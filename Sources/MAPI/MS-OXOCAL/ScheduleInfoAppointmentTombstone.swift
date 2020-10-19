//
//  ScheduleInfoAppointmentTombstone.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.12.5 PidTagScheduleInfoAppointmentTombstone Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidTagScheduleInfoAppointmentTombstone property ([MS-OXPROPS] section 2.966) in a delegator's Delegate Information object contains a list of tombstones.
/// This property is not required. If this property does not exist when a meeting is declined by the delegator or the delegate, it MUST be created.
/// This property has the following structure, where the fields are stored in little-endian byte order.
public struct ScheduleInfoAppointmentTombstone {
    public let identifier: UInt32
    public let headerSize: UInt32
    public let version: UInt32
    public let recordsCount: UInt32
    public let recordsSize: UInt32
    public let records: [Record]
    
    public init(dataStream: inout DataStream) throws {
        /// Identifier (4 bytes): This field MUST have a value of 0xBEDEAFCD.
        self.identifier = try dataStream.read(endianess: .littleEndian)
        if self.identifier != 0xBEDEAFCD {
            throw MAPIError.corrupted
        }
        
        /// HeaderSize (4 bytes): This field MUST have a value of 0x00000014.
        self.headerSize = try dataStream.read(endianess: .littleEndian)
        if self.headerSize != 0x00000014 {
            throw MAPIError.corrupted
        }
        
        /// Version (4 bytes): This field MUST have a value of 0x00000003.
        self.version = try dataStream.read(endianess: .littleEndian)
        if self.version != 0x00000003 {
            throw MAPIError.corrupted
        }
        
        /// RecordsCount (4 bytes): The number of structures contained in the Records field.
        self.recordsCount = try dataStream.read(endianess: .littleEndian)
        
        /// RecordsSize (4 bytes): This field MUST have a value of 0x00000014.
        self.recordsSize = try dataStream.read(endianess: .littleEndian)
        if self.recordsSize != 0x00000014 {
            throw MAPIError.corrupted
        }
        
        /// Records (variable): An array of Record structures (section 2.2.12.5.1), each of which specifies a tombstone.
        var records: [Record] = []
        records.reserveCapacity(Int(self.recordsCount))
        for _ in 0..<recordsCount {
            let record = try Record(dataStream: &dataStream)
            records.append(record)
        }
        
        self.records = records
        
        assert(dataStream.remainingCount == 0)
    }
}
