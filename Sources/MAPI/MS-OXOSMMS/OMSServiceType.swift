//
//  OMSServiceType.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXOSMMS] 2.2.1.3 PidNameOMSServiceType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidNameOMSServiceType property ([MS-OXPROPS] section 2.457) indicates the type of service used to send the SMS or MMS
/// message. The value of this property MUST be one of the values in the following table.
public enum OMSServiceType: UInt32 {
    case sms = 0x00000001
    case mms = 0x00000004
}
