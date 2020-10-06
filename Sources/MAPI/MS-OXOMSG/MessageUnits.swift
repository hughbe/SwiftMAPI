//
//  MessageUnits.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOMSG] 2.2.3.3 PidTagDeferredSendUnits Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagDeferredSendUnits property ([MS-OXPROPS] section 2.659) specifies the unit of time by
/// which the value of the PidTagDeferredSendNumber property (section 2.2.3.2) is multiplied. If set,
/// the PidTagDeferredSendUnits property has one of the values listed in the following table.
/// [MS-OXOMSG] 2.2.3.6 PidTagExpiryUnits Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagExpiryUnits property ([MS-OXPROPS] section 2.684) is used to describe the unit of time
/// that the value of the PidTagExpiryNumber property (section 2.2.3.5) multiplies. If set, the following
/// are the valid values of this property.
public enum MessageUnits: UInt32 {
    /// For example, 60 seconds.
    case minutes = 0x00000000
    
    /// For example, 60x60 seconds.
    case hours = 0x00000001
    
    /// For example, 24x60x60 seconds.
    case day = 0x00000002
    
    /// For example, 7x24x60x60 seconds.
    case week = 0x00000003
}
