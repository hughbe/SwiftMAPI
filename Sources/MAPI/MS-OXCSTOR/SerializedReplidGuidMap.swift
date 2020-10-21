//
//  SerializedReplidGuidMap.swift
//  
//
//  Created by Hugh Bellamy on 20/10/2020.
//

import DataStream
import Foundation

public struct SerializedReplidGuidMap {
    public let values: [(id: UInt16, guid: UUID)]
    
    public init(dataStream: inout DataStream) throws {
        var values: [(id: UInt16, guid: UUID)] = []
        values.reserveCapacity(dataStream.remainingCount / 18)
        while dataStream.remainingCount >= 18 {
            let id: UInt16 = try dataStream.read(endianess: .littleEndian)
            let guid: UUID = try dataStream.readGUID(endianess: .littleEndian)
            values.append((id: id, guid: guid))
        }
        
        self.values = values
    }
}
