//
//  StringEncoding.swift
//
//
//  Created by Hugh Bellamy on 20/11/2026.
//

import DataStream

/// 8-bit ("ANSI", PtypString8) strings are in the writer's ANSI code page, assumed to be Windows-1252, the code page of
/// Western-language Windows.
///
/// Every byte decodes to a character and back to the same byte, so strings round-trip unchanged. The five bytes that
/// Windows-1252 leaves undefined (0x81, 0x8D, 0x8F, 0x90 and 0x9D) decode to the C1 control with the same value, as
/// Windows' `MultiByteToWideChar` does. Characters that Windows-1252 can't represent are written as "?", as Windows'
/// `WideCharToMultiByte` does.
///
/// This is implemented with a table instead of `String.Encoding`, because how Foundation decodes bytes 0x80 and above
/// with `.ascii` depends on the platform and the deployment target (macOS 12 decodes them as Latin-1; macOS 26 fails),
/// and `OutputDataStream.write(_:encoding:)` calls `fatalError` for any character it can't encode.
internal enum ANSIEncoding {
    /// The characters of bytes 0x80–0x9F. The other bytes are the Unicode scalar with the same value.
    private static let highTable: [UInt32] = [
        0x20AC, 0x0081, 0x201A, 0x0192, 0x201E, 0x2026, 0x2020, 0x2021,
        0x02C6, 0x2030, 0x0160, 0x2039, 0x0152, 0x008D, 0x017D, 0x008F,
        0x0090, 0x2018, 0x2019, 0x201C, 0x201D, 0x2022, 0x2013, 0x2014,
        0x02DC, 0x2122, 0x0161, 0x203A, 0x0153, 0x009D, 0x017E, 0x0178,
    ]

    private static let reverseTable: [UInt32: UInt8] = {
        var table: [UInt32: UInt8] = [:]
        for (index, scalar) in highTable.enumerated() {
            table[scalar] = UInt8(0x80 + index)
        }
        return table
    }()

    static func decode<Bytes: Sequence>(_ bytes: Bytes) -> String where Bytes.Element == UInt8 {
        var scalars = String.UnicodeScalarView()
        for byte in bytes {
            let value = byte >= 0x80 && byte <= 0x9F ? highTable[Int(byte - 0x80)] : UInt32(byte)
            scalars.append(Unicode.Scalar(value)!)
        }

        return String(scalars)
    }

    static func encode(_ string: String) -> [UInt8] {
        var bytes: [UInt8] = []
        bytes.reserveCapacity(string.unicodeScalars.count)
        for scalar in string.unicodeScalars {
            let value = scalar.value
            if let byte = reverseTable[value] {
                bytes.append(byte)
            } else if value < 0x80 || (value >= 0xA0 && value <= 0xFF) {
                bytes.append(UInt8(value))
            } else {
                bytes.append(0x3F) // "?"
            }
        }

        return bytes
    }

    /// The number of bytes `encode` produces: one per Unicode scalar.
    static func byteCount(_ string: String) -> Int {
        return string.unicodeScalars.count
    }
}

/// Little-endian UTF-16 (PtypString) strings.
internal enum UTF16LEEncoding {
    /// Decodes little-endian UTF-16 bytes. Throws `MAPIError.corrupted` for an odd number of bytes or an unpaired
    /// surrogate, rather than replacing it as Foundation may, so that a string is never silently changed when it is
    /// written back.
    static func decode(_ bytes: [UInt8]) throws -> String {
        guard bytes.count % 2 == 0 else {
            throw MAPIError.corrupted
        }

        let units = stride(from: 0, to: bytes.count, by: 2).map { UInt16(bytes[$0]) | UInt16(bytes[$0 + 1]) << 8 }
        var scalars = String.UnicodeScalarView()
        var iterator = units.makeIterator()
        var decoder = UTF16()
        while true {
            switch decoder.decode(&iterator) {
            case .scalarValue(let scalar):
                scalars.append(scalar)
            case .emptyInput:
                return String(scalars)
            case .error:
                throw MAPIError.corrupted
            }
        }
    }

    static func encode(_ string: String) -> [UInt8] {
        var bytes: [UInt8] = []
        bytes.reserveCapacity(string.utf16.count * 2)
        for unit in string.utf16 {
            bytes.append(UInt8(unit & 0xFF))
            bytes.append(UInt8(unit >> 8))
        }

        return bytes
    }

    /// The number of bytes `encode` produces: two per UTF-16 code unit.
    static func byteCount(_ string: String) -> Int {
        return string.utf16.count * 2
    }
}

internal extension DataStream {
    /// Reads `count` bytes as an 8-bit string. Throws for a negative count.
    mutating func readString8(count: Int) throws -> String {
        guard count >= 0 else {
            throw MAPIError.corrupted
        }

        return ANSIEncoding.decode(try readBytes(count: count))
    }

    /// Reads an 8-bit string terminated by a single zero byte, and consumes the terminator.
    mutating func readNullTerminatedString8() throws -> String {
        var bytes: [UInt8] = []
        while true {
            let byte: UInt8 = try read()
            if byte == 0 {
                return ANSIEncoding.decode(bytes)
            }

            bytes.append(byte)
        }
    }

    /// Reads `byteCount` bytes as a little-endian UTF-16 string. Throws for a negative or odd count.
    mutating func readUTF16String(byteCount: Int) throws -> String {
        guard byteCount >= 0 else {
            throw MAPIError.corrupted
        }

        return try UTF16LEEncoding.decode(try readBytes(count: byteCount))
    }

    /// Reads a little-endian UTF-16 string terminated by two zero bytes, and consumes the terminator.
    mutating func readNullTerminatedUTF16String() throws -> String {
        var bytes: [UInt8] = []
        while true {
            let low: UInt8 = try read()
            let high: UInt8 = try read()
            if low == 0 && high == 0 {
                return try UTF16LEEncoding.decode(bytes)
            }

            bytes.append(low)
            bytes.append(high)
        }
    }

    /// Moves forward `count` bytes, throwing rather than trapping if `count` is negative or runs past the end.
    mutating func skipChecked(count: Int) throws {
        guard count >= 0 else {
            throw MAPIError.corrupted
        }

        try skip(count: count)
    }

    /// Moves to `position`, throwing rather than trapping if it is outside the stream.
    mutating func seek(to position: Int) throws {
        guard position >= 0 && position <= count else {
            throw MAPIError.corrupted
        }

        self.position = position
    }
}

internal extension OutputDataStream {
    /// Writes an 8-bit string, without a terminator. Characters Windows-1252 can't represent are written as "?".
    mutating func writeString8(_ value: String) {
        write(ANSIEncoding.encode(value))
    }

    /// Writes an 8-bit string followed by a single zero byte.
    mutating func writeNullTerminatedString8(_ value: String) {
        writeString8(value)
        write(UInt8(0))
    }

    /// Writes a little-endian UTF-16 string, without a terminator.
    mutating func writeUTF16String(_ value: String) {
        write(UTF16LEEncoding.encode(value))
    }

    /// Writes a little-endian UTF-16 string followed by two zero bytes.
    mutating func writeNullTerminatedUTF16String(_ value: String) {
        writeUTF16String(value)
        write(UInt8(0))
        write(UInt8(0))
    }
}
