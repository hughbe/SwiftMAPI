//
//  RecurrencePattern.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream
import Foundation

/// [MS-OXOCAL] 2.2.1.44.1 RecurrencePattern Structure
/// The RecurrencePattern structure specifies a recurrence pattern. The fields of this structure are stored in little-endian byte order.
public struct RecurrencePattern {
    public let readerVersion: UInt16
    public let writerVersion: UInt16
    public let recurFrequency: RecurFrequency
    public let patternType: PatternType
    public let calendarType: CalendarType
    public let firstDateTime: UInt32
    public let period: UInt32
    public let slidingFlag: UInt32
    public let patternTypeSpecific: Any?
    public let endType: EndType
    public let occurrenceCount: UInt32
    public let firstDOW: DayOfWeek
    public let deletedInstanceCount: UInt32
    public let deletedInstanceDates: [Date]
    public let modifiedInstanceCount: UInt32
    public let modifiedInstanceDates: [Date]
    public let startDate: Date
    public let endDate: Date
    
    public init(dataStream: inout DataStream) throws {
        /// ReaderVersion (2 bytes): This field MUST be set to 0x3004.
        self.readerVersion = try dataStream.read(endianess: .littleEndian)
        if self.readerVersion != 0x3004 {
            throw MAPIError.corrupted
        }
        
        /// WriterVersion (2 bytes): This field MUST be set to 0x3004.
        self.writerVersion = try dataStream.read(endianess: .littleEndian)
        if self.writerVersion != 0x3004 {
            throw MAPIError.corrupted
        }
        
        /// RecurFrequency (2 bytes): An integer that specifies the frequency of the recurring series.
        /// Valid values are listed in the following table.
        let recurFrequencyRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        guard let recurFrequency = RecurFrequency(rawValue: recurFrequencyRaw) else {
            throw MAPIError.corrupted
        }
        
        self.recurFrequency = recurFrequency
        
        /// PatternType (2 bytes): An integer that specifies the type of recurrence pattern.
        /// The valid recurrence pattern types are listed in the following table.
        let patternTypeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        guard let patternType = PatternType(rawValue: patternTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.patternType = patternType
        
        /// CalendarType (2 bytes): An integer that specifies the type of calendar that is used.
        /// The acceptable values for the calendar type are listed in the following table.
        let calendarTypeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        guard let calendarType = CalendarType(rawValue: calendarTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.calendarType = calendarType
        
        /// FirstDateTime (4 bytes): An integer that specifies the first ever day, week, or month of a recurring series, dating back
        /// to a reference date, which is January 1, 1601, for a Gregorian calendar. The value and its meaning depend on the
        /// value of the RecurFrequency field. The value of the FirstDateTime field is used to determine the valid dates of a
        /// recurring series, as specified in section 2.2.1.44.1.2.
        /// The value and meaning of the FirstDateTime field for each type of recurrence frequency are specified in the following table.
        /// For details about how the value is calculated, see section 2.2.1.44.1.1.
        /// Frequency Value and Meaning
        /// Daily The number of minutes between midnight January 1, 1601, and the first ever day on which the event would occur.
        /// Weekly The number of minutes between midnight January 1, 1601, and the first day of the first ever week in which the event would occur.
        /// Monthly or Yearly The number of minutes between midnight January 1, 1601, and the first day of the first ever month in which the event would occur.
        self.firstDateTime = try dataStream.read(endianess: .littleEndian)
        
        /// Period (4 bytes): An integer that specifies the interval at which the meeting pattern specified in PatternTypeSpecific field repeats.
        /// The Period value MUST be between 1 and the maximum recurrence interval, which is 999 days for daily recurrences, 99 weeks
        /// for weekly recurrences, and 99 months for monthly recurrences. The following table lists the values for this field based on the
        /// recurrence frequency, which is specified in the RecurFrequency field.
        /// Frequency Value
        /// Daily recurrence The period is stored as the minutes in whole number of days. For example, to define a recurrence that
        /// occurs every two days, the Period field is set to 0x00000B40, which equals 2880 minutes, or two days.
        /// Weekly recurrence
        /// The period is stored in weeks. For example, if the Period field is set to 0x00000002, the meeting occurs every two weeks.
        /// Monthly or yearly recurrence The period is stored in months. If the recurrence is a yearly recurrence, The Period field MUST be set to 12.
        self.period = try dataStream.read(endianess: .littleEndian)
        
        /// SlidingFlag (4 bytes): This field is only used for scheduling tasks; otherwise the value MUST be
        /// zero (0). For more details about sliding tasks, see [MS-OXOTASK] section 3.1.4.6.2.
        self.slidingFlag = try dataStream.read(endianess: .littleEndian)
        
        /// PatternTypeSpecific (variable): A structure that specifies the details of the recurrence pattern.
        /// The structure varies according to the value of the PatternType field, as specified in sections
        /// 2.2.1.44.1.3, 2.2.1.44.1.4, 2.2.1.44.1.5, and 2.2.1.44.1.6.
        switch self.patternType {
        case .day:
            /// [MS-OXOCAL] 2.2.1.44.1.3 PatternTypeSpecific Day
            /// For a daily recurrence pattern (value of the PatternType field is 0x0000), the PatternTypeSpecific field has no value
            /// and is zero bytes. In other words, the value of the PatternTypeSpecific field is not included in the BLOB when the
            /// value of the PatternType field is 0x0000.
            self.patternTypeSpecific = nil
        case .week:
            self.patternTypeSpecific = try PatternTypeSpecificWeek(dataStream: &dataStream)
        case .month,
             .monthEnd,
             .hjMonth,
             .hjMonthEnd:
            self.patternTypeSpecific = try PatternTypeSpecificMonth(dataStream: &dataStream)
        case .monthNth,
             .hjMonthNth:
            self.patternTypeSpecific = try PatternTypeSpecificMonthNth(dataStream: &dataStream)
        }
        
        /// EndType (4 bytes): An integer that specifies the ending type for the recurrence. This field MUST be set to one of
        /// the values listed in the following table.
        let endTypeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        guard let endType = EndType(rawValue: endTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.endType = endType
        
        /// OccurrenceCount (4 bytes): An integer that specifies the number of occurrences in a recurrence.
        /// When the EndType of the pattern is "End after date", this value has to be computed. Although the
        /// value of this field is set, its value has no meaning on a recurring series that has no end date. This
        /// value can be set to 0x0000000A for a recurring series with no end date.<14>
        self.occurrenceCount = try dataStream.read(endianess: .littleEndian)

        /// FirstDOW (4 bytes): An integer that specifies the day on which the calendar week begins. The default value is Sunday (0x00000000).
        /// This field MUST be set to one of the values listed in the following table.
        let firstDOWRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        guard let firstDOW = DayOfWeek(rawValue: firstDOWRaw) else {
            throw MAPIError.corrupted
        }
        
        self.firstDOW = firstDOW
        
        /// DeletedInstanceCount (4 bytes): An integer that specifies the number of elements in the
        /// DeletedInstanceDates field.
        self.deletedInstanceCount = try dataStream.read(endianess: .littleEndian)
        
        func readDate() throws -> Date {
            let rawValue: UInt32 = try dataStream.read(endianess: .littleEndian)
            let secondsToUnixEpoch: UInt64 = 11644473600
            let unixTimestamp = UInt64(rawValue) * 60 + secondsToUnixEpoch
            return Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        }
        
        /// DeletedInstanceDates (variable): An array of dates, each of which is the original instance date of
        /// either a deleted instance or a modified instance for this recurrence. The number of dates
        /// contained in this array is specified by the DeletedInstanceCount field. Each date is stored as the
        /// number of minutes between midnight, January 1, 1601, and midnight of the specified day, in the
        /// time zone specified by the PidLidTimeZoneStruct property (section 2.2.1.39). The dates are
        /// ordered from earliest to latest.
        /// The array contains exactly one element for each deleted instance, and every deleted instance is
        /// represented. The array also contains an entry for every modified instance. The array SHOULD NOT
        /// contain duplicate entries. Deleted instances for which there is no corresponding value in the
        /// ModifiedInstanceDates field imply that they have been completely removed from the pattern.
        var deletedInstanceDates: [Date] = []
        deletedInstanceDates.reserveCapacity(Int(self.deletedInstanceCount))
        for _ in 0..<self.deletedInstanceCount {
            let deletedInstanceDate = try readDate()
            deletedInstanceDates.append(deletedInstanceDate)
        }
        
        self.deletedInstanceDates = deletedInstanceDates
        
        /// ModifiedInstanceCount (4 bytes): An integer that specifies the number of elements in the
        /// ModifiedInstanceDates field. The value of this field MUST be less than or equal to the value of
        /// the DeletedInstanceCount field.
        self.modifiedInstanceCount = try dataStream.read(endianess: .littleEndian)
        
        /// ModifiedInstanceDates (variable): An array of dates, each of which is the date of a modified
        /// instance. The number of dates contained in this array is specified by the ModifiedInstanceCount
        /// field. Each date is stored as the number of minutes between midnight, January 1, 1601, and
        /// midnight of the specified day, in the time zone specified by the PidLidTimeZoneStruct property
        /// (section 2.2.1.39). The dates are ordered from earliest to latest.
        /// The array contains exactly one element for each modified instance, and every modified instance is
        /// represented. The array SHOULD NOT contain duplicate entries. Every modified instance also has to
        /// have an entry in the DeletedInstanceDates field with the original instance date.
        var modifiedInstanceDates: [Date] = []
        modifiedInstanceDates.reserveCapacity(Int(self.modifiedInstanceCount))
        for _ in 0..<self.modifiedInstanceCount {
            let modifiedInstanceDate = try readDate()
            modifiedInstanceDates.append(modifiedInstanceDate)
        }
        
        self.modifiedInstanceDates = modifiedInstanceDates
    
        /// StartDate (4 bytes): An integer that specifies the date of the first occurrence. The value is the
        /// number of minutes between midnight, January 1, 1601, and midnight of the date of the first
        /// occurrence.
        self.startDate = try readDate()

        /// EndDate (4 bytes): An integer that specifies the ending date for the recurrence. The value is the
        /// number of minutes between midnight, January 1, 1601, and midnight of the date of the last
        /// occurrence. When the value of the EndType field is 0x00002022 (end after n occurrences), this
        /// value is calculated based on the number of occurrences If the recurrence does not have an end
        /// date, the value of the EndDate field MUST be set to 0x5AE980DF.
        self.endDate = try readDate()
    }
    
    /// RecurFrequency (2 bytes): An integer that specifies the frequency of the recurring series.
    /// Valid values are listed in the following table.
    public enum RecurFrequency: UInt16 {
        /// Daily 0x200A
        case daily = 0x200A
        
        /// Weekly 0x200B
        case weekly = 0x200B
        
        /// Monthly 0x200C
        case monthly = 0x200C
        
        /// Yearly 0x200D
        case yearly = 0x200D
    }
    
    /// PatternType (2 bytes): An integer that specifies the type of recurrence pattern.
    /// The valid recurrence pattern types are listed in the following table.
    public enum PatternType: UInt16 {
        /// Day 0x0000 The event has a daily recurrence.
        case day = 0x0000

        /// Week 0x0001 The event has a weekly recurrence.
        case week = 0x0001

        /// Month 0x0002 The event has a monthly recurrence.
        case month = 0x0002

        /// MonthEnd 0x0004 The event has a month-end recurrence.<12>
        case monthEnd = 0x0004

        /// MonthNth 0x0003 The event has an every nth month pattern.
        case monthNth = 0x0003

        /// HjMonth 0x000A The event has a monthly recurrence in the Hijri calendar. For this value in the PatternType field, the
        /// value of the CalendarType field SHOULD be set to 0x0000.<13>
        case hjMonth = 0x000A

        /// HjMonthNth 0x000B
        /// The event has an every nth month pattern in the Hijri calendar. For this value in the PatternType field, the value of the
        /// CalendarType field MUST be set to 0x0000.
        case hjMonthNth = 0x000B
        
        /// HjMonthEnd 0x000C
        /// The event has a month end recurrence in the Hijri calendar. For this value in the PatternType field, the value of the
        /// CalendarType field MUST be set to 0x0000.
        case hjMonthEnd = 0x000C
    }
    
    /// CalendarType (2 bytes): An integer that specifies the type of calendar that is used.
    /// The acceptable values for the calendar type are listed in the following table.
    public enum CalendarType: UInt16 {
        /// Default 0x0000 The default value for the calendar type is Gregorian. If the value of the PatternType field is HjMonth,
        /// HjMonthNth, or HjMonthEnd and the value of the CalendarType field is Default, this recurrence uses the Hijri calendar.
        case `default` = 0x0000
        
        /// CAL_GREGORIAN 0x0001 Gregorian (localized) calendar
        case gregorian = 0x0001
        
        /// CAL_GREGORIAN_US 0x0002 Gregorian (U.S.) calendar
        case gregorianUs = 0x0002
        
        /// CAL_JAPAN 0x0003 Japanese Emperor era calendar
        case japan = 0x0003
        
        /// CAL_TAIWAN 0x0004 Taiwan calendar
        case taiwan = 0x0004
        
        /// CAL_KOREA 0x0005 Korean Tangun era calendar
        case korean = 0x0005
        
        /// CAL_HIJRI 0x0006 Hijri (Arabic Lunar) calendar
        case hijri = 0x0006
        
        /// CAL_THAI 0x0007 Thai calendar
        case thai = 0x0007
        
        /// CAL_HEBREW 0x0008 Hebrew lunar calendar
        case hebrew = 0x0008
        
        /// CAL_GREGORIAN_ME_FRENCH 0x0009 Gregorian Middle East French calendar
        case gregorianMeFrench = 0x0009
        
        /// CAL_GREGORIAN_ARABIC 0x000A Gregorian Arabic calendar
        case gregorianArabic = 0x000A
        
        /// CAL_GREGORIAN_XLIT_ENGLISH 0x000B Gregorian transliterated English calendar
        case greogrianXlitEnglish = 0x000B
        
        /// CAL_GREGORIAN_XLIT_FRENCH 0x000C Gregorian transliterated French calendar
        case greogrianXlitFrench = 0x000C
        
        /// CAL_LUNAR_JAPANESE 0x000E Japanese lunar calendar
        case lunarJapanese = 0x000E
        
        /// CAL_CHINESE_LUNAR 0x000F Chinese lunar calendar
        case chineseLunar = 0x000F
        
        /// CAL_SAKA 0x0010 Saka era calendar
        case saka = 0x0010
        
        /// CAL_LUNAR_ETO_CHN 0x0011 Lunar ETO Chinese calendar
        case lunarEtoChinese = 0x0011
        
        /// CAL_LUNAR_ETO_KOR 0x0012 Lunar ETO Korean calendar
        case lunarEtoKorean = 0x0012
        
        /// CAL_LUNAR_ROKUYOU 0x0013 Lunar Rokuyou calendar
        case lunarRokuyou = 0x0013
        
        /// CAL_LUNAR_KOREAN 0x0014 Korean lunar calendar
        case lunarKorean = 0x0014
        
        /// CAL_UMALQURA 0x0017 Um Al Qura calendar
        case umAlQura = 0x0017
    }
    
    /// EndType (4 bytes): An integer that specifies the ending type for the recurrence. This field MUST be set to one of the
    /// values listed in the following table.
    public enum EndType: UInt32 {
        /// End after date 0x00002021
        case endAfterDate = 0x00002021

        /// End after N occurrences 0x00002022
        case endAfterNOccurences = 0x00002022
        
        /// Never end SHOULD be 0x00002023 but can be 0xFFFFFFFF
        case neverEnd = 0x00002023
        
        case neverEnd2 = 0xFFFFFFFF
    }
    
    /// FirstDOW (4 bytes): An integer that specifies the day on which the calendar week begins. The default value is Sunday (0x00000000).
    /// This field MUST be set to one of the values listed in the following table.
    public enum DayOfWeek: UInt32 {
        /// Sunday 0x00000000
        case sunday = 0x00000000
        
        /// Monday 0x00000001
        case monday = 0x00000001
        
        /// Tuesday 0x00000002
        case tuesday = 0x00000002
        
        /// Wednesday 0x00000003
        case wednesday = 0x00000003
        
        /// Thursday 0x00000004
        case thursday = 0x00000004
        
        /// Friday 0x00000005
        case friday = 0x00000005
        
        /// Saturday 0x00000006
        case saturday = 0x00000006
    }
}
