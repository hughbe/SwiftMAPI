//
//  GUID.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream
import Foundation

public extension DataStream {
    mutating func readGUID(endianess: Endianess = .systemDefault) throws -> UUID {
        if endianess == .systemDefault {
            return try read(type: UUID.self)
        }

        let data1 = try read(endianess: .bigEndian) as UInt32
        let data2 = try read(endianess: .bigEndian) as UInt16
        let data3 = try read(endianess: .bigEndian) as UInt16
        let data4 = try read(type: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8).self)
        
        if endianess == .littleEndian {
            let uuid = uuid_t(
                UInt8((data1 & 0xFF)),
                UInt8((data1 & 0xFF00) >> 8),
                UInt8((data1 & 0xFF0000) >> 16),
                UInt8((data1 & 0xFF000000) >> 24),
                UInt8((data2 & 0xFF)),
                UInt8((data2 & 0xFF00) >> 8),
                UInt8((data3 & 0xFF)),
                UInt8((data3 & 0xFF00) >> 8),
                data4.0,
                data4.1,
                data4.2,
                data4.3,
                data4.4,
                data4.5,
                data4.6,
                data4.7
            )
            return UUID(uuid: uuid)
        }
        else {
            let uuid = uuid_t(
                UInt8((data1 & 0xFF000000) >> 24),
                UInt8((data1 & 0xFF0000) >> 16),
                UInt8((data1 & 0xFF00) >> 8),
                UInt8((data1 & 0xFF)),
                UInt8((data2 & 0xFF00) >> 8),
                UInt8((data2 & 0xFF)),
                UInt8((data3 & 0xFF00) >> 8),
                UInt8((data3 & 0xFF)),
                data4.0,
                data4.1,
                data4.2,
                data4.3,
                data4.4,
                data4.5,
                data4.6,
                data4.7
            )
            return UUID(uuid: uuid)
        }
    }
}
