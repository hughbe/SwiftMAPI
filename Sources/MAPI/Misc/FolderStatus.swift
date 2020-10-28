//
//  FolderStatus.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

/// Contains a 32-bit bitmask of flags that define folder status.
/// This property for folders is analogous to the PR_MSG_STATUS (PidTagMessageStatus) property for messages. Its flags are
/// provided for the client application only and do not affect the message store. Clients can use or ignore these settings. The
/// client can also define its own values for the client-definable bits of this property.
/// One or more of the following flags can be set for the bitmask:
/// Message store providers set this property on a folder to one or more of these values and clients interpret the status as appropriate for
/// their applications. For example, a client can use the folder status to visually differentiate between folders in a hierarchy table, displaying
/// folders with the same status in the same way. Highlighted folders can be shown in reverse video, tagged folders and folders marked
/// for deletion can be shown with a meaningful icon, and hidden folders can be concealed.
/// Bits 16 through 31 ("0x10000" through "0x80000000") of this property are available for use by the IPM client application. All other
/// bits are reserved for use by MAPI; those not defined in the preceding list should be initially set to zero and not altered.
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstatus-canonical-property
public struct FolderStatus: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// FLDSTATUS_HIGHLIGHTED The folder is highlighted, for example, shown in reverse video.
    public static let highlighted = FolderStatus(rawValue: 0x00000001)
    
    /// FLDSTATUS_TAGGED The folder is tagged.
    public static let tagged = FolderStatus(rawValue: 0x00000002)
    
    /// FLDSTATUS_HIDDEN The folder is hidden.
    public static let hidden = FolderStatus(rawValue: 0x00000004)
    
    /// FLDSTATUS_DELMARKED The folder is marked for deletion. The client application sets this flag.
    public static let markedForDeletion = FolderStatus(rawValue: 0x00000008)
    
    public static let all: FolderStatus = [.highlighted, .tagged, .hidden, .markedForDeletion]
}
