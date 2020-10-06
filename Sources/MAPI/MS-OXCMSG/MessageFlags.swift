//
//  MessageFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.6 PidTagMessageFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagMessageFlags property ([MS-OXPROPS] section 2.791) specifies the status of the
/// Message object. Set to zero or to a bitwise OR of one or more of the values from the following
/// tables.
/// After the first successful call to the RopSaveChangesMessage ROP ([MS-OXCROPS] section
/// 2.2.6.3), as described in section 2.2.3.3, these flags are read-only for the client.
public struct MessageFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The message is marked as having been read.
    public static let read = MessageFlags(rawValue: 0x00000001)
    
    /// The message is still being composed and is treated as a Draft Message object. This bit is cleared by the server when responding to the RopSubmitMessage ROP
    /// ([MS-OXCROPS] section 2.2.7.1) with a success code.
    public static let unsent = MessageFlags(rawValue: 0x00000008)
    
    /// The message includes a request for a resend operation with a non-delivery report. For more details, see [MS-OXOMSG] section 3.2.4.5.
    public static let resend = MessageFlags(rawValue: 0x00000080)
    
    /// The message has not been modified since it was first saved (if unsent) or it was delivered (if sent).
    public static let unmodified = MessageFlags(rawValue: 0x00000002)
    
    /// The message is marked for sending as a result of a call to the RopSubmitMessage ROP
    public static let submitted = MessageFlags(rawValue: 0x00000004)
    
    /// The message has at least one attachment. This flag corresponds to the message's PidTagHasAttachments property (section 2.2.1.2).
    public static let hasAttachment = MessageFlags(rawValue: 0x00000010)
    
    /// The user receiving the message was also the user who sent the message.
    public static let fromMe = MessageFlags(rawValue: 0x00000020)
    
    /// The message is an FAI message.
    public static let fai = MessageFlags(rawValue: 0x00000040)
    
    /// The user who sent the message has requested notification when a recipient (1) first reads it.
    public static let notifyRead = MessageFlags(rawValue: 0x00000100)
    
    /// The user who sent the message has requested notification when a recipient (1) deletes it before reading or the Message object expires.
    public static let notifyUnread = MessageFlags(rawValue: 0x00000200)
    
    /// The message has been read at least once. This flag is set or cleared by the server whenever the mfRead flag is set or cleared.<4>
    /// Clients SHOULD ignore this flag.
    public static let notifyEverRead = MessageFlags(rawValue: 0x00000400)
    
    /// The incoming message arrived over the Internet and originated either outside the organization or from a source the gateway does not consider trusted.
    public static let internet = MessageFlags(rawValue: 0x00002000)
    
    /// The incoming message arrived over an external link other than X.400 or the Internet. It originated either outside the organization
    /// or from a source the gateway does not consider trusted.
    public static let untrusted = MessageFlags(rawValue: 0x00008000)

    public static let all: MessageFlags = [.read, .unsent, .resend, .unmodified, .submitted, .hasAttachment, .fromMe, .fai, .notifyRead, .notifyUnread, .notifyEverRead, .internet, .untrusted]
}
