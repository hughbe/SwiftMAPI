//
//  SharingFlavor.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXSHARE] 2.2.2.5 PidLidSharingFlavor Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidSharingFlavor property ([MS-OXPROPS] section 2.245) specifies the type of Sharing Message object.
/// This property MUST be set to one of the following values.
public enum SharingFlavor: UInt32 {
    /// A sharing invitation for a special folder.
    case sharingInvitationForSpecialFolder = 0x00020310
    
    /// A sharing invitation for a folder that is not a special folder.
    case sharingInvitationForNonSpecialFolder = 0x00000310
    
    /// A sharing request for a special folder.
    case sharingRequestForSpeicalFolder = 0x00020500
    
    /// Both a sharing invitation for a special folder and a sharing request for the recipient's equivalent special folder.
    case sharingInvitationForSpecialFolderAndSharingRequestForRecipientsEquivalentSpecialFolder = 0x00020710
    
    /// A sharing response that is denying a sharing request.
    case sharingResponseDenyingSharingRequest = 0x00025100
}
