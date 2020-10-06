//
//  DataStream+ReadString.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream
import Foundation

public extension DataStream {
    mutating func readUTF16LEString() throws -> String? {
        let position = self.position
        var count = 0
        while (try read(endianess: .littleEndian) as UInt16 != 0) {
            count += 1
        }
        
        return String(data: data[position...position + count * 2], encoding: .utf16LittleEndian)
    }

    mutating func readAsciiString() throws -> String? {
        let position = self.position
        var count = 0
        while (try read() as UInt8 != 0) {
            count += 1
        }
        
        return String(data: data[position...position + count], encoding: .ascii)
    }
}
