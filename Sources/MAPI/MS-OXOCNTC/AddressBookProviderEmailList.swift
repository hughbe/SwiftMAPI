//
//  AddressBookProviderEmailList.swift
//  
//
//  Created by Hugh Bellamy on 19/10/2020.
//

/// [MS-OXOCNCTC] 2.2.1.2.11 PidLidAddressBookProviderEmailList Property
/// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidAddressBookProviderEmailList property ([MS-OXPROPS] section 2.2) specifies which
/// Electronic Address properties are set on the Contact object. Each PtypInteger32 value in this
/// property MUST be unique in the property and MUST be set to one of the values in the following table.
/// If this property is set, the PidLidAddressBookProviderArrayType property (section 2.2.1.2.12)
/// MUST also be set. These two properties MUST be kept synchronized with each other.
/// For example, if one of the values in the PidLidAddressBookProviderEmailList property is
/// 0x00000000, then the PidLidAddressBookProviderArrayType property would have the bit
/// 0x00000001 set.
public enum AddressBookProviderEmailList: UInt32 {
    /// 0x00000000 Email1 is defined for the contact.
    case email1Defined = 0x00000000
    
    /// 0x00000001 Email2 is defined for the contact.
    case email2Defined = 0x00000001
    
    /// 0x00000002 Email3 is defined for the contact.
    case email3Defined = 0x00000002
    
    /// 0x00000003 Business Fax is defined for the contact.
    case businessFaxDefined = 0x00000003
    
    /// 0x00000004 Home Fax is defined for the contact.
    case homeFaxDefined = 0x00000004
    
    /// 0x00000005 Primary Fax is defined for the contact.
    case primaryFaxDefined = 0x00000005
}
