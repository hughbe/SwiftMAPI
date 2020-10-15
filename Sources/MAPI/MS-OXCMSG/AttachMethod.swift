//
//  AttachMethod.swift
//
//
//  Created by Hugh Bellamy on 22/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

import Foundation

/// [MS-OXCMSG] 2.2.2.9 PidTagAttachMethod Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagAttachMethod property ([MS-OXPROPS] section 2.601) represents the way the contents of an attachment are accessed.
/// This property is set to one of the following values.
public enum AttachMethod: UInt32 {
    /// The attachment has just been created
    case none = 0x00000000
    
    /// The PidTagAttachDataBinary property (section 2.2.2.7) contains the attachment data.
    case byValue = 0x00000001
    
    /// The PidTagAttachLongPathname property (section 2.2.2.13) contains a fully qualified path identifying the attachment To recipients with
    /// access to a common file server.
    case byReference = 0x00000002
    
    /// The PidTagAttachLongPathname property contains a fully qualified path identifying the attachment.
    case byReferenceOnly = 0x00000004
    
    /// The attachment is an embedded message that is accessed via the RopOpenEmbeddedMessage ROP ([MS-OXCROPS] section 2.2.6.16).
    case embeddedMessage = 0x00000005
    
    /// The PidTagAttachDataObject property (section 2.2.2.8) contains data in an application-specific format.
    case storage = 0x00000006
    
    /// The PidTagAttachLongPathname property contains a fully qualified path identifying the attachment.
    /// The PidNameAttachmentProviderType defines the web service API manipulating the attachment.
    case byWebReference = 0x00000007
}
