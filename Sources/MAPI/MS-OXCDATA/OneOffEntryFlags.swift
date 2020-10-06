//
//  OneOffEntryFlags.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/one-off-entry-identifiers
/// The flags field can be set to the following values:
/// MAPI_ONE_OFF_NO_RICH_INFO
/// MAPI_ONE_OFF_UNICODE
public struct OneOffEntryFlags: OptionSet {
    public let rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }

    /// The MAPI_ONE_OFF_NO_RICH_INFO flag is set if a recipient should not receive message content in the Transport Neutral
    /// Encapsulation Format (TNEF). This flag is set when MAPI_SEND_NO_RICH_INFO is passed to IAddrBook::CreateOneOff
    /// method.
    public static let noRichInfo = OneOffEntryFlags(rawValue: 0x0001)
    
    /// The MAPI_ONE_OFF_UNICODE flag is set if the display name and email address are Unicode strings.
    /// This flag is set when the MAPI_UNICODE is passed to IAddrBook::CreateOneOff. When the MAPI_UNICODE
    /// flag is not passed to CreateOneOff, MAPI assumes that the display name and email address strings are in the
    /// workstation's current ANSI character set. ANSI strings generally do not work well in messages that are sent
    /// between platforms using different character sets because the code page is not encoded in the entry identifier.
    /// To protect against this potential incompatibility, many address types are limited to only those characters that
    /// are common across multiple character sets. However, to ensure character set and platform compatibility, clients
    /// should use Unicode for the character strings in their messages.
    public static let unicode = OneOffEntryFlags(rawValue: 0x8000)
    
    public static let all: OneOffEntryFlags = [.noRichInfo, .unicode]
}
