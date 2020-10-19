//
//  GlobalObjectId.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

/// [MS-OXOCAL] 2.2.1.27 PidLidGlobalObjectId Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidGlobalObjectId property ([MS-OXPROPS] section 2.143) specifies the unique identifier of the Calendar object. After it is set for a Calendar object,
/// the value of this property MUST NOT change. The fields in this binary large object (BLOB) are specified in the following table. All fields have little-endian byte order.
public struct GlobalObjectId {
    public let byteArrayID: [UInt8]
    public let yh: UInt8
    public let yl: UInt8
    public let m: UInt8
    public let d: UInt8
    public let creationTime: Date
    public let x: UInt8
    public let size: UInt32
    public let data: [UInt8]

    public init(dataStream: inout DataStream) throws {
        /// Byte Array ID (16 bytes): An array of 16 bytes identifying this BLOB as a Global Object ID. The byte array MUST be as follows:
        /// 0x04, 0x00, 0x00, 0x00, 0x82, 0x00, 0xE0, 0x00, 0x74, 0xC5, 0xB7, 0x10, 0x1A, 0x82, 0xE0, 0x08.
        self.byteArrayID = try dataStream.readBytes(count: 16)
        if self.byteArrayID != [0x04, 0x00, 0x00, 0x00, 0x82, 0x00, 0xE0, 0x00, 0x74, 0xC5, 0xB7, 0x10, 0x1A, 0x82, 0xE0, 0x08] {
            throw MAPIError.corrupted
        }
        
        /// YH (1 byte): The high-ordered byte of the 2-byte year from the PidLidExceptionReplaceTime property (section 2.2.10.2.5) if the object represents an exception; otherwise, zero.
        self.yh = try dataStream.read()
        
        /// YL (1 byte): The low-ordered byte of the 2-byte year from the PidLidExceptionReplaceTime property if the object represents an exception; otherwise, zero.
        self.yl = try dataStream.read()
        
        /// M (1 byte): The month from the PidLidExceptionReplaceTime property if the object represents an exception; otherwise, zero
        /// If it represents an exception, the value MUST be one of those listed in the following table.
        self.m = try dataStream.read()
        
        /// D (1 byte): The day of the month from the PidLidExceptionReplaceTime property if the object represents an exception; otherwise, zero.
        self.d = try dataStream.read()
        
        /// Creation Time (8 bytes): A FILETIME structure ([MS-DTYP]) that specifies the date and time when this Global Object ID was generated.
        self.creationTime = try FILETIME(dataStream: &dataStream).date
        
        /// X (8 bytes): Reserved, MUST be all zeros.
        self.x = try dataStream.read(endianess: .littleEndian)
        if self.x != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// Size (4 bytes): This field specifies the size of the Data field.
        self.size = try dataStream.read(endianess: .littleEndian)
        
        /// Data (variable): An array of bytes that ensures the uniqueness of the Global Object ID among all Calendar objects in all mailboxes.
        self.data = try dataStream.readBytes(count: Int(self.size))
    }
}
