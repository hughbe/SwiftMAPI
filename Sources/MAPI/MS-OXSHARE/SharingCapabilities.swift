//
//  SharingCapabilities.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXSHARE] 2.2.2.1 PidLidSharingCapabilities Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidSharingCapabilities property ([MS-OXPROPS] section 2.237) MUST be set to one of the following values.
public enum SharingCapabilities: UInt32 {
    /// The Sharing Message object relates to a special folder.
    case relatesToSpecialFolder = 0x00040290
    
    /// The Sharing Message object does not relate to a special folder.
    case doesNotRelateToSpecialFolder = 0x000402B0
}
