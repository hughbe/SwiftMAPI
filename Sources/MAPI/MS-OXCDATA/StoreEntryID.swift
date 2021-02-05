//
//  StoreEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.4.3 Store Object EntryID Structure
/// A Store Object EntryID structure specifies a mailbox Store object or a public folder Store object itself, rather than a Message object or Folder
/// object residing in such a database. It is used in certain property values.
public struct StoreEntryID: EntryID {
    public let flags: UInt32
    public let providerUid: GUID
    public let version: UInt8
    public let flag: UInt8
    public let dllFileName: String
    public let wrappedProviderData: StoreEntryIDWrappedProviderData
    
    public static let providerUid = GUID(0x10BBA138, 0xE505, 0x1A10, 0xa1, 0xbb, 0x08, 0x00, 0x2b, 0x2a, 0x56, 0xc2)
    public static let mailboxStoreObject = GUID(0x20FA551B, 0x66AA, 0xCD11, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A)
    public static let publicFolderStoreObject = GUID(0x1002831C, 0x66AA, 0xCD11, 0x9B, 0xC8, 0x00, 0xAA, 0x00, 0x2F, 0xC4, 0x5A)
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let startPosition = dataStream.position
        guard size >= 36 else {
            throw MAPIError.corrupted
        }
        
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID is
        /// valid. However, in any EntryID stored in a property value, these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        guard self.flags == 0x00000000 else {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The identifier for the provider that created the EntryID. This value is used to route EntryIDs to the correct
        /// provider and MUST be set to %x38.A1.BB.10.05.E5.10.1A.A1.BB.08.00.2B.2A.56.C2.
        self.providerUid = try GUID(dataStream: &dataStream)
        guard self.providerUid == StoreEntryID.providerUid else {
            throw MAPIError.corrupted
        }
        
        /// Version (1 byte): This value MUST be set to zero.
        self.version = try dataStream.read()
        guard self.version == 0x00 else {
            throw MAPIError.corrupted
        }
        
        /// Flag (1 byte): This value MUST be set to zero.
        self.flag = try dataStream.read()
        guard self.flag == 0x00 else {
            throw MAPIError.corrupted
        }
        
        /// DLLFileName (14 bytes): This field MUST be set to the following value, which represents
        /// "emsmdb.dll": %x45.4D.53.4D.44.42.2E.44.4C.4C.00.00.00.00.
        self.dllFileName = try dataStream.readString(count: 14, encoding: .ascii)!.trimmingCharacters(in: ["\0"])
        
        let remainingCount = size - (dataStream.position - startPosition)
        switch self.dllFileName.lowercased() {
        case "emsmdb.dll":
            self.wrappedProviderData = try EMSMDBEntryIdData(dataStream: &dataStream, size: remainingCount)
        case "mspst.dll":
            self.wrappedProviderData = try MSPSTEntryIdData(dataStream: &dataStream, size: remainingCount)
        case "pstprx.dll":
            self.wrappedProviderData = try PSTPRXEntryIdData(dataStream: &dataStream, size: remainingCount)
        default:
            throw MAPIError.corrupted
        }
        
        guard dataStream.position - startPosition == size else {
            throw MAPIError.corrupted
        }
    }

    public var dataSize: Int {
        /// Flags (4 bytes) + ProviderUid (16 bytes) + Version (1 byte) + Flag (1 byte) + WrappedFlags (4 bytes) + WrappedProviderUid (16 bytes) + WrappedType (4 bytes)
        var baseSize = 4 + 16 + 1 + 1 + 4 + 16 + 4
        baseSize += dllFileName.count
        baseSize += wrappedProviderData.dataSize
        return baseSize
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        dataStream.write(flags, endianess: .littleEndian)
        providerUid.write(to: &dataStream)
        dataStream.write(flag, endianess: .littleEndian)
        dataStream.write(dllFileName, encoding: .ascii)
        wrappedProviderData.write(to: &dataStream)
    }
}
