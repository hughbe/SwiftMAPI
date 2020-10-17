//
//  EntryID.swift
//  
//
//  Created by Hugh Bellamy on 08/10/2020.
//

import DataStream
import Foundation

public protocol EntryID {
    var flags: UInt32 { get }
    var providerUid: UUID { get }
}

public func getEntryID(dataStream: inout DataStream, size: Int) throws -> EntryID {
    let position = dataStream.position

    /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what
    /// circumstances a short-term EntryID is valid. However, in any EntryID stored in a property value,
    /// these 4 bytes MUST be zero, indicating a long-term EntryID.
    let flags: UInt32 = try dataStream.read()
    if flags != 0x00000000 {
        //throw MAPIError.corrupted
    }
    
    /// ProviderUID (16 bytes): The identifier for the provider that created the EntryID. This value is used
    /// to route EntryIDs to the correct provider. Values for this field appear in the following table.
    /// EntryID UID type                      | ProviderUID value
    /// ---------------------------------------------------------------------------------------------------------
    /// Object in private message store                                   | Is set to the MailboxGuid field value provided in the RopLogon ROP response buffer ([MS-OXCROPS] section 2.2.3.1.2).
    /// Object in public message store                                    | %x1A. 44.73.90.AA.66.11.CD.9B.C8.00.AA.00.2F.C4.5A
    /// Address book recipient (1)                                            | %xDC.A7.40.C8.C0.42.10.1A.B4.B9.08.00.2B.2F.E1.82
    /// One-off recipient (1)                                                      | %x81.2B.1F.A4.BE.A3.10.19.9D.6E.00.DD.01.0F.54.02
    /// Contact address or personal distribution list recipient | %xFE.42.AA.0A.18.C7.1A.10.E8.85.0B.65.1C.24.00.00
    let providerUid: UUID = try dataStream.read(type: UUID.self)
    dataStream.position = position
    switch providerUid {
    case UUID(uuid: uuid_t(0xDC, 0xA7, 0x40, 0xC8, 0xC0, 0x42, 0x10, 0x1A, 0xB4, 0xB9, 0x08, 0x00, 0x2B, 0x2F, 0xE1, 0x82)):
        return try AddressBookEntryID(dataStream: &dataStream)
    case UUID(uuid: uuid_t(0x81, 0x2b, 0x1f, 0xa4, 0xbe, 0xa3, 0x10, 0x19, 0x9d, 0x6e, 0x00, 0xdd, 0x01, 0x0f, 0x54, 0x02)):
        return try OneOffEntryID(dataStream: &dataStream)
    case UUID(uuid: uuid_t(0xFE, 0x42, 0xAA, 0x0A, 0x18, 0xC7, 0x1A, 0x10, 0xE8, 0x85, 0x0B, 0x65, 0x1C, 0x24, 0x00, 0x00)):
        return try ContactAddressEntryID(dataStream: &dataStream)
    default:
        if size == 46 {
            return try FolderEntryID(dataStream: &dataStream)
        }

        return try GeneralEntryID(dataStream: &dataStream)
    }
}
