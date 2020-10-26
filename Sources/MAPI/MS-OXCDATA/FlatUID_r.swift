//
//  FlatUID_r.swift
//
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.5 Flat UID Structures
/// The FlatUID structure, as specified in section 2.5.1, is a byte-order independent version of a GUID structure and is used to
/// uniquely identify a service provider. It appears in EntryIDs. The FlatUID_r structure is an encoding of the FlatUID structure.
/// The semantic meaning is unchanged from the FlatUID data structure.
/// [MS-OXCDATA] 2.5.2 FlatUID_r Structure
public struct FlatUID_r {
    public let flatUID: [UInt8]
    
    public init(dataStream: inout DataStream) throws  {
        /// FlatUID (16 bytes): A flat little-endian sequence used as a unique identifier in various structures.
        self.flatUID = try dataStream.readBytes(count: 16)
    }
}
