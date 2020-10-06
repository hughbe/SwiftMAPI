//
//  AttachmentPermissionType.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.2.27 PidNameAttachmentOriginalPermissionType
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidNameAttachmentOriginalPermissionType property ([MS-OXPROPS] section 2.370)
/// contains the original permission type data associated with a web reference attachment.
/// [MS-OXCMSG] 2.2.2.28 PidNameAttachmentPermissionType
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidNameAttachmentPermissionType property ([MS-OXPROPS] section 2.371) contains the
/// permission type data associated with a web reference attachment.
public enum AttachmentPermissionType: UInt32 {
    /// None. User has no permissions to share
    case none = 0x00000000

    /// View. User can only read the web reference attachment.
    case view = 0x00000001
    
    /// Edit. User can edit the web reference attachment.
    case edit = 0x00000002
}
