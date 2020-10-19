//
//  PatternTypeSpecificMonth.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.1.44.1.5 PatternTypeSpecific Month
/// The value is little-endian byte order. For a Month, MonthEnd, HjMonth, or HjMonthEnd recurrence pattern (value of the
/// PatternType field is 0x002, 0x004, 0x00A, or 0x00C, respectively), the structure of the PatternTypeSpecific field is as follows.
public struct PatternTypeSpecificMonth {
    public let day: UInt32
    
    public init(dataStream: inout DataStream) throws {
        self.day = try dataStream.read(endianess: .littleEndian)
    }
}
