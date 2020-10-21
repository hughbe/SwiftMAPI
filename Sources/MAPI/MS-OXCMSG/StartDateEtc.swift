//
//  StartDateEtc.swift
//  
//
//  Created by Hugh Bellamy on 21/10/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

public struct StartDateEtc {
    public let defaultRetentionPeriod: UInt32
    public let startDate: Date
    
    public init(dataStream: inout DataStream) throws {
        /// 4 Default retention period
        /// A default retention tag is applied to a Message object when a regular retention tag is not present on the Message
        /// object. The absence of a regular retention tag indicates that the Message object does not have a specific retention
        /// policy. The application of the default tag is based on the Message object's message class.)
        self.defaultRetentionPeriod = try dataStream.read(endianess: .littleEndian)
        
        /// 8 Start date The date, in UTC, from which the age of the Message object is calculated.
        self.startDate = try FILETIME(dataStream: &dataStream).date
        
        assert(dataStream.remainingCount == 0)
    }
}
