import DataStream
import XCTest
@testable import MAPI

/// Tests that EntryIDs can be written back to the bytes that they were read from.
final class EntryIDWriteTests: XCTestCase {
    private static let storeProviderUid: [UInt8] = [
        0x38, 0xA1, 0xBB, 0x10, 0x05, 0xE5, 0x10, 0x1A, 0xA1, 0xBB, 0x08, 0x00, 0x2B, 0x2A, 0x56, 0xC2
    ]
    private static let mailboxStoreObject: [UInt8] = [
        0x1B, 0x55, 0xFA, 0x20, 0xAA, 0x66, 0x11, 0xCD, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A
    ]
    private static let pstProviderUid: [UInt8] = [
        0x4E, 0x49, 0x54, 0x41, 0xF9, 0xBF, 0xB8, 0x01, 0x00, 0xAA, 0x00, 0x37, 0xD9, 0x6E, 0x00, 0x00
    ]

    private func padded(_ name: String) -> [UInt8] {
        let bytes = Array(name.utf8)
        return bytes + [UInt8](repeating: 0, count: 14 - bytes.count)
    }

    private func unicode(_ value: String) -> [UInt8] {
        return Array((value + "\0").data(using: .utf16LittleEndian)!)
    }

    private func le32(_ value: UInt32) -> [UInt8] {
        return [UInt8(value & 0xFF), UInt8((value >> 8) & 0xFF), UInt8((value >> 16) & 0xFF), UInt8((value >> 24) & 0xFF)]
    }

    private func assertRoundTrips(_ bytes: [UInt8], file: StaticString = #filePath, line: UInt = #line) throws -> EntryID {
        var dataStream = DataStream(Data(bytes))
        let entryID = try getEntryID(dataStream: &dataStream, size: bytes.count)

        var output = OutputDataStream()
        entryID.write(to: &output)
        XCTAssertEqual(bytes, [UInt8](output.data), file: file, line: line)
        XCTAssertEqual(bytes.count, entryID.dataSize, file: file, line: line)
        return entryID
    }

    func testMSPSTStoreEntryID() throws {
        // Unicode path, as written by Outlook 2003 and above.
        let bytes: [UInt8] = [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.storeProviderUid + [0x00, 0x00]
            + padded("mspst.dll") + EntryIDWriteTests.pstProviderUid + [0x00, 0x00]
            + unicode("C:\\Outlook.pst")
        let entryID = try assertRoundTrips(bytes)
        XCTAssertTrue(entryID is StoreEntryID)
        XCTAssertEqual("mspst.dll", (entryID as? StoreEntryID)?.dllFileName)
    }

    func testMSPSTStoreEntryIDWithAsciiPathOnly() throws {
        let bytes: [UInt8] = [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.storeProviderUid + [0x00, 0x00]
            + padded("mspst.dll") + EntryIDWriteTests.pstProviderUid + [0x00]
            + Array("C:\\WINDOWS\\outlook.pst".utf8) + [0x00]
        _ = try assertRoundTrips(bytes)
    }

    func testPSTPRXStoreEntryID() throws {
        let bytes: [UInt8] = [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.storeProviderUid + [0x00, 0x00]
            + padded("PSTPRX.DLL") + [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.pstProviderUid + [0x00]
            + Array("C:\\WINDOWS\\outlook.pst".utf8) + [0x00]
        let entryID = try assertRoundTrips(bytes)
        XCTAssertEqual("PSTPRX.DLL", (entryID as? StoreEntryID)?.dllFileName)
    }

    func testEMSMDBStoreEntryIDWithoutEntryIDVersion() throws {
        let bytes: [UInt8] = [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.storeProviderUid + [0x00, 0x00]
            + padded("emsmdb.dll")
            + [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.mailboxStoreObject + le32(0x0C)
            + Array("SERVER".utf8) + [0x00]
            + Array("/o=Org/ou=Site/cn=Recipients/cn=user".utf8) + [0x00]
        let entryID = try assertRoundTrips(bytes)
        XCTAssertEqual("emsmdb.dll", (entryID as? StoreEntryID)?.dllFileName)
    }

    func testEMSMDBStoreEntryIDWithEntryIDV3() throws {
        let smtp = unicode("user@example.com")
        let v3Size = UInt32(16 + smtp.count + 2)
        let v3: [UInt8] = le32(0xF43246E9) + le32(v3Size) + le32(2) + le32(16) + smtp + [0x00, 0x00]
        let bytes: [UInt8] = [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.storeProviderUid + [0x00, 0x00]
            + padded("emsmdb.dll")
            + [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.mailboxStoreObject + le32(0x0C)
            + Array("SERVER".utf8) + [0x00]
            + Array("/o=Org/ou=Site/cn=Recipients/cn=user".utf8) + [0x00]
            + v3
        _ = try assertRoundTrips(bytes)
    }

    func testEMSMDBStoreEntryIDWithEntryIDV2() throws {
        let serverDN = unicode("/o=Org/cn=Servers/cn=SERVER")
        let serverFQDN = unicode("server.example.com")
        let offsetDN: UInt32 = 20
        let offsetFQDN = offsetDN + UInt32(serverDN.count)
        let v2Size = UInt32(20 + serverDN.count + serverFQDN.count + 2)
        let v2: [UInt8] = le32(0xF32135D8) + le32(v2Size) + le32(1) + le32(offsetDN) + le32(offsetFQDN)
            + serverDN + serverFQDN + [0x00, 0x00]
        let bytes: [UInt8] = [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.storeProviderUid + [0x00, 0x00]
            + padded("emsmdb.dll")
            + [0x00, 0x00, 0x00, 0x00] + EntryIDWriteTests.mailboxStoreObject + le32(0x0C)
            + Array("SERVER".utf8) + [0x00]
            + Array("/o=Org/ou=Site/cn=Recipients/cn=user".utf8) + [0x00]
            + v2
        _ = try assertRoundTrips(bytes)
    }

    static var allTests = [
        ("testMSPSTStoreEntryID", testMSPSTStoreEntryID),
        ("testMSPSTStoreEntryIDWithAsciiPathOnly", testMSPSTStoreEntryIDWithAsciiPathOnly),
        ("testPSTPRXStoreEntryID", testPSTPRXStoreEntryID),
        ("testEMSMDBStoreEntryIDWithoutEntryIDVersion", testEMSMDBStoreEntryIDWithoutEntryIDVersion),
        ("testEMSMDBStoreEntryIDWithEntryIDV3", testEMSMDBStoreEntryIDWithEntryIDV3),
        ("testEMSMDBStoreEntryIDWithEntryIDV2", testEMSMDBStoreEntryIDWithEntryIDV2),
    ]
}
