//
//  FreeBusyEntryIds.swift
//  
//
//  Created by Hugh Bellamy on 30/10/2020.
//

import DataStream
import Foundation

public struct FreeBusyEntryIds {
    public let firstValue: Data
    public let delegateInformationEntryId: EntryID
    public let freeBusyMessageEntryId: EntryID?
    public let freeBusyDataEntryId: EntryID
    public let remainingData: [Data]
    
    public init(data: [Data]) throws {
        self.firstValue = data[0]
        do {
            var dataStream = DataStream(data: data[1])
            self.delegateInformationEntryId = try getEntryID(dataStream: &dataStream, size: dataStream.count)
        }
        do {
            var dataStream = DataStream(data: data[2])
            if dataStream.count > 0 {
                self.freeBusyMessageEntryId = try getEntryID(dataStream: &dataStream, size: dataStream.count)
            } else {
                self.freeBusyMessageEntryId = nil
            }
        }
        do {
            var dataStream = DataStream(data: data[3])
            self.freeBusyDataEntryId = try getEntryID(dataStream: &dataStream, size: dataStream.count)
        }
        self.remainingData = [Data](data.suffix(from: 4))
    }
}
