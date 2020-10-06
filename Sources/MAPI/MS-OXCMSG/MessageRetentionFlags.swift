//
//  MessageRetentionFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.58.6 PidTagRetentionFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagRetentionFlags property ([MS-OXPROPS] section 2.933) contains flags that specify the
/// status or nature of an item's retention tag or archive tag. The PidTagRetentionFlags property can
/// be present on both Message objects and folders and can be set by both client and server.
/// The value of the PidTagRetentionFlags property is a bitwise OR of zero or more of the values from
/// the following table.
public struct MessageRetentionFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The retention tag on the folder is explicitly set.
    public static let explicitTag = MessageRetentionFlags(rawValue: 0x00000001)
    
    /// The retention tag was not changed by the end user.
    public static let userOverride = MessageRetentionFlags(rawValue: 0x00000002)
    
    /// The retention tag on the Message object is an autotag, which is predicted by the system.
    public static let autoTag = MessageRetentionFlags(rawValue: 0x00000004)
    
    /// The retention tag on the folder is of a personal type and can be made available to the end user.
    public static let personalTag = MessageRetentionFlags(rawValue: 0x00000008)
    
    /// The archive tag on the folder is explicitly set.
    public static let explicitArchiveTag = MessageRetentionFlags(rawValue: 0x00000010)
    
    /// The Message object remains in place and is not archived.
    public static let keepInPlace = MessageRetentionFlags(rawValue: 0x00000020)
    
    /// The Message object or folder is system data.
    public static let systemData = MessageRetentionFlags(rawValue: 0x00000040)
    
    /// The folder needs to be rescanned.
    public static let needsRescan = MessageRetentionFlags(rawValue: 0x00000080)
    
    /// The folder is being rescanned.
    public static let pendingRescan = MessageRetentionFlags(rawValue: 0x00000100)

    public static let all: MessageRetentionFlags = [.explicitTag, .userOverride, .autoTag, .personalTag, .explicitArchiveTag, .keepInPlace, .systemData, .needsRescan, .pendingRescan]
}
