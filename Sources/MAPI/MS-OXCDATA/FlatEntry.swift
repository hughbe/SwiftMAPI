//
//  FlatEntry.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.3 EntryID Lists
/// [MS-OXCDATA] 2.3.2 FlatEntry Structure
/// A FlatEntry structure is the size of an EntryID, followed by the EntryID itself, for ease of serialization.
public struct FlatEntry {
    public let size: UInt32
    public let entryID: EntryID
    
    public init(dataStream: inout DataStream) throws {
        /// Size (4 bytes): An unsigned integer giving the size of the following EntryID field, not including the Size field.
        self.size = try dataStream.read(endianess: .littleEndian)
        
        let position = dataStream.position
        
        /// EntryID (variable): The EntryID structure itself. It MUST be exactly the length, in bytes, indicated by the Size field.
        self.entryID = try getEntryID(dataStream: &dataStream, size: Int(self.size))
        
        if dataStream.position - position != size {
            throw MAPIError.corrupted
        }
    }
}
