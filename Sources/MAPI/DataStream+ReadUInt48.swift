//
//  DataStream+ReadUInt48.swift
//  
//
//  Created by Hugh Bellamy on 02/10/2020.
//

import DataStream

internal extension DataStream {
    mutating func readUInt48() throws  -> UInt64 {
        let b1: UInt8 = try read()
        let b2: UInt8 = try read()
        let b3: UInt8 = try read()
        let b4: UInt8 = try read()
        let b5: UInt8 = try read()
        let b6: UInt8 = try read()
        
        return UInt64(b1) | (UInt64(b2) << 8) | (UInt64(b3) << 16) | (UInt64(b4) << 24) | (UInt64(b5) << 32) | (UInt64(b6) << 40)
    }
}
