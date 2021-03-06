//
//  OneOffEntryID.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-OXCDATA] 2.2.5 Recipient EntryID Structures
/// [MS-OXCDATA] 2.2.5.1 One-Off EntryID Structure
/// A One-Off EntryID structure specifies a set of data representing recipients (1) that do not exist in the directory. All information about a one-off recipient (1) is contained in the EntryID.
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/one-off-entry-identifiers
public struct OneOffEntryID: EntryID {
    public var flags: UInt32
    public var providerUid: GUID
    public var version: UInt16
    public var entryFlags: OneOffEntryFlags
    public var displayName: String
    public var addressType: String
    public var emailAddress: String
    
    public static let providerUid = GUID(0xA41F2B81, 0xA3BE, 0x1910, 0x9d, 0x6e, 0x00, 0xdd, 0x01, 0x0f, 0x54, 0x02)

    public init(dataStream: inout DataStream, size: Int) throws {
        /// Flags (4 bytes): This value is set to 0x00000000. Bits in this field indicate under what circumstances a short-term EntryID is valid.
        /// However, in any EntryID stored in a property value, these 4 bytes are zero, indicating a long-term EntryID.
        self.flags = try dataStream.read(endianess: .littleEndian)
        guard self.flags == 0x00000000 else {
            throw MAPIError.corrupted
        }
        
        /// ProviderUID (16 bytes): The identifier of the provider that created the EntryID. This value is used to route EntryIDs to
        /// the correct provider and MUST be set to %x81.2B.1F.A4.BE.A3.10.19.9D.6E.00.DD.01.0F.54.02.
        self.providerUid = try GUID(dataStream: &dataStream)
        guard self.providerUid == OneOffEntryID.providerUid else {
            throw MAPIError.corrupted
        }
        
        /// Version (2 bytes): This value is set to 0x0000.
        self.version = try dataStream.read(endianess: .littleEndian)
        guard self.version == 0x0000 else {
            throw MAPIError.corrupted
        }
        
        /// Flags (2 bytes):
        /// Pad (1 bit): (mask 0x8000) Reserved. This value is set to '0'.
        /// MAE (2 bits): (mask 0x0C00) The encoding used for Macintosh-specific data attachments, as specified in [MS-OXCMAIL]
        /// section 2.1.3.4.3. The values for this field are specified in the following table.
        /// Name     | Word value | Field value     | Description
        /// -----------------------------------------------------
        /// BinHex          |  0x0000             | b'00'                              | BinHex encoded.
        /// UUENCODE  | 0x0020              | b'01'                              | UUENCODED. Not valid if the message is in Multipurpose Internet Mail Extensions (MIME) format, in which case the flag will be ignored and BinHex used instead.
        /// AppleSingle   | 0x0040              | b'10'                              | Apple Single encoded. Allowed only when the message format is MIME.
        /// AppleDouble | 0x0060 b'11'     | Apple Double encoded.| Allowed only when the message format is MIME.
        /// Format (4 bits): (enumeration, mask 0x1E00) The message format desired for this recipient (1), as specified in the following table.
        /// Name     | Word value | Field value     | Description
        /// -----------------------------------------------------
        /// TextOnly        | 0x0006              | b'0011'                          | Send a plain text message body.
        /// HtmlOnly       | 0x000E              | b'0111'                          | Send an HTML message body.
        /// TextAndHtml | 0x0016              | b'1011'                          | Send a multipart/alternative body with both plain text and HTML.
        /// M (1 bit): (mask 0x0100) A flag that indicates how messages are to be sent. If b'0', indicates messages are to be sent to the
        /// recipient (1) in Transport Neutral Encapsulation Format (TNEF) format; if b'1', messages are sent to the recipient (1) in pure
        /// MIME format.
        /// U (1 bit): (mask 0x0080) A flag that indicates the format of the string fields that follow. If b'1', the string fields following are in
        /// Unicode (UTF-16 form) with 2-byte terminating null characters; if b'0', the string fields following are multibyte character set
        /// (MBCS) characters terminated by a single 0 byte.
        /// R (2 bits): (mask 0x0060) Reserved. This value is set to b'00'.
        /// L (1 bit): (mask 0x0010) A flag that indicates whether the server can look up an address in the address book. If b'1', server cannot
        /// look up this user's email address in the address book. If b'0', server can look up this user's email address in the address book.
        /// Pad (4 bits): (mask 0x000F) Reserved. This value is set to b'0000'.
        self.entryFlags = OneOffEntryFlags(rawValue: try dataStream.read(endianess: .littleEndian))
        
        /// DisplayName (variable): The recipient's display name (in the recipient table, the PidTagDisplayName property ([MS-OXCFOLD]
        /// section 2.2.2.2.2.5)) as a null-terminated string. If the U field is b'1', the terminating null character is 2 bytes long; otherwise, 1 byte.
        if self.entryFlags.contains(.unicode) {
            self.displayName = try dataStream.readUnicodeString(endianess: .littleEndian)!
        } else {
            self.displayName = try dataStream.readAsciiString()!
        }

        /// AddressType (variable): The recipient's email address type (in the recipient table, the PidTagAddressType property ([MS-OXOABK]
        /// section 2.2.3.13)) as a null-terminated string. If the U field is b'1', the terminating null character is 2 bytes long; otherwise, 1 byte.
        if self.entryFlags.contains(.unicode) {
            self.addressType = try dataStream.readUnicodeString(endianess: .littleEndian)!
        } else {
            self.addressType = try dataStream.readAsciiString()!
        }

        /// EmailAddress (variable): The recipient's email address (in the recipient table, the PidTagEmailAddress property ([MS-OXOABK]
        /// section 2.2.3.14)) as a null-terminated string. If the U field is b'1', the terminating null character is 2 bytes long; otherwise, 1 byte.
        if self.entryFlags.contains(.unicode) {
            self.emailAddress = try dataStream.readUnicodeString(endianess: .littleEndian)!
        } else {
            self.emailAddress = try dataStream.readAsciiString()!
        }
    }
    
    public var dataSize: Int {
        /// Flags (4 bytes) + ProviderUid (16 bytes) + Version (2 bytes) + Entry Flags (2 bytes) + Display Name (variable) + Address Type (variable) + Email Address (variable)
        var baseSize = 4 + 16 + 2 + 2
        baseSize += (displayName.count + 1) * (entryFlags.contains(.unicode) ? 2 : 1)
        baseSize += (addressType.count + 1) * (entryFlags.contains(.unicode) ? 2 : 1)
        baseSize += (emailAddress.count + 1) * (entryFlags.contains(.unicode) ? 2 : 1)
        return baseSize
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        dataStream.write(flags, endianess: .littleEndian)
        providerUid.write(to: &dataStream)
        dataStream.write(version, endianess: .littleEndian)
        dataStream.write(entryFlags.rawValue, endianess: .littleEndian)
        
        if entryFlags.contains(.unicode) {
            dataStream.write(displayName + "\0", encoding: .utf16LittleEndian)
        } else {
            dataStream.write(displayName + "\0", encoding: .ascii)
        }
        
        if entryFlags.contains(.unicode) {
            dataStream.write(addressType + "\0", encoding: .utf16LittleEndian)
        } else {
            dataStream.write(addressType + "\0", encoding: .ascii)
        }
        
        if entryFlags.contains(.unicode) {
            dataStream.write(emailAddress + "\0", encoding: .utf16LittleEndian)
        } else {
            dataStream.write(emailAddress + "\0", encoding: .ascii)
        }
    }
}
