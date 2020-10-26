//
//  FlatUID.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.5 Flat UID Structures
/// The FlatUID structure, as specified in section 2.5.1, is a byte-order independent version of a GUID structure and is used to
/// uniquely identify a service provider. It appears in EntryIDs. The FlatUID_r structure is an encoding of the FlatUID structure.
/// The semantic meaning is unchanged from the FlatUID data structure.
/// [MS-OXCDATA] 2.5.1 FlatUID Structure
/// A FlatUID structure is a GUID structure put into little-endian byte order. That is, FlatUID and GUID structures have the same
/// byte order when used on a little-endian processor. However, on a bigendian processor, the FlatUID structure has the same
/// byte order as on the little-endian machine, but the GUID structure uses big-endian format for certain fields.
public struct FlatUID {
    public let flatUID: [UInt8]
    
    public init(dataStream: inout DataStream) throws  {
        /// FlatUID (16 bytes): A flat little-endian sequence used as a unique identifier in various structures.
        self.flatUID = try dataStream.readBytes(count: 16)
    }
}
