//
//  MessageStorage+ContactProperties.swift
//
//
//  Created by Hugh Bellamy on 26/08/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

/// [MS-OXOCNTC] 2.2 Message Syntax
/// Contact objects and Personal Distribution List objects can be created and modified by clients and
/// servers. Except where noted, this section defines constraints under which both clients and servers
/// operate.
/// Protocol clients operate on Contact objects and Personal Distribution List objects by using the Message
/// and Attachment Object Protocol, as specified in [MS-OXCMSG], and the Folder Object Protocol, as
/// specified in [MS-OXCFOLD]. The details of how a protocol server operates on Contact objects and
/// Personal Distribution List objects are implementation-dependent, but the results of any such
/// operations MUST be exposed to clients in a manner that is consistent with this protocol.
/// Unless otherwise specified, a Contact object and a Personal Distribution List object adhere to all
/// property constraints specified in [MS-OXPROPS] and [MS-OXCMSG].
/// [MS-OXOCNTC] 2.2.1 Contact Object Properties
/// Properties that are used in groups to define components of a Contact object are specified in sections
/// 2.2.1.1 through 2.2.1.9. Standalone properties of a Contact object are specified in sections 2.2.1.10
/// and 2.2.1.11. Each property is set only when user data needs to be stored.
/// [MS-OXOCNTC] 2.2.1.1 Contact Name Properties
/// Contact Name properties can be set on a Contact object to specify the name of the person
/// represented by the contact.
/// [MS-OXOCNTC] 2.2.1.2 Electronic Address Properties
/// The Contact object has built-in properties for up to three different email addresses (Email1,
/// Email2, and Email3) and three different fax addresses (Primary Fax, Business Fax, and Home Fax).
/// Each of these electronic addresses is optional, and each consists of a group of related properties
/// associated with it.
/// Unless otherwise specified, when creating or modifying a Contact object, all properties in a group
/// MUST be set, changed, or deleted together at the same time. Specifications of similar properties are
/// grouped together in sections 2.2.1.2.1 through section 2.2.1.2.12. The following table specifies the
/// properties in each Electronic Address group.
/// If any of the email addresses are defined for the contact, then the properties
/// PidLidAddressBookProviderArrayType (section 2.2.1.2.12) and
/// PidLidAddressBookProviderEmailList (section 2.2.1.2.11) MUST be defined as well.
/// For each email address, if one property is defined, then the entire set of properties MUST be defined,
/// and PidLidAddressBookProviderArrayType and PidLidAddressBookProviderEmailList MUST be
/// defined as well.
/// If PidTagPrimaryFaxNumber, PidTagBusinessFaxNumber, or PidTagHomeFaxNumber is
/// defined, then the PidLidAddressBookProviderArrayType and
/// PidLidAddressBookProviderEmailList properties SHOULD be defined, as well as the rest of the
/// Primary Fax, Business Fax, or Home Fax properties, respectively. The client sets the
/// PidLidAddressBookProviderEmailList and PidLidAddressBookProviderArrayType and Primary
/// Fax, Business Fax, or Home Fax properties only if the client is able to interpret the value of the
/// PidTagPrimaryFaxNumber, PidTagBusinessFaxNumber, or PidTagHomeFaxNumber property,
/// respectively, as an actual fax phone number. The server sets the
/// PidLidAddressBookProviderEmailList and PidLidAddressBookProviderArrayType properties
/// whenever the PidTagPrimaryFaxNumber, PidTagBusinessFaxNumber, or
/// PidTagHomeFaxNumber property is set.<2>
/// [MS-OXOCNTC] 2.2.1.3 Physical Address Properties
/// The Contact object provides built-in support for three physical addresses: Home Address, Work
/// Address, and Other Address. One of the addresses can be marked as the Mailing Address. Each of
/// these physical addresses is optional, and each consists of a group of related properties.
/// When creating or modifying a Contact object, all properties in a group MUST be set, changed, or
/// deleted together at the same time, unless otherwise specified in sections 2.2.1.3.1 through section
/// 2.2.1.3.9. Specifications of similar properties are grouped together in sections 2.2.1.3.1 through
/// 2.2.1.3.9.
/// The following table specifies the properties in each Physical Address group.
/// [MS-OXOCNTC] 2.2.1.4 Telephone Properties
/// Telephone properties specify telephone numbers for the contact. If present, each property MUST NOT
/// exceed a length of 255 characters, excluding the terminating null character. Each property in this
/// section is optional.
/// [MS-OXOCNTC] 2.2.1.5 Event Properties
/// Two events are associated with a contact: a birthday and an anniversary. Each event is defined by
/// two properties: a PtypTime property and an object PtypBinary property. If one of the two properties
/// is set for an event, the other MUST also be set. If either of the two events is defined for a contact, the
/// PidLidReferenceEntryId property (section 2.2.1.10.1) SHOULD be set to the EntryID for this
/// Contact object.
/// [MS-OXOCNTC] 2.2.1.6 Professional Properties
/// Professional properties are used to store professional details for the person represented by the
/// contact.
/// [MS-OXOCNTC] 2.2.1.7 Business Card Properties
/// Business Card properties can be used to customize the display of contact information in business card
/// format.<3> The business card format is a collection of information about how to display contact data
/// to the user. The server ignores the Business Card properties.
/// [MS-OXOCNTC] 2.2.1.8 Contact Photo Properties
/// The PidLidHasPicture property (section 2.2.1.8.1) and the contact photo attachment specified in
/// section 2.2.1.8.3 are optional and represent an optional photo associated with the contact.<4>
/// [MS-OXOCNTC] 2.2.1.9 Contact Aggregation Properties
/// The contact aggregation properties are used for importing external contacts and linking duplicate
/// contacts.<5> The linking of duplicate contacts allows the client to show one representation to the
/// user.
/// [MS-OXOCNTC] 2.2.1.10 Other Contact Properties
/// [MS-OXOCNTC] 2.2.2 Personal Distribution List Properties
/// Properties that are used in groups to define components of a Personal Distribution List object are
/// specified in sections 2.2.2.1 and 2.2.2.2. Standalone properties of a Personal Distribution List object
/// are specified in sections 2.2.2.3 and 2.2.2.4. Each property is set only when user data needs to be
/// stored.
/// [MS-OXOCNTC] 2.2.2.1 Personal Distribution List Name Properties
/// The properties specified in section 2.2.2.1.1 to section 2.2.2.1.4 are used to display the name of the
/// Personal Distribution List object.
/// [MS-OXOCNTC] 2.2.2.2 Personal Distribution List Member Properties
public extension MessageStorage {
    /// [MS-OXOCNTC] 2.2.1.1.1 PidTagNickname Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNickname property ([MS-OXPROPS] section 2.803) specifies the nickname of the
    /// contact. This property is optional.
    var nickname: String? {
        return getProperty(id: .tagNickname)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.2 PidTagGeneration Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagGeneration property ([MS-OXPROPS] section 2.709) specifies the generation suffix of the
    /// contact, such as "Jr.", "Sr.", or "III". This property is optional.
    var generation: String? {
        return getProperty(id: .tagGeneration)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.3 PidTagDisplayNamePrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayNamePrefix property ([MS-OXPROPS] section 2.673) specifies the title of the
    /// contact, such as "Mr." or "Mrs.". This property is optional.
    var displayNamePrefix: String? {
        return getProperty(id: .tagDisplayNamePrefix)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.5 PidTagMiddleName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMiddleName property ([MS-OXPROPS] section 2.798) specifies the middle name(s) of the
    /// contact. This property is optional.
    var middleName: String? {
        return getProperty(id: .tagMiddleName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.9 PidLidYomiFirstName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidYomiFirstName property ([MS-OXPROPS] section 2.365) specifies the phonetic
    /// pronunciation of the contact's given name. This property is optional.
    var yomiFirstName: String? {
        return getProperty(name: .lidYomiFirstName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.10 PidLidYomiLastName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidYomiLastName property ([MS-OXPROPS] section 2.366) specifies the phonetic
    /// pronunciation of the contact's surname. This property is optional.
    var yomiLastName: String? {
        return getProperty(name: .lidYomiLastName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.11 PidLidFileUnder Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFileUnder property ([MS-OXPROPS] section 2.133) specifies the name under which to file
    /// this contact when displaying a list of contacts. The client SHOULD treat this property as an empty
    /// string if it is missing from the Contact object. This property is optional.
    var fileUnder: String? {
        return getProperty(name: .lidFileUnder)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.12 PidLidFileUnderId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFileUnderId property ([MS-OXPROPS] section 2.134) specifies how to format the value of
    /// the PidLidFileUnder property (section 2.2.1.1.11) by using the values of other Contact Name
    /// properties.
    /// The valid values of The PidLidFileUnderId property are shown in the following table. If the
    /// PidLidFileUnderId property is either missing or set to a value that is not valid, the client can choose
    /// its own logic to format the value of the PidLidFileUnder property (section 2.2.1.1.11) as other
    /// Contact Name properties change.
    /// In the following table, the notation <PropertyName> is used to represent the value of the property
    /// specified by PropertyName. For example, if the value of the PidTagGivenName property (section
    /// 2.2.1.1.6) is "Ben", then "<PidTagGivenName>" specifies the string "Ben". Other notation: "\r"
    /// specifies a carriage return character, "\n" specifies a line feed character, and <space> represents a
    /// space character. The table shows the format of the PidLidFileUnder property when all of the Contact
    /// Name properties are present. If a Contact Name property is not present, the separator characters
    /// surrounding it can be removed by the client.
    /// Value of the PidLidFileUnderId | property Format of the PidLidFileUnder property
    /// 0x00000000 Empty string.
    /// 0x00003001 "<PidTagDisplayName>"
    /// 0x00003A06 "<PidTagGivenName>"
    /// 0x00003A11 "<PidTagSurname>"
    /// 0x00003A16 "<PidTagCompanyName>"
    /// 0x00008017 "<PidTagSurname>,<space><PidTagGivenName><space><PidTagMiddleName>"
    /// 0x00008018 "<PidTagCompanyName>\r\n<PidTagSurname>,<space><PidTagGivenName><space>
    /// < PidTagMiddleName >"
    /// 0x00008019 "<PidTagSurname>,<space><PidTagGivenName><space><PidTagMiddleName>\r\n<P
    /// idTagCompanyName>"
    /// 0x00008030 "<PidTagSurname>< PidTagGivenName ><space>< PidTagMiddleName >"
    /// 0x00008031 "<PidTagSurname><space><PidTagGivenName><space>< PidTagMiddleName >"
    /// 0x00008032 "<PidTagCompanyName>\r\n<PidTagSurname><PidTagGivenName><space><PidTag
    /// MiddleName>"
    /// 0x00008033 "<PidTagCompanyName>\r\n<PidTagSurname><space><PidTagGivenName><space>
    /// <PidTagMiddleName>"
    /// 0x00008034 "<PidTagSurname><PidTagGivenName><space>< PidTagMiddleName
    /// >\r\n<PidTagCompanyName>"
    /// 0x00008035 "<PidTagSurname><space><PidTagGivenName><space><PidTagMiddleName>\r\n<Pi
    /// dTagCompanyName>"
    /// 0x00008036 "<PidTagSurname><space><PidTagGivenName><space><PidTagMiddleName><space
    /// ><PidTagGeneration>"
    /// 0x00008037 "<PidTagGivenName><space><PidTagMiddleName><space><PidTagSurname><space
    /// ><PidTagGeneration>"
    /// 0x00008038 "<PidTagSurname><PidTagGivenName><space><PidTagMiddleName><space><PidTa
    /// gGeneration>"
    /// 0xFFFFFFFD The client or server uses the current value of the PidLidFileUnder property and other contact
    /// properties to find a best match to one of the previous values in this table.
    /// 0xFFFFFFFE The client or server chooses the default values based on the implementation.
    /// 0xFFFFFFFF The value of the PidLidFileUnder property is a user-provided string. In this case, the value of
    /// the PidLidFileUnder property is not changed when the value of another Contact Name
    /// property changes.
    var fileUnderId: UInt32? {
        return getProperty(name: .lidFileUnderId)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.13 PidLidFileUnderList Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFileUnderList property ([MS-OXPROPS] section 2.135) specifies a list of possible values
    /// for the PidLidFileUnderId property (section 2.2.1.1.12). Each value in this multivalue property
    /// MUST be one of the allowed values for the PidLidFileUnderId property. The PidLidFileUnderList
    /// property is set by the client, but it is never used by either the client or the server. This property is
    /// optional.
    var fileUnderList: [UInt32]? {
        return getProperty(name: .lidFileUnderList)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.1 PidLidEmail1DisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1DisplayName ([MS-OXPROPS] section 2.102), PidLidEmail2DisplayName ([MS-OXPROPS]
    /// section 2.107), and PidLidEmail3DisplayName ([MS-OXPROPS] section 2.112) properties specify the userreadable display name for the email address of the contact.
    var email1DisplayName: String? {
        return getProperty(name: .lidEmail1DisplayName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.1 PidLidEmail2DisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1DisplayName ([MS-OXPROPS] section 2.102), PidLidEmail2DisplayName ([MS-OXPROPS]
    /// section 2.107), and PidLidEmail3DisplayName ([MS-OXPROPS] section 2.112) properties specify the userreadable display name for the email address of the contact.
    var email2DisplayName: String? {
        return getProperty(name: .lidEmail2DisplayName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.1 PidLidEmail3DisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1DisplayName ([MS-OXPROPS] section 2.102), PidLidEmail2DisplayName ([MS-OXPROPS]
    /// section 2.107), and PidLidEmail3DisplayName ([MS-OXPROPS] section 2.112) properties specify the userreadable display name for the email address of the contact.
    var email3DisplayName: String? {
        return getProperty(name: .lidEmail3DisplayName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.2 PidLidEmail1AddressType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1AddressType ([MS-OXPROPS] section 2.101), PidLidEmail2AddressType ([MSOXPROPS] section 2.106), and PidLidEmail3AddressType ([MS-OXPROPS] section 2.111) properties
    /// specify the address type of the electronic address for the contact. If one of these properties is
    /// present, the property value MUST be a valid address type. The RopGetAddressTypes remote
    /// operation (ROP) ([MS-OXCROPS] section 2.2.7.3) can be used to get a list of the valid address
    /// types; a third-party-defined address type is also valid. Address types commonly used by the client and
    /// server are "SMTP" and "EX".
    var email1AddressType: String? {
        return getProperty(name: .lidEmail1AddressType)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.2 PidLidEmail2AddressType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1AddressType ([MS-OXPROPS] section 2.101), PidLidEmail2AddressType ([MSOXPROPS] section 2.106), and PidLidEmail3AddressType ([MS-OXPROPS] section 2.111) properties
    /// specify the address type of the electronic address for the contact. If one of these properties is
    /// present, the property value MUST be a valid address type. The RopGetAddressTypes remote
    /// operation (ROP) ([MS-OXCROPS] section 2.2.7.3) can be used to get a list of the valid address
    /// types; a third-party-defined address type is also valid. Address types commonly used by the client and
    /// server are "SMTP" and "EX".
    var email2AddressType: String? {
        return getProperty(name: .lidEmail2AddressType)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.2 PidLidEmail3AddressType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1AddressType ([MS-OXPROPS] section 2.101), PidLidEmail2AddressType ([MSOXPROPS] section 2.106), and PidLidEmail3AddressType ([MS-OXPROPS] section 2.111) properties
    /// specify the address type of the electronic address for the contact. If one of these properties is
    /// present, the property value MUST be a valid address type. The RopGetAddressTypes remote
    /// operation (ROP) ([MS-OXCROPS] section 2.2.7.3) can be used to get a list of the valid address
    /// types; a third-party-defined address type is also valid. Address types commonly used by the client and
    /// server are "SMTP" and "EX".
    var email3AddressType: String? {
        return getProperty(name: .lidEmail3AddressType)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.3 PidLidEmail1EmailAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1EmailAddress ([MS-OXPROPS] section 2.103), PidLidEmail2EmailAddress
    /// ([MS-OXPROPS] section 2.108), and PidLidEmail3EmailAddress ([MS-OXPROPS] section 2.113)
    /// properties specify the email address of the contact. The format of an email address is determined
    /// by its address type. Therefore, the values of these properties MUST conform to the address types
    /// specified for these email addresses. Address types are specified by the PidLidEmail1AddressType
    /// (section 2.2.1.2.2), PidLidEmail2AddressType (section 2.2.1.2.2), and PidLidEmail3AddressType
    /// (section 2.2.1.2.2) properties. The client and server commonly use the "SMTP" and "EX" address
    /// types. The format of an "SMTP" email address is specified in [RFC5321]; the format of an "EX" email
    /// address is specified in [RFC2247].
    /// The address type is intended to provide an avenue for various third-party delivery mechanisms to
    /// define their own email address format. A Contact object merely stores the address type and the
    /// email address; the address type and the email address have no special meaning in the context of this
    /// protocol.
    var email1EmailAddress: String? {
        return getProperty(name: .lidEmail1EmailAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.3 PidLidEmail2EmailAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1EmailAddress ([MS-OXPROPS] section 2.103), PidLidEmail2EmailAddress
    /// ([MS-OXPROPS] section 2.108), and PidLidEmail3EmailAddress ([MS-OXPROPS] section 2.113)
    /// properties specify the email address of the contact. The format of an email address is determined
    /// by its address type. Therefore, the values of these properties MUST conform to the address types
    /// specified for these email addresses. Address types are specified by the PidLidEmail1AddressType
    /// (section 2.2.1.2.2), PidLidEmail2AddressType (section 2.2.1.2.2), and PidLidEmail3AddressType
    /// (section 2.2.1.2.2) properties. The client and server commonly use the "SMTP" and "EX" address
    /// types. The format of an "SMTP" email address is specified in [RFC5321]; the format of an "EX" email
    /// address is specified in [RFC2247].
    /// The address type is intended to provide an avenue for various third-party delivery mechanisms to
    /// define their own email address format. A Contact object merely stores the address type and the
    /// email address; the address type and the email address have no special meaning in the context of this
    /// protocol.
    var email2EmailAddress: String? {
        return getProperty(name: .lidEmail2EmailAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.3 PidLidEmail3EmailAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1EmailAddress ([MS-OXPROPS] section 2.103), PidLidEmail2EmailAddress
    /// ([MS-OXPROPS] section 2.108), and PidLidEmail3EmailAddress ([MS-OXPROPS] section 2.113)
    /// properties specify the email address of the contact. The format of an email address is determined
    /// by its address type. Therefore, the values of these properties MUST conform to the address types
    /// specified for these email addresses. Address types are specified by the PidLidEmail1AddressType
    /// (section 2.2.1.2.2), PidLidEmail2AddressType (section 2.2.1.2.2), and PidLidEmail3AddressType
    /// (section 2.2.1.2.2) properties. The client and server commonly use the "SMTP" and "EX" address
    /// types. The format of an "SMTP" email address is specified in [RFC5321]; the format of an "EX" email
    /// address is specified in [RFC2247].
    /// The address type is intended to provide an avenue for various third-party delivery mechanisms to
    /// define their own email address format. A Contact object merely stores the address type and the
    /// email address; the address type and the email address have no special meaning in the context of this
    /// protocol.
    var email3EmailAddress: String? {
        return getProperty(name: .lidEmail3EmailAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.4 PidLidEmail1OriginalDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1OriginalDisplayName ([MS-OXPROPS] section 2.104),
    /// PidLidEmail2OriginalDisplayName ([MS-OXPROPS] section 2.109), and
    /// PidLidEmail3OriginalDisplayName ([MS-OXPROPS] section 2.114) properties specify the Simple
    /// Mail Transfer Protocol (SMTP) email address corresponding to the email address specified in
    /// section 2.2.1.2.3 for the Contact object. If the value of the PidLidEmail1AddressType (section
    /// 2.2.1.2.2), PidLidEmail2AddressType (section 2.2.1.2.2), or PidLidEmail3AddressType (section
    /// 2.2.1.2.2) property is "SMTP", then the value of the respective PidLidEmail1OriginalDisplayName,
    /// PidLidEmail2OriginalDisplayName, or PidLidEmail3OriginalDisplayName property SHOULD
    /// equal the value of the respective PidLidEmail1EmailAddress (section 2.2.1.2.3),
    /// PidLidEmail2EmailAddress (section 2.2.1.2.3), or PidLidEmail3EmailAddress (section 2.2.1.2.3)
    /// property; otherwise, the values do not have to be equal. The purpose of the
    /// PidLidEmail1OriginalDisplayName, PidLidEmail2OriginalDisplayName, and
    /// PidLidEmail3OriginalDisplayName properties is to display an alternative user-friendly address that
    /// is equivalent to the one in the PidLidEmail1EmailAddress, PidLidEmail2EmailAddress, or
    /// PidLidEmail3EmailAddress property.
    var email1OriginalDisplayName: String? {
        return getProperty(name: .lidEmail1OriginalDisplayName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.4 PidLidEmail2OriginalDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1OriginalDisplayName ([MS-OXPROPS] section 2.104),
    /// PidLidEmail2OriginalDisplayName ([MS-OXPROPS] section 2.109), and
    /// PidLidEmail3OriginalDisplayName ([MS-OXPROPS] section 2.114) properties specify the Simple
    /// Mail Transfer Protocol (SMTP) email address corresponding to the email address specified in
    /// section 2.2.1.2.3 for the Contact object. If the value of the PidLidEmail1AddressType (section
    /// 2.2.1.2.2), PidLidEmail2AddressType (section 2.2.1.2.2), or PidLidEmail3AddressType (section
    /// 2.2.1.2.2) property is "SMTP", then the value of the respective PidLidEmail1OriginalDisplayName,
    /// PidLidEmail2OriginalDisplayName, or PidLidEmail3OriginalDisplayName property SHOULD
    /// equal the value of the respective PidLidEmail1EmailAddress (section 2.2.1.2.3),
    /// PidLidEmail2EmailAddress (section 2.2.1.2.3), or PidLidEmail3EmailAddress (section 2.2.1.2.3)
    /// property; otherwise, the values do not have to be equal. The purpose of the
    /// PidLidEmail1OriginalDisplayName, PidLidEmail2OriginalDisplayName, and
    /// PidLidEmail3OriginalDisplayName properties is to display an alternative user-friendly address that
    /// is equivalent to the one in the PidLidEmail1EmailAddress, PidLidEmail2EmailAddress, or
    /// PidLidEmail3EmailAddress property.
    var email2OriginalDisplayName: String? {
        return getProperty(name: .lidEmail2OriginalDisplayName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.2.4 PidLidEmail3OriginalDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1OriginalDisplayName ([MS-OXPROPS] section 2.104),
    /// PidLidEmail2OriginalDisplayName ([MS-OXPROPS] section 2.109), and
    /// PidLidEmail3OriginalDisplayName ([MS-OXPROPS] section 2.114) properties specify the Simple
    /// Mail Transfer Protocol (SMTP) email address corresponding to the email address specified in
    /// section 2.2.1.2.3 for the Contact object. If the value of the PidLidEmail1AddressType (section
    /// 2.2.1.2.2), PidLidEmail2AddressType (section 2.2.1.2.2), or PidLidEmail3AddressType (section
    /// 2.2.1.2.2) property is "SMTP", then the value of the respective PidLidEmail1OriginalDisplayName,
    /// PidLidEmail2OriginalDisplayName, or PidLidEmail3OriginalDisplayName property SHOULD
    /// equal the value of the respective PidLidEmail1EmailAddress (section 2.2.1.2.3),
    /// PidLidEmail2EmailAddress (section 2.2.1.2.3), or PidLidEmail3EmailAddress (section 2.2.1.2.3)
    /// property; otherwise, the values do not have to be equal. The purpose of the
    /// PidLidEmail1OriginalDisplayName, PidLidEmail2OriginalDisplayName, and
    /// PidLidEmail3OriginalDisplayName properties is to display an alternative user-friendly address that
    /// is equivalent to the one in the PidLidEmail1EmailAddress, PidLidEmail2EmailAddress, or
    /// PidLidEmail3EmailAddress property.
    var email3OriginalDisplayName: String? {
        return getProperty(name: .lidEmail3OriginalDisplayName)
    }

    /// [MS-OXOCNCT] 2.2.1.2.5 PidLidEmail1OriginalEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1OriginalEntryId ([MS-OXPROPS] section 2.105), PidLidEmail2OriginalEntryId
    /// ([MS-OXPROPS] section 2.110) and PidLidEmail3OriginalEntryId ([MS-OXPROPS] section 2.115)
    /// properties specify the EntryID of the object corresponding to this electronic address. It MUST be
    /// either a one-off EntryID for this electronic address or a valid Address Book object EntryID.
    var email1OriginalEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidEmail1OriginalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// [MS-OXOCNCT] 2.2.1.2.5 PidLidEmail2OriginalEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1OriginalEntryId ([MS-OXPROPS] section 2.105), PidLidEmail2OriginalEntryId
    /// ([MS-OXPROPS] section 2.110) and PidLidEmail3OriginalEntryId ([MS-OXPROPS] section 2.115)
    /// properties specify the EntryID of the object corresponding to this electronic address. It MUST be
    /// either a one-off EntryID for this electronic address or a valid Address Book object EntryID.
    var email2OriginalEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidEmail2OriginalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// [MS-OXOCNCT] 2.2.1.2.5 PidLidEmail3OriginalEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidEmail1OriginalEntryId ([MS-OXPROPS] section 2.105), PidLidEmail2OriginalEntryId
    /// ([MS-OXPROPS] section 2.110) and PidLidEmail3OriginalEntryId ([MS-OXPROPS] section 2.115)
    /// properties specify the EntryID of the object corresponding to this electronic address. It MUST be
    /// either a one-off EntryID for this electronic address or a valid Address Book object EntryID.
    var email3OriginalEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidEmail3OriginalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.6 PidTagBusinessFaxNumber
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPrimaryFaxNumber property ([MS-OXOABK] section 2.2.4.29),
    /// PidTagBusinessFaxNumber property ([MS-OXOCNTC] section 2.2.1.2.6), and
    /// PidTagHomeFaxNumber property ([MS-OXOCNTC] section 2.2.1.2.6) properties specify the fax
    /// number for the contact. The string MUST NOT be longer than 255 characters, not including the
    /// terminating null character. There are no other restrictions on the format of these properties.
    var businessFaxNumber: String? {
        return getProperty(id: .tagBusinessFaxNumber)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.6 PidTagHomeFaxNumber
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPrimaryFaxNumber property ([MS-OXOABK] section 2.2.4.29),
    /// PidTagBusinessFaxNumber property ([MS-OXOCNTC] section 2.2.1.2.6), and
    /// PidTagHomeFaxNumber property ([MS-OXOCNTC] section 2.2.1.2.6) properties specify the fax
    /// number for the contact. The string MUST NOT be longer than 255 characters, not including the
    /// terminating null character. There are no other restrictions on the format of these properties.
    var homeFaxNumber: String? {
        return getProperty(id: .tagHomeFaxNumber)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.7 PidLidFax1AddressType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1AddressType property ([MS-OXOCNTC] section 2.2.1.2.7),
    /// PidLidFax2AddressType property ([MS-OXOCNTC] section 2.2.1.2.7), and
    /// PidLidFax3AddressType property ([MS-OXOCNTC] section 2.2.1.2.7) properties specify the
    /// address type of the electronic address for the contact. These properties, if present, MUST be set to
    /// "FAX".
    var fax1AddressType: String? {
        return getProperty(name: .lidFax1AddressType)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.7 PidLidFax2AddressType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1AddressType property ([MS-OXOCNTC] section 2.2.1.2.7),
    /// PidLidFax2AddressType property ([MS-OXOCNTC] section 2.2.1.2.7), and
    /// PidLidFax3AddressType property ([MS-OXOCNTC] section 2.2.1.2.7) properties specify the
    /// address type of the electronic address for the contact. These properties, if present, MUST be set to
    /// "FAX".
    var fax2AddressType: String? {
        return getProperty(name: .lidFax2AddressType)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.7 PidLidFax3AddressType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1AddressType property ([MS-OXOCNTC] section 2.2.1.2.7),
    /// PidLidFax2AddressType property ([MS-OXOCNTC] section 2.2.1.2.7), and
    /// PidLidFax3AddressType property ([MS-OXOCNTC] section 2.2.1.2.7) properties specify the
    /// address type of the electronic address for the contact. These properties, if present, MUST be set to
    /// "FAX".
    var fax3AddressType: String? {
        return getProperty(name: .lidFax3AddressType)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.8 PidLidFax1EmailAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8),
    /// PidLidFax2EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8), and
    /// PidLidFax3EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8) properties specify a userfriendly combination of the display name and the corresponding fax number for the contact. These
    /// properties, if present, SHOULD each contain a user-readable display name, followed by the "@"
    /// character, followed by a fax number.
    var fax1EmailAddress: String? {
        return getProperty(name: .lidFax1EmailAddress)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.8 PidLidFax2EmailAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8),
    /// PidLidFax2EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8), and
    /// PidLidFax3EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8) properties specify a userfriendly combination of the display name and the corresponding fax number for the contact. These
    /// properties, if present, SHOULD each contain a user-readable display name, followed by the "@"
    /// character, followed by a fax number.
    var fax2EmailAddress: String? {
        return getProperty(name: .lidFax2EmailAddress)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.8 PidLidFax3EmailAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8),
    /// PidLidFax2EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8), and
    /// PidLidFax3EmailAddress property ([MS-OXOCNTC] section 2.2.1.2.8) properties specify a userfriendly combination of the display name and the corresponding fax number for the contact. These
    /// properties, if present, SHOULD each contain a user-readable display name, followed by the "@"
    /// character, followed by a fax number.
    var fax3EmailAddress: String? {
        return getProperty(name: .lidFax3EmailAddress)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.9 PidLidFax1OriginalDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9)
    /// PidLidFax2OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9 ), and
    /// PidLidFax3OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9) properties specify the
    /// normalized subject for the contact. These properties, if present, MUST each be set to the same value
    /// as PidTagNormalizedSubject ([MS-OXCMSG] section 2.2.1.10), as specified in section 2.2.1.11.1.
    var fax1OriginalDisplayName: String? {
        return getProperty(name: .lidFax1OriginalDisplayName)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.9 PidLidFax2OriginalDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9)
    /// PidLidFax2OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9 ), and
    /// PidLidFax3OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9) properties specify the
    /// normalized subject for the contact. These properties, if present, MUST each be set to the same value
    /// as PidTagNormalizedSubject ([MS-OXCMSG] section 2.2.1.10), as specified in section 2.2.1.11.1.
    var fax2OriginalDisplayName: String? {
        return getProperty(name: .lidFax2OriginalDisplayName)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.9 PidLidFax3OriginalDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9)
    /// PidLidFax2OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9 ), and
    /// PidLidFax3OriginalDisplayName property ([MS-OXOCNTC] section 2.2.1.2.9) properties specify the
    /// normalized subject for the contact. These properties, if present, MUST each be set to the same value
    /// as PidTagNormalizedSubject ([MS-OXCMSG] section 2.2.1.10), as specified in section 2.2.1.11.1.
    var fax3OriginalDisplayName: String? {
        return getProperty(name: .lidFax3OriginalDisplayName)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.10 PidLidFax1OriginalEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10),
    /// PidLidFax2OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10), and
    /// PidLidFax3OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10) properties specify the
    /// one-off EntryID corresponding to this fax address.
    var fax1OriginalEntryId: OneOffEntryID? {
        guard let data: Data = getProperty(name: .lidFax1OriginalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? OneOffEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.10 PidLidFax2OriginalEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10),
    /// PidLidFax2OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10), and
    /// PidLidFax3OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10) properties specify the
    /// one-off EntryID corresponding to this fax address.
    var fax2OriginalEntryId: OneOffEntryID? {
        guard let data: Data = getProperty(name: .lidFax2OriginalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? OneOffEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOCNCT] 2.2.1.2.10 PidLidFax3OriginalEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFax1OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10),
    /// PidLidFax2OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10), and
    /// PidLidFax3OriginalEntryId property ([MS-OXOCNTC] section 2.2.1.2.10) properties specify the
    /// one-off EntryID corresponding to this fax address.
    var fax3OriginalEntryId: OneOffEntryID? {
        guard let data: Data = getProperty(name: .lidFax3OriginalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? OneOffEntryID(dataStream: &dataStream)
    }
    
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
    var addressBookProviderEmailList: [AddressBookProviderEmailList]? {
        guard let rawValues: [UInt32] = getProperty(name: .lidAddressBookProviderEmailList) else {
            return nil
        }
        
        return rawValues.compactMap(AddressBookProviderEmailList.init)
    }
    
    /// [MS-OXOCNCTC] 2.2.1.2.12 PidLidAddressBookProviderArrayType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAddressBookProviderArrayType property ([MS-OXPROPS] section 2.1) specifies the
    /// state of the contact's electronic addresses and represents a set of bit flags. The value of the
    /// PidLidAddressBookProviderArrayType property MUST be a combination of flags that specify the
    /// state of the Contact object. Individual flags are specified in the following table. If this property is set,
    /// the PidLidAddressBookProviderEmailList property (section 2.2.1.2.11) MUST be set as well. These
    /// two properties MUST be kept in sync with each other.
    /// For example, if this property has the bit 0x00000001 set, then one of the values of the
    /// PidLidAddressBookProviderEmailList property would be 0x00000000.
    var addressBookProviderArrayType: AddressBookProviderArrayType? {
        guard let rawValue: UInt32 = getProperty(name: .lidAddressBookProviderArrayType) else {
            return nil
        }
        
        return AddressBookProviderArrayType(rawValue: rawValue)
    }
    
    /// [MS-OXOCNCTC] 2.2.1.3.1 PidLidWorkAddressStreet
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressStreet ([MS-OXPROPS] section 2.362), PidTagHomeAddressStreet ([MSOXOABK] section 2.2.4.20), PidTagOtherAddressStreet ([MS-OXPROPS] section 2.849), and
    /// PidTagStreetAddress ([MS-OXOABK] section 2.2.4.14) properties specify the street portion of the
    /// contact's Work, Home, Other, or Mailing Address. These properties can also be used to store the post
    /// office box part of the address, if it exists.
    var workAddressStreet: String? {
        return getProperty(name: .lidWorkAddressStreet)
    }
    
    /// [MS-OXOCNCTC] 2.2.1.3.1 PidTagOtherAddressStreet
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressStreet ([MS-OXPROPS] section 2.362), PidTagHomeAddressStreet ([MSOXOABK] section 2.2.4.20), PidTagOtherAddressStreet ([MS-OXPROPS] section 2.849), and
    /// PidTagStreetAddress ([MS-OXOABK] section 2.2.4.14) properties specify the street portion of the
    /// contact's Work, Home, Other, or Mailing Address. These properties can also be used to store the post
    /// office box part of the address, if it exists.
    var otherAddressStreet: String? {
        return getProperty(id: .tagOtherAddressStreet)
    }
    
    /// [MS-OXOCNCTC] 2.2.1.3.2 PidLidWorkAddressCity
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCity ([MS-OXPROPS] section 2.356), PidTagHomeAddressCity ([MSOXPROPS] section 2.721), PidTagOtherAddressCity ([MS-OXPROPS] section 2.844), and
    /// PidTagLocality ([MS-OXOABK] section 2.2.4.16) properties specify the city or locality portion of the
    /// contact's Work, Home, Other, or Mailing Address.
    var workAddressCity: String? {
        return getProperty(name: .lidWorkAddressCity)
    }
    
    /// [MS-OXOCNCTC] 2.2.1.3.2 PidTagHomeAddressCity,
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCity ([MS-OXPROPS] section 2.356), PidTagHomeAddressCity ([MSOXPROPS] section 2.721), PidTagOtherAddressCity ([MS-OXPROPS] section 2.844), and
    /// PidTagLocality ([MS-OXOABK] section 2.2.4.16) properties specify the city or locality portion of the
    /// contact's Work, Home, Other, or Mailing Address.
    var homeAddressCity: String? {
        return getProperty(id: .tagHomeAddressCity)
    }
    
    /// [MS-OXOCNCTC] 2.2.1.3.2 PidTagOtherAddressCity,
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCity ([MS-OXPROPS] section 2.356), PidTagHomeAddressCity ([MSOXPROPS] section 2.721), PidTagOtherAddressCity ([MS-OXPROPS] section 2.844), and
    /// PidTagLocality ([MS-OXOABK] section 2.2.4.16) properties specify the city or locality portion of the
    /// contact's Work, Home, Other, or Mailing Address.
    var otherAddressCity: String? {
        return getProperty(id: .tagOtherAddressCity)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.3 PidLidWorkAddressState
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressState ([MS-OXPROPS] section 2.361),
    /// PidTagHomeAddressStateOrProvince ([MS-OXPROPS] section 2.725),
    /// PidTagOtherAddressStateOrProvince ([MS-OXPROPS] section 2.848), and
    /// PidTagStateOrProvince [MS-OXOABK] section 2.2.4.17) properties specify the state or province
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var workAddressState: String? {
        return getProperty(name: .lidWorkAddressState)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.3 PidTagHomeAddressStateOrProvince
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressState ([MS-OXPROPS] section 2.361),
    /// PidTagHomeAddressStateOrProvince ([MS-OXPROPS] section 2.725),
    /// PidTagOtherAddressStateOrProvince ([MS-OXPROPS] section 2.848), and
    /// PidTagStateOrProvince [MS-OXOABK] section 2.2.4.17) properties specify the state or province
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var homeAddressStateOrProvince: String? {
        return getProperty(id: .tagHomeAddressStateOrProvince)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.3 PidTagOtherAddressStateOrProvince
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressState ([MS-OXPROPS] section 2.361),
    /// PidTagHomeAddressStateOrProvince ([MS-OXPROPS] section 2.725),
    /// PidTagOtherAddressStateOrProvince ([MS-OXPROPS] section 2.848), and
    /// PidTagStateOrProvince [MS-OXOABK] section 2.2.4.17) properties specify the state or province
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var otherAddressStateOrProvince: String? {
        return getProperty(id: .tagOtherAddressStateOrProvince)
    }
    
    /// [MS-OXOCNTC] 2.1.3.4 PidLidWorkAddressPostalCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostalCode ([MS-OXPROPS] section 2.359),
    /// PidTagHomeAddressPostalCode ([MS-OXPROPS] section 2.723),
    /// PidTagOtherAddressPostalCode ([MS-OXPROPS] section 2.846), and PidTagPostalCode ([MSOXOABK] section 2.2.4.18) properties specify the postal code (ZIP code) portion of the contact's
    /// Work, Home, Other, or Mailing Address.
    var workAddressPostalCode: String? {
        return getProperty(name: .lidWorkAddressPostalCode)
    }
    
    /// [MS-OXOCNTC] 2.1.3.4 PidTagHomeAddressPostalCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostalCode ([MS-OXPROPS] section 2.359),
    /// PidTagHomeAddressPostalCode ([MS-OXPROPS] section 2.723),
    /// PidTagOtherAddressPostalCode ([MS-OXPROPS] section 2.846), and PidTagPostalCode ([MSOXOABK] section 2.2.4.18) properties specify the postal code (ZIP code) portion of the contact's
    /// Work, Home, Other, or Mailing Address.
    var homeAddressPostalCode: String? {
        return getProperty(id: .tagHomeAddressPostalCode)
    }
    
    /// [MS-OXOCNTC] 2.1.3.4 PidTagOtherAddressPostalCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostalCode ([MS-OXPROPS] section 2.359),
    /// PidTagHomeAddressPostalCode ([MS-OXPROPS] section 2.723),
    /// PidTagOtherAddressPostalCode ([MS-OXPROPS] section 2.846), and PidTagPostalCode ([MSOXOABK] section 2.2.4.18) properties specify the postal code (ZIP code) portion of the contact's
    /// Work, Home, Other, or Mailing Address.
    var otherAddressPostalCode: String? {
        return getProperty(id: .tagOtherAddressPostalCode)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.5 PidLidWorkAddressCountry
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountry ([MS-OXPROPS] section 2.357), PidTagHomeAddressCountry
    /// ([MS-OXPROPS] section 2.722), PidTagOtherAddressCountry ([MS-OXPROPS] section 2.845), and
    /// PidTagCountry ([MS-OXOABK] section 2.2.4.19) properties specify the country or region portion of
    /// the contact's Work, Home, Other, or Mailing Address.
    var workAddressCountry: String? {
        return getProperty(name: .lidWorkAddressCountry)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.5 PidTagHomeAddressCountry
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountry ([MS-OXPROPS] section 2.357), PidTagHomeAddressCountry
    /// ([MS-OXPROPS] section 2.722), PidTagOtherAddressCountry ([MS-OXPROPS] section 2.845), and
    /// PidTagCountry ([MS-OXOABK] section 2.2.4.19) properties specify the country or region portion of
    /// the contact's Work, Home, Other, or Mailing Address.
    var homeAddressCountry: String? {
        return getProperty(id: .tagHomeAddressCountry)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.5 PidTagOtherAddressCountry
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountry ([MS-OXPROPS] section 2.357), PidTagHomeAddressCountry
    /// ([MS-OXPROPS] section 2.722), PidTagOtherAddressCountry ([MS-OXPROPS] section 2.845), and
    /// PidTagCountry ([MS-OXOABK] section 2.2.4.19) properties specify the country or region portion of
    /// the contact's Work, Home, Other, or Mailing Address.
    var otherAddressCountry: String? {
        return getProperty(id: .tagOtherAddressCountry)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.6 PidLidWorkAddressCountryCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountryCode ([MS-OXPROPS] section 2.358),
    /// PidLidHomeAddressCountryCode ([MS-OXPROPS] section 2.146),
    /// PidLidOtherAddressCountryCode ([MS-OXPROPS] section 2.199), and
    /// PidLidAddressCountryCode ([MS-OXPROPS] section 2.3) properties specify the country/region code
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var workAddressCountryCode: String? {
        return getProperty(name: .lidWorkAddressCountryCode)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.6 PidLidHomeAddressCountryCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountryCode ([MS-OXPROPS] section 2.358),
    /// PidLidHomeAddressCountryCode ([MS-OXPROPS] section 2.146),
    /// PidLidOtherAddressCountryCode ([MS-OXPROPS] section 2.199), and
    /// PidLidAddressCountryCode ([MS-OXPROPS] section 2.3) properties specify the country/region code
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var homeAddressCountryCode: String? {
        return getProperty(name: .lidHomeAddressCountryCode)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.6 PidTagOtherAddressCountryCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountryCode ([MS-OXPROPS] section 2.358),
    /// PidLidHomeAddressCountryCode ([MS-OXPROPS] section 2.146),
    /// PidLidOtherAddressCountryCode ([MS-OXPROPS] section 2.199), and
    /// PidLidAddressCountryCode ([MS-OXPROPS] section 2.3) properties specify the country/region code
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var otherAddressCountryCode: String? {
        return getProperty(name: .lidOtherAddressCountryCode)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.6 PidTagCountryCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountryCode ([MS-OXPROPS] section 2.358),
    /// PidLidHomeAddressCountryCode ([MS-OXPROPS] section 2.146),
    /// PidLidOtherAddressCountryCode ([MS-OXPROPS] section 2.199), and
    /// PidLidAddressCountryCode ([MS-OXPROPS] section 2.3) properties specify the country/region code
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var addressCountryCode: String? {
        return getProperty(name: .lidAddressCountryCode)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.7 PidLidWorkAddressPostOfficeBox
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostOfficeBox ([MS-OXPROPS] section 2.360),
    /// PidTagHomeAddressPostOfficeBox ([MS-OXPROPS] section 2.724),
    /// PidTagOtherAddressPostOfficeBox ([MS-OXPROPS] section 2.847) and PidTagPostOfficeBox
    /// [MS-OXOABK] section 2.2.4.15) properties specify the post office box portion of the contact's Work,
    /// Home, Other, or Mailing Address. The client and the server do not use these properties when
    /// generating the full address or when parsing the full address into components. Instead, they place the
    /// post office box data as part of the street address.
    /// When a property in a physical address group is changed, as specified in section 3.1.5.2, these
    /// properties do not need to be updated.
    var workAddressPostOfficeBox: String? {
        return getProperty(name: .lidWorkAddressPostOfficeBox)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.7 PidTagHomeAddressPostOfficeBox
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostOfficeBox ([MS-OXPROPS] section 2.360),
    /// PidTagHomeAddressPostOfficeBox ([MS-OXPROPS] section 2.724),
    /// PidTagOtherAddressPostOfficeBox ([MS-OXPROPS] section 2.847) and PidTagPostOfficeBox
    /// [MS-OXOABK] section 2.2.4.15) properties specify the post office box portion of the contact's Work,
    /// Home, Other, or Mailing Address. The client and the server do not use these properties when
    /// generating the full address or when parsing the full address into components. Instead, they place the
    /// post office box data as part of the street address.
    /// When a property in a physical address group is changed, as specified in section 3.1.5.2, these
    /// properties do not need to be updated.
    var homeAddressPostOfficeBox: String? {
        return getProperty(id: .tagHomeAddressPostOfficeBox)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.7 PidTagOtherAddressPostOfficeBox
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostOfficeBox ([MS-OXPROPS] section 2.360),
    /// PidTagHomeAddressPostOfficeBox ([MS-OXPROPS] section 2.724),
    /// PidTagOtherAddressPostOfficeBox ([MS-OXPROPS] section 2.847) and PidTagPostOfficeBox
    /// [MS-OXOABK] section 2.2.4.15) properties specify the post office box portion of the contact's Work,
    /// Home, Other, or Mailing Address. The client and the server do not use these properties when
    /// generating the full address or when parsing the full address into components. Instead, they place the
    /// post office box data as part of the street address.
    /// When a property in a physical address group is changed, as specified in section 3.1.5.2, these
    /// properties do not need to be updated.
    var otherAddressPostOfficeBox: String? {
        return getProperty(id: .tagOtherAddressPostOfficeBox)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.8 PidLidWorkAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddress ([MS-OXPROPS] section 2.355), PidLidHomeAddress ([MS-OXPROPS]
    /// section 2.145), PidLidOtherAddress ([MS-OXPROPS] section 2.198), and PidTagPostalAddress
    /// ([MS-OXPROPS] section 2.860) properties specify the complete address of the contact's Work, Home,
    /// Other, or Mailing Address. Each of these properties SHOULD be a combination of other Physical
    /// Address properties and is based on client locale.
    var workAddress: String? {
        return getProperty(name: .lidWorkAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.8 PidLidHomeAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddress ([MS-OXPROPS] section 2.355), PidLidHomeAddress ([MS-OXPROPS]
    /// section 2.145), PidLidOtherAddress ([MS-OXPROPS] section 2.198), and PidTagPostalAddress
    /// ([MS-OXPROPS] section 2.860) properties specify the complete address of the contact's Work, Home,
    /// Other, or Mailing Address. Each of these properties SHOULD be a combination of other Physical
    /// Address properties and is based on client locale.
    var homeAddress: String? {
        return getProperty(name: .lidHomeAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.8 PidLidOtherAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddress ([MS-OXPROPS] section 2.355), PidLidHomeAddress ([MS-OXPROPS]
    /// section 2.145), PidLidOtherAddress ([MS-OXPROPS] section 2.198), and PidTagPostalAddress
    /// ([MS-OXPROPS] section 2.860) properties specify the complete address of the contact's Work, Home,
    /// Other, or Mailing Address. Each of these properties SHOULD be a combination of other Physical
    /// Address properties and is based on client locale.
    var otherAddress: String? {
        return getProperty(name: .lidOtherAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.3.8 PidTagPostalAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddress ([MS-OXPROPS] section 2.355), PidLidHomeAddress ([MS-OXPROPS]
    /// section 2.145), PidLidOtherAddress ([MS-OXPROPS] section 2.198), and PidTagPostalAddress
    /// ([MS-OXPROPS] section 2.860) properties specify the complete address of the contact's Work, Home,
    /// Other, or Mailing Address. Each of these properties SHOULD be a combination of other Physical
    /// Address properties and is based on client locale.
    var postalAddress: String? {
        return getProperty(id: .tagPostalAddress)
    }

    /// [MS-OXOCNTC] 2.2.1.3.9 PidLidPostalAddressId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostalAddressId property ([MS-OXPROPS] section 2.204) specifies which physical
    /// address is the Mailing Address for this contact. If present, the property MUST have one of the values
    /// specified in the following table. If not set, the client SHOULD assume that the value is 0x00000000.
    /// This property is optional.
    var postalAddressId: PostalAddressId? {
        guard let rawValue: UInt32 = getProperty(name: .lidPostalAddressId) else {
            return nil
        }
        
        return PostalAddressId(rawValue: rawValue)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.2 PidTagCallbackTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCallbackTelephoneNumber property ([MS-OXPROPS] section 2.623) specifies the
    /// callback telephone number for the contact.
    var callbackTelephoneNumber: String? {
        return getProperty(id: .tagCallbackTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.8 PidTagRadioTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRadioTelephoneNumber property ([MS-OXPROPS] section 2.873) specifies the radio
    /// telephone number for the contact.
    var radioTelephoneNumber: String? {
        return getProperty(id: .tagRadioTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.9 PidTagCarTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCarTelephoneNumber property ([MS-OXPROPS] section 2.625) specifies the car
    /// telephone number for the contact.
    var carTelephoneNumber: String? {
        return getProperty(id: .tagCarTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.10 PidTagOtherTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOtherTelephoneNumber property ([MS-OXPROPS] section 2.850) specifies an alternate
    /// telephone number for the contact.
    var otherTelephoneNumber: String? {
        return getProperty(id: .tagOtherTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.13 PidTagTelecommunicationsDeviceForDeafTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTelecommunicationsDeviceForDeafTelephoneNumber property ([MS-OXPROPS]
    /// section 2.1036) specifies the telephone number for the contact's text telephone (TTY) or
    /// telecommunication device for the deaf (TDD).
    var telecommunicationsDeviceForDeafTelephoneNumber: String? {
        return getProperty(id: .tagTelecommunicationsDeviceForDeafTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.1.4.14 PidTagCompanyMainTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCompanyMainTelephoneNumber property ([MS-OXPROPS] section 2.634) specifies the
    /// company phone number for the contact.
    var companyMainTelephoneNumber: String? {
        return getProperty(id: .tagCompanyMainTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.16 PidTagIsdnNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIsdnNumber property ([MS-OXPROPS] section 2.752) specifies the Integrated Services
    /// Digital Network (ISDN) number for the contact.
    var isdnNumber: String? {
        return getProperty(id: .tagIsdnNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.5.1 PidTagBirthday Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBirthday property ([MS-OXPROPS] section 2.612) specifies the birthday of the contact,
    /// at 11:59 in Coordinated Universal Time (UTC).
    var birthday: Date? {
        return getProperty(id: .tagBirthday)
    }
    
    /// [MS-OXOCNTC] 2.2.1.5.2 PidLidBirthdayLocal Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidBirthdayLocal property ([MS-OXPROPS] section 2.45) specifies the birthday of the
    /// contact, at 0:00 in the client's local time zone. It is saved without any time zone conversions.
    var birthdayLocal: Date? {
        return getProperty(name: .lidBirthdayLocal)
    }
    
    /// [MS-OXOCNTC] 2.2.1.5.3 PidLidBirthdayEventEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidBirthdayEventEntryId property ([MS-OXPROPS] section 2.44) specifies the object
    /// EntryID of an optional Appointment object that represents the contact's birthday. The
    /// Appointment object specified by the EntryID MUST be linked to this contact by using the
    /// PidLidContactLinkEntry ([MS-OXCMSG] section 2.2.1.57.1), PidLidContactLinkSearchKey ([MSOXCMSG] section 2.2.1.57.4), and PidLidContactLinkName ([MS-OXCMSG] section 2.2.1.57.3)
    /// properties, as specified in [MS-OXCMSG] section 2.2.1.57.
    /// For details about Appointment objects, see [MS-OXOCAL].
    var birthdayEventEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidBirthdayEventEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCNTC] 2.2.1.5.4 PidTagWeddingAnniversary Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWeddingAnniversary property ([MS-OXPROPS] section 2.1058) specifies the wedding
    /// anniversary of the contact, at 11:59 in Coordinated Universal Time (UTC).
    var weddingAnniversary: Date? {
        return getProperty(id: .tagWeddingAnniversary)
    }
    
    /// [MS-OXOCNTC] 2.2.1.5.5 PidLidWeddingAnniversaryLocal Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWeddingAnniversaryLocal property ([MS-OXPROPS] section 2.352) specifies the
    /// wedding anniversary of the contact, at 0:00 in the client's local time zone. It is saved without any
    /// time zone conversions.
    var weddingAnniversaryLocal: Date? {
        return getProperty(name: .lidWeddingAnniversaryLocal)
    }
    
    /// [MS-OXOCNTC] 2.2.1.5.6 PidLidAnniversaryEventEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAnniversaryEventEntryId property ([MS-OXPROPS] section 2.7) specifies the object
    /// EntryID of the Appointment object that represents the contact's anniversary. The Appointment
    /// object specified by the EntryID MUST be linked to this contact by using PidLidContactLinkEntry
    /// ([MS-OXCMSG] section 2.2.1.57.1), PidLidContactLinkSearchKey ([MS-OXCMSG] section
    /// 2.2.1.57.4), and PidLidContactLinkName ([MS-OXCMSG] section 2.2.1.57.3), as specified in [MSOXCMSG] section 2.2.1.57.
    /// For details about Appointment objects, see [MS-OXOCAL].
    var anniversaryEventEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidAnniversaryEventEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCNTC] 2.2.1.6.4 PidTagDepartment Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidDepartment property ([MS-OXPROPS] section 2.94) is not used and MUST be ignored by
    /// the server. The client MUST set this property to an empty string.
    var department: String? {
        return getProperty(name: .lidDepartment)
    }
    
    /// [MS-OXOCNTC] 2.2.1.6.6 PidTagManagerName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagManagerName property ([MS-OXPROPS] section 2.775) specifies the name of the
    /// contact's manager. This property is optional.
    var managerName: String? {
        return getProperty(id: .tagManagerName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.6.8 PidLidYomiCompanyName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidYomiCompanyName property ([MS-OXPROPS] section 2.364) specifies the phonetic
    /// pronunciation of the contact's company name. This property is optional.
    var yomiCompanyName: String? {
        return getProperty(name: .lidYomiCompanyName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.6.9 PidTagProfession Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagProfession property ([MS-OXPROPS] section 2.869) specifies the profession of the
    /// contact. This property is optional.
    var profession: String? {
        return getProperty(id: .tagProfession)
    }
    
    /// [MS-OXOCNTC] 2.2.1.7.1 PidLidBusinessCardDisplayDefinition Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidBusinessCardDisplayDefinition ([MS-OXPROPS] section 2.47) property specifies usercustomization details for displaying a contact as a business card. This property is optional.
    /// The layout of a business card can be represented as an image and a number of text fields. The image
    /// can be either a contact photo, specified in section 2.2.1.8, or a card picture, specified in section
    /// 2.2.1.7.2. Text fields consist of a value from another PtypString property set on the Contact object
    /// and an optional customized label string provided by the user.
    var businessCardDisplayDefinition: BusinessCardDisplayDefinition? {
        guard let data: Data = getProperty(name: .lidBusinessCardDisplayDefinition) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? BusinessCardDisplayDefinition(dataStream: &dataStream)
    }
    
    /// [MS-OXOCNTC] 2.2.1.7.2 PidLidBusinessCardCardPicture Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidBusinessCardCardPicture property ([MS-OXPROPS] section 2.46) contains the image to
    /// be used on a business card, whose value MUST be either a Portable Network Graphics (PNG) or
    /// Joint Photographic Experts Group (JPEG) stream. This property SHOULD be used in conjunction
    /// with the PidLidBusinessCardDisplayDefinition property (section 2.2.1.7.1) as follows: the
    /// PidLidBusinessCardCardPicture property SHOULD NOT be present on a Contact object if the
    /// PidLidBusinessCardDisplayDefinition property is not present. This property also SHOULD NOT be
    /// present if the data in the PidLidBusinessCardDisplayDefinition property does not require a card
    /// image.
    var businessCardCardPicture: Data? {
        return getProperty(name: .lidBusinessCardCardPicture)
    }
    
    /// [MS-OXOCNTC] 2.2.1.7.3 PidLidContactUserField1
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactUserField1 ([MS-OXPROPS] section 2.79). PidLidContactUserField2 ([MSOXPROPS] section 2.80), PidLidContactUserField3 ([MS-OXPROPS] section 2.81), and
    /// PidLidContactUserField4 ([MS-OXPROPS] section 2.82) properties can be used to add custom text
    /// to a business card representation of a Contact object. These properties contain text that is unrelated
    /// to any other contact-specific property. These properties are optional.
    var contactUserField1: String? {
        return getProperty(name: .lidContactUserField1)
    }
    
    /// [MS-OXOCNTC] 2.2.1.4.5 PidTagPrimaryTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPrimaryTelephoneNumber property ([MS-OXPROPS] section 2.866) specifies the
    /// primary telephone number for the contact.
    var primaryTelephoneNumber: String? {
        return getProperty(id: .tagPrimaryTelephoneNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.7.3 PidLidContactUserField2
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactUserField1 ([MS-OXPROPS] section 2.79). PidLidContactUserField2 ([MSOXPROPS] section 2.80), PidLidContactUserField3 ([MS-OXPROPS] section 2.81), and
    /// PidLidContactUserField4 ([MS-OXPROPS] section 2.82) properties can be used to add custom text
    /// to a business card representation of a Contact object. These properties contain text that is unrelated
    /// to any other contact-specific property. These properties are optional.
    var contactUserField2: String? {
        return getProperty(name: .lidContactUserField2)
    }
    
    /// [MS-OXOCNTC] 2.2.1.7.3 PidLidContactUserField3
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactUserField1 ([MS-OXPROPS] section 2.79). PidLidContactUserField2 ([MSOXPROPS] section 2.80), PidLidContactUserField3 ([MS-OXPROPS] section 2.81), and
    /// PidLidContactUserField4 ([MS-OXPROPS] section 2.82) properties can be used to add custom text
    /// to a business card representation of a Contact object. These properties contain text that is unrelated
    /// to any other contact-specific property. These properties are optional.
    var contactUserField3: String? {
        return getProperty(name: .lidContactUserField3)
    }
    
    /// [MS-OXOCNTC] 2.2.1.7.3 PidLidContactUserField4
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactUserField1 ([MS-OXPROPS] section 2.79). PidLidContactUserField2 ([MSOXPROPS] section 2.80), PidLidContactUserField3 ([MS-OXPROPS] section 2.81), and
    /// PidLidContactUserField4 ([MS-OXPROPS] section 2.82) properties can be used to add custom text
    /// to a business card representation of a Contact object. These properties contain text that is unrelated
    /// to any other contact-specific property. These properties are optional.
    var contactUserField4: String? {
        return getProperty(name: .lidContactUserField4)
    }
    
    /// [MS-OXOCNTC] 2.2.1.8.1 PidLidHasPicture Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidHasPicture property ([MS-OXPROPS] section 2.144) indicates whether a contact photo
    /// attachment, specified in section 2.2.1.8.3, exists. If this property is set to nonzero (TRUE), then the
    /// contact photo attachment exists and the client uses it as the contact photo. If this property does not
    /// exist, or exists and is set to zero (FALSE), then there is no contact photo attachment.
    var hasPicture: Bool? {
        return getProperty(name: .lidHasPicture)
    }
    
    /// [MS-OXOCNTC] 2.2.1.8.2 PidTagAttachmentContactPhoto Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachmentContactPhoto property ([MS-OXPROPS] section 2.593) indicates whether an
    /// Attachment object is a contact photo attachment. This property is set to nonzero (TRUE) to identify
    /// the Attachment object as a contact photo attachment. There SHOULD be only one attachment with the
    /// PidTagAttachmentContactPhoto property set to TRUE on a Contact object. If more than one
    /// attachment has this property set to TRUE, the client can use any one of the marked attachments as
    /// the contact photo.
    var attachmentContactPhoto: Bool? {
        return getProperty(id: .tagAttachmentContactPhoto)
    }
    
    /// [MS-OXOCNTC] 2.2.1.9.1 PidLidContactLinkedGlobalAddressListEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkedGlobalAddressListEntryId property ([MS-OXPROPS] section 2.70)
    /// specifies the EntryID of the GAL contact to which the duplicate contact is linked.<6>
    var contactLinkedGlobalAddressListEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidContactLinkedGlobalAddressListEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCNTC] 2.2.1.9.2 PidLidContactLinkGlobalAddressListLinkId Property
    /// Type: PtypGuid ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkGlobalAddressListLinkId property ([MS-OXPROPS] section 2.72) specifies
    /// the GUID of the GAL contact to which the duplicate contact is linked.<7>
    var contactLinkGlobalAddressListLinkId: GUID? {
        return getProperty(name: .lidContactLinkGlobalAddressListLinkId)
    }
    
    /// [MS-OXOCTNTC] 2.2.1.9.3 PidLidContactLinkGlobalAddressListLinkState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkGlobalAddressListLinkState property ([MS-OXPROPS] section 2.73)
    /// specifies the state of the linking between the GAL contact and the duplicate contact.<8>
    /// The valid values for this property are specified in the following table.
    var contactLinkGlobalAddressListLinkState: ContactLinkGlobalAddressListLinkState? {
        guard let rawValue: UInt32 = getProperty(name: .lidContactLinkGlobalAddressListLinkState) else {
            return nil
        }
        
        return ContactLinkGlobalAddressListLinkState(rawValue: rawValue)
    }
    
    /// [MS-OXOCTNTC] 2.2.1.9.4 PidLidContactLinkLinkRejectHistory Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkLinkRejectHistory property ([MS-OXPROPS] section 2.74) contains a list of
    /// any contacts that were previously rejected for linking with the duplicate contact.<9>
    var contactLinkLinkRejectHistory: [Data]? {
        return getProperty(name: .lidContactLinkLinkRejectHistory)
    }
    
    /// [MS-OXOCTNTC] 2.2.1.9.5 PidLidContactLinkSMTPAddressCache Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkSMTPAddressCache property ([MS-OXPROPS] section 2.77) contains a list
    /// of the SMTP addresses that are used by the GAL contact that are linked to the duplicate
    /// contact.<10>
    var contactLinkSMTPAddressCache: [String]? {
        return getProperty(name: .lidContactLinkSMTPAddressCache)
    }
    
    /// [MS-OXOCNTC] 2.2.1.9.6 PidLidIsContactLinked Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidIsContactLinked property ([MS-OXPROPS] section 2.155) specifies whether the contact is
    /// linked to other contacts. The value TRUE indicates that the contact is linked.<11>
    var isContactLinked: Bool? {
        return getProperty(name: .lidIsContactLinked)
    }
    
    /// [MS-OXOCNTC] 2.2.1.9.7 PidTagOscSyncEnabled Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOscSyncEnabled property ([MS-OXPROPS] section 2.843) specifies whether contact
    /// synchronization with an external source (such as a social networking site) is handled by the server.
    /// This property is set on a message that is stored in the contacts folder.<12>
    var oscSyncEnabled: Bool? {
        return getProperty(id: .tagOscSyncEnabled)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.1 PidLidReferenceEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReferenceEntryId property ([MS-OXPROPS] section 2.218) contains a value that is equal  to the value of the EntryID
    /// of the Contact object unless the Contact object is a copy of an earlier original.
    var referenceEntryId: EntryID? {
        guard let data: Data = getProperty(name: .lidReferenceEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.2 PidTagHobbies Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHobbies property ([MS-OXPROPS] section 2.718) specifies the hobbies of the contact.
    /// This property is optional.
    var hobbies: String? {
        return getProperty(id: .tagHobbies)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.3 PidTagSpouseName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSpouseName property ([MS-OXPROPS] section 2.1020) specifies the name of the
    /// contact's spouse/partner. This property is optional.
    var spouseName: String? {
        return getProperty(id: .tagSpouseName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.4 PidTagLanguage Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLanguage property ([MS-OXPROPS] section 2.759) specifies the language that the
    /// contact uses. This property is optional.
    var language: String? {
        return getProperty(id: .tagLanguage)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.5 PidTagLocation Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLocation property ([MS-OXPROPS] section 2.772) specifies the location of the contact.
    /// For example, this could be the building and office number of the contact. This property is optional.
    var location: String? {
        return getProperty(id: .tagLocation)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.6 PidLidInstantMessagingAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidInstantMessagingAddress property ([MS-OXPROPS] section 2.151) specifies the
    /// contact's instant messaging address. This property is optional.
    var instantMessagingAddress: String? {
        return getProperty(name: .lidInstantMessagingAddress)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.7 PidTagOrganizationalIdNumber Property
    /// Type: PtypString
    /// The PidTagOrganizationalIdNumber property ([MS-OXPROPS] section 2.818) specifies an
    /// organizational ID number for the contact, such as an employee ID number. This property is optional.
    var organizationalIdNumber: String? {
        return getProperty(id: .tagOrganizationalIdNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.8 PidTagCustomerId Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCustomerId property ([MS-OXPROPS] section 2.653) specifies the contact's customer
    /// ID number. This property is optional.
    var customerId: String? {
        return getProperty(id: .tagCustomerId)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.9 PidTagGovernmentIdNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagGovernmentIdNumber property ([MS-OXPROPS] section 2.711) specifies the contact's
    /// government ID number. This property is optional.
    var governmentIdNumber: String? {
        return getProperty(id: .tagGovernmentIdNumber)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.10 PidLidFreeBusyLocation Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFreeBusyLocation property ([MS-OXPROPS] section 2.142) specifies a Uniform
    /// Resource Locator (URL) path from which a client can retrieve free/busy status information for the
    /// contact as an iCalendar file, as specified in [MS-OXCICAL]. This property is optional.
    /// [MS-XWDCAL] 2.2.2.3 PidLidFreeBusyLocation
    /// DAV property name: urn:schemas:calendar:fburl
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidFreeBusyLocation property ([MS-OXOCNTC] section 2.2.1.10.10) gets or sets the URL of
    /// the free/busy public folder.
    /// The format of the fburl property is as follows:
    /// fburl = http domain location company group user legacydn [start] [end]
    /// http = "http://" / "https://"
    /// domain = atom ;Server name
    /// atom = 1*atext
    /// atext = ALPHA / DIGIT / "!" / "#" / "$" / "%"
    ///  / "&" / "'" / "*" / "+" / "-" / "/" / "="
    ///  / "?" / "^" / "_" / "`" / "{" / "|" / "}" / "~"
    /// ; Any character except controls, SP, and specials.
    /// ALPHA = %x41-5A / %x61-7A ; A-Z / a-z
    /// DIGIT = %x30-39 ; 0-9
    /// location = "/public/" atom "/non_ipm_subtree/SCHEDULE+ FREE BUSY/EX:"
    /// ;specify the location of the free busy folder as specified in [MS-OXOPFFB] ;section 3.1.4.1.2
    /// company = "/o=" atom ;Specify the /o from the LegacyDN
    /// group = "/ou=" atom ;Specify the /ou from the LegacyDN
    /// user = "USER-/"
    /// legacydn = atom
    /// ;Specify the rest of the LegacyDN after the OU portion
    /// start = "?start" year "-" month "-" day
    /// end = "&end=" year "-" month "-" day
    /// year = 4DIGIT
    /// month = 2DIGIT
    /// day = 2DIGIT
    /// For example:
    /// http://<domain>/public/MAPITLH/non_ipm_subtree/SCHEDULE+ FREE BUSY/EX:/o=<o from legacyDN of
    /// User>/ou=<OU from legacyDN of User>/USER-/<rest of the User's legacyDN after the OU
    /// part>?start1999-01-05&end=1999-01-08
    /// Start and end dates MUST be expressed in the format specified in [ISO-8601]. The end date is
    /// inclusive, so if the start date and the end date are the same, the response will include one day. If the
    /// end date is before the start date, the server MUST return the 400 Bad Request error code, as specified
    /// in [RFC2068] section 10.4.1.
    /// For more details about the PidLidFreeBusyLocation property, see [MS-OXPROPS] section 2.141.
    var freeBusyLocation: String? {
        return getProperty(name: .lidFreeBusyLocation)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.11 PidTagAccount Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAccount property ([MS-OXPROPS] section 2.504) specifies the account name of the
    /// contact. This property is not used by either the client or the server. This property is optional.
    /// [MS-OXOABK] 2.2.3.20 PidTagAccount
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAccount property ([MS-OXOCNTC] section 2.2.1.10.11) contains an Address Book
    /// object's alias, which is an alternative name by which the object can be identified.
    var account: String? {
        return getProperty(id: .tagAccount)
    }

    /// [MS-OXOCNTC] 2.2.1.10.12 PidLidHtml Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidHtml property ([MS-OXPROPS] section 2.147) specifies the contact's business web page
    /// URL. The value of this property, if present, SHOULD be the same as the value of the
    /// PidTagBusinessHomePage property (section 2.2.1.10.14). This property is optional.
    var businessWebPageUrl: String? {
        return getProperty(name: .lidHtml)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.13 PidTagPersonalHomePage Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPersonalHomePage property ([MS-OXPROPS] section 2.858) specifies the contact's
    /// personal web page URL. This property is optional.
    var personalHomePage: String? {
        return getProperty(id: .tagPersonalHomePage)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.14 PidTagBusinessHomePage Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBusinessHomePage property ([MS-OXPROPS] section 2.621) specifies the contact's
    /// business Web page URL. The value of this property, if present, SHOULD be the same as the value of
    /// the PidLidHtml property (section 2.2.1.10.12). This property is optional.
    var businessHomePage: String? {
        return getProperty(id: .tagBusinessHomePage)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.15 PidTagFtpSite Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFtpSite property ([MS-OXPROPS] section 2.706) specifies the contact's File Transfer
    /// Protocol (FTP) URL. FTP is a protocol used to transfer data, as specified in [RFC959]. This property
    /// is optional.
    var ftpSite: String? {
        return getProperty(id: .tagFtpSite)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.16 PidTagComputerNetworkName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// he PidTagComputerNetworkName property ([MS-OXPROPS] section 2.636) specifies the name of
    /// the network to which the contact's computer is connected. This property is not used by either the
    /// client or the server. This property is optional.
    var computerNetworkName: String? {
        return getProperty(id: .tagComputerNetworkName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.17 PidTagChildrensNames Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagChildrensNames property ([MS-OXPROPS] section 2.629) specifies the names of the
    /// contact's children. This property is optional.
    var childrensNames: [String]? {
        return getProperty(id: .tagChildrensNames)
    }

    /// [MS-OXOCNTC] 2.2.1.10.18 PidLidContactCharacterSet Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactCharacterSet property ([MS-OXPROPS] section 2.68) specifies the character set
    /// used for this Contact object.<13> Clients use this property to aid in generating a character-setdependent list of choices for the properties PidLidFileUnder (section 2.2.1.1.11),
    /// PidLidFileUnderList (section 2.2.1.1.13), and PidLidFileUnderId (section 2.2.1.1.12). If the value
    /// of the PidLidContactCharacterSet property is 0x00000000 or 0x00000001, clients SHOULD treat
    /// this property as not being set. For U.S. English, the client sets the value of the
    /// PidLidContactCharacterSet property to 0x00000100, denoting a Western character set. This
    /// property is optional.
    var contactCharacterSet: UInt32? {
        return getProperty(name: .lidContactCharacterSet)
    }

    /// [MS-OXOCNTC] 2.2.1.10.19 PidLidAutoLog Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAutoLog property ([MS-OXPROPS] section 2.40) specifies to the client whether to create a
    /// Journal object for each action associated with this Contact object. This property is optional.
    var autoLog: Bool? {
        return getProperty(name: .lidAutoLog)
    }

    /// [MS-OXOCNTC] 2.2.1.10.20 PidTagGender Property
    /// Type: PtypInteger16 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagGender property ([MS-OXPROPS] section 2.708) specifies the gender of the contact. If
    /// present, the property MUST be one of the following values. This property is optional.
    var gender: Gender? {
        guard let rawValue: UInt16 = getProperty(id: .tagGender) else {
            return nil
        }
        
        return Gender(rawValue: rawValue)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.21 PidTagReferredByName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReferredByName property ([MS-OXPROPS] section 2.907) specifies the name of the
    /// person who referred this contact to the user. This property is optional.
    var referredByName: String? {
        return getProperty(id: .tagReferredByName)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.22 PidLidContactItemData Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactItemData property ([MS-OXPROPS] section 2.69) can be used to help display the
    /// contact information. If present, the property MUST have six entries, each corresponding to a visible
    /// field in the client's user interface. This property is optional.
    /// The meaning of each entry in the PidLidContactItemData property is defined in the following table.
    /// The value MUST be one of the following Meaning
    /// One-based index into the multivalue property
    /// 0x00000001 The client SHOULD display the contact's Home Address. 1
    /// 0x00000002 or 0x00000000 The client SHOULD display the contact's Work Address. 1
    /// 0x00000003 The client SHOULD display the contact's Other Address. 1
    /// 0x00008080 The client SHOULD display Email1. 2
    /// 0x00008090 The client SHOULD display Email2. 2
    /// 0x000080A0 The client SHOULD display Email3. 2
    /// Property ID of any of the Telephone properties specified in section 2.2.1.4 or of any of the fax numbers specified in section 2.2.1.2.6.
    /// The client SHOULD display the corresponding property. 3, 4, 5, 6
    var contactItemData: [UInt32]? {
        return getProperty(name: .lidContactItemData)
    }
    
    /// [MS-OXOCNTC] 2.2.1.10.24 PidLidBilling Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidBilling property ([MS-OXPROPS] section 2.43) specifies billing information for the
    /// contact. This property is optional.
    var billing: String? {
        return getProperty(name: .lidBilling)
    }
    
    /// [MS-OXOCNTC] 2.2.2.1.2 PidLidDistributionListName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidDistributionListName property ([MS-OXPROPS] section 2.98) specifies the name of the
    /// personal distribution list. The value of this property SHOULD be the same as the value of the
    /// PidTagDisplayName property (section 2.2.2.1.1).
    var distributionListName: String? {
        return getProperty(name: .lidDistributionListName)
    }
    
    /// [MS-OXOCNTC] 2.2.2.2.1 PidLidDistributionListMembers Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidDistributionListMembers property ([MS-OXPROPS] section 2.97) specifies the list of EntryIDs of the objects corresponding
    /// to the members of the personal distribution list. Members of the personal distribution list can be other personal distribution lists,
    /// electronic addresses contained in a contact, Global Address List (GAL) members, or one-off email addresses. The format of each
    /// EntryID MUST be either a One-Off EntryID structure ([MS-OXCDATA] section 2.2.5.1) or a WrappedEntryId structure
    /// (section 2.2.2.2.4.1.1).
    /// When setting this property, the client or the server MUST ensure its total size is less than 15,000 bytes.
    var distributionListMembers: [EntryID]? {
        guard let data: [Data] = getProperty(name: .lidDistributionListMembers) else {
            return nil
        }
        
        return data.compactMap { data -> EntryID? in
            var dataStream = DataStream(data)
            return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
        }
    }
    
    /// [MS-OXOCNTC] 2.2.2.2.2 PidLidDistributionListOneOffMembers Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidDistributionListOneOffMembers property ([MS-OXPROPS] section 2.99) specifies the list of one-off EntryIDs corresponding
    /// to the members of the personal distribution list. These one-off EntryIDs encapsulate display names and email addresses of the
    /// personal distribution list members.
    /// If the client or the server sets this property,<15> it MUST be synchronized with the PidLidDistributionListMembers property (section 2.2.2.2.1): for each entry in the
    /// PidLidDistributionListOneOffMembers property, there MUST be an entry in the same position in the PidLidDistributionListMembers
    /// property.
    /// When setting this property, the client or the server MUST ensure that its total size is less than 15,000 bytes.
    var distributionListOneOffMembers: [EntryID]? {
        guard let data: [Data] = getProperty(name: .lidDistributionListOneOffMembers) else {
            return nil
        }
        
        return data.compactMap { data -> EntryID? in
            var dataStream = DataStream(data)
            return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
        }
    }
    
    /// [MS-OXOCNTC] 2.2.2.2.3 PidLidDistributionListChecksum Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidDistributionListChecksum property ([MS-OXPROPS] section 2.96) specifies the 32-bit
    /// cyclic redundancy check (CRC) polynomial checksum, as specified in [ISO/IEC8802-3], calculated
    /// on the value of the PidLidDistributionListMembers property (section 2.2.2.2.1), as specified in
    /// section 3.1.5.11.
    /// The value of this property can be used to detect when the PidLidDistributionListMembers property
    /// was updated without updating the other Personal Distribution List Member properties (by computing
    /// the CRC on the existing value of the PidLidDistributionListMembers property and comparing it with
    /// the value of the PidLidDistributionListChecksum property). The server does not set or update this
    /// property.
    var distributionListChecksum: UInt32? {
        return getProperty(name: .lidDistributionListChecksum)
    }
    
    /// [MS-OXOCNTC] 2.2.2.2.4 PidLidDistributionListStream Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidDistributionListStream property ([MS-OXPROPS] section 2.100) specifies the list of
    /// EntryIDs and one-off EntryIDs corresponding to the members of the personal distribution list.
    /// Members of the personal distribution list can be other personal distribution lists, electronic addresses
    /// contained in a contact, GAL members, or one-off email addresses. The format of each EntryID
    /// MUST be as specified in section 2.2.2.2.1, and the format for each one-off EntryID MUST be as
    /// specified in section 2.2.2.2.2.
    /// The PidLidDistributionListStream property is intended to allow a distribution list to grow past the
    /// size limits of the PidLidDistributionListMembers property (section 2.2.2.2.1) and the
    /// PidLidDistributionListOneOffMembers property (section 2.2.2.2.2). This property SHOULD<16>
    /// be used if the size of either PidLidDistributionListMembers or
    /// PidLidDistributionListOneOffMembers would be greater than 15,000 bytes. If this property is set,
    /// the PidLidDistributionListMembers, PidLidDistributionListOneOffMembers, and
    /// PidLidDistributionListChecksum (section 2.2.2.2.3) properties SHOULD<17> be ignored.
    var distributionListStream: DistributionListStream? {
        guard let data: Data = getProperty(name: .lidDistributionListStream) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? DistributionListStream(dataStream: &dataStream)
    }
}
