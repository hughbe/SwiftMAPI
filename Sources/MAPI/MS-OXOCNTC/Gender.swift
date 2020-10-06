//
//  Gender.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

/// [MS-OXOCNTC] 2.2.1.10.20 PidTagGender Property
/// Type: PtypInteger16 ([MS-OXCDATA] section 2.11.1)
/// The PidTagGender property ([MS-OXPROPS] section 2.708) specifies the gender of the contact. If present, the property MUST be one o
/// the following values. This property is optional.
public enum Gender: UInt16 {
    case unspecified = 0x0000
    case female = 0x0001
    case male = 0x0002
}
