//
//  PropertyName.swift
//
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.6 Property Name Structures
/// The PropertyName structure, as specified in section 2.6.1, describes a named property. It is used in RopGetPropertyIdsFromNames
/// ([MS-OXCROPS] section 2.2.8.1) and RopGetNamesFromPropertyIds ([MS-OXCROPS] section 2.2.8.2) ROP requests.
/// The PropertyName_r structure, specified in [MS-NSPI], is an encoding of the PropertyName data structure. Strictly speaking,
/// both the PropertyName_r structure and the PropertyName structure are distinct encodings of the same abstract data structure
/// rather than PropertyName_r being an encoding of PropertyName. In this case, the semantics of the PropertyName_r structure is
/// different from the PropertyName structure; PropertyName_r uses no string names, only long IDs (LIDs). The packet diagrams in
/// sections 2.6.1 and 2.6.2 illustrate the differences between the two structures.
/// [MS-OXCDATA] 2.6.2 PropertyName_r Structure
/// The PropertyName_r structure does not support string names for named properties. The PropertyName_r structure only
/// supports LIDs.
public struct PropertyName_r {
    public let guid: FlatUID
    public let reserved: UInt32
    public let lid: UInt32
    
    public init(dataStream: inout DataStream) throws {
        /// GUID (16 bytes): Encodes the GUID field of the PropertyName structure, as specified in section 2.6.1.
        self.guid = try FlatUID(dataStream: &dataStream)
        
        /// Reserved (4 bytes): All clients and servers MUST set this value to 0x00000000.
        self.reserved = try dataStream.read(endianess: .littleEndian)
        if self.reserved != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// LID (4 bytes): This value encodes the LID field in the PropertyName structure, as specified in section 2.6.1. Unlike the
        /// optional LID field in the PropertyName structure, the LID field is always present in the PropertyName_r structure.
        /// Also, string names for named properties are not allowed.
        self.lid = try dataStream.read(endianess: .littleEndian)
    }
}
