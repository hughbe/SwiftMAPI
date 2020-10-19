//
//  TimeZoneStruct.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXOCAl] 2.2.1.39 PidLidTimeZoneStruct Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidTimeZoneStruct property ([MS-OXPROPS] section 2.343) is set on a recurring series to specify time zone information.
/// This property specifies how to convert time fields between local time and UTC. The fields in this BLOB are encoded in little-endian byte order.
public struct TimeZoneStruct {
    public let lBias: UInt32
    public let lStandardBias: UInt32
    public let lDaylightBias: UInt32
    public let wStandardYear: UInt16
    public let stStandardDate: SYSTEMTIME
    public let wDaylightYear: UInt16
    public let stDaylightDate: SYSTEMTIME

    public init(dataStream: inout DataStream) throws {
        /// lBias (4 bytes): The time zone's offset in minutes from UTC.
        self.lBias = try dataStream.read(endianess: .littleEndian)

        /// lStandardBias (4 bytes): The offset in minutes from the value of the lBias field during standard time.
        self.lStandardBias = try dataStream.read(endianess: .littleEndian)

        /// lDaylightBias (4 bytes): The offset in minutes from the value of the lBias field during daylight saving time.
        self.lDaylightBias = try dataStream.read(endianess: .littleEndian)

        /// wStandardYear (2 bytes): This field matches the stStandardDate's wYear member.
        self.wStandardYear = try dataStream.read(endianess: .littleEndian)

        /// stStandardDate (16 bytes): A SYSTEMTIME structure, as specified in [MS-DTYP]. This field contains the date and local time that indicate when to begin
        /// using the value specified in the lStandardBias field.
        /// If the time zone does not support daylight saving time, the wMonth member in the SYSTEMTIME structure MUST be zero (0). If the wYear member is not
        /// zero (0), the date is interpreted as an absolute date that only occurs once. If the wYear member is zero (0), the date is interpreted as a relative date that
        /// occurs yearly. The wHour and wMinute members are set to the transition time; the wDayOfWeek member is set to the appropriate weekday, and the
        /// wDay member is set to indicate the occurrence of the day of the week within the month (1 to 5, where 5 indicates the final occurrence during the month
        /// if that day of the week does not occur 5 times).
        self.stStandardDate = try SYSTEMTIME(dataStream: &dataStream)

        /// wDaylightYear (2 bytes): This field is equal to the value of the stDaylightDate's wYear field.
        self.wDaylightYear = try dataStream.read(endianess: .littleEndian)

        /// stDaylightDate (16 bytes): A SYSTEMTIME structure. This field contains the date and local time that indicate when to begin using the value specified in the
        /// lDaylightBias field. This field has the same format and constraints as the stStandardDate field.
        self.stDaylightDate = try SYSTEMTIME(dataStream: &dataStream)
        
        assert(dataStream.remainingCount == 0)
    }
}
