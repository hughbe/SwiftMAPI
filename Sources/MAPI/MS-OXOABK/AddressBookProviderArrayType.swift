//
//  AddressBookProviderArrayType.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOCNTC] 2.2.1.2.12 PidLidAddressBookProviderArrayType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidAddressBookProviderArrayType property ([MS-OXPROPS] section 2.1) specifies the state of the contact's electronic
/// addresses and represents a set of bit flags. The value of the PidLidAddressBookProviderArrayType property MUST be a combination
/// of flags that specify the state of the Contact object. Individual flags are specified in the following table. If this property is set,
/// the PidLidAddressBookProviderEmailList property (section 2.2.1.2.11) MUST be set as well. These two properties MUST be kept
/// in sync with each other. For example, if this property has the bit 0x00000001 set, then one of the values of the
/// PidLidAddressBookProviderEmailList property would be 0x00000000.
public struct AddressBookProviderArrayType: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// Email1 is defined for the contact.
    public static let email1Defined = AddressBookProviderArrayType(rawValue: 0x00000001)
    
    /// Email2 is defined for the contact.
    public static let email2Defined = AddressBookProviderArrayType(rawValue: 0x00000002)
    
    /// Email3 is defined for the contact.
    public static let email3Defined = AddressBookProviderArrayType(rawValue: 0x00000004)
    
    /// Business Fax is defined for the contact.
    public static let businessFaxDefined = AddressBookProviderArrayType(rawValue: 0x00000008)
    
    /// Home Fax is defined for the contact.
    public static let homeFaxDefined = AddressBookProviderArrayType(rawValue: 0x00000010)
    
    /// Primary Fax is defined for the contact.
    public static let primaryFaxDefined = AddressBookProviderArrayType(rawValue: 0x00000020)

    public static let all: AddressBookProviderArrayType = [.email1Defined, .email2Defined, .email3Defined, .businessFaxDefined, .homeFaxDefined, .primaryFaxDefined]
}
