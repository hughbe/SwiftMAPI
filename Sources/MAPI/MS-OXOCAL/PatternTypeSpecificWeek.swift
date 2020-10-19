//
//  PatternTypeSpecificWeek.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.1.44.1.4 PatternTypeSpecific Week
/// For a weekly recurrence pattern (value of the PatternType field is 0x0001), the structure of the PatternTypeSpecific
/// field is as follows.
public struct PatternTypeSpecificWeek: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    public init(dataStream: inout DataStream) throws {
        self.rawValue = try dataStream.read(endianess: .littleEndian)
    }

    /// X (1 bit): This bit is not used. MUST be zero and MUST be ignored.
    public static let x = PatternTypeSpecificWeek([])
    
    /// Sa (1 bit): (0x00000040) The event occurs on Saturday.
    public static let sa = PatternTypeSpecificWeek(rawValue: 0x00000001)
    
    /// F (1 bit): (0x00000020) The event occurs on Friday.
    public static let f = PatternTypeSpecificWeek(rawValue: 0x00000002)
    
    /// Th (1 bit): (0x00000010) The event occurs on Thursday.
    public static let th = PatternTypeSpecificWeek(rawValue: 0x00000004)
    
    /// W (1 bit): (0x00000008) The event occurs on Wednesday.
    public static let w = PatternTypeSpecificWeek(rawValue: 0x00000008)
    
    /// Tu (1 bit): (0x00000004) The event occurs on Tuesday.
    public static let tu = PatternTypeSpecificWeek(rawValue: 0x00000010)
    
    /// M (1 bit): (0x00000002) The event occurs on Monday.
    public static let m = PatternTypeSpecificWeek(rawValue: 0x00000020)
    
    /// Su (1 bit): (0x00000001) The event occurs on Sunday.
    public static let su = PatternTypeSpecificWeek(rawValue: 0x00000040)
    
    /// unused (3 bytes): These bits are not used. MUST be zero and MUST be ignored.
    /// Nth Weekday of month: (bits M, Tu, W, Th, F are set)
    /// Nth Weekend of month: (bits Sa, Su are set)
    
    /// unused (3 bytes): These bits are not used. MUST be zero and MUST be ignored.

    public static let all: PatternTypeSpecificWeek = [.x, .sa, .f, .th, .w, .tu, .m, .su]
}
