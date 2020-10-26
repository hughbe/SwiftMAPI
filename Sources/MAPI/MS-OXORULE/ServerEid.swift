//
//  ServerEid.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXORULE] 2.2.5.1.2.1.1 ServerEid Structure
/// The ServerEid structure contains details about the destination folder.
public struct ServerEid {
    public let ours: UInt8
    public let folderId: FolderID
    public let messageId: UInt64
    public let instance: UInt32
    
    public init(dataStream: inout DataStream) throws {
        /// Ours (1 byte): The value 0x01 indicates that the remaining bytes conform to this structure; the 	value 0x00 indicates
        /// that the remaining bytes conform to a client-defined structure. This field MUST be set to 0x01.
        self.ours = try dataStream.read()
        
        /// FolderId (8 bytes): A Folder ID structure, as specified in [MS-OXCDATA] section 2.2.1.1, that identifies the destination folder.
        self.folderId = try FolderID(dataStream: &dataStream)
        
        /// MessageId (8 bytes): This field is not used and MUST be set to all zeros.
        self.messageId = try dataStream.read(endianess: .littleEndian)
        if self.messageId != 0x0000000000000000 {
            throw MAPIError.corrupted
        }
        
        /// Instance (4 bytes): This field is not used and MUST be set to all zeros.
        self.instance = try dataStream.read(endianess: .littleEndian)
        if self.instance != 0x00000000 {
            throw MAPIError.corrupted
        }
    }
}
