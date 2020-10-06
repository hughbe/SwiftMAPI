//
//  SharingResponseType.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXSHARE] 2.2.4.2 PidLidSharingResponseType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidSharingResponseType property ([MS-OXPROPS] section 2.286) specifies the type of sharing response with which the
/// recipient of the sharing request responded. This property MUST be set to one of the following values.
public enum SharingResponseType: UInt32 {
    /// Acceptance of the sharing request
    case acceptance = 0x00000001
    
    /// Denial of the sharing request
    case denial = 0x00000002
}
