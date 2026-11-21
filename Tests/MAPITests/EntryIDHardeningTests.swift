//
//  EntryIDHardeningTests.swift
//
//
//  Created by Hugh Bellamy on 20/11/2026.
//

import DataStream
import Foundation
import XCTest
@testable import MAPI

/// Tests that non-ASCII strings round-trip and that malformed EntryIDs throw instead of crashing.
final class EntryIDHardeningTests: XCTestCase {
    private func parse(_ bytes: [UInt8]) throws -> EntryID {
        var dataStream = DataStream(Data(bytes))
        return try getEntryID(dataStream: &dataStream, size: bytes.count)
    }

    private func written(_ entryID: EntryID) -> [UInt8] {
        var output = OutputDataStream()
        entryID.write(to: &output)
        return [UInt8](output.data)
    }

    func testEveryFixtureRoundTrips() throws {
        for (name, bytes) in EntryIDFixtures.all {
            let entryID = try parse(bytes)
            XCTAssertEqual(bytes, written(entryID), name)
            XCTAssertEqual(bytes.count, entryID.dataSize, name)
        }
    }

    func testNonASCIIPSTPathRoundTrips() throws {
        let entryID = try parse(EntryIDFixtures.mspstNonASCII)
        let data = try XCTUnwrap((entryID as? StoreEntryID)?.wrappedProviderData as? MSPSTEntryIdData)
        XCTAssertEqual("C:\\Users\\José\\a.pst", data.pathAscii)
        XCTAssertEqual("C:\\Users\\José\\a.pst", data.pathUnicode)
        XCTAssertEqual(EntryIDFixtures.mspstNonASCII, written(entryID))
        XCTAssertEqual(EntryIDFixtures.mspstNonASCII.count, entryID.dataSize)

        let pstprx = try parse(EntryIDFixtures.pstprx)
        let pstprxData = try XCTUnwrap((pstprx as? StoreEntryID)?.wrappedProviderData as? PSTPRXEntryIdData)
        XCTAssertEqual("C:\\Users\\José\\a.pst", pstprxData.pathAscii)
        XCTAssertEqual(EntryIDFixtures.pstprx, written(pstprx))
    }

    func testNonASCIIOneOffRoundTrips() throws {
        let ansi = try XCTUnwrap(try parse(EntryIDFixtures.oneOffAnsi) as? OneOffEntryID)
        XCTAssertEqual("José", ansi.displayName)

        let unicode = try XCTUnwrap(try parse(EntryIDFixtures.oneOffUnicode) as? OneOffEntryID)
        XCTAssertEqual("José 😀", unicode.displayName)
        XCTAssertEqual(EntryIDFixtures.oneOffUnicode.count, unicode.dataSize)
    }

    func testUnrepresentableANSICharactersAreWrittenAsQuestionMarks() throws {
        var entryID = try XCTUnwrap(try parse(EntryIDFixtures.oneOffAnsi) as? OneOffEntryID)
        entryID.displayName = "日本 €😀"
        let bytes = written(entryID)
        XCTAssertEqual(entryID.dataSize, bytes.count)
        let expected: [UInt8] = [0x3F, 0x3F, 0x20, 0x80, 0x3F, 0x00]
        XCTAssertEqual(expected, Array(bytes[24..<30]))
    }

    func testEveryANSIByteRoundTrips() {
        let bytes = (1...255).map { UInt8($0) }
        XCTAssertEqual(bytes, ANSIEncoding.encode(ANSIEncoding.decode(bytes)))
        XCTAssertEqual(255, ANSIEncoding.byteCount(ANSIEncoding.decode(bytes)))
    }

    func testUnpairedSurrogateThrows() {
        var bytes = EntryIDFixtures.oneOffUnicode
        // Replace "J" with a lone high surrogate (0xD800).
        bytes[24] = 0x00
        bytes[25] = 0xD8
        XCTAssertThrowsError(try parse(bytes))
        XCTAssertThrowsError(try UTF16LEEncoding.decode([0x00, 0xDC]))
        XCTAssertThrowsError(try UTF16LEEncoding.decode([0x41]))
    }

    func testTooSmallSizeThrows() {
        for size in [-1, 0, 19] {
            var dataStream = DataStream(Data(EntryIDFixtures.general))
            XCTAssertThrowsError(try getEntryID(dataStream: &dataStream, size: size))
        }
    }

    /// Every single-byte corruption of every fixture, and every truncation, either throws or reads an EntryID that
    /// writes exactly `dataSize` bytes. A crash fails the whole test run.
    func testCorruptedFixturesNeverCrash() {
        for (name, bytes) in EntryIDFixtures.all {
            for index in 0..<bytes.count {
                for value in 0...255 where UInt8(value) != bytes[index] {
                    var corrupted = bytes
                    corrupted[index] = UInt8(value)
                    if let entryID = try? parse(corrupted) {
                        XCTAssertEqual(entryID.dataSize, written(entryID).count, "\(name)[\(index)] = \(value)")
                    }
                }
            }

            for count in 0..<bytes.count {
                if let entryID = try? parse(Array(bytes.prefix(count))) {
                    XCTAssertEqual(entryID.dataSize, written(entryID).count, "\(name) truncated to \(count)")
                }
            }
        }
    }

    static var allTests = [
        ("testEveryFixtureRoundTrips", testEveryFixtureRoundTrips),
        ("testNonASCIIPSTPathRoundTrips", testNonASCIIPSTPathRoundTrips),
        ("testNonASCIIOneOffRoundTrips", testNonASCIIOneOffRoundTrips),
        ("testUnrepresentableANSICharactersAreWrittenAsQuestionMarks", testUnrepresentableANSICharactersAreWrittenAsQuestionMarks),
        ("testEveryANSIByteRoundTrips", testEveryANSIByteRoundTrips),
        ("testUnpairedSurrogateThrows", testUnpairedSurrogateThrows),
        ("testTooSmallSizeThrows", testTooSmallSizeThrows),
        ("testCorruptedFixturesNeverCrash", testCorruptedFixturesNeverCrash),
    ]
}
