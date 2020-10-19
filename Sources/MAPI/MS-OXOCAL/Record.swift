//
//  Record.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream
import Foundation

/// [MS-OXOCAL] 2.2.12.5.1 Record Structure
/// The Record structure specifies a tombstone within the Records field of the PidTagScheduleInfoAppointmentTombstone property (section 2.2.12.5).
public struct Record {
    public let startTime: Date
    public let endTime: Date
    public let globalObjectIdSize: UInt32
    public let globalObjectId: GlobalObjectId
    public let usernameSize: UInt16
    public let username: String
    
    public init(dataStream: inout DataStream) throws {
        func readDate() throws -> Date {
            let rawValue: UInt32 = try dataStream.read(endianess: .littleEndian)
            let secondsToUnixEpoch: UInt64 = 11644473600
            let unixTimestamp = UInt64(rawValue) * 60 + secondsToUnixEpoch
            return Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        }
        
        /// StartTime (4 bytes): The start time of the Meeting object in minutes since midnight, January 1, 1601, UTC.
        self.startTime = try readDate()
        
        /// EndTime (4 bytes): The end time of the Meeting object in minutes since midnight, January 1, 1601, UTC.
        self.endTime = try readDate()
        
        /// GlobalObjectIdSize (4 bytes): The size, in bytes, of the GlobalObjectId field.
        self.globalObjectIdSize = try dataStream.read(endianess: .littleEndian)
        
        /// GlobalObjectId (variable): The value of the PidLidGlobalObjectId property (section 2.2.1.27) of the meeting that this record represents.
        self.globalObjectId = try GlobalObjectId(dataStream: &dataStream)
        
        /// UsernameSize (2 bytes): The size, in bytes, of the Username field.
        self.usernameSize = try dataStream.read(endianess: .littleEndian)
        
        /// Username (variable): A non-Unicode string. The value of the Username field is equal to the value of the PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5)
        /// of the Address Book object of the user who added the tombstone.
        self.username = try dataStream.readString(count: Int(self.usernameSize), encoding: .ascii)!
    }
}
