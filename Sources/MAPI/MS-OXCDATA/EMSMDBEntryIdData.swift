//
//  EMSMDBEntryIdData.swift
//  
//
//  Created by Hugh Bellamy on 05/02/2021.
//

import DataStream
import WindowsDataTypes

public struct EMSMDBEntryIdData: StoreEntryIDWrappedProviderData {
    public let flags: UInt32
    public let providerUid: GUID
    public let wrappedType: OpenStoreFlags
    public let serverShortName: String
    public let mailboxDN: String?
    public let entryIdV2: EntryIDV2?
    public let entryIdV3: EntryIDV3?

    public init(dataStream: inout DataStream, size: Int) throws {
        let startPosition = dataStream.position

        /// WrappedFlags (4 bytes): This value MUST be set to 0x00000000.
        self.flags = try dataStream.read(endianess: .littleEndian)
        
        /// WrappedProvider UID (16 bytes): This field MUST be set to one of the values in the following table.
        self.providerUid = try GUID(dataStream: &dataStream)
        
        let mailboxStore = self.providerUid == StoreEntryID.mailboxStoreObject
        let publicFolderStore = self.providerUid == StoreEntryID.publicFolderStoreObject
        if !mailboxStore && !publicFolderStore {
            throw MAPIError.corrupted
        }
        
        /// WrappedType (4 bytes): The value of this field is determined by where the folder is located. For a mailbox this value MUST be set
        /// to %x0C.00.00.00. For a public message store, this value MUST be set to %x06.00.00.00.
        let wrappedTypeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.wrappedType = OpenStoreFlags(rawValue: wrappedTypeRaw)
        if (mailboxStore && wrappedTypeRaw != 0x0C0000) && (publicFolderStore && wrappedTypeRaw != 0x060000) {
            throw MAPIError.corrupted
        }
        
        /// ServerShortname (variable): A string of single-byte characters terminated by a single zero byte, indicating the short name or NetBIOS
        /// name of the server.
        self.serverShortName = try dataStream.readAsciiString()!
        
        /// MailboxDN (variable): A string of single-byte characters terminated by a single zero byte and representing the X500 DN of the mailbox
        /// as specified in [MS-OXOAB]. This field is present only for mailbox databases.
        func hasMailboxDN(wrappedType: OpenStoreFlags) throws -> Bool {
            if !wrappedType.contains(.public) {
                return true
            }
            
            let remainingCount = (size - (dataStream.position - startPosition))
            if remainingCount < 4 {
                return true
            }
            
            let magic: UInt32 = try dataStream.peek(endianess: .littleEndian)
            return magic != EntryIDV2.magic && magic != EntryIDV3.magic
        }
        if try hasMailboxDN(wrappedType: self.wrappedType) {
            self.mailboxDN = try dataStream.readAsciiString()!
        } else {
            self.mailboxDN = nil
        }
        
        let remainingCount = size - (dataStream.position - startPosition)
        if remainingCount > 0 {
            let magic: UInt32 = try dataStream.peek(endianess: .littleEndian)
            switch magic {
            case EntryIDV2.magic:
                self.entryIdV2 = try EntryIDV2(dataStream: &dataStream)
                self.entryIdV3 = nil
            case EntryIDV3.magic:
                self.entryIdV2 = nil
                self.entryIdV3 = try EntryIDV3(dataStream: &dataStream)
            default:
                throw MAPIError.corrupted
            }
        } else {
            self.entryIdV2 = nil
            self.entryIdV3 = nil
        }

        guard dataStream.position - startPosition == size else {
            throw MAPIError.corrupted
        }
    }
    
    public struct EntryIDV2 {
        public let magic: UInt32
        public let size: UInt32
        public let version: UInt32
        public let offsetDN: UInt32
        public let offsetFQDN: UInt32
        public let serverDN: String?
        public let serverFQDN: String?
        public let reserved: UInt16
        
        public static let magic: UInt32 = 0xF32135D8
        
        public init(dataStream: inout DataStream) throws {
            let position = dataStream.position
            
            /// Magic (4 bytes): MUST be 0xF32135D8.
            self.magic = try dataStream.read(endianess: .littleEndian)
            if self.magic != EntryIDV2.magic {
                throw MAPIError.corrupted
            }
            
            /// Size (4 bytes): An unsigned 32 bit integer giving the total size of the EntryIDv2 structure, including the ServerDN and ServerFQDN.
            self.size = try dataStream.read(endianess: .littleEndian)
            
            /// Version (4 bytes): MUST be 0x00000001.
            self.version = try dataStream.read(endianess: .littleEndian)
            guard self.version == 0x00000001 else {
                throw MAPIError.corrupted
            }
            
            /// OffsetDN (4 bytes): The offset in the buffer of the ServerDN. Should be 0x00000000 if ServerDN is not present.
            self.offsetDN = try dataStream.read(endianess: .littleEndian)
            
            /// OffsetFQDN (4 bytes): The offset in the buffer of the ServerFQDN. Should be 0x00000000 if ServerFQDN is not present.
            self.offsetFQDN = try dataStream.read(endianess: .littleEndian)

            /// ServerDN (optional) (variable): A string of single-byte characters terminated by a single zero byte, indicating the DN of the server.
            if self.offsetDN != 0x00000000 {
                let dataPosition = position + Int(self.offsetDN)
                if dataPosition != dataStream.position {
                    if dataPosition < dataStream.position || dataPosition >= dataStream.count {
                        throw MAPIError.corrupted
                    }

                    dataStream.position = dataPosition
                }

                self.serverDN = try dataStream.readUnicodeString(endianess: .littleEndian)
            } else {
                self.serverDN = nil
            }

            /// ServerFQDN (optional) (variable): A string of Unicode characters terminated by two zero bytes, indicating the FQDN of the server.
            if self.offsetFQDN != 0x00000000 {
                let dataPosition = position + Int(self.offsetFQDN)
                if dataPosition != dataStream.position {
                    if dataPosition < dataStream.position || dataPosition >= dataStream.count {
                        throw MAPIError.corrupted
                    }

                    dataStream.position = dataPosition
                }

                self.serverFQDN = try dataStream.readUnicodeString(endianess: .littleEndian)
            } else {
                self.serverFQDN = nil
            }
            
            /// Reserved (2 bytes): MUST be set to 0x0000.
            self.reserved = try dataStream.read(endianess: .littleEndian)
            if self.reserved != 0x0000 {
                throw MAPIError.corrupted
            }
            
            if dataStream.position - position != size {
                throw MAPIError.corrupted
            }
        }
    }
    
    public struct EntryIDV3 {
        public let magic: UInt32
        public let size: UInt32
        public let version: UInt32
        public let offsetSmtpAddress: UInt32
        public let smtpAddress: String?
        public let reserved: UInt16
        
        public static let magic: UInt32 = 0xF43246E9
        
        public init(dataStream: inout DataStream) throws {
            let position = dataStream.position
            
            /// Magic (4 bytes): MUST be 0xF43246E9.
            self.magic = try dataStream.read(endianess: .littleEndian)
            if self.magic != EntryIDV3.magic {
                throw MAPIError.corrupted
            }
            
            /// Size (4 bytes): An unsigned 32 bit integer giving the total size of the EntryIDv3 structure, including the SmtpAddress.
            self.size = try dataStream.read(endianess: .littleEndian)
            
            /// Version (4 bytes): MUST be 0x00000002.
            self.version = try dataStream.read(endianess: .littleEndian)
            if self.version != 0x00000002 {
                throw MAPIError.corrupted
            }
            
            /// OffsetSmtpAddress (4 bytes): The offset in the buffer of the SmtpAddress. Should be 0x00000000 if SmtpAddress is not present.
            self.offsetSmtpAddress = try dataStream.read(endianess: .littleEndian)
            
            /// SmtpAddress (optional) (variable): A string of Unicode characters terminated by two zero bytes, indicating the SMTP Address of the server.
            if self.offsetSmtpAddress != 0x00000000 {
                let dataPosition = position + Int(self.offsetSmtpAddress)
                if dataPosition != dataStream.position {
                    if dataPosition < dataStream.position || dataPosition >= dataStream.count {
                        throw MAPIError.corrupted
                    }

                    dataStream.position = dataPosition
                }

                self.smtpAddress = try dataStream.readUnicodeString(endianess: .littleEndian)
            } else {
                self.smtpAddress = nil
            }
            
            /// Reserved (2 bytes): MUST be set to 0x0000.
            self.reserved = try dataStream.read(endianess: .littleEndian)
            if self.reserved != 0x0000 {
                throw MAPIError.corrupted
            }
        }
    }
    
    public var dataSize: Int {
        fatalError("NYI")
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        fatalError("NYI")
    }
}
