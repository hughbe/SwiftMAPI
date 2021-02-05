//
//  SerializedReplidGuidMap.swift
//  
//
//  Created by Hugh Bellamy on 20/10/2020.
//

import DataStream
import WindowsDataTypes

public struct SerializedReplidGuidMap {
    public let values: [(id: UInt16, guid: GUID)]
    
    public init(dataStream: inout DataStream) throws {
        var values: [(id: UInt16, guid: GUID)] = []
        values.reserveCapacity(dataStream.remainingCount / 18)
        while dataStream.remainingCount >= 18 {
            let id: UInt16 = try dataStream.read(endianess: .littleEndian)
            let guid = try GUID(dataStream: &dataStream)
            values.append((id: id, guid: guid))
        }
        
        self.values = values
    }
}
