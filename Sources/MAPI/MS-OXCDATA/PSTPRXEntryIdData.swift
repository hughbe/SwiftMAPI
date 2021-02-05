//
//  PSTPRXEntryIdData.swift
//
//
//  Created by Hugh Bellamy on 05/02/2021.
//

import DataStream
import WindowsDataTypes

public struct PSTPRXEntryIdData: StoreEntryIDWrappedProviderData {
    public let flags: UInt32
    public let providerUid: GUID
    public let bReserved: UInt8
    public let pathAscii: String
    public let pathUnicode: String?
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let startPosition = dataStream.position
        
        self.flags = try dataStream.read(endianess: .littleEndian)

        self.providerUid = try GUID(dataStream: &dataStream)
        
        self.bReserved = try dataStream.read()
        
        self.pathAscii = try dataStream.readAsciiString()!
        
        if dataStream.position - startPosition == size {
            self.pathUnicode = nil
            return
        }
        
        self.pathUnicode = try dataStream.readUnicodeString(endianess: .littleEndian)!
        
        guard dataStream.position - startPosition == size else {
            throw MAPIError.corrupted
        }
    }
    
    public var dataSize: Int {
        /// Flags (4 bytes) + ProviderUid (16 bytes) + bReserved (1 byte) + PathAscii (variable) + PathUnicode (variable, optional)
        var baseSize = 4 + 16 + 1
        baseSize += pathAscii.count + 1
        if let pathUnicode = pathUnicode {
            baseSize += (pathUnicode.count + 1) * 2
        }
        
        return baseSize
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        dataStream.write(flags, endianess: .littleEndian)
        providerUid.write(to: &dataStream)
        dataStream.write(bReserved)
        dataStream.write(pathAscii + "\0", encoding: .ascii)
        if let pathUnicode = pathUnicode {
            dataStream.write(pathUnicode + "\0", encoding: .utf16LittleEndian)
        }
    }
}
