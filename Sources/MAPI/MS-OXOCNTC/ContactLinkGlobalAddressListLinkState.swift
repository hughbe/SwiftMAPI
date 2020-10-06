//
//  ContactLinkGlobalAddressListLinkState.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

/// [MS-OXOCNTC] 2.2.1.9.3 PidLidContactLinkGlobalAddressListLinkState Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidContactLinkGlobalAddressListLinkState property ([MS-OXPROPS] section 2.73)
/// specifies the state of the linking between the GAL contact and the duplicate contact.<8>
/// The valid values for this property are specified in the following table.
public enum ContactLinkGlobalAddressListLinkState: UInt32 {
    /// The duplicate contact is not linked to the GAL contact or the GAL contact is not downloaded.
    case notLinkedOrNotDownloaded = 0x00000000
    
    /// The duplicate contact is linked to the GAL contact.
    case linked = 0x00000001
    
    /// The duplicate contact cannot be automatically linked to the GAL contact.
    case cannotBeAutomaticallyLinked = 0x00000002
}
