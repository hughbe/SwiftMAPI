//
//  EntryIDFixtures.swift
//
//
//  Created by Hugh Bellamy on 20/11/2026.
//

/// Well-formed EntryIDs of every kind that `getEntryID` reads, used by the round-trip and fuzz tests.
enum EntryIDFixtures {
    static let storeProviderUid: [UInt8] = [
        0x38, 0xA1, 0xBB, 0x10, 0x05, 0xE5, 0x10, 0x1A, 0xA1, 0xBB, 0x08, 0x00, 0x2B, 0x2A, 0x56, 0xC2
    ]
    static let mailboxStoreObject: [UInt8] = [
        0x1B, 0x55, 0xFA, 0x20, 0xAA, 0x66, 0x11, 0xCD, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A
    ]
    static let pstProviderUid: [UInt8] = [
        0x4E, 0x49, 0x54, 0x41, 0xF9, 0xBF, 0xB8, 0x01, 0x00, 0xAA, 0x00, 0x37, 0xD9, 0x6E, 0x00, 0x00
    ]
    static let oneOffProviderUid: [UInt8] = [
        0x81, 0x2B, 0x1F, 0xA4, 0xBE, 0xA3, 0x10, 0x19, 0x9D, 0x6E, 0x00, 0xDD, 0x01, 0x0F, 0x54, 0x02
    ]
    static let addressBookProviderUid: [UInt8] = [
        0xDC, 0xA7, 0x40, 0xC8, 0xC0, 0x42, 0x10, 0x1A, 0xB4, 0xB9, 0x08, 0x00, 0x2B, 0x2F, 0xE1, 0x82
    ]
    static let contactAddressProviderUid: [UInt8] = [
        0xFE, 0x42, 0xAA, 0x0A, 0x18, 0xC7, 0x1A, 0x10, 0xE8, 0x85, 0x0B, 0x65, 0x1C, 0x24, 0x00, 0x00
    ]
    static let wrappedProviderUid: [UInt8] = [
        0xC0, 0x91, 0xAD, 0xD3, 0x51, 0x9D, 0xCF, 0x11, 0xA4, 0xA9, 0x00, 0xAA, 0x00, 0x47, 0xFA, 0xA4
    ]
    static let messageProviderUid: [UInt8] = [
        0x1A, 0x44, 0x73, 0x90, 0xAA, 0x66, 0x11, 0xCD, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A
    ]
    static let databaseGuid: [UInt8] = [
        0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
    ]

    static func padded(_ name: String) -> [UInt8] {
        let bytes = Array(name.utf8)
        return bytes + [UInt8](repeating: 0, count: 14 - bytes.count)
    }

    /// UTF-16LE with a two-byte terminator.
    static func unicode(_ value: String) -> [UInt8] {
        return value.utf16.flatMap { [UInt8($0 & 0xFF), UInt8($0 >> 8)] } + [0x00, 0x00]
    }

    /// ASCII with a one-byte terminator.
    static func ascii(_ value: String) -> [UInt8] {
        return Array(value.utf8) + [0x00]
    }

    static func le32(_ value: UInt32) -> [UInt8] {
        return [UInt8(value & 0xFF), UInt8((value >> 8) & 0xFF), UInt8((value >> 16) & 0xFF), UInt8((value >> 24) & 0xFF)]
    }

    static let zeroFlags: [UInt8] = [0x00, 0x00, 0x00, 0x00]

    /// "C:\Users\José\a.pst" in Windows-1252, where "é" is 0xE9.
    static let windows1252Path: [UInt8] = Array("C:\\Users\\Jos".utf8) + [0xE9] + Array("\\a.pst".utf8) + [0x00]

    static let mspstUnicode: [UInt8] = zeroFlags + storeProviderUid + [0x00, 0x00]
        + padded("mspst.dll") + pstProviderUid + [0x00, 0x00]
        + unicode("C:\\Outlook.pst")

    static let mspstAscii: [UInt8] = zeroFlags + storeProviderUid + [0x00, 0x00]
        + padded("mspst.dll") + pstProviderUid + [0x00]
        + ascii("C:\\WINDOWS\\outlook.pst")

    static let mspstNonASCII: [UInt8] = zeroFlags + storeProviderUid + [0x00, 0x00]
        + padded("mspst.dll") + pstProviderUid + [0x00]
        + windows1252Path + unicode("C:\\Users\\José\\a.pst")

    static let pstprx: [UInt8] = zeroFlags + storeProviderUid + [0x00, 0x00]
        + padded("PSTPRX.DLL") + zeroFlags + pstProviderUid + [0x00]
        + windows1252Path

    static let emsmdb: [UInt8] = zeroFlags + storeProviderUid + [0x00, 0x00]
        + padded("emsmdb.dll")
        + zeroFlags + mailboxStoreObject + le32(0x0C)
        + ascii("SERVER")
        + ascii("/o=Org/ou=Site/cn=Recipients/cn=user")

    static let emsmdbV3: [UInt8] = {
        let smtp = unicode("user@example.com")
        let v3Size = UInt32(16 + smtp.count + 2)
        let v3: [UInt8] = le32(0xF43246E9) + le32(v3Size) + le32(2) + le32(16) + smtp + [0x00, 0x00]
        return emsmdb + v3
    }()

    static let emsmdbV2: [UInt8] = {
        let serverDN = unicode("/o=Org/cn=Servers/cn=SERVER")
        let serverFQDN = unicode("server.example.com")
        let offsetDN: UInt32 = 20
        let offsetFQDN = offsetDN + UInt32(serverDN.count)
        let v2Size = UInt32(20 + serverDN.count + serverFQDN.count + 2)
        let v2: [UInt8] = le32(0xF32135D8) + le32(v2Size) + le32(1) + le32(offsetDN) + le32(offsetFQDN)
            + serverDN + serverFQDN + [0x00, 0x00]
        return emsmdb + v2
    }()

    static let oneOffAnsi: [UInt8] = zeroFlags + oneOffProviderUid + [0x00, 0x00] + [0x00, 0x00]
        + Array("Jos".utf8) + [0xE9, 0x00] + ascii("SMTP") + ascii("jose@example.com")

    static let oneOffUnicode: [UInt8] = zeroFlags + oneOffProviderUid + [0x00, 0x00] + [0x00, 0x80]
        + unicode("José 😀") + unicode("SMTP") + unicode("jose@example.com")

    static let addressBook: [UInt8] = zeroFlags + addressBookProviderUid + le32(1) + le32(0)
        + ascii("/o=Org/ou=Site/cn=Recipients/cn=user")

    static let folder: [UInt8] = zeroFlags + messageProviderUid + [0x01, 0x00]
        + databaseGuid + [0x01, 0x02, 0x03, 0x04, 0x05, 0x06] + [0x00, 0x00]

    static let message: [UInt8] = zeroFlags + messageProviderUid + [0x07, 0x00]
        + databaseGuid + [0x01, 0x02, 0x03, 0x04, 0x05, 0x06] + [0x00, 0x00]
        + databaseGuid + [0x11, 0x12, 0x13, 0x14, 0x15, 0x16] + [0x00, 0x00]

    static let wrappedOneOff: [UInt8] = zeroFlags + wrappedProviderUid + [0x00] + oneOffAnsi

    static let contactAddress: [UInt8] = zeroFlags + contactAddressProviderUid + le32(3) + le32(4)
        + le32(0) + le32(UInt32(addressBook.count)) + addressBook

    static let general: [UInt8] = zeroFlags + databaseGuid + [0xDE, 0xAD, 0xBE, 0xEF]

    static let all: [(name: String, bytes: [UInt8])] = [
        ("mspstUnicode", mspstUnicode),
        ("mspstAscii", mspstAscii),
        ("mspstNonASCII", mspstNonASCII),
        ("pstprx", pstprx),
        ("emsmdb", emsmdb),
        ("emsmdbV3", emsmdbV3),
        ("emsmdbV2", emsmdbV2),
        ("oneOffAnsi", oneOffAnsi),
        ("oneOffUnicode", oneOffUnicode),
        ("addressBook", addressBook),
        ("folder", folder),
        ("message", message),
        ("wrappedOneOff", wrappedOneOff),
        ("contactAddress", contactAddress),
        ("general", general),
    ]
}
