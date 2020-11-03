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
    public let delegateInformationEntryId: EntryID?
    public let freeBusyMessageEntryId: EntryID?
    public let freeBusyDataEntryId: EntryID?
    public let remainingData: [Data]
    
    public init(data: [Data]) throws {
        func getEntryId(index: Int) throws -> EntryID? {
            var dataStream = DataStream(data: data[index])
            if dataStream.count == 0 {
                return nil
            }
             
            return try getEntryID(dataStream: &dataStream, size: dataStream.count)
        }
        
        self.firstValue = data[0]
        self.delegateInformationEntryId = try getEntryId(index: 1)
        self.freeBusyMessageEntryId = try getEntryId(index: 2)
        self.freeBusyDataEntryId = try getEntryId(index: 3)
        self.remainingData = [Data](data.suffix(from: 4))
    }
}
