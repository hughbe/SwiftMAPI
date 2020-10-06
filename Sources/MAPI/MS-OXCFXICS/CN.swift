//
//  File.swift
//  
//
//  Created by Hugh Bellamy on 02/10/2020.
//

/// [MS-OXCFXICS] 2.2.2.1 CN Structure
/// A CN structure contains a change number that identifies a version of a messaging object. CNs are
/// identical in format to Folder ID structures ([MS-OXCDATA] section 2.2.1.1) and Message ID
/// structures ([MS-OXCDATA] section 2.2.1.2), except the GlobalCounter field represents a change to a
/// messaging object rather than a messaging object itself.
public struct CN {
    public let rawValue: UInt64

    /// ReplicaId (2 bytes): A 16-bit unsigned integer identifying the server replica in which the messaging object was last changed.
    public var replicaId: UInt16 {
        return UInt16(rawValue & 0b1111111111111111)
    }
    
    /// GlobalCounter (6 bytes): An unsigned 48-bit integer identifying the change to the messaging object.
    public var globalCounter: UInt64 {
        return rawValue >> 16
    }
    
    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
}
