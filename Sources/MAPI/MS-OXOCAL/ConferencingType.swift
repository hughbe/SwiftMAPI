//
//  ConferencingType.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
/// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or non-NULL, clients SHOULD set their value
/// to zero or an empty string (as appropriate).<18> If the PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the
/// properties in this section are ignored. These properties are to be set only on Calendar objects and meeting-related objects.
/// [MS-OXOCAL] 2.2.1.56.3 PidLidConferencingType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidConferencingType ([MS-OXPROPS] section 2.67) property specifies the type of the meeting.
/// The value of this property MUST be set to one of the values listed in the following table
public enum ConferencingType: UInt32 {
    case windowsNetmeeting = 0x00000000
    case windowsMediaServices = 0x00000001
    case exchangeConferencing = 0x00000002
}
