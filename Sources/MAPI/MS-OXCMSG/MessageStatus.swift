//
//  MessageStatus.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.8 PidTagMessageStatus Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// Specifies the status of a message in a contents table. Contains a bitwise OR of zero or more of the
/// following values.
public struct MessageStatus: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The message has been marked for downloading from the remote message store to the local client.
    public static let remoteDownload = MessageStatus(rawValue: 0x00001000)
    
    /// This is a conflict resolve message as specified in [MS-OXCFXICS] section 3.1.5.6.2.1. This is a read-only value for the client.
    public static let inConflict = MessageStatus(rawValue: 0x00000800)
    
    /// The message has been marked for deletion at the remote message store without downloading to the local client.
    public static let remoteDelete = MessageStatus(rawValue: 0x00000800)

    public static let all: MessageStatus = [.remoteDownload, .inConflict, .remoteDelete]
}
