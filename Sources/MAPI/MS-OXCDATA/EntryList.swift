//
//  EntryList.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.3 EntryID Lists
/// [MS-OXCDATA] 2.3.1 EntryList Structure
/// An EntryList structure specifies a set of data used in search folder criteria to serialize a list of
/// EntryID structures. EntryList structures contain three parts:
///  The count of entries in the list
///  COUNT structures (section 2.11.1.1) giving the length of individual entries
///  Data for each of the individual entries
public struct EntryList {
    public let entryCount: UInt32
    public let pad: UInt32
    public let entryLengths: [(length: UInt32, pad: UInt32)]
    public let entryIDs: [EntryID]
    
    public init(dataStream: inout DataStream) throws {
        /// EntryCount (4 bytes): An unsigned integer giving the number of EntryID structures in the list. It
        /// MUST be followed by that many EntryLength and that many EntryID structures.
        self.entryCount = try dataStream.read(endianess: .littleEndian)
        
        /// Pad (4 bytes): This field can be any value; clients and servers MUST ignore the value.
        self.pad = try dataStream.read(endianess: .littleEndian)
        
        /// EntryLength (variable): A series of EntryCount field pairs: an unsigned integer giving the size of
        /// one EntryID field, followed by 4-byte pad that can have any value.
        var entryLengths: [(length: UInt32, pad: UInt32)] = []
        entryLengths.reserveCapacity(Int(self.entryCount))
        for _ in 0..<self.entryCount {
            let length: UInt32 = try dataStream.read(endianess: .littleEndian)
            let pad: UInt32 = try dataStream.read(endianess: .littleEndian)
            entryLengths.append((length, pad))
        }
        
        self.entryLengths = entryLengths
        
        /// EntryIDs (variable): A series of EntryID fields. The number of EntryID fields is specified by the
        /// EntryCount field. The length of the first EntryID field is specified by the first 32 bits of the first
        /// element of the EntryID field is specified by the first 32 bits of the second element of the
        /// EntryLength field.
        var entryIDs: [EntryID] = []
        entryIDs.reserveCapacity(Int(self.entryCount))
        for i in 0..<self.entryCount {
            let entryID = try getEntryID(dataStream: &dataStream, size: Int(entryLengths[Int(i)].length))
            entryIDs.append(entryID)
        }
        
        self.entryIDs = entryIDs
    }
}
