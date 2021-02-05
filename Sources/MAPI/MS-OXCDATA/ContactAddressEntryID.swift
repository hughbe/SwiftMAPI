//
//  ContactAddressEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.5 Recipient EntryID Structures
/// [MS-OXCDATA] 2.2.5.3 Contact Address EntryID Structure
/// A Contact Address EntryID structure specifies a set of data representing recipients whose information is stored in a Contact object, as
/// specified in [MS-OXOCNTC].
public struct ContactAddressEntryID: EntryID {
    public var flags: UInt32
    public var providerUid: GUID
    public var version: UInt32
    public var type: UInt32
    public var index: UInt32
    public var entryIdCount: UInt32
    public var entryIdBytes: EntryID
    
    public static let providerUid = GUID(0x0AAA42FE, 0xC718, 0x101A, 0xe8, 0x85, 0x0B, 0x65, 0x1C, 0x24, 0x00, 0x00)

    public init(dataStream: inout DataStream, size: Int) throws {
        let startPosition = dataStream.position
        guard size >= 36 else {
            throw MAPIError.corrupted
        }
        
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID is valid.
        /// However, in any EntryID stored in a property value, these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        guard self.flags == 0x00000000 else {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The Identifier for the provider that created the EntryID. This value is used to route EntryIDs to the correct provider and MUST be set to %xFE.42.AA.0A.18.C7.1A.10.E8.85.0B.65.1C.24.00.00.
        self.providerUid = try GUID(dataStream: &dataStream)
        if self.providerUid != ContactAddressEntryID.providerUid {
            throw MAPIError.corrupted
        }
        
        /// Version (4 bytes): This value MUST be set to %x03.00.00.00.
        self.version = try dataStream.read(endianess: .littleEndian)
        guard self.version == 0x00000003 else {
            throw MAPIError.corrupted
        }
        
        /// Type (4 bytes): This value MUST be set to %x04.00.00.00.
        self.type = try dataStream.read(endianess: .littleEndian)
        guard self.type == 0x00000004 else {
            throw MAPIError.corrupted
        }

        /// Index (4 bytes): An unsigned integer value that MUST be a number from 0 through 5. This value
        /// represents which electronic address in the contact information to use. A value of 0, 1, or 2
        /// represents Email1, Email2, and Email3 respectively, and a value of 3, 4, or 5 represents Fax1,
        /// Fax2, and Fax3 respectively. For more details, see [MS-OXOCNTC] section 2.2.1.2.
        self.index = try dataStream.read(endianess: .littleEndian)
        guard self.index <= 5 else {
            throw MAPIError.corrupted
        }
        
        /// EntryIdCount (4 bytes): An unsigned integer value representing the count of bytes in the EntryIdBytes field.
        self.entryIdCount = try dataStream.read(endianess: .littleEndian)
        guard 36 + self.entryIdCount <= size else {
            throw MAPIError.corrupted
        }
        
        /// EntryIdBytes (variable): The EntryID of the Contact object that contains this address, which in turn has the format specified in section 2.2.4.2.
        /// The size of this structure is specified by the EntryIdCount field.<4>
        self.entryIdBytes = try getEntryID(dataStream: &dataStream, size: Int(self.entryIdCount))
        
        /// <4> Section 2.2.5.3: Office Outlook 2003 and Office Outlook 2007 can leave 3 extra bytes not filled at the end of the Contact
        /// Address EntryID structure; in other words, the sum of all fields specified in this protocol can be 3 bytes less than the count of
        /// bytes of the entire EntryID. The value of the extra 3 bytes has no meaning to either the server or the client.
        if size - (dataStream.position - startPosition) == 3 {
            try dataStream.skip(count: 3)
        }
        
        guard dataStream.position - startPosition == size else {
            throw MAPIError.corrupted
        }
    }
    
    public var dataSize: Int {
        /// Flags (4 bytes) + ProviderUid (16 bytes) + Index (4 bytes) + EntryIdCount (4 bytes) + EntryIdBytes (variable)
        var baseSize = 4 + 16 + 4 + 4
        baseSize += entryIdBytes.dataSize
        return baseSize
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        dataStream.write(flags, endianess: .littleEndian)
        providerUid.write(to: &dataStream)
        dataStream.write(index, endianess: .littleEndian)
        dataStream.write(entryIdCount, endianess: .littleEndian)
        entryIdBytes.write(to: &dataStream)
    }
}
