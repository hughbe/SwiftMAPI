//
//  TZRule.swift
//  
//
//  Created by Hugh Bellamy on 17/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXOCAL] 2.2.1.41.1 TZRule Structure
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// Each TZRule structure is represented as shown in the following diagram.
public struct TZRule {
    public let majorVersion: UInt8
    public let minorVersion: UInt8
    public let reserved: UInt16
    public let flags: TZRuleFlags
    public let wYear: UInt16
    public let x: [UInt8]
    public let lBias: UInt32
    public let lStandardBias: UInt32
    public let lDaylightBias: UInt32
    public let stStandardDate: SYSTEMTIME
    public let stDaylightDate: SYSTEMTIME
    
    public init(dataStream: inout DataStream) throws {
        /// Major version (1 byte): This field is set to 0x02.
        self.majorVersion = try dataStream.read()
        if self.majorVersion != 0x02 {
            throw MAPIError.corrupted
        }
        
        /// Minor version (1 byte): This field is set to 0x01.
        self.minorVersion = try dataStream.read()
        if self.minorVersion != 0x01 {
            throw MAPIError.corrupted
        }
        
        /// Reserved (2 bytes): This field MUST be set to 0x003E.
        self.reserved = try dataStream.read(endianess: .littleEndian)
        if self.reserved != 0x003E {
            throw MAPIError.corrupted
        }
        
        /// TZRule flags (2 bytes): This field contains individual bit flags that specify information about this TZRule structure,
        /// represented here in little-endian byte order.
        let flagsRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        self.flags = TZRuleFlags(rawValue: flagsRaw)
        
        /// wYear (2 bytes): A property that specifies the year in which this rule (2) is scheduled to take effect.
        /// A rule (2) will remain in effect from January 1 of its wYear field value until January 1 of the next rule's (2) wYear field value.
        /// If no rules (2) exist for subsequent years, this rule (2) will remain in effect indefinitely.
        self.wYear = try dataStream.read(endianess: .littleEndian)
        
        /// X (14 bytes): This field is unused; MUST be all zeros.
        self.x = try dataStream.readBytes(count: 14)
        
        /// lBias (4 bytes): This field specifies the time zone's offset in minutes from UTC.
        self.lBias = try dataStream.read(endianess: .littleEndian)
        
        /// lStandardBias (4 bytes): This field specifies the offset in minutes from the value stored in the lBias field during standard time.
        self.lStandardBias = try dataStream.read(endianess: .littleEndian)
        
        /// lDaylightBias (4 bytes): This field specifies the offset in minutes from lBias during daylight saving time.
        self.lDaylightBias = try dataStream.read(endianess: .littleEndian)
        
        /// stStandardDate (16 bytes): A SYSTEMTIME structure ([MS-DTYP]). This field contains the date and local time to begin
        /// using the value of the lStandardBias field.
        /// If the time zone does not support daylight saving time, the wMonth field in the SYSTEMTIME structure MUST be zero.
        /// If the wYear field in the SYSTEMTIME structure is not zero, the date is interpreted as an absolute date that only occurs once.
        /// If the wYear field is zero, the date is interpreted as a relative date that occurs yearly. The wHour and wMinute fields are set
        /// to the transition time, the wDayOfWeek field is set to the appropriate weekday, and the wDay field is set to indicate the
        /// occurrence of the day of the week within the month (1 to 5, where 5 indicates the final occurrence during the month if that
        /// day of the week does not occur 5 times).
        self.stStandardDate = try SYSTEMTIME(dataStream: &dataStream)
        
        /// stDaylightDate (16 bytes): A SYSTEMTIME structure containing the date and local time that specifies when to begin using
        /// the value stored in the lDaylightBias field. This property has the same format and constraints as the stStandardDate field.
        self.stDaylightDate = try SYSTEMTIME(dataStream: &dataStream)
    }
}
