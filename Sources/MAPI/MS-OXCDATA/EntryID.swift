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

    /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID
    /// is valid. However, in any EntryID stored in a property value, these 4 bytes MUST be zero, indicating a long-term EntryID.
    let flags: UInt32 = try dataStream.read()
    
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
    case AddressBookEntryID.providerUid:
        return try AddressBookEntryID(dataStream: &dataStream, size: size)
    case OneOffEntryID.providerUid:
        return try OneOffEntryID(dataStream: &dataStream)
    case ContactAddressEntryID.providerUid:
        return try ContactAddressEntryID(dataStream: &dataStream)
    case WrappedEntryId.providerUid:
        return try WrappedEntryId(dataStream: &dataStream, size: size)
    case MessageEntryID.providerUid:
        if size == 46 {
            return try FolderEntryID(dataStream: &dataStream, size: size)
        } else {
            return try MessageEntryID(dataStream: &dataStream, size: size)
        }
    case StoreEntryID.providerUid:
        let _: UInt32 = try dataStream.read(endianess: .littleEndian)
        let _: UUID = try dataStream.read(type: UUID.self)
        let _: UInt8 = try dataStream.read()
        let _: UInt8 = try dataStream.read()
        let providerName = try dataStream.readString(count: 14, encoding: .ascii)!
        
        dataStream.position = position
        if providerName.caseInsensitiveCompare("emsmdb.dll\0\0\0\0") == .orderedSame {
            return try StoreObjectEntryID(dataStream: &dataStream, size: size)
        } else if providerName.caseInsensitiveCompare("mspst.dll\0\0\0\0\0") == .orderedSame || providerName.caseInsensitiveCompare("pstprx.dll\0\0\0\0") == .orderedSame{
            return try StoreEntryID(dataStream: &dataStream, size: size)
        } else {
            fatalError("NYI: \(providerName)")
        }
    default:
        if flags == 0x00000000 {
            if size == 46 {
                return try FolderEntryID(dataStream: &dataStream, size: size)
            } else if size == 72 {
                return try MessageEntryID(dataStream: &dataStream, size: size)
            }
        }

        return try GeneralEntryID(dataStream: &dataStream, size: size)
    }
}
