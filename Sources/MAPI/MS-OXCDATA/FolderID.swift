//
//  FolderID.swift
//  
//
//  Created by Hugh Bellamy on 02/10/2020.
//

/// [MS-OXCDATA] 2.2.1.1 Folder ID Structure
/// A Folder ID structure uniquely identifies a folder in the context of a logon to a Store object. The Folder ID structure is used in the context
/// of a ROP, such as the RopOpenFolder ROP ([MSOXCROPS] section 2.2.4.1), where the Store object context is already established.
/// It is an 8-byte structure.
public struct FolderID {
    public let rawValue: UInt64

    /// ReplicaId (2 bytes): An unsigned integer identifying a Store object.
    public var replicaId: UInt16 {
        return UInt16(rawValue & 0b1111111111111111)
    }
    
    /// GlobalCounter (6 bytes): An unsigned integer identifying the folder within its Store object.
    public var globalCounter: UInt64 {
        return rawValue >> 16
    }
    
    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
}
