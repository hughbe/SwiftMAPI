//
//  LongTermID.swift
//
//
//  Created by Hugh Bellamy on 02/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.1.3.1 LongTermID Structure
/// A LongTermID structure is a Global Identifier structure, as specified in section 2.2.1.3, plus a 2-byte Pad field that has the value 0x0000.
/// The total length of the LongTermID structure is 24 bytes. LongTermID structures can be generated from the Message ID structure, as
/// specified in section 2.2.1.2, or Folder ID structure, as specified in section 2.2.1.1, by using the RopLongTermIdFromId ROP
/// ([MS-OXCROPS] section 2.2.3.8). Message ID structures and Folder ID structures can be generated from their associated LongTermID
/// structures by using the RopIdFromLongTermId ROP ([MS-OXCROPS] section 2.2.3.9).
public struct LongTermID {
    public let databaseGuid: GUID
    public let globalCounter: UInt64
    public let pad: UInt16
    
    public init(dataStream: inout DataStream) throws {
        /// DatabaseGuid (16 bytes): An unsigned integer identifying a Store object.
        self.databaseGuid = try GUID(dataStream: &dataStream)
        
        /// GlobalCounter (6 bytes): An unsigned integer identifying the folder or message within its Store object.
        self.globalCounter = try dataStream.readUInt48()
        
        self.pad = try dataStream.read(endianess: .littleEndian)
    }
}
