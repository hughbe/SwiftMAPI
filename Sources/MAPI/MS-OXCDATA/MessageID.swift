//
//  MessageID.swift
//
//
//  Created by Hugh Bellamy on 02/10/2020.
//

import  DataStream

/// [MS-OXCDATA] 2.2.1.2 Message ID Structure
/// A Message ID structure uniquely identifies a message in the context of a logon to a Store object. The Message ID structure is serialized
/// compactly in the context of a ROP, such as the RopOpenMessage ROP ([MS-OXCROPS] section 2.2.6.1), where the Store object
/// context is already established. It is an 8-byte structure.
public struct MessageID {
    public let rawValue: UInt64

    /// ReplicaId (2 bytes): An unsigned integer identifying a Store object.
    public var replicaId: UInt16 {
        return UInt16(rawValue & 0b1111111111111111)
    }
    
    /// GlobalCounter (6 bytes): An unsigned integer identifying the message within its Store object.
    public var globalCounter: UInt64 {
        return rawValue >> 16
    }
    
    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
    
    public init(dataStream: inout DataStream) throws {
        self.init(rawValue: try dataStream.read(endianess: .littleEndian))
    }
}
