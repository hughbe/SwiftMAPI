//
//  FolderEntryID.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.4.1 Folder EntryID Structure
/// A Folder EntryID structure specifies a set of data that identify a Store object. The format and information of Folder EntryID
/// structures differ from that of EntryIDs used in ROPs. For folders, the ReplicaId field, as specified in section 2.2.1.1, is mapped
/// to a DatabaseGuid by using the RopLongTermIdFromId ROP ([MS-OXCROPS] section 2.2.3.8).This less compact format is
/// necessary because no assumptions can be made about the Store object context in which a Folder EntryID structure is used.
public struct FolderEntryID: EntryID {
    public let flags: UInt32
    public let providerUid: GUID
    public let folderType: StoreObjectType
    public let databaseGuid: GUID
    public let globalCounter: UInt64
    public let pad: UInt16
    
    public static let providerUid = GUID(0x9073441A, 0x66AA, 0xCD11, 0x9b, 0xc8, 0x00, 0xaa, 0x00, 0x2f, 0xc4, 0x5a)
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let position = dataStream.position
        
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID is valid. However, in any
        /// EntryID stored in a property value,  these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        guard self.flags == 0x00000000 else {
            throw MAPIError.corrupted
        }
        
        /// Provider UID (16 bytes): The value of this field is determined by where the folder is located. For a folder in a private mailbox, this value MUST be set to
        /// value of the MailboxGuid field from the RopLogon ROP response buffer ([MS-OXCROPS] section 2.2.3.1.2). For a folder in the public message store,
        /// this value MUST be set to %x1A.44.73.90.AA.66.11.CD.9B.C8.00.AA.00.2F.C4.5A.
        self.providerUid = try GUID(dataStream: &dataStream)
        
        /// FolderType (2 bytes): One of several Store object types specified in the table in section 2.2.4.
        let folderTypeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        guard let folderType = StoreObjectType(rawValue: folderTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.folderType = folderType
        
        /// DatabaseGuid (16 bytes): A GUID associated with the Store object and corresponding to the ReplicaId field of the FID structure.
        self.databaseGuid = try GUID(dataStream: &dataStream)
        
        /// GlobalCounter (6 bytes): An unsigned integer identifying the folder.
        self.globalCounter = try dataStream.readUInt48()
        
        /// Pad (2 bytes): This value MUST be set to zero.
        self.pad = try dataStream.read(endianess: .littleEndian)
        guard self.pad == 0x0000 else {
            throw MAPIError.corrupted
        }
        
        guard dataStream.position - position == size else {
            throw MAPIError.corrupted
        }
    }
}
