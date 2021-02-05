//
//  GID.swift
//  
//
//  Created by Hugh Bellamy on 02/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.1.3 Global Identifier Structure
/// A Global Identifier structure identifies a folder or message in a Store object. It differs from a Folder
/// ID structure, as specified in section 2.2.1.1, or Message ID structure, as specified in section 2.2.1.2,
/// in that the ReplicaId field is replaced by the corresponding Store object's GUID. The last fields of a
/// Folder ID structure or message EntryID structure, as specified in section 2.2.4.2 are effectively a
/// Global Identifier structure.
public struct GID {
    public let databaseGuid: GUID
    public let globalCounter: UInt64
    
    public init(dataStream: inout DataStream) throws {
        /// DatabaseGuid (16 bytes): An unsigned integer identifying a Store object.
        self.databaseGuid = try GUID(dataStream: &dataStream)
        
        /// GlobalCounter (6 bytes): An unsigned integer identifying the folder or message within its Store object.
        self.globalCounter = try dataStream.readUInt48()
    }
}
