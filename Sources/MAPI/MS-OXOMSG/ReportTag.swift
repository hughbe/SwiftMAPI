//
//  ReportTag.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXOMSG] 2.2.2.22 PidTagReportTag Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidTagReportTag property ([MS-OXPROPS] section 2.920) contains the data that is used to
/// correlate the report and the original message. The property can be absent if the sender does not
/// request a reply or response to the original e-mail message. If the original E-mail object has either
/// the PidTagResponseRequested property (section 2.2.1.46) set to 0x01 or the
/// PidTagReplyRequested property (section 2.2.1.45) set to 0x01, then the property is set on the
/// original E-mail object by using the following format.
public struct ReportTag {
    public let cookie: String
    public let version: UInt32
    public let storeEntryIdSize: UInt32
    public let storeEntryId: StoreEntryID?
    public let folderEntryIdSize: UInt32
    public let folderEntryId: FolderEntryID?
    public let messageEntryIdSize: UInt32
    public let messageEntryId: MessageEntryID?
    public let searchFolderEntryIdSize: UInt32
    public let searchFolderEntryId: FolderEntryID?
    public let messageSearchKeySize: UInt32
    public let messageSearchKey: [UInt8]?
    public let ansiTextSize: UInt32
    public let ansiText: String?
    
    public init(dataStream: inout DataStream) throws {
        /// Cookie (9 bytes): A null-terminated string of nine characters used for validation; set to "PCDFEB09".
        self.cookie = try dataStream.readString(count: 9, encoding: .ascii)!
        if self.cookie != "PCDFEB09\0" {
            throw MAPIError.corrupted
        }
        
        /// Version (4 bytes): This field specifies the version. If the SearchFolderEntryId field is present, this
        /// field MUST be set to 0x00020001; otherwise, this field MUST be set to 0x00010001.
        self.version = try dataStream.read(endianess: .littleEndian)
        
        /// StoreEntryIdSize (4 bytes): Size of the StoreEntryId field.
        self.storeEntryIdSize = try dataStream.read(endianess: .littleEndian)
        
        /// StoreEntryId (variable length of bytes): This field specifies the entry ID of the mailbox that contains the original message. If the value of the
        /// StoreEntryIdSize field is 0x00000000, this field is omitted. If the value is not zero, this field is filled with the number of bytes specified by the
        /// StoreEntryIdSize field.
        if self.storeEntryIdSize != 0x00000000 {
            self.storeEntryId = try StoreEntryID(dataStream: &dataStream, size: Int(self.storeEntryIdSize))
        } else {
            self.storeEntryId = nil
        }
        
        /// FolderEntryIdSize (4 bytes): Size of the FolderEntryId field.
        self.folderEntryIdSize = try dataStream.read(endianess: .littleEndian)
        
        /// FolderEntryId (variable): This field specifies the entry ID of the folder that contains the original message. If the value of the FolderEntryIdSize field is
        /// 0x00000000, this field is omitted. If the value is not zero, the field is filled with the number of bytes specified by the FolderEntryIdSize field.
        if self.folderEntryIdSize != 0x00000000 {
            self.folderEntryId = try FolderEntryID(dataStream: &dataStream, size: Int(folderEntryIdSize))
        } else {
            self.folderEntryId = nil
        }
        
        /// MessageEntryIdSize (4 bytes): Size of the MessageEntryId field.
        self.messageEntryIdSize = try dataStream.read(endianess: .littleEndian)
        
        /// MessageEntryId (variable): This field specifies the entry ID of the original message. If the value of the MessageEntryIdSize field is 0x00000000, this field
        /// is omitted. If the value is not zero, the field is filled with the number of bytes specified by the MessageEntryIdSize field.
        if self.messageEntryIdSize != 0x00000000 {
            self.messageEntryId = try MessageEntryID(dataStream: &dataStream, size: Int(messageEntryIdSize))
        } else {
            self.messageEntryId = nil
        }
        
        /// SearchFolderEntryIdSize (4 bytes): Size of the SearchFolderEntryId field.
        self.searchFolderEntryIdSize = try dataStream.read(endianess: .littleEndian)

        /// SearchFolderEntryId (variable): This field specifies the entry ID of an alternate folder that contains the original message. If the value of the
        /// SearchFolderEntryIdSize field is 0x00000000, this field is omitted. If the value is not zero, the field is filled with the number of bytes specified by the
        /// SearchFolderEntryIdSize field.
        if self.searchFolderEntryIdSize != 0x00000000 {
            self.searchFolderEntryId = try FolderEntryID(dataStream: &dataStream, size: Int(self.searchFolderEntryIdSize))
        } else {
            self.searchFolderEntryId = nil
        }
        
        /// MessageSearchKeySize (4 bytes): Size of the MessageSearchKey field.
        self.messageSearchKeySize = try dataStream.read(endianess: .littleEndian)
        
        /// MessageSearchKey (variable): This field specifies the search key of the original message. If the value of the MessageSearchKeySize field is 0x00000000,
        /// this field is omitted. If the value is not zero, the MessageSearchKey field is filled with the number of bytes specified by the MessageSearchKeySize field.
        if self.messageSearchKeySize != 0x00000000 {
            self.messageSearchKey = try dataStream.readBytes(count: Int(self.messageSearchKeySize))
        } else {
            self.messageSearchKey = nil
        }
        
        /// ANSITextSize (4 bytes): Number of characters in the ANSI Text field.
        self.ansiTextSize = try dataStream.read(endianess: .littleEndian)
        
        /// ANSIText (variable): The subject of the original message. If the value of the ANSITextSize field is 0x00000000, this field is omitted. If the value is not zero,
        /// the field is filled with the number of bytes specified by the ANSITextSize field.
        if self.ansiTextSize != 0x00000000 {
            self.ansiText = try dataStream.readString(count: Int(self.ansiTextSize), encoding: .ascii)
        } else {
            self.ansiText = nil
        }
        
        assert(dataStream.remainingCount == 0)
    }
}
