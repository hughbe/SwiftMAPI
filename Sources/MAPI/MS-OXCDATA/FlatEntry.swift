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
    
    public init(entryID: EntryID) {
        self.size = UInt32(entryID.dataSize)
        self.entryID = entryID
    }
    
    public init(size: UInt32, entryID: EntryID) {
        self.size = size
        self.entryID = entryID
    }
    
    public init(dataStream: inout DataStream) throws {
        /// Size (4 bytes): An unsigned integer giving the size of the following EntryID field, not including the Size field.
        self.size = try dataStream.read(endianess: .littleEndian)
        guard self.size <= dataStream.remainingCount else {
            throw MAPIError.corrupted
        }
        
        let position = dataStream.position
        
        /// EntryID (variable): The EntryID structure itself. It MUST be exactly the length, in bytes, indicated by the Size field.
        self.entryID = try getEntryID(dataStream: &dataStream, size: Int(self.size))
        
        guard dataStream.position - position == size else {
            throw MAPIError.corrupted
        }
    }
    
    public var dataSize: Int {
        return 4 + entryID.dataSize
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        dataStream.write(size, endianess: .littleEndian)
        entryID.write(to: &dataStream)
    }
}
