//
//  PatternTypeSpecificMonthNth.swift
//
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.1.44.1.6 PatternTypeSpecific MonthNth
/// For the MonthNth or HjMonthNth recurrence pattern (value of the PatternType field is 0x0003 or 0x000B, respectively),
/// the structure of the PatternTypeSpecific field is as follows.
public struct PatternTypeSpecificMonthNth {
    public let flags: Flags
    public let n: RecurrenceDays

    public init(dataStream: inout DataStream) throws {
        let flagsRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.flags = Flags(rawValue: flagsRaw)
        
        /// N (4 bytes): The occurrence of the recurrence's days in each month in which the recurrence falls. It
        /// MUST be equal to one of the values listed in the following table.
        let nRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        guard let n = RecurrenceDays(rawValue: nRaw) else {
            throw MAPIError.corrupted
        }
        
        self.n = n
    }
    
    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        /// X (1 bit): This bit is not used. MUST be zero and MUST be ignored.
        public static let x = Flags([])
        
        /// Sa (1 bit): The event occurs on Saturday.
        public static let sa = Flags(rawValue: 0x00000001)
        
        /// F (1 bit): The event occurs on Friday.
        public static let f = Flags(rawValue: 0x00000002)
        
        /// Th (1 bit): The event occurs on Thursday.
        public static let th = Flags(rawValue: 0x00000004)
        
        /// W (1 bit): The event occurs on Wednesday.
        public static let w = Flags(rawValue: 0x00000008)
        
        /// Tu (1 bit): The event occurs on Tuesday.
        public static let tu = Flags(rawValue: 0x00000010)
        
        /// M (1 bit): The event occurs on Monday.
        public static let m = Flags(rawValue: 0x00000020)
        
        /// Su (1 bit): The event occurs on Sunday.
        public static let su = Flags(rawValue: 0x00000040)
        
        /// unused (3 bytes): These bits are not used. MUST be zero and MUST be ignored.
        /// Nth Weekday of month: (bits M, Tu, W, Th, F are set)
        /// Nth Weekend of month: (bits Sa, Su are set)
        
        /// unused (3 bytes): These bits are not used. MUST be zero and MUST be ignored.
        
        /// N (4 bytes): The occurrence of the recurrence's days in each month in which the recurrence falls. It
        /// MUST be equal to one of the values listed in the following table.
        /// Name Value Meaning
        /// First 0x00000001 The recurrence falls on the first occurrence of the days specified in every month.
        /// Second 0x00000002 The recurrence falls on the second occurrence of the days specified in every month.
        /// Third 0x00000003 The recurrence falls on the third occurrence of the days specified in every month.
        /// Fourth 0x00000004 The recurrence falls on the fourth occurrence of the days specified in every month.
        /// Last 0x00000005 The recurrence falls on the last occurrence of the days specified in every month.
        /// For example:
        ///  If an event occurs on the last weekday of every two months, the two fields of the PatternTypeSpecific field are
        /// set to 0x0000003E and 0x00000005.
        ///  If an event occurs on the first weekday of every two months, the two fields of the PatternTypeSpecific field are
        /// set to 0x0000003E and 0x00000001.
        ///  If an event occurs on the last weekend of every month, the two fields of the PatternTypeSpecific field are set
        /// to 0x00000041and 0x00000005.
        ///  If an event occurs on the first weekend of every month, the two fields of the PatternTypeSpecific field are set
        /// to 0x00000041 and 0x00000001.

        public static let all: Flags = [.x, .sa, .f, .th, .w, .tu, .m, .su]
    }
    
    /// N (4 bytes): The occurrence of the recurrence's days in each month in which the recurrence falls. It
    /// MUST be equal to one of the values listed in the following table.
    public enum RecurrenceDays: UInt32 {
        /// First 0x00000001 The recurrence falls on the first occurrence of the days specified in every month.
        case first = 0x00000001
        
        /// Second 0x00000002 The recurrence falls on the second occurrence of the days specified in every month.
        case second = 0x00000002
        
        /// Third 0x00000003 The recurrence falls on the third occurrence of the days specified in every month.
        case third = 0x00000003
        
        /// Fourth 0x00000004 The recurrence falls on the fourth occurrence of the days specified in every month.
        case fourth = 0x00000004
        
        /// Last 0x00000005 The recurrence falls on the last occurrence of the days specified in every month.
        case last = 0x00000005
    }
}
