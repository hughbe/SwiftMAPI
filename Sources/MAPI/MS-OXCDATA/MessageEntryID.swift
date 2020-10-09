//
//  MessageEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCDATA] 2.2.4.2 Message EntryID Structure
/// In the context of an EntryID, a Message EntryID structure, as specified in section 2.2.1.2, differs from the structure in the context of a ROP.
/// The ReplicaId field, as specified in section 2.2.1.2, is mapped to a MessageDatabaseGuid field, and the whole ID is prefixed with flags and a provider
/// UID field. In addition, the Folder ID structure, as specified in section 2.2.1.1, of the folder in which the message resides is included.
public struct MessageEntryID: EntryID {
    public var flags: UInt32
    public var providerUid: UUID
    public var messageType: StoreObjectType
    public var folderDatabaseGuid: UUID
    public var folderGlobalCounter: UInt64
    public var pad1: UInt16
    public var messageDatabaseGuid: UUID
    public var messageGlobalCounter: UInt64
    public var pad2: UInt16

    public init(dataStream: inout DataStream) throws {
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID is valid.
        /// However, in any EntryID stored in a property value, these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        if self.flags != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The value of this field is determined by where the folder is located. For a folder in a private mailbox, this value MUST
        /// be set to the value of the MailboxGuid field from the RopLogon ROP response buffer ([MS-OXCROPS] section 2.2.3.1.2). For a folder in the public
        /// message store, this value MUST be set to %x1A.44.73.90.AA.66.11.CD.9B.C8.00.AA.00.2F.C4.5A.
        self.providerUid = try dataStream.read(type: UUID.self)
        
        let providerUid = UUID(uuid: uuid_t(0x1A, 0x44, 0x73, 0x90, 0xAA, 0x66, 0x11, 0xCD, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A))
        if self.providerUid != providerUid {
            throw MAPIError.corrupted
        }
        
        /// MessageType (2 bytes): One of several Store object types specified in the table in section 2.2.4.
        let messageTypeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        guard let messageType = StoreObjectType(rawValue: messageTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.messageType = messageType
        
        /// FolderDatabaseGuid (16 bytes): A GUID associated with the Store object of the folder in which the message resides and corresponding to the ReplicaId field
        /// in the folder ID structure, as specified in section 2.2.1.1.
        self.folderDatabaseGuid = try dataStream.readGUID(endianess: .littleEndian)
        
        /// FolderGlobalCounter (6 bytes): An unsigned integer identifying the folder in which the message resides.
        self.folderGlobalCounter = try dataStream.readUInt48()

        /// Pad (2 bytes): This value MUST be set to zero.
        self.pad1 = try dataStream.read(endianess: .littleEndian)
        if self.pad1 != 0x0000 {
            throw MAPIError.corrupted
        }
        
        /// MessageDatabaseGuid (16 bytes): A GUID associated with the Store object of the message and
        /// corresponding to the ReplicaId field of the Message ID structure, as specified in section 2.2.1.2.
        self.messageDatabaseGuid = try dataStream.readGUID(endianess: .littleEndian)

        /// MessageGlobalCounter (6 bytes): An unsigned integer identifying the message.
        self.messageGlobalCounter = try dataStream.readUInt48()
        
        /// Pad (2 bytes): This value MUST be set to zero.
        self.pad2 = try dataStream.read(endianess: .littleEndian)
        if self.pad2 != 0x0000 {
            throw MAPIError.corrupted
        }

        assert(dataStream.remainingCount == 0)
    }
}
