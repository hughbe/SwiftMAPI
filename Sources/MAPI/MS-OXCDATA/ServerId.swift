//
//  ServerId.swift
//  
//
//  Created by Hugh Bellamy on 23/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.11.1.4 PtypServerId Type
public struct ServerId {
    public let ours: UInt8
    public let folderID: FolderID
    public let messageID: MessageID
    public let instance: UInt32
    
    public init(dataStream: inout DataStream) throws {
        /// Ours (1 byte): The value 0x01 indicates the remaining bytes conform to this structure; the value 0x00 indicates this is a
        /// client-defined value and has whatever size and structure the client has defined.
        self.ours = try dataStream.read()
        
        /// folder ID (8 bytes): A Folder ID structure, as specified in section 2.2.1.1.
        self.folderID = try FolderID(dataStream : &dataStream)
        
        /// message ID (8 bytes): A Message ID structure, as specified in section 2.2.1.2, identifying a message in a folder identified by
        /// an associated folder ID. If the object pointed to is a folder, the value of this field MUST be all zeros.
        self.messageID = try MessageID(dataStream : &dataStream)
        
        /// Instance (4 bytes): An unsigned instance number within an array of ServerIds to compare against. This field is used only for
        /// searches against multivalue properties and MUST be zero in any other context.
        self.instance = try dataStream.read(endianess: .littleEndian)
    }
}
