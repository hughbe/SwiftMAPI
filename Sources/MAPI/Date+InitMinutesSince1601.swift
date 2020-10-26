//
//  Date+InitMinutesSince1601.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

import Foundation

internal extension Date {
    init(minutesSince1601: UInt32) {
        let secondsToUnixEpoch: UInt64 = 11644473600
        let unixTimestamp = UInt64(minutesSince1601) * 60 + secondsToUnixEpoch
        self = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    }
}
