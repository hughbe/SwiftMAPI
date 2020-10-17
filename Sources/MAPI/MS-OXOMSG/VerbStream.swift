//
//  VerbStream.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXOMSG] 2.2.1.74 PidLidVerbStream Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidVerbStream property ([MS-OXPROPS] section 2.350) specifies what voting responses the user can make
/// in response to the message. The format is of this property is shown in the following diagram
public struct VerbStream {
    public let version: UInt16
    public let count: UInt32
    public let voteOptions: [VoteOption]
    public let version2: UInt16
    public let voteOptionsExtras: [VoteOptionExtra]
    
    public init(dataStream: inout DataStream) throws {
        /// Version (WORD): Set to 0x0102.
        self.version = try dataStream.read(endianess: .littleEndian)
        if self.version != 0x0102 {
            throw MAPIError.corrupted
        }
        
        /// Count (DWORD): Specifies the count of the VoteOption structures plus the count of the
        /// VoteOptionExtras structures to follow.
        self.count = try dataStream.read(endianess: .littleEndian)
        
        /// VoteOption1 (variable length): The first VoteOption structure specified in section 2.2.1.74.1.
        /// VoteOptionN (variable length): The last VoteOption structure specified in section 2.2.1.74.1,
        /// where the ‘N’ in the field name represents the count of all the VoteOption structures in the
        /// PidLidVerbStream.
        var voteOptions: [VoteOption] = []
        voteOptions.reserveCapacity(Int(self.count))
        for _ in 0..<self.count {
            let voteOption = try VoteOption(dataStream: &dataStream)
            voteOptions.append(voteOption)

            dataStream.position += 2
        }
        
        self.voteOptions = voteOptions
        
        /// Version2 (WORD): MUST be set to 0x0104.
        self.version2 = try dataStream.read(endianess: .littleEndian)
        if self.version2 != 0x0104 {
            throw MAPIError.corrupted
        }
        
        /// VoteOptionExtras1 (variable length): The first VoteOptionExtras structure specified in section 2.2.1.74.2.
        /// VoteOptionExtrasN (variable length): The last VoteOptionExtras structure specified in section 2.2.1.74.2,
        /// where the ‘N’ in the field name represents the count of all the VoteOptionExtras structures in the PidLidVerbStream.
        var voteOptionsExtras: [VoteOptionExtra] = []
        voteOptionsExtras.reserveCapacity(Int(self.count))
        for _ in 0..<self.count {
            let voteOptionExtra = try VoteOptionExtra(dataStream: &dataStream)
            voteOptionsExtras.append(voteOptionExtra)
        }
        
        self.voteOptionsExtras = voteOptionsExtras
        
        assert(dataStream.remainingCount == 0)
    }
}
