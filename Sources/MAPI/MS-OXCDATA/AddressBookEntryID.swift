//
//  AddressBookEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCDATA] 2.2.5 Recipient EntryID Structures
/// [MS-OXCDATA] 2.2.5.2 Address Book EntryID Structure
/// An Address Book EntryID structure specifies several types of Address Book objects, including individual users, distribution lists, containers, and templates.
public struct AddressBookEntryID: EntryID {
    public var flags: UInt32
    public var providerUid: UUID
    public var version: UInt32
    public var type: AddressBookEntryType
    public var x500DN: String
    
    public static let providerUid = UUID(uuid: uuid_t(0xDC, 0xA7, 0x40, 0xC8, 0xC0, 0x42, 0x10, 0x1A, 0xB4, 0xB9, 0x08, 0x00, 0x2B, 0x2F, 0xE1, 0x82))

    public init(dataStream: inout DataStream, size: Int) throws {
        let position = dataStream.position
        
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID is valid.
        /// However, in any EntryID stored in a property value, these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        if self.flags != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The identifier for the provider that created the EntryID. This value is used to route EntryIDs to the correct
        /// provider and MUST be set to %xDC.A7.40.C8.C0.42.10.1A.B4.B9.08.00.2B.2F.E1.82.
        self.providerUid = try dataStream.read(type: UUID.self)
        if self.providerUid != AddressBookEntryID.providerUid {
            throw MAPIError.corrupted
        }
        
        /// Version (4 bytes): This value MUST be set to %x01.00.00.00.
        self.version = try dataStream.read(endianess: .littleEndian)
        if self.version != 0x00000001 {
            throw MAPIError.corrupted
        }
        
        /// Type (4 bytes): An integer representing the type of the object. It MUST be one of the values from the following table.
        let typeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        guard let type = AddressBookEntryType(rawValue: typeRaw) else {
            throw MAPIError.corrupted
        }

        self.type = type
        
        /// X500DN (variable): The X500 DN of the Address Book object. The X500DN field is a null-terminated string of 8-bit characters.
        guard let x500DN = try dataStream.readAsciiString() else {
            throw MAPIError.corrupted
        }
        
        self.x500DN = x500DN
        
        assert(dataStream.position - position == size)
    }
}
