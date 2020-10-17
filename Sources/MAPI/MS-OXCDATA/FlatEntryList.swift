//
//  FlatEntryList.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.3 EntryID Lists
/// [MS-OXCDATA] 2.3.3 FlatEntryList Structure
/// A FlatEntryList structure gives the number of EntryIDs and their total size, followed by a series of FlatEntry structures.
public struct FlatEntryList {
    public let count: UInt32
    public let size: UInt32
    public let flatEntries: [FlatEntry]
    
    public init(dataStream: inout DataStream) throws {
        /// Count (4 bytes): An unsigned integer giving the number of FlatEntry structures in the list.
        self.count = try dataStream.read(endianess: .littleEndian)

        /// Size (4 bytes): The total size of all the FlatEntry structures, not including the Count and Size fields.
        self.size = try dataStream.read(endianess: .littleEndian)
        
        let position = dataStream.position
        
        /// FlatEntries (variable): A series of FlatEntry structures with the actual EntryID data. The number of
        /// structures MUST be exactly the same as the value of the Count field, and their total size MUST be
        /// exactly the same as the value of the Size field.
        var flatEntries: [FlatEntry] = []
        flatEntries.reserveCapacity(Int(self.count))
        for _ in 0..<self.count {
            let flatEntry = try FlatEntry(dataStream: &dataStream)
            flatEntries.append(flatEntry)
            
            // Align to 4 byte boundary.
            dataStream.position += Int(flatEntry.size) % 4
        }
        
        self.flatEntries = flatEntries
        
        if dataStream.position - position != self.size {
            throw MAPIError.corrupted
        }
    }
}
