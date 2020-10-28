//
//  DistListMemberInfo.swift
//  
//
//  Created by Hugh Bellamy on 28/10/2020.
//

import DataStream

/// [MS-OXOCNTC] 2.2.2.2.4.1 DistListMemberInfo Structure
/// The DistListMemberInfo structure contains information about one member of the personal distribution list. The following table specifies
/// the format of the DistListMemberInfo structure stored in the PidLidDistributionListStream property (section 2.2.2.2.4).
public struct DistListMemberInfo {
    public let entryIdSize: UInt32
    public let entryIdData: EntryID
    public let oneOffEntryIdSize: UInt32
    public let oneOffEntryIdData: EntryID?
    public let extraMemberInfoSize: UInt32
    public let extraMemberInfo: [UInt8]?
    
    public init(dataStream: inout DataStream) throws {
        /// EntryIdSize (4 bytes): An integer that specifies the size, in bytes, of the EntryIdData field.
        self.entryIdSize = try dataStream.read(endianess: .littleEndian)
        
        /// EntryIdData (variable): An array of bytes that specify the EntryID of this member of the personal distribution list. A member can
        /// be another personal distribution list, an electronic address contained in a contact, a GAL member, a distribution list, or a one-off
        /// email address. The format of the EntryID MUST be either a One-OffEntryID structure ([MS-OXCDATA] section 2.2.5.1) or a
        /// WrappedEntryId structure (section 2.2.2.2.4.1.1).
        self.entryIdData = try getEntryID(dataStream: &dataStream, size: Int(self.entryIdSize))
        
        /// one-offEntryIdSize (4 bytes): An integer that specifies the size, in bytes, of the oneoffEntryIdData field. If there is no
        /// corresponding one-off EntryID for this member, this value MUST be set to 0x00000000.
        self.oneOffEntryIdSize = try dataStream.read(endianess: .littleEndian)
        
        /// one-offEntryIdData (variable): An array of bytes that specify the one-off EntryID of this member of the personal distribution list.
        /// This one-off EntryID encapsulates the display name and email address of the personal distribution list member.
        if self.oneOffEntryIdSize != 0x00000000 {
            self.oneOffEntryIdData = try getEntryID(dataStream: &dataStream, size: Int(self.oneOffEntryIdSize))
        } else {
            self.oneOffEntryIdData = nil
        }
        
        /// ExtraMemberInfoSize (4 bytes): This field MUST be set to 0.
        self.extraMemberInfoSize = try dataStream.read(endianess: .littleEndian)
        if self.extraMemberInfoSize != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ExtraMemberInfoData (variable): This field is not used by either the client or the server and MUST NOT be present.
        if self.extraMemberInfoSize != 0x00000000 {
            self.extraMemberInfo = try dataStream.readBytes(count: Int(self.extraMemberInfoSize))
        } else {
            self.extraMemberInfo = nil
        }
    }
}
