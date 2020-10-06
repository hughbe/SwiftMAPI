//
//  PostalAddressId.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

/// [MS-OXOCNTC] 2.2.1.3.9 PidLidPostalAddressId Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidPostalAddressId property ([MS-OXPROPS] section 2.204) specifies which physical
/// address is the Mailing Address for this contact. If present, the property MUST have one of the values
/// specified in the following table. If not set, the client SHOULD assume that the value is 0x00000000.
/// This property is optional.
public enum PostalAddressId: UInt32 {
    /// No address is selected as the Mailing Address. PidTagStreetAddress (section 2.2.1.3.1),
    /// PidTagLocality (section 2.2.1.3.2), PidTagStateOrProvince (section 2.2.1.3.3),
    /// PidTagPostalCode (section 2.2.1.3.4), PidTagCountry (section 2.2.1.3.5),
    /// PidLidAddressCountryCode (section 2.2.1.3.6), and PidTagPostalAddress (section 2.2.1.3.8)
    /// all MUST NOT be set.
    case noMailingAddress = 0x00000000
    
    /// The Home Address is the Mailing Address.
    /// The values of the PidTagStreetAddress, PidTagLocality, PidTagStateOrProvince,
    /// PidTagPostalCode, PidTagPostOfficeBox (section 2.2.1.3.7), PidTagCountry,
    /// PidLidAddressCountryCode, and PidTagPostalAddress properties MUST be equal to the
    /// values of the PidTagHomeAddressStreet (section 2.2.1.3.1), PidTagHomeAddressCity
    /// (section 2.2.1.3.2), PidTagHomeAddressStateOrProvince (section 2.2.1.3.3),
    /// PidTagHomeAddressPostalCode (section 2.2.1.3.4), PidTagHomeAddressPostOfficeBox
    /// (section 2.2.1.3.7), PidTagHomeAddressCountry (section 2.2.1.3.5),
    /// PidLidHomeAddressCountryCode (section 2.2.1.3.6), and PidLidHomeAddress (section
    /// 2.2.1.3.8) properties, respectively.
    case homeAddressIsMailingAddress = 0x00000001
    
    /// The Work Address is the Mailing Address. The values of the PidTagStreetAddress,
    /// PidTagLocality, PidTagStateOrProvince, PidTagPostalCode, PidTagPostOfficeBox,
    /// PidTagCountry, PidLidAddressCountryCode, and PidTagPostalAddress properties MUST be
    /// equal to the values of the PidLidWorkAddressStreet (section 2.2.1.3.1),
    /// PidLidWorkAddressCity (section 2.2.1.3.2), PidLidWorkAddressState (section 2.2.1.3.3),
    /// PidLidWorkAddressPostalCode (section 2.2.1.3.4), PidLidWorkAddressPostOfficeBox
    /// (section 2.2.1.3.7), PidLidWorkAddressCountry (section 2.2.1.3.5),
    /// PidLidWorkAddressCountryCode (section 2.2.1.3.6), and PidLidWorkAddress (section
    /// 2.2.1.3.8) properties, respectively.
    case workAddressIsMailingAddress = 0x00000002
    
    /// The Other Address is the Mailing Address. The values of the PidTagStreetAddress,
    /// PidTagLocality, PidTagStateOrProvince, PidTagPostalCode, PidTagPostOfficeBox,
    /// PidTagCountry, PidLidAddressCountryCode, and PidTagPostalAddress properties MUST be
    /// equal to the values of the PidTagOtherAddressStreet (section 2.2.1.3.1),
    /// PidTagOtherAddressCity (section 2.2.1.3.2), PidTagOtherAddressStateOrProvince (section
    /// 2.2.1.3.3), PidTagOtherAddressPostalCode (section 2.2.1.3.4),
    /// PidTagOtherAddressPostOfficeBox (section 2.2.1.3.7), PidTagOtherAddressCountry
    /// (section 2.2.1.3.5), PidLidOtherAddressCountryCode (section 2.2.1.3.6), and
    /// PidLidOtherAddress (section 2.2.1.3.8) properties, respectively.
    case otherAddressIsMailingAddress = 0x00000003
}
