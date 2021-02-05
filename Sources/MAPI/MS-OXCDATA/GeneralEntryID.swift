//
//  FolderEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.3 General EntryID Structure
/// A General EntryID structure is used to identify and access an object. Note that the length of an
/// EntryID is specified externally, not in the structure itself.
public struct GeneralEntryID: EntryID {
    public var flags: UInt32
    public var providerUid: GUID
    public var providerData: [UInt8]

    public init(dataStream: inout DataStream, size: Int) throws {
        let startPosition = dataStream.position

        guard size >= 20 else {
            throw MAPIError.corrupted
        }
        
        /// Flags (4 bytes): This value MUST be set to 0x00000000. Bits in this field indicate under what
        /// circumstances a short-term EntryID is valid. However, in any EntryID stored in a property value,
        /// these 4 bytes MUST be zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        
        /// ProviderUID (16 bytes): The identifier for the provider that created the EntryID. This value is used
        /// to route EntryIDs to the correct provider. Values for this field appear in the following table.
        /// EntryID UID type                      | ProviderUID value
        /// ---------------------------------------------------------------------------------------------------------
        /// Object in private message store                                   | Is set to the MailboxGuid field value provided in the RopLogon ROP response buffer ([MS-OXCROPS] section 2.2.3.1.2).
        /// Object in public message store                                    | %x1A. 44.73.90.AA.66.11.CD.9B.C8.00.AA.00.2F.C4.5A
        /// Address book recipient (1)                                            | %xDC.A7.40.C8.C0.42.10.1A.B4.B9.08.00.2B.2F.E1.82
        /// One-off recipient (1)                                                      | %x81.2B.1F.A4.BE.A3.10.19.9D.6E.00.DD.01.0F.54.02
        /// Contact address or personal distribution list recipient | %xFE.42.AA.0A.18.C7.1A.10.E8.85.0B.65.1C.24.00.00
        self.providerUid = try GUID(dataStream: &dataStream)
        
        /// ProviderData (variable): Provider-specific data further specified in section 2.2.4.1, section 2.2.4.2, and section 2.2.4.3.
        self.providerData = try dataStream.readBytes(count: Int(size - 20))
        
        guard dataStream.position - startPosition == size else {
            throw MAPIError.corrupted
        }
    }
}
