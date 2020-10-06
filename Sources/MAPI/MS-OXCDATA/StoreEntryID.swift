//
//  StoreEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation

/// Not documented!
public struct StoreEntryID {
    public var flags: UInt32
    public var providerUid: UUID
    public var version: UInt8
    public var flag: UInt8
    public var dllFileName: String
    public var unknown: [UInt8]
    public var path: String
    
    public init(dataStream: inout DataStream) throws {
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what
        /// circumstances a short-term EntryID is valid. However, in any EntryID stored in a property value,
        /// these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        if self.flags != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The identifier for the provider that created the EntryID. This value is used
        /// to route EntryIDs to the correct provider and MUST be set to
        /// %x38.A1.BB.10.05.E5.10.1A.A1.BB.08.00.2B.2A.56.C2.
        self.providerUid = try dataStream.read(type: UUID.self)
        
        let oneOffUid = UUID(uuid: uuid_t(0x38, 0xA1, 0xBB, 0x10, 0x05, 0xE5, 0x10, 0x1A, 0xA1, 0xBB, 0x08, 0x00, 0x2B, 0x2A, 0x56, 0xC2))
        if self.providerUid != oneOffUid {
            throw MAPIError.corrupted
        }
        
        /// Version (1 byte): This value MUST be set to zero.
        self.version = try dataStream.read()
        if self.version != 0x00 {
            throw MAPIError.corrupted
        }
        
        /// Flag (1 byte): This value MUST be set to zero.
        self.flag = try dataStream.read()
        if self.flag != 0x00 {
            throw MAPIError.corrupted
        }
        
        /// DLLFileName (14 bytes): This field MUST be set to the following value, which represents
        /// "mstpst.dll"
        self.dllFileName = try dataStream.readString(count: 14, encoding: .ascii)!
        if self.dllFileName != "mspst.dll\0\0\0\0\0" {
            throw MAPIError.corrupted
        }
        
        self.unknown = try dataStream.readBytes(count: 16)
        
        self.path = try dataStream.readString(count: dataStream.remainingCount, encoding: .utf16LittleEndian)!
        
        assert(dataStream.remainingCount == 0)
    }
}
