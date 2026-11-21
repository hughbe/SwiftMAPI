//
//  MSPSTEntryIdData.swift
//  
//
//  Created by Hugh Bellamy on 05/02/2021.
//

import DataStream
import WindowsDataTypes

public struct MSPSTEntryIdData: StoreEntryIDWrappedProviderData {
    public let providerUid: GUID
    public let bReserved: UInt8
    public let pathAscii: String
    public let pathUnicode: String?
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let startPosition = dataStream.position

        self.providerUid = try GUID(dataStream: &dataStream)
        
        self.bReserved = try dataStream.read()
        
        self.pathAscii = try dataStream.readNullTerminatedString8()
        
        if dataStream.position - startPosition == size {
            self.pathUnicode = nil
            return
        }
        
        self.pathUnicode = try dataStream.readNullTerminatedUTF16String()
        
        guard dataStream.position - startPosition == size else {
            throw MAPIError.corrupted
        }
    }
    
    public var dataSize: Int {
        /// ProviderUid (16 bytes) + bReserved (1 byte) + PathAscii (variable) + PathUnicode (variable, optional)
        var baseSize = 16 + 1
        baseSize += ANSIEncoding.byteCount(pathAscii) + 1
        if let pathUnicode = pathUnicode {
            baseSize += UTF16LEEncoding.byteCount(pathUnicode) + 2
        }
        
        return baseSize
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        providerUid.write(to: &dataStream)
        dataStream.write(bReserved)
        dataStream.writeNullTerminatedString8(pathAscii)
        if let pathUnicode = pathUnicode {
            dataStream.writeNullTerminatedUTF16String(pathUnicode)
        }
    }
}
