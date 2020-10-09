//
//  StoreObjectEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCDATA] 2.2.4.3 Store Object EntryID Structure
/// A Store Object EntryID structure specifies a mailbox Store object or a public folder Store object
/// itself, rather than a Message object or Folder object residing in such a database. It is used in certain
/// property values.
public struct StoreObjectEntryID {
    public var flags: UInt32
    public var providerUid: UUID
    public var version: UInt8
    public var flag: UInt8
    public var dllFileName: String
    public var wrappedFlags: UInt32
    public var wrappedProviderUid: UUID
    public var wrappedType: UInt32
    public var serverShortName: String
    public var mailboxDN: String
    
    public init(dataStream: inout DataStream) throws {
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what
        /// circumstances a short-term EntryID is valid. However, in any EntryID stored in a property value,
        /// these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        if self.flags != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The identifier for the provider that created the EntryID. This value is used to route EntryIDs to the correct provider and MUST be set to
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
        /// "emsmdb.dll": %x45.4D.53.4D.44.42.2E.44.4C.4C.00.00.00.00.
        self.dllFileName = try dataStream.readString(count: 14, encoding: .ascii)!
        if self.dllFileName != "emsmdb.dll\0\0\0\0" {
            throw MAPIError.corrupted
        }
        
        /// WrappedFlags (4 bytes): This value MUST be set to 0x00000000.
        self.wrappedFlags = try dataStream.read(endianess: .littleEndian)
        if self.wrappedFlags != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// WrappedProvider UID (16 bytes): This field MUST be set to one of the values in the following
        /// table.
        self.wrappedProviderUid = try dataStream.readGUID(endianess: .littleEndian)

        let mailboxStoreObject = UUID(uuid: uuid_t(0x1B, 0x55, 0xFA, 0x20, 0xAA, 0x66, 0x11, 0xCD, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A))
        let publicFolderStoreObject = UUID(uuid: uuid_t(0x1C, 0x83, 0x02, 0x10, 0xAA, 0x66, 0x11, 0xCD, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A))
        let mailboxStore = self.wrappedProviderUid == mailboxStoreObject
        let publicFolderStore = self.wrappedProviderUid == publicFolderStoreObject
        if !mailboxStore && !publicFolderStore {
            throw MAPIError.corrupted
        }
        
        /// WrappedType (4 bytes): The value of this field is determined by where the folder is located. For a
        /// mailbox this value MUST be set to %x0C.00.00.00. For a public message store, this value MUST
        /// be set to %x06.00.00.00.
        let wrappedType: UInt32 = try dataStream.read(endianess: .littleEndian)
        if (mailboxStore && wrappedType != 0x0C0000) && (publicFolderStore && wrappedType != 0x060000) {
            throw MAPIError.corrupted
        }
        
        self.wrappedType = wrappedType
        
        /// ServerShortname (variable): A string of single-byte characters terminated by a single zero byte,
        /// indicating the short name or NetBIOS name of the server.
        self.serverShortName = try dataStream.readAsciiString()!
        
        /// MailboxDN (variable): A string of single-byte characters terminated by a single zero byte and
        /// representing the X500 DN of the mailbox, as specified in [MS-OXOAB]. This field is present only
        /// for mailbox databases.
        self.mailboxDN = try dataStream.readAsciiString()!
        
        /// There is no padding in one-off entry identifier structures; the bytes are packed exactly as indicated above and
        /// the entry identifier length should not include any bytes beyond the terminating null character of the email address.
        assert(dataStream.remainingCount == 0)
    }
}
