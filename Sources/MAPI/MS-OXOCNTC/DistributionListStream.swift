//
//  DistributionListStream.swift
//  
//
//  Created by Hugh Bellamy on 28/10/2020.
//

import DataStream

/// [MS-OXOCNTC] 2.2.2.2.4 PidLidDistributionListStream Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidDistributionListStream property ([MS-OXPROPS] section 2.100) specifies the list of EntryIDs and one-off EntryIDs corresponding
/// to the members of the personal distribution list. Members of the personal distribution list can be other personal distribution lists, electronic
/// addresses contained in a contact, GAL members, or one-off email addresses. The format of each EntryID MUST be as specified in section
/// 2.2.2.2.1, and the format for each one-off EntryID MUST be as specified in section 2.2.2.2.2.
/// The PidLidDistributionListStream property is intended to allow a distribution list to grow past the size limits of the
/// PidLidDistributionListMembers property (section 2.2.2.2.1) and the PidLidDistributionListOneOffMembers property (section 2.2.2.2.2).
/// This property SHOULD<16> be used if the size of either PidLidDistributionListMembers or PidLidDistributionListOneOffMembers would
/// be greater than 15,000 bytes. If this property is set, the PidLidDistributionListMembers, PidLidDistributionListOneOffMembers, and
/// PidLidDistributionListChecksum (section 2.2.2.2.3) properties SHOULD<17> be ignored.
/// The following diagram specifies the buffer format of the PidLidDistributionListStream property.
public struct DistributionListStream {
    public let streamVersion: UInt16
    public let reserved: UInt16
    public let buildVersion: UInt32
    public let distListStreamFlags: Flags
    public let countOfEntries: UInt32
    public let totalEntryIDSize: UInt32
    public let totalOneOffSize: UInt32
    public let totalExtraSize: UInt32
    public let distListMemberInfoArray: [DistListMemberInfo]
    public let terminator1: UInt32
    public let terminator2: UInt32
    
    public init(dataStream: inout DataStream) throws {
        /// StreamVersion (2 bytes): A 16-bit value that specifies the version of the stream. This field MUST be set to 0x0001.
        self.streamVersion = try dataStream.read(endianess: .littleEndian)
        if self.streamVersion != 0x0001 {
            throw MAPIError.corrupted
        }
        
        /// Reserved (2 bytes): This field MUST be set to zero when sent and MUST be ignored when received.
        self.reserved = try dataStream.read(endianess: .littleEndian)
        
        /// BuildVersion (4 bytes): A 32-bit value that specifies the build version of the stream. The value of this field is the value of the
        /// MajorVersion field of the PidLidBusinessCardDisplayDefinition property (section 2.2.1.7.1) multiplied by 10,000. The value
        /// of the MinorVersion field of the PidLidBusinessCardDisplayDefinition property is then added to the result.
        self.buildVersion = try dataStream.read(endianess: .littleEndian)
        
        /// DistListStreamFlags (4 bytes): A 32-bit value that contains bits that indicate overall behavior of the personal distribution list.
        /// The following table specifies the valid flags.
        /// If the Always Use Stream bit is set, a client MUST save the personal distribution list members in the stream, even if the members
        /// would normally fit in the PidLidDistributionListMembers and PidLidDistributionListOneOffMembers properties.
        /// When modifying the personal distribution list, a client MUST preserve any data in the Reserved
        /// portion of this field. When creating a new personal distribution list, this value MUST set the reserved bits to 0.
        let distListStreamFlagsRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.distListStreamFlags = Flags(rawValue: distListStreamFlagsRaw)
        
        /// CountOfEntries (4 bytes): An integer that specifies the number of DistListMemberInfo structures, as specified in section 2.2.2.2.4.1,
        /// in the DistListMemberInfoArray field.
        self.countOfEntries = try dataStream.read(endianess: .littleEndian)
        
        /// TotalEntryIDSize (4 bytes): An integer that specifies the sum of the sizes (in bytes) of the EntryIDs stored in each
        /// DistListMemberInfo structure.
        self.totalEntryIDSize = try dataStream.read(endianess: .littleEndian)
        
        /// TotalOneOffSize (4 bytes): An integer that specifies the sum of the sizes (in bytes) of the one-off EntryIDs stored in each
        /// DistListMemberInfo structure.
        self.totalOneOffSize = try dataStream.read(endianess: .littleEndian)
        
        /// TotalExtraSize (4 bytes): Not used. This field MUST be set to 0x00000000.
        self.totalExtraSize = try dataStream.read(endianess: .littleEndian)
        if self.totalExtraSize != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// DistListMemberInfoArray (variable): An array of DistListMemberInfo structures (section 2.2.2.2.4.1), each of which contains
        /// information about one member of the personal distribution list.
        var distListMemberInfoArray: [DistListMemberInfo] = []
        distListMemberInfoArray.reserveCapacity(Int(self.countOfEntries))
        for _ in 0..<self.countOfEntries {
            let distListMemberInfo = try DistListMemberInfo(dataStream: &dataStream)
            distListMemberInfoArray.append(distListMemberInfo)
        }
        
        self.distListMemberInfoArray = distListMemberInfoArray
        
        /// Terminator1 (4 bytes): Not used. This field MUST be set to 0x00000000.
        self.terminator1 = try dataStream.read(endianess: .littleEndian)
        if self.terminator1 != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// Terminator2 (4 bytes): Not used. This field MUST be set to 0x00000000.
        self.terminator2 = try dataStream.read(endianess: .littleEndian)
        if self.terminator2 != 0x00000000 {
            throw MAPIError.corrupted
        }
    }
    
    /// DistListStreamFlags (4 bytes): A 32-bit value that contains bits that indicate overall behavior of the personal distribution list.
    /// The following table specifies the valid flags.
    /// If the Always Use Stream bit is set, a client MUST save the personal distribution list members in the stream, even if the members
    /// would normally fit in the PidLidDistributionListMembers and PidLidDistributionListOneOffMembers properties.
    /// When modifying the personal distribution list, a client MUST preserve any data in the Reserved
    /// portion of this field. When creating a new personal distribution list, this value MUST set the reserved bits to 0.
    public struct Flags: OptionSet {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        public static let alwaysUseStream = Flags(rawValue: 0x00000001)

        public static let all: Flags = [.alwaysUseStream]
    }
}
