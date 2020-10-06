//
//  OMSSourceType.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXOSMMS] 2.2.1.4 PidNameOMSSourceType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidNameOMSSourceType property ([MS-OXPROPS] section 2.458) indicates the source of the
/// SMS or MMS message. The value of this property MUST be one of the values in the following table.
public enum OMSSourceType: UInt32 {
    /// (as described in [MSDN-MobileServicePart1]
    case xmsInspector = 0x00000000
    
    case reminder = 0x00000001
    
    case calendarSummary = 0x00000002
    
    case rule = 0x00000003
    
    case unknown = 0x00000004
}
