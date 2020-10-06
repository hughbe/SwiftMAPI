//
//  WlinkFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCPRPT] 2.2.9.6 PidTagWlinkFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagWlinkFlags property ([MS-OXPROPS] section 2.1062) is a bit field in which each bit SHOULD be set to 1 if the associated
/// condition in the following table applies and to 0 otherwise. The possible bit values are as follows.
/// All bits not specified in the above table are reserved. They MUST be ignored, but if set, they are to be preserved.
public struct WlinkFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// Shortcut points to a server public folder.
    public static let publicFolder = WlinkFlags(rawValue: 0x00000001)

    /// Shortcut points to a folder that is accessed via the Internet Message Access Protocol - Version 4 (IMAP4).
    public static let imapFolder = WlinkFlags(rawValue: 0x00000004)
    
    /// Shortcut points to a folder that is accessed via the Web Distributed Authoring and Versioning Protocol (WebDAV).
    public static let webDavFolder = WlinkFlags(rawValue: 0x00000008)
    
    /// Shortcut points to a folder that is accessed via a SharePoint folder.
    public static let sharePointFolder = WlinkFlags(rawValue: 0x00000010)
    
    /// Shortcut points to a Root folder (interpersonal messaging subtree).
    public static let rootFolder = WlinkFlags(rawValue: 0x00000020)

    /// Shortcut points to a folder that has been shared with other users. This value can be used to display a visual indicator and
    /// does not set any permissions.
    public static let sharedOut = WlinkFlags(rawValue: 0x00000100)
    
    /// Shortcut points to a folder that is owned by another user. This value can be used to display a visual indicator and does not
    /// set any permissions.
    public static let sharedIn = WlinkFlags(rawValue: 0x00000200)

    /// Shortcut points to a folder that belongs to another user.
    public static let personFolder = WlinkFlags(rawValue: 0x00000400)
    
    /// Shortcut points to a folder that accesses data from an iCalendar data source (see [MS-OXCICAL]).
    public static let iCal = WlinkFlags(rawValue: 0x00000800)
    
    /// Shortcut points to a Calendar folder. The contents of the Calendar folder, if displayed with other calendars, are merged into one calendar
    /// and the ordering determined by the PidTagWlinkOrdinal property (section 2.2.9.7). Merging is purely a display; no objects are created or
    /// moved between folders.
    public static let overlay = WlinkFlags(rawValue: 0x00001000)
    
    /// Shortcut has been renamed such that the value of the PidTagNormalizedSubject property (section 2.2.9.2) of the shortcut does not
    /// match the value of the PidTagNormalizedSubject property of the folder, or the shortcut is a group header and has been renamed
    /// from the default value.
    public static let oneOffName = WlinkFlags(rawValue: 0x00002000)

    public static let all: WlinkFlags = [.publicFolder, .imapFolder, .webDavFolder, .sharePointFolder, .rootFolder, .sharedOut, .sharedIn, .personFolder, .iCal, .overlay, .oneOffName]
}
