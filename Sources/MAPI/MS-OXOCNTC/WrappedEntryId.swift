//
//  WrappedEntryId.swift
//  
//
//  Created by Hugh Bellamy on 28/10/2020.
//

import DataStream
import Foundation

/// [MS-OXOCNTC] 2.2.2.2.4.1.1 WrappedEntryId Structure
/// The WrappedEntryId structure specifies the EntryID of a member of a personal distribution list. The following diagram specifies the format
/// of the WrappedEntryId structure.
public struct WrappedEntryId: EntryID {
    public let flags: UInt32
    public let providerUid: UUID
    public let type: UInt8
    public let embeddedEntryID: EntryID
    
    public static let providerUid = UUID(uuid: uuid_t(0xC0, 0x91, 0xAD, 0xD3, 0x51, 0x9D, 0xCF, 0x11, 0xA4, 0xA9, 0x00, 0xAA, 0x00, 0x47, 0xFA, 0xA4))
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let position = dataStream.position

        /// Flags (4 bytes): Not used. This field MUST be set to 0x00000000.
        self.flags = try dataStream.read(endianess: .littleEndian)
        if self.flags != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): This field MUST contain the value "%xC0.91.AD.D3.51.9D.CF.11.A4.A9.00.AA.00.47.FA.A4".
        self.providerUid = try dataStream.read(type: UUID.self)
        if self.providerUid != WrappedEntryId.providerUid {
            throw MAPIError.corrupted
        }
        
        /// Type (1 byte): An 8-bit value that specifies how the EmbeddedEntryID field is interpreted and MUST be a combination of bits
        /// from the following table.
        /// 0x0F The lower 4 bits of the Type field are interpreted as an unsigned integer value that specifies what type of EntryID is
        /// embedded in this Wrapped EntryID structure. These bits MUST be set to one of the following values:
        ///  A value of 0 designates a one-off EntryID; the EmbeddedEntryID field MUST be a One-Off EntryID structure ([MS-OXCDATA]
        /// section 2.2.5.1).
        ///  A value of 3 designates the EntryID of a Contact object; the EmbeddedEntryID field MUST be a Message EntryID structure
        /// ([MS-OXCDATA] section 2.2.4.2).
        ///  A value of 4 designates the EntryID of a Personal Distribution List object; the EmbeddedEntryID field MUST be a Message
        /// EntryID structure ([MS-OXCDATA] section 2.2.4.2).
        ///  A value of 5 designates the EntryID of a mail user in the GAL; the EmbeddedEntryID field MUST be an Address Book EntryID
        /// structure ([MS-OXCDATA] section 2.2.5.2).
        ///  A value of 6 designates the EntryID of a distribution list in the GAL; the EmbeddedEntryID field MUST be an Address Book
        /// EntryID structure ([MS-OXCDATA] section 2.2.5.2).
        /// 0x70 The next 3 bits of the Type field are interpreted as an unsigned integer value. If the EmbeddedEntryID field contains a
        /// one-off EntryID, this value MUST be 0. If the EmbeddedEntryID field does not contain the EntryID of a Contact object, this
        /// value MUST be 3.
        /// If the EmbeddedEntryID field contains a the EntryID of a Contact object, this unsigned integer MUST have one of the following
        /// values:
        ///  0 (denoting a Business Fax electronic address)
        ///  1 (denoting a Home Fax electronic address)
        ///  2 (denoting a Primary Fax electronic address)
        ///  4 (denoting an Email1 address)
        ///  5 (denoting an Email2 address)
        ///  6 (denoting an Email3 address)
        /// Note that this value MUST NOT be set to 7.
        /// 0x80 If the EmbeddedEntryID field contains a one-off EntryID, this bit MUST NOT be set. Otherwise, this bit MUST be set.
        self.type = try dataStream.read()
        
        /// EmbeddedEntryID (variable): An array of bytes that specifies an EntryID that MUST be interpreted according to the value of the
        /// Type field, more specifically according to the value contained in the lower 4 bits of the Type field, as specified in the previous table.
        let remainingCount = size - (dataStream.position - position)
        switch self.type & 0x0F {
        case 0:
            self.embeddedEntryID = try OneOffEntryID(dataStream: &dataStream)
        case 3:
            if remainingCount == 46 {
                self.embeddedEntryID = try FolderEntryID(dataStream: &dataStream, size: remainingCount)
            } else if remainingCount == 70 {
                self.embeddedEntryID = try MessageEntryID(dataStream: &dataStream, size: remainingCount)
            } else {
                self.embeddedEntryID = try getEntryID(dataStream: &dataStream, size: size)
            }
        case 4:
            self.embeddedEntryID = try MessageEntryID(dataStream: &dataStream, size: remainingCount)
        case 5:
            self.embeddedEntryID = try AddressBookEntryID(dataStream: &dataStream, size: remainingCount)
        case 6:
            self.embeddedEntryID = try AddressBookEntryID(dataStream: &dataStream, size: remainingCount)
        default:
            throw MAPIError.corrupted
        }
    }
}
