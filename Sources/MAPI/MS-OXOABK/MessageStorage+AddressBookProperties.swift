//
//  MessageStorage+AddressBookProperties.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import Foundation

/// [MS-OXOABK] 2.2 Message Syntax
/// The properties used by this protocol are maintained on an address book server. The properties are
/// returned by an address book server in one of the following:
///  Various NSPI functions of either the Name Service Provider Interface (NSPI) Protocol, as specified
/// in [MS-NSPI], or the Exchange Server NSPI Protocol, as specified in [MS-OXNSPI].
///  Various response bodies of an HTTP POST method, as specified in [MS-OXCMAPIHTTP].<3>
/// Alternatively, many of these properties are maintained in an offline address book (OAB) by using
/// the OAB Format and Schema Protocol, as specified in [MS-OXOAB]. The OAB is a collection of
/// address lists, each of which contains Address Book objects and their properties. Refer to [MSOXOAB] for a list of the properties maintained in OABs.
/// There are many types of Address Book objects, including but not limited to mail users, distribution
/// lists, address book containers, Resource objects, Department objects, Organization objects,
/// and templates. This protocol does not require values for all properties that are defined for any object
/// type, nor does it limit the properties to those of their own type or those listed in this specification.
/// When a data source, such as an OAB or an address book server, includes properties that are not in
/// this set, the format and meaning of the property is defined by the implementation of that data source.
/// In all the properties of type PtypString ([MS-OXCDATA] section 2.11.1) that are listed in this
/// document, a request to an address book server of that property with type PtypString8 ([MSOXCDATA] section 2.11.1) or PtypString is permitted. If a conversion is required, the string will be
/// converted to the type requested by the client, as specified in either [MS-NSPI] or [MS-OXNSPI].
/// For all of the properties of type PtypString that are listed in this document, an OAB that includes a
/// value for that string property MUST contain exactly one string representation. The internal
/// representation of strings in an OAB that use the OAB Format and Schema Protocol is specified in [MSOXOAB]. A client that looks up the value for a string property MUST convert the value to the string
/// type that is native to the client before it interprets the value of that property.
/// [MS-OXOABK] 2.2.2 Properties that Apply to Containers in the Address Book Hierarchy Table
/// An address book is a collection of Address Book objects, each of which is contained in any number
/// of address lists. The address book is arranged as a hierarchy of address book containers. Each
/// address book container, in turn, describes an address list that contains many Address Book objects.
/// When using an offline address book (OAB), messaging clients SHOULD obtain information about
/// the address book hierarchy and its address book containers by using the Offline Address Book
/// Retrieval File Format, as specified in [MS-OXWOAB], or MAY<6> obtain information by using the
/// Offline Address Book Public Folder Retrieval Protocol, as specified in [MS-OXPFOAB]. Because an OAB
/// maintains its own structure for the hierarchy table, none of the properties of address book
/// containers described in this document apply to the OAB.
/// The hierarchy table is a set of rows, each of which describes one address book container. For details
/// about retrieving the address book hierarchy table, see section 3.1.4.1.
/// [MS-OXOABK] 2.2.3 Properties that Apply to All Address Book Objects
/// Address Book objects are listed in an offline address book (OAB) by the OAB Format and
/// Schema Protocol, as specified in [MS-OXOAB], or accessed on an address book server by using
/// various NSPI method calls,<9> as specified in [MS-NSPI] and [MS-OXNSPI], or by using various
/// HTTP request types for an address book server endpoint,<10> as specified in [MS-OXCMAPIHTTP].
/// Each object represents any addressable entity, including but not limited to mail user, distribution
/// list, Department object, Organization object, address book container, or Resource object.
/// Not all properties defined in this section are stored in the OAB. For a list of the properties stored in the
/// OAB, see [MS-OXOAB].
/// It is possible to set any Address Book object as an addressee of an outbound message to be sent by a
/// messaging client. A mail user is an example, and it can contain an e-mail address to be used for
/// messaging. A distribution list is a special type of Address Book object that represents a collection of
/// other Address Book objects, can be an addressee of an outbound message, and SHOULD have
/// additional properties, as specified in section 2.2.6. Mail user objects are further broken down into
/// subtypes, such as rooms, equipment, messaging forums, or other types. Note that servers can restrict
/// client access to specific properties as required by the implementation. One example is distribution list
/// membership; the server can restrict access to distribution lists in which the members are hidden.
/// The Department object and the Organization object are types of Address Book objects that are
/// required to support a hierarchical address book view that messaging clients need.
/// [MS-OXOABK] 2.2.4 Properties that Apply to Mail User Objects
/// [MS-OXOABK] 2.2.5 Properties That Reference Other Address Book Objects
/// Some Address Book objects contain references to other Address Book objects, in the form of a
/// table, through various properties.
/// For details about accessing these tables from an address book server, see [MS-NSPI] and [MSOXNSPI] section 3.1.4.4.2.2.<38> Each of these properties is of type PtypEmbeddedTable ([MSOXCDATA] section 2.11.1). For example, a mail user in an organization reports to a manager, who is
/// also listed in that address book as another mail user. In this case, a property of type
/// PtypEmbeddedTable or PidTagAddressBookManager (section 2.2.5.1) references the manager.
/// In general, a property of type PtypEmbeddedTable references any number of other Address Book
/// objects. Properties of type PtypEmbeddedTable are made available on an address book server by
/// using a property value–based explicit table through either the NspiGetMatches method, as specified
/// in [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.10, or the GetMatches request type, as specified in
/// [MS-OXCMAPIHTTP] section 2.2.5.5, and are modified through either the NspiModLinkAtt method,
/// as specified in [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.15, or the ModLinkAtt request type, as
/// specified in [MS-OXCMAPIHTTP] section 2.2.5.10.<39><40>
/// These tables are represented in an offline address book (OAB) as a property either of type
/// PtypString ([MS-OXCDATA] section 2.11.1) (for tables that consist of no more than one reference) or
/// of type PtypMultipleString ([MS-OXCDATA] section 2.11.1) (for tables that can consist of multiple
/// references), as specified in [MS-OXOAB]. Each string value represents the DN of another Address
/// Book object. For example, a mail user in an organization reports to a manager who is also listed in the
/// address book as another mail user. In this case, the PidTagAddressBookManager property (section
/// 2.2.5.1), with a property type of PtypString, contains the DN of the manager.
/// [MS-OXOABK] 2.2.5 Properties That Reference Other Address Book Objects
/// Some Address Book objects contain references to other Address Book objects, in the form of a
/// table, through various properties.
/// For details about accessing these tables from an address book server, see [MS-NSPI] and [MSOXNSPI] section 3.1.4.4.2.2.<38> Each of these properties is of type PtypEmbeddedTable ([MSOXCDATA] section 2.11.1). For example, a mail user in an organization reports to a manager, who is
/// also listed in that address book as another mail user. In this case, a property of type
/// PtypEmbeddedTable or PidTagAddressBookManager (section 2.2.5.1) references the manager.
/// In general, a property of type PtypEmbeddedTable references any number of other Address Book
/// objects. Properties of type PtypEmbeddedTable are made available on an address book server by
/// using a property value–based explicit table through either the NspiGetMatches method, as specified
/// in [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.10, or the GetMatches request type, as specified in
/// [MS-OXCMAPIHTTP] section 2.2.5.5, and are modified through either the NspiModLinkAtt method,
/// as specified in [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.15, or the ModLinkAtt request type, as
/// specified in [MS-OXCMAPIHTTP] section 2.2.5.10.<39><40>
/// These tables are represented in an offline address book (OAB) as a property either of type
/// PtypString ([MS-OXCDATA] section 2.11.1) (for tables that consist of no more than one reference) or
/// of type PtypMultipleString ([MS-OXCDATA] section 2.11.1) (for tables that can consist of multiple
/// references), as specified in [MS-OXOAB]. Each string value represents the DN of another Address
/// Book object. For example, a mail user in an organization reports to a manager who is also listed in the
/// address book as another mail user. In this case, the PidTagAddressBookManager property (section
/// 2.2.5.1), with a property type of PtypString, contains the DN of the manager.
/// [MS-OXOABK] 2.2.6 Properties That Apply to Distribution Lists
/// [MS-OXOABK] 2.2.7 Properties That Apply to Organization Objects
/// An Organization object is an Address Book object that represents an organization and contains
/// properties that are specific to that organization. A mail user's Organization object is obtained by
/// using the PidTagAddressBookOrganizationalUnitRootDistinguishedName property (section
/// 2.2.4.39) of the mail user.<44> When this property is not present on a mail user, messaging clients
/// access the Organization object of a mail user by extracting the org-rdn string from the mail user's DN,
/// which is in the format of an X500 address and the x500-dn format specification, as specified in section
/// 2.2.1.1. Messaging clients use the resulting org-rdn string as a DN of the mail user's organization,
/// which is in the organization-dn format specification. After the Organization object is obtained,
/// messaging clients are able to perform operations the same way as they would on any other Address
/// Book object.
/// [MS-OXOABK] 2.2.8 Properties That Apply to Department Objects
/// A Department object is an Address Book object that represents a department within an
/// organization and contains properties that are specific to a Department object. Department objects are
/// distinct from departmental groups, which are a specific type of distribution list with all its
/// properties. A server MAY<46> represent a department hierarchy by using either Department objects
/// or departmental groups, and it MUST NOT mix the representations.
/// Messaging clients obtain the root of the department hierarchy by using the
/// PidTagAddressBookHierarchicalRootDepartment property (section 2.2.7.2) of the Organization
/// object (which MAY be either a Department object or a departmental group), or by obtaining the root
/// department that is not specific to any organization, which MUST be a Department object, and which
/// has a DN that is specified by using the organization-dn format specification, as specified in 2.2.1.1,
/// with a value of "/o=FF46312B-D8AE-406C-B8E6-BC1A22A4C69E".
/// [MS-OXOABK] 2.2.9 Properties That Apply to Resource Objects
/// [MS-OXOABK] 2.2.10 Properties That Have Special Purposes
public extension MessageStorage {
    /// [MS-OXOABK] 2.2.2.1 PidTagContainerFlags
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContainerFlags property ([MS-OXPROPS] section 2.638) contains a bitmask of flags that
    /// describe capabilities of an address book container.
    /// The flags listed in the following table are defined for the bitmask of the PidTagContainerFlags
    /// property. The PidTagContainerFlags property MUST NOT contain any other flags.
    var containerFlags: ContainerFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagContainerFlags) else {
            return nil
        }
        
        return ContainerFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOABK] 2.2.2.3 PidTagAddressBookContainerId
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookContainerId property ([MS-OXPROPS] section 2.506) identifies an
    /// address book container on an address book server. Note that this property is a Minimal Entry
    /// ID. A value of 0 (zero) represents the Global Address List (GAL). If the value is nonzero, it is only a
    /// valid representation of the specific container. This representation lasts for the time that the connection
    /// to the address book server lasts, or, after disconnection from and reconnection to the same or another
    /// address book server, for as long as the new server identifies itself as having the same GUID. The
    /// server returns the GUID in the pServerGuid parameter of the NspiBind method,<7> as specified in
    /// [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.1, or in the ServerGuid field of the Bind request type
    /// response,<8> as specified in [MS-OXCMAPIHTTP] section 2.2.5.1.2.
    /// Because this property applies to a container in the hierarchy table, it is not present on objects in an
    /// offline address book (OAB). An OAB has its own structure for maintaining the hierarchy, using the
    /// OAB Public Folder Retrieval Protocol, as specified in [MS-OXPFOAB].
    var addressBookContainerId: UInt32? {
        return getProperty(id: .tagAddressBookContainerId)
    }
    
    /// [MS-OXOABK] 2.2.2.4 PidTagAddressBookIsMaster
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookIsMaster property ([MS-OXPROPS] section 2.539) is TRUE (0x01) if it is
    /// possible to create Address Book objects in that container, and FALSE (0x00) otherwise. The value
    /// does not pertain to parent containers or subcontainers of this container.
    /// Because this property applies to a container in the hierarchy table, it is not present on objects in an
    /// offline address book (OAB). An OAB has its own structure for maintaining the hierarchy, using the
    /// OAB Public Folder Retrieval Protocol, as specified in [MS-OXPFOAB].
    var addressBookIsMaster: Bool? {
        return getProperty(id: .tagAddressBookIsMaster)
    }
    
    /// [MS-OXOABK] 2.2.2.5 PidTagAddressBookParentEntryId
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookParentEntryId property ([MS-OXPROPS] section 2.553) is the entry ID of
    /// the parent container in a hierarchy of address book containers. This property is not present if no
    /// parent container exists. Messaging clients use this property to expand and collapse a hierarchy of
    /// address book containers in an address book hierarchy table.
    /// Because this property applies to a container in the hierarchy table, it is not present on objects in an
    /// offline address book (OAB). An OAB has its own structure for maintaining the hierarchy, using the
    /// OAB Public Folder Retrieval Protocol, as specified in [MS-OXPFOAB].
    var addressBookParentEntryId: Data? {
        return getProperty(id: .tagAddressBookParentEntryId)
    }
    
    /// [MS-OXOABK] 2.2.3.3 PidTagTemplateid
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTemplateid property ([MS-OXPROPS] section 2.1037) contains the PidTagEntryId
    /// property (section 2.2.3.2), expressed in Permanent Entry ID format. This value MUST be present for
    /// all Address Book objects on an NSPI server, its DN MUST match the value for the
    /// PidTagEmailAddress property (section 2.2.3.14), and its DN MUST follow the format particular to
    /// the type of object, as described in section 2.2.1.1.
    /// The PidTagTemplateid property is not present on objects in an offline address book (OAB).
    var templateid: Data? {
        return getProperty(id: .tagTemplateid)
    }
    
    /// [MS-OXOABK] 2.2.3.6 PidTagInstanceKey
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInstanceKey property ([MS-OXPROPS] section 2.737) identifies an object on an NSPI
    /// server. It is a Minimal Entry ID, represented as a 4 byte binary value, in little-endian byte order.
    /// The PidTagInstanceKey property is not present on objects in an offline address book (OAB).
    var instanceKey: Data? {
        return getProperty(id: .tagInstanceKey)
    }
    
    /// [MS-OXOABK] 2.2.3.8 PidTagTransmittableDisplayName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTransmittableDisplayName property ([MS-OXPROPS] section 2.1043) contains an
    /// Address Book object's display name that is transmitted with the message. This value MUST be
    /// present on all objects on an NSPI server except the organization object. When present the value
    /// MUST match the value for the PidTagDisplayName property (section 2.2.3.1).
    /// The PidTagTransmittableDisplayName property is not present on objects in an offline address
    /// book (OAB).
    var transmittableDisplayName: String? {
        return getProperty(id: .tagTransmittableDisplayName)
    }
    
    /// [MS-OXOABK] 2.2.3.9 PidTagAddressBookPhoneticDisplayName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookPhoneticDisplayName property ([MS-OXPROPS] section 2.556) contains
    /// the phonetic representation of the PidTagDisplayName property (section 2.2.3.1).<12>
    var addressBookPhoneticDisplayName: String? {
        return getProperty(id: .tagAddressBookPhoneticDisplayName)
    }

    /// [MS-OXOABK] 2.2.3.11 PidTagDisplayType
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayType property ([MS-OXPROPS] section 2.673) contains a value that indicates how
    /// to display an Address Book object in a table or as an addressee on a message. Messaging clients
    /// use this property to display an icon, make the object bold, or apply some other display element to
    /// make it easy for a user who is viewing the object to distinguish its type. In addition, the
    /// PidTagDisplayTypeEx property (section 2.2.3.12) provides a means to refine the display further.
    /// The PidTagDisplayType property MUST have one of the following display type values, as specified in
    /// [MS-NSPI] and [MS-OXNSPI] section 2.2.1.3, according to the object's type: DT_MAILUSER,
    /// DT_DISTLIST, DT_FORUM, DT_AGENT, DT_ORGANIZATION, DT_PRIVATE_DISTLIST, or
    /// DT_REMOTE_MAILUSER.<13>
    var displayType: DisplayType? {
        guard let rawValue: UInt32 = getProperty(id: .tagDisplayType) else {
            return nil
        }
        
        return DisplayType(rawValue: rawValue)
    }
    
    /// [MS-OXOABK] 2.2.3.12 PidTagDisplayTypeEx
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayTypeEx property ([MS-OXPROPS] section 2.674) contains a value that indicates
    /// how to display an Address Book object in a table or as a recipient on a message. Messaging clients
    /// use this to display an icon, make the object bold, or apply some other display element to make it easy
    /// for a user who is viewing the object to distinguish its type. This property contains more detailed
    /// information about the object's display information than does the PidTagDisplayType property
    /// (section 2.2.3.11). In addition to the display information contained in the PidTagDisplayType
    /// property, this property distinguishes among additional object types. When the object comes from a
    /// remote server, the PidTagDisplayType property also includes information about the type of object
    /// on that remote server, as well as the type on the local server.
    /// The PidTagDisplayTypeEx property also includes information that indicates whether it is possible to
    /// share information from the user's own mailbox to the entity represented by an Address Book object.
    /// The PidTagDisplayTypeEx property is a bitmask of flags and values and has the following structure:
    /// r (1 bit): 1 indicates that the value in dtRemote is the remote display type. The numeral 0 (zero)
    /// means that dtRemote is undefined. This represents the high order bit.
    /// s (1 bit): 1 indicates that the mailbox server supports sharing to the entity that an Address Book
    /// object represents. The numeral 0 (zero) means that it does not support such sharing.
    /// reserved (14 bits): Undefined. This value MUST contain all zeros and MUST be ignored by clients.
    /// dtRemote (1 byte): The display type of an Address Book object in the remote forest. This is
    /// undefined if r is 0 (zero). If r is 1, it contains one of the values listed in the following table.
    /// dtLocal (1 byte): The display type of an Address Book object in the messaging user's local forest. It
    /// contains one of the values listed in the following table.
    /// Note that dtLocal and/or dtRemote MUST have one of the following display type values, as defined
    /// in [MS-NSPI] and [MS-OXNSPI] section 2.2.1.3,<14> according to the object's type: DT_MAILUSER,
    /// DT_DISTLIST, DT_FORUM, DT_AGENT, DT_ORGANIZATION, DT_PRIVATE_DISTLIST,
    /// DT_REMOTE_MAILUSER, or one of the values listed in the following table.
    /// Value name Value Description
    /// DT_ROOM 0x07 A conference room. It is possible for messaging clients to send meeting
    /// requests to the specified Address Book object to book the room.
    /// DT_EQUIPMENT 0x08 Equipment. It is possible for messaging clients to send meeting requests to the
    /// specified Address Book object to reserve the equipment.
    /// DT_SEC_DISTLIST 0x09 A distribution list used as a security group on the server.
    var displayTypeEx: DisplayTypeEx? {
        guard let rawValue: UInt32 = getProperty(id: .tagDisplayTypeEx) else {
            return nil
        }
        
        return DisplayTypeEx(rawValue: rawValue)
    }
    
    /// [MS-OXOABK] 2.2.3.13 PidTagAddressType
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressType property ([MS-OXPROPS] section 2.570) contains an Address Book
    /// object's e-mail address type. It MUST have the value "EX" for all objects on an NSPI server.
    /// The PidTagAddressType property is not present on objects in an offline address book (OAB).
    /// [MS-OXCMAIL] 2.1.3.1.9 PidTagAddressType Property
    /// The value of the PidTagAddressType property ([MS-OXOABK] section 2.2.3.13) is a string that
    /// names the messaging system that the address is destined for. It is used to assign responsibility for an
    /// e-mail address to the right transport provider. The string value provided by the PidTagAddressType
    /// property contains only uppercase alphabetic characters from "A" through "Z", and the numbers from
    /// "0" through "9". The value of the PidTagAddressType property is also used to designate the correct
    /// format for the PidTagEmailAddress property ([MS-OXOABK] section 2.2.3.14).
    /// If a client tries to compose a message to a user whose address type is not in the server's list of
    /// known address types, the message will produce a non-delivery report unless the client itself, acting
    /// as the message transfer agent, is able to deliver the message by using an alternate transport that
    /// bypasses the server.
    /// The following table lists the address types that are known at this time. The common address types
    /// include "EX", "SMTP", "X400", and "X500".
    /// Messaging system Value of the PidTagAddressType property
    /// Microsoft Exchange "EX"
    /// Internet "SMTP"
    /// X.400 Message Handling System "X400"
    /// X.500 Directory Services "X500"
    var addressType: String? {
        return getProperty(id: .tagAddressType)
    }
    
    /// [MS-OXOABK] 2.2.3.14 PidTagEmailAddress
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagEmailAddress property ([MS-OXPROPS] section 2.675) contains an Address Book
    /// object's e-mail address, expressed in X500 format, using the format that is particular to the type of
    /// object, as specified in section 2.2.1.1. This property MUST be present for every Address Book object.
    /// Its value MUST match the DN of the Permanent Entry ID for the object if the object is present on an
    /// NSPI server. Its DN MUST follow the format particular to the type of object, as specified in section
    /// 2.2.1.1.
    var emailAddress: String? {
        return getProperty(id: .tagEmailAddress)
    }
    
    /// [MS-OXOABK] 2.2.3.15 PidTagAddressBookObjectDistinguishedName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookObjectDistinguishedName property ([MS-OXPROPS] section 2.548)
    /// contains the DN of an Address Book object in DN format, as specified in section 2.2.1.1. If present,
    /// its DN MUST follow the format that is particular to the type of object, as specified in section 2.2.1.1.
    /// Its value, if present, MUST match the value for the PidTagEmailAddress property. This value MUST
    /// be present on all Address Book objects on an NSPI server.
    var addressBookObjectDistinguishedName: String? {
        return getProperty(id: .tagAddressBookObjectDistinguishedName)
    }
    
    /// [MS-OXOABK] 2.2.3.18 PidTagSendRichInfo
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSendRichInfo property ([MS-OXPROPS] section 2.1003) contains TRUE (0x01) if the email-enabled entity represented by an Address Book object can receive all message content,
    /// including Rich Text Format (RTF) and other embedded objects. When sending mail by using the
    /// [RFC2822] Internet message format and Multipurpose Internet Mail Extensions (MIME) to the Email Object Conversion Protocol, as specified in [MS-OXCMAIL], the PidTagSendRichInfo property
    /// specifies whether to encode the message in MIME or in Transport Neutral Encapsulation Format
    /// (TNEF), as specified in [MS-OXCMAIL]. The PidTagSendRichInfo property contains FALSE (0x00) if
    /// the e-mail-enabled entity cannot receive formatted message content.
    /// [MS-OXOMSG] 2.2.1.47 PidTagSendRichInfo Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSendRichInfo property ([MS-OXOABK] section 2.2.3.18) specifies whether the sender
    /// can receive all message content, including Rich Text Format (RTF) and Object Linking and
    /// Embedding (OLE) objects. If this property is present, this property is set to either 0x01, indicating
    /// that the sender can receive all message contents, or 0x00, indicating that the sender of the e-mail
    /// message is using a different type of e-mail client. The default is 0x00.
    var sendRichInfo: Bool? {
        return getProperty(id: .tagSendRichInfo)
    }
    
    /// [MS-OXOABK] 2.2.3.19 PidTagSendInternetEncoding
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSendInternetEncoding property ([MS-OXPROPS] section 2.1002) contains a bitmask of
    /// message-encoding preferences for mail sent to an e-mail-enabled entity that is represented by an
    /// Address Book object. When sending mail by using the [RFC2822] Internet message format and
    /// Multipurpose Internet Mail Extensions (MIME) to the E-mail Object Conversion Protocol, as
    /// specified in [MS-OXCMAIL], the PidTagSendInternetEncoding property specifies the format of the
    /// MIME body, as specified in [MS-OXCMAIL].
    var sendInternetEncoding: UInt32? {
        return getProperty(id: .tagSendInternetEncoding)
    }
    
    /// [MS-OXOABK] 2.2.3.21 PidTagSmtpAddress
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSmtpAddress property ([MS-OXPROPS] section 2.1014) contains an Address Book
    /// object's Simple Mail Transfer Protocol (SMTP) address.
    var smtpAddress: String? {
        return getProperty(id: .tagSmtpAddress)
    }
    
    /// [MS-OXOABK] 2.2.3.22 PidTagAddressBookTargetAddress
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookTargetAddress property ([MS-OXPROPS] section 2.567) contains the
    /// foreign system e-mail address of an Address Book object. If this value is present, it MUST be
    /// prefixed with the address type of the foreign address, followed by a colon (":"), followed by the
    /// foreign e-mail address expressed in that address type. For Simple Mail Transfer Protocol (SMTP)
    /// addresses, this value is "SMTP:" followed by the foreign SMTP address.
    var addressBookTargetAddress: String? {
        return getProperty(id: .tagAddressBookTargetAddress)
    }
    
    /// [MS-OXOABK] 2.2.3.23 PidTagAddressBookProxyAddresses
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookProxyAddresses property ([MS-OXPROPS] section 2.559) contains
    /// alternate e-mail addresses for an Address Book object. Each string MUST be prefixed by an e-mail
    /// type, followed by a colon (":"), followed by the e-mail address in a format for that e-mail type. For a
    /// Simple Mail Transfer Protocol (SMTP) address, the string MUST start with the string "SMTP:" or
    /// "SMTP:" followed by an SMTP address. The first string starting with the uppercase string "SMTP:"
    /// MUST match the PidTagSmtpAddress property (section 2.2.3.21) for the Address Book object.
    var addressBookProxyAddresses: [String]? {
        return getProperty(id: .tagAddressBookProxyAddresses)
    }
    
    /// [MS-OXOABK] 2.2.3.24 PidTagAddressBookSeniorityIndex
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookSeniorityIndex property<15> ([MS-OXPROPS] section 2.566) contains a
    /// signed integer that specifies the seniority order of Address Book objects that represent members of
    /// a department and are referenced by a Department object or departmental group, with larger
    /// values specifying members that are more senior. It also specifies the sort order of Department objects
    /// or departmental groups that represent child departments of another parent department in a hierarchy
    /// of departments and that are referenced by the parent's Department object or departmental group, in
    /// descending order.
    var addressBookSeniorityIndex: UInt32? {
        return getProperty(id: .tagAddressBookSeniorityIndex)
    }
    
    /// [MS-OXOABK] 2.2.3.25 PidTagAddressBookObjectGuid
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookObjectGuid property<16> ([MS-OXPROPS] section 2.549) contains a
    /// GUID that uniquely identifies an Address Book object.
    var addressBookObjectGuid: Data? {
        return getProperty(id: .tagAddressBookObjectGuid)
    }
    
    /// [MS-OXOABK] 2.2.3.26 PidTagAddressBookSenderHintTranslations
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookSenderHintTranslations property<17> ([MS-OXPROPS] section 2.565)
    /// contains the locale ID and translations of the default mail tip. An example of this value is "enUS:Hello" or "es:Hola".
    var addressBookSenderHintTranslations: [String]? {
        return getProperty(id: .tagAddressBookSenderHintTranslations)
    }
    
    /// [MS-OXOABK] 2.2.3.27 PidTagAddressBookDeliveryContentLength
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDeliveryContentLength property<18> ([MS-OXPROPS] section 2.507)
    /// specifies the maximum size of a message that a recipient can receive.
    var addressBookDeliveryContentLength: UInt32? {
        return getProperty(id: .tagAddressBookDeliveryContentLength)
    }
    
    /// [MS-OXOABK] 2.2.3.28 PidTagAddressBookModerationEnabled
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookModerationEnabled property<19> ([MS-OXPROPS] section 2.546)
    /// indicates whether moderation is enabled for the mail user of the distribution list. This property is
    /// set to TRUE (0x01) if moderation is enabled for the mail user or distribution list; otherwise, this
    /// property is set to FALSE (0x00).
    var addressBookModerationEnabled: Bool? {
        return getProperty(id: .tagAddressBookModerationEnabled)
    }
    
    /// [MS-OXOABK] 2.2.3.29 PidTagAddressBookDistributionListMemberCount
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDistributionListMemberCount property<20> ([MS-OXPROPS] section
    /// 2.511) contains the total number of recipients in a specified distribution list. This value includes
    /// the members of all the distribution lists that are members of the specified distribution list.
    /// This property is calculated during OAB generation and is not available on the NSPI server.
    var addressBookDistributionListMemberCount: UInt32? {
        return getProperty(id: .tagAddressBookDistributionListMemberCount)
    }
    
    /// [MS-OXOABK] 2.2.3.30 PidTagAddressBookDistributionListExternalMemberCount
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDistributionListExternalMemberCount property<21> ([MS-OXPROPS]
    /// section 2.510) contains the number of external recipients in a specified distribution list.
    /// This property is calculated during OAB generation and is not available on the NSPI server.
    var addressBookDistributionListExternalMemberCount: UInt32? {
        return getProperty(id: .tagAddressBookDistributionListMemberCount)
    }
    
    /// [MS-OXOABK] 2.2.3.32 PidTagMappingSignature
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMappingSignature property ([MS-OXPROPS] section 2.774) MUST be present on all
    /// Address Book objects on an NSPI server and MUST contain the following 16 bytes:
    /// 0xDC, 0xA7, 0x40, 0xC8, 0xC0, 0x42, 0x10, 0x1A, 0xB4, 0xB9, 0x08, 0x00, 0x2B, 0x2F, 0xE1,
    /// 0x82The PidTagMappingSignature property is not present on objects in an offline address book
    /// (OAB).
    var mappingSignature: Data? {
        return getProperty(id: .tagMappingSignature)
    }
    
    /// [MS-OXOABK] 2.2.3.33 PidTagInitialDetailsPane
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInitialDetailsPane property ([MS-OXPROPS] section 2.734) indicates which page of a
    /// display template to display first. This value MUST be present on all Address Book objects on an
    /// NSPI server, and it MUST have the value 0 (zero).
    var initialDetailsPane: UInt32? {
        return getProperty(id: .tagInitialDetailsPane)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute1: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute1)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute2: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute2)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute3: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute3)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute4: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute4)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute5: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute5)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute6: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute6)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute7: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute7)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute8: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute8)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute9: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute9)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute10: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute10)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute11: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute11)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute12: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute13)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute14: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute14)
    }
    
    /// [MS-OXOABK] 2.2.3.34 PidTagAddressBookExtensionAttribute1 through
    /// PidTagAddressBookExtensionAttribute15
    /// These 15 properties are used to store custom values. These properties are PtypString values ([MSOXCDATA] section 2.11.1) that are defined and populated by the organization that modified the
    /// display templates.
    var addressBookExtensionAttribute15: String? {
        return getProperty(id: .tagAddressBookExtensionAttribute15)
    }
    
    /// [MS-OXOABK] 2.2.3.35 PidTagAddressBookDisplayTypeExtended
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDisplayTypeExtended property ([MS-OXPROPS] section 2.509) is limited
    /// to Recipient objects. The PidTagAddressBookDisplayTypeExtended property SHOULD be
    /// present on objects on an NSPI server or an offline address book (OAB).<22>
    var addressBookDisplayTypeExtended: UInt32? {
        return getProperty(id: .tagAddressBookDisplayTypeExtended)
    }
    
    /// [MS-OXOABK] 2.2.4.1 PidTagSurname
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSurname property ([MS-OXPROPS] section 2.1030) contains a mail user's family name.
    /// [MS-OXOCNTC] 2.2.1.1.3 PidTagDisplayNamePrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayNamePrefix property ([MS-OXPROPS] section 2.673) specifies the title of the
    /// contact, such as "Mr." or "Mrs.". This property is optional.
    var surname: String? {
        return getProperty(id: .tagSurname)
    }
    
    /// [MS-OXOCNTC] 2.2.1.1.6 PidTagGivenName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagGivenName property ([MS-OXPROPS] section 2.710) specifies the given name (first
    /// name) of the contact. This property is optional.
    /// [MS-OXOABK] 2.2.4.2 PidTagGivenName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagGivenName property ([MS-OXPROPS] section 2.708) contains a mail user's given name.
    var givenName: String? {
        return getProperty(id: .tagGivenName)
    }

    /// [MS-OXOABK] 2.2.4.3 PidTagInitials
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInitials property ([MS-OXPROPS] section 2.735) contains the initials for parts of a mail
    /// user's full name.
    /// [MS-OXOCNTC] 2.2.1.1.7 PidTagInitials Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInitials property ([MS-OXPROPS] section 2.737) specifies the initials of the contact. This
    /// property is optional.
    var initials: String? {
        return getProperty(id: .tagInitials)
    }

    /// [MS-OXOABK] 2.2.4.4 PidTagTitle
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTitle property ([MS-OXPROPS] section 2.1040) contains a mail user's job title.
    /// [MS-OXOCNTC] 2.2.1.6.1 PidTagTitle Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTitle property ([MS-OXOABK] section 2.2.4.4) specifies the job title of the contact. This
    /// property is optional.
    var title: String? {
        return getProperty(id: .tagTitle)
    }

    /// [MS-OXOABK] 2.2.4.5 PidTagOfficeLocation
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOfficeLocation property ([MS-OXPROPS] section 2.808) contains a mail user's office
    /// location.
    /// [MS-OXOCNTC] 2.2.1.6.5 PidTagOfficeLocation Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOfficeLocation property ([MS-OXOABK] section 2.2.4.5) specifies the location of the
    /// office that the contact works in. This property is optional.
    var officeLocation: String? {
        return getProperty(id: .tagOfficeLocation)
    }

    /// [MS-OXOABK] 2.2.4.6 PidTagDepartmentName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDepartmentName property ([MS-OXPROPS] section 2.666) contains a name for the
    /// department in which a mail user works.
    /// [MS-OXOCNTC] 2.2.1.6.3 PidTagDepartmentName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDepartmentName property ([MS-OXOABK] section 2.2.4.6) specifies the name of the
    /// department to which the contact belongs. This property is optional.
    var departmentName: String? {
        return getProperty(id: .tagDepartmentName)
    }

    /// [MS-OXOABK] 2.2.4.7 PidTagCompanyName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCompanyName property ([MS-OXPROPS] section 2.633) contains a mail user's
    /// company name.
    /// [MS-OXOCNTC] 2.2.1.6.2 PidTagCompanyName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCompanyName property ([MS-OXOABK] section 2.2.4.7) specifies the company that
    /// employs the contact. This property is optional.
    var companyName: String? {
        return getProperty(id: .tagCompanyName)
    }

    /// [MS-OXOABK] 2.2.4.8 PidTagAssistant
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAssistant property ([MS-OXPROPS] section 2.576) contains the name of a mail user's
    /// administrative assistant.
    /// [MS-OXOCNTC] 2.2.1.6.7 PidTagAssistant Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAssistant property ([MS-OXOABK] section 2.2.4.8) specifies the name of the contact's
    /// assistant. This property is optional.
    var assistant: String? {
        return getProperty(id: .tagAssistant)
    }

    /// [MS-OXOABK] 2.2.4.9 PidTagAddressBookManagerDistinguishedName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookManagerDistinguishedName property ([MS-OXPROPS] section 2.543)
    /// contains the DN of a mail user's manager.
    var addressBookManagerDistinguishedName: String? {
        return getProperty(id: .tagAddressBookManagerOrTagAddressBookManagerDistinguishedName)
    }

    /// [MS-OXOABK] 2.2.4.10 PidTagAddressBookPhoneticGivenName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookPhoneticGivenName property ([MS-OXPROPS] section 2.557) contains the
    /// phonetic representation of the PidTagGivenName property (section 2.2.4.2).<23>
    var addressBookPhoneticGivenName: String? {
        return getProperty(id: .tagAddressBookPhoneticGivenName)
    }

    /// [MS-OXOABK] 2.2.4.11 PidTagAddressBookPhoneticSurname
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookPhoneticSurname property ([MS-OXPROPS] section 2.558) contains the
    /// phonetic representation of the PidTagSurname property (section 2.2.4.1).<24>
    var addressBookPhoneticSurname: String? {
        return getProperty(id: .tagAddressBookPhoneticSurname)
    }

    /// [MS-OXOABK] 2.2.4.12 PidTagAddressBookPhoneticCompanyName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookPhoneticCompanyName property ([MS-OXPROPS] section 2.554) contains
    /// the phonetic representation of the PidTagCompanyName property (section 2.2.4.7).<25>
    var addressBookPhoneticCompanyName: String? {
        return getProperty(id: .tagAddressBookPhoneticCompanyName)
    }
    
    /// [MS-OXOABK] 2.2.4.13 PidTagAddressBookPhoneticDepartmentName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookPhoneticDepartmentName property ([MS-OXPROPS] section 2.555)
    /// contains the phonetic representation of the PidTagDepartmentName property (section
    /// 2.2.4.6).<26>
    var addressBookPhoneticDepartmentName: String? {
        return getProperty(id: .tagAddressBookPhoneticDepartmentName)
    }
    
    /// [MS-OXOABK] 2.2.4.14 PidTagStreetAddress
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagStreetAddress property ([MS-OXPROPS] section 2.1025) contains a mail user's street
    /// address.
    /// [MS-OXOCNCTC] 2.2.1.3.1 PidTagStreetAddress
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressStreet ([MS-OXPROPS] section 2.362), PidTagHomeAddressStreet ([MSOXOABK] section 2.2.4.20), PidTagOtherAddressStreet ([MS-OXPROPS] section 2.849), and
    /// PidTagStreetAddress ([MS-OXOABK] section 2.2.4.14) properties specify the street portion of the
    /// contact's Work, Home, Other, or Mailing Address. These properties can also be used to store the post
    /// office box part of the address, if it exists.
    var streetAddress: String? {
        return getProperty(id: .tagStreetAddress)
    }
    
    /// [MS-OXOABK] 2.2.4.15 PidTagPostOfficeBox
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPostOfficeBox property ([MS-OXPROPS] section 2.860) contains the number or identifier
    /// of a mail user's post office box.
    /// [MS-OXOCNTC] 2.2.1.3.7 PidTagPostOfficeBox
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
    var postOfficeBox: String? {
        return getProperty(id: .tagPostOfficeBox)
    }
    
    /// [MS-OXOABK] 2.2.4.16 PidTagLocality
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLocality property ([MS-OXPROPS] section 2.769) contains the name of a mail user's
    /// locality, such as the town or city.
    /// [MS-OXOCNCTC] 2.2.1.3.2 PidTagLocality,
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCity ([MS-OXPROPS] section 2.356), PidTagHomeAddressCity ([MSOXPROPS] section 2.721), PidTagOtherAddressCity ([MS-OXPROPS] section 2.844), and
    /// PidTagLocality ([MS-OXOABK] section 2.2.4.16) properties specify the city or locality portion of the
    /// contact's Work, Home, Other, or Mailing Address.
    var locality: String? {
        return getProperty(id: .tagLocality)
    }
    
    /// [MS-OXOABK] 2.2.4.17 PidTagStateOrProvince
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagStateOrProvince property ([MS-OXPROPS] section 2.1021) contains the name of a mail
    /// user's state or province.
    /// [MS-OXOCNTC] 2.2.1.3.3 PidTagStateOrProvince
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressState ([MS-OXPROPS] section 2.361),
    /// PidTagHomeAddressStateOrProvince ([MS-OXPROPS] section 2.725),
    /// PidTagOtherAddressStateOrProvince ([MS-OXPROPS] section 2.848), and
    /// PidTagStateOrProvince [MS-OXOABK] section 2.2.4.17) properties specify the state or province
    /// portion of the contact's Work, Home, Other, or Mailing Address.
    var stateOrProvince: String? {
        return getProperty(id: .tagStateOrProvince)
    }
    
    /// [MS-OXOABK] 2.2.4.18 PidTagPostalCode
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPostalCode property ([MS-OXPROPS] section 2.859) contains the postal code for a mail
    /// user's postal address.
    /// [MS-OXOCNTC] 2.1.3.4 PidTagPostalCode
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressPostalCode ([MS-OXPROPS] section 2.359),
    /// PidTagHomeAddressPostalCode ([MS-OXPROPS] section 2.723),
    /// PidTagOtherAddressPostalCode ([MS-OXPROPS] section 2.846), and PidTagPostalCode ([MSOXOABK] section 2.2.4.18) properties specify the postal code (ZIP code) portion of the contact's
    /// Work, Home, Other, or Mailing Address.
    var postalCode: String? {
        return getProperty(id: .tagPostalCode)
    }
    
    /// [MS-OXOABK] 2.2.4.19 PidTagCountry
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCountry property ([MS-OXPROPS] section 2.647) contains the name of a mail user's
    /// country/region.
    /// [MS-OXOCNTC] 2.2.1.3.5 PidTagCountry
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressCountry ([MS-OXPROPS] section 2.357), PidTagHomeAddressCountry
    /// ([MS-OXPROPS] section 2.722), PidTagOtherAddressCountry ([MS-OXPROPS] section 2.845), and
    /// PidTagCountry ([MS-OXOABK] section 2.2.4.19) properties specify the country or region portion of
    /// the contact's Work, Home, Other, or Mailing Address.
    var country: String? {
        return getProperty(id: .tagCountry)
    }
    
    /// [MS-OXOABK] 2.2.4.20 PidTagHomeAddressStreet
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHomeAddressStreet property ([MS-OXPROPS] section 2.724) contains a mail user's
    /// home street address.
    /// [MS-OXOCNCTC] 2.2.1.3.1 PidTagHomeAddressStreet
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidWorkAddressStreet ([MS-OXPROPS] section 2.362), PidTagHomeAddressStreet ([MSOXOABK] section 2.2.4.20), PidTagOtherAddressStreet ([MS-OXPROPS] section 2.849), and
    /// PidTagStreetAddress ([MS-OXOABK] section 2.2.4.14) properties specify the street portion of the
    /// contact's Work, Home, Other, or Mailing Address. These properties can also be used to store the post
    /// office box part of the address, if it exists.
    var homeAddressStreet: String? {
        return getProperty(id: .tagHomeAddressStreet)
    }

    /// [MS-OXOABK] 2.2.4.21 PidTagBusinessTelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBusinessTelephoneNumber property ([MS-OXPROPS] section 2.620) contains the
    /// primary telephone number of a mail user's place of business.
    /// [MS-OXOCNTC] 2.2.1.4.3 PidTagBusinessTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBusinessTelephoneNumber property ([MS-OXOABK] section 2.2.4.21) specifies the
    /// business telephone number for the contact.
    var businessTelephoneNumber: String? {
        return getProperty(id: .tagBusinessTelephoneNumber)
    }

    /// [MS-OXOABK] 2.2.4.22 PidTagHomeTelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHomeTelephoneNumber property ([MS-OXPROPS] section 2.726) contains the primary
    /// telephone number of a mail user's home.
    /// [MS-OXOCNTC] 2.2.1.4.4 PidTagHomeTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHomeTelephoneNumber property ([MS-OXOABK] section 2.2.4.22) specifies the home
    /// telephone number for the contact.
    var homeTelephoneNumber: String? {
        return getProperty(id: .tagHomeTelephoneNumber)
    }

    /// [MS-OXOABK] 2.2.4.23 PidTagBusiness2TelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBusiness2TelephoneNumber property ([MS-OXPROPS] section 2.616) contains a
    /// secondary telephone number at a mail user's place of business.
    /// [MS-OXOCNTC] 2.2.1.4.6 PidTagBusiness2TelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBusiness2TelephoneNumber property ([MS-OXOABK] section 2.2.4.23) specifies the
    /// second business telephone number for the contact.
    var business2TelephoneNumber: String? {
        return getProperty(id: .tagBusiness2TelephoneNumberOrTagBusiness2TelephoneNumbers)
    }

    /// [MS-OXOABK] 2.2.4.24 PidTagBusiness2TelephoneNumbers
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBusiness2TelephoneNumbers property ([MS-OXPROPS] section 2.617) contains
    /// secondary telephone numbers at a mail user's place of business.
    var business2TelephoneNumbers: [String]? {
        return getProperty(id: .tagBusiness2TelephoneNumberOrTagBusiness2TelephoneNumbers)
    }

    /// [MS-OXOABK] 2.2.4.25 PidTagHome2TelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHome2TelephoneNumber property ([MS-OXPROPS] section 2.717) contains a
    /// secondary telephone number at a mail user's home.
    /// [MS-OXOCNTC] 2.2.1.4.12 PidTagHome2TelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHome2TelephoneNumber property ([MS-OXOABK] section 2.2.4.25) specifies a second
    /// home telephone number for the contact.
    var home2TelephoneNumber: String? {
        return getProperty(id: .tagHome2TelephoneNumberOrTagHome2TelephoneNumbers)
    }

    /// [MS-OXOABK] 2.2.4.26 PidTagHome2TelephoneNumbers
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHome2TelephoneNumbers property ([MS-OXPROPS] section 2.718) contains secondary
    /// telephone numbers at a mail user's home.
    var home2TelephoneNumbers: [String]? {
        return getProperty(id: .tagHome2TelephoneNumberOrTagHome2TelephoneNumbers)
    }

    /// [MS-OXOABK] 2.2.4.27 PidTagMobileTelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMobileTelephoneNumber property ([MS-OXPROPS] section 2.798) contains a mail
    /// user's mobile telephone number.
    /// [MS-OXOCNTC] 2.2.1.4.7 PidTagMobileTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMobileTelephoneNumber property ([MS-OXOABK] section 2.2.4.27) specifies the mobile
    /// telephone number for the contact.
    var mobileTelephoneNumber: String? {
        return getProperty(id: .tagMobileTelephoneNumber)
    }

    /// [MS-OXOABK] 2.2.4.28 PidTagPagerTelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPagerTelephoneNumber property ([MS-OXPROPS] section 2.851) contains a mail
    /// user's pager telephone number.
    /// [MS-OXOCNTC] 2.2.1.4.1 PidTagPagerTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPagerTelephoneNumber property ([MS-OXOABK] section 2.2.4.28) specifies the pager
    /// telephone number for the contact.
    var pagerTelephoneNumber: String? {
        return getProperty(id: .tagPagerTelephoneNumber)
    }

    /// [MS-OXOABK] 2.2.4.29 PidTagPrimaryFaxNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPrimaryFaxNumber property ([MS-OXPROPS] section 2.862) contains the telephone
    /// number of a mail user's primary fax machine.
    /// [MS-OXOCNCT] 2.2.1.2.6 PidTagPrimaryFaxNumber
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPrimaryFaxNumber property ([MS-OXOABK] section 2.2.4.29),
    /// PidTagBusinessFaxNumber property ([MS-OXOCNTC] section 2.2.1.2.6), and
    /// PidTagHomeFaxNumber property ([MS-OXOCNTC] section 2.2.1.2.6) properties specify the fax
    /// number for the contact. The string MUST NOT be longer than 255 characters, not including the
    /// terminating null character. There are no other restrictions on the format of these properties.
    var primaryFaxNumber: String? {
        return getProperty(id: .tagPrimaryFaxNumber)
    }

    /// [MS-OXOABK] 2.2.4.30 PidTagTelexNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1) in an OAB file, PtypMultipleBinary ([MSOXCDATA] section 2.11.1) when returned from an NSPI server
    /// The PidTagTelexNumber property ([MS-OXPROPS] section 2.1035) contains a mail user's telex
    /// number.
    /// [MS-OXOCNTC] 2.2.1.4.15 PidTagTelexNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTelexNumber property ([MS-OXOABK] section 2.2.4.30) specifies the telex number for
    /// the contact.
    var telexNumber: String? {
        return getProperty(id: .tagTelexNumber)
    }

    /// [MS-OXOABK] 2.2.4.31 PidTagAssistantTelephoneNumber
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAssistantTelephoneNumber property ([MS-OXPROPS] section 2.577) contains the
    /// telephone number of a mail user's administrative assistant.
    /// [MS-OXOCNTC] 2.2.1.4.11 PidTagAssistantTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAssistantTelephoneNumber property ([MS-OXOABK] section 2.2.4.31) specifies the
    /// telephone number of the contact's assistant.
    var assistantTelephoneNumber: String? {
        return getProperty(id: .tagAssistantTelephoneNumber)
    }

    /// [MS-OXOABK] 2.2.4.32 PidTagKeyword
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagKeyword property ([MS-OXPROPS] section 2.756) contains a keyword that identifies a
    /// mail user to his or her system administrator.
    var keyword: String? {
        return getProperty(id: .tagKeyword)
    }

    /// [MS-OXOABK] 2.2.4.33 PidTagMessageHandlingSystemCommonName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageHandlingSystemCommonName property ([MS-OXPROPS] section 2.786)
    /// contains the common name of a messaging user for use in a message header. This property is readonly.
    var messageHandlingSystemCommonName: String? {
        return getProperty(id: .tagMessageHandlingSystemCommonName)
    }

    /// [MS-OXOABK] 2.2.4.34 PidTagUserCertificate
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagUserCertificate property ([MS-OXPROPS] section 2.1046) has been deprecated. This
    /// property MUST be ignored by clients.
    var userCertificate: Data? {
        return getProperty(id: .tagUserCertificate)
    }

    /// [MS-OXOABK] 2.2.4.35 PidTagAddressBookX509Certificate
    /// Data type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookX509Certificate property ([MS-OXPROPS] section 2.569) contains ASN.1
    /// DER encoded X.509 certificates for a mail user. Each binary value MUST be an ASN.1 DER encoded
    /// X.509 certificate, as specified in [RFC3280].
    var addressBookX509Certificate: [Data]? {
        return getProperty(id: .tagAddressBookX509Certificate)
    }

    /// [MS-OXOABK] 2.2.4.36 PidTagUserX509Certificate
    /// Data type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagUserX509Certificate property ([MS-OXPROPS] section 2.1048) contains a list certificate
    /// for a mail user. Each binary value MUST be either an ASN.1 DER encoded SignedData Type binary
    /// large object (BLOB) that contains the user's certificates and is signed with the user's certificate, as
    /// specified in [RFC3852], or a binary property as specified in the following paragraph.
    /// To determine which of the preceding types each binary value is, the application MUST examine the
    /// first byte of each binary value. If the first byte has the value 0x30, it is an ASN.1 DER encoded
    /// SignedData Type BLOB. Otherwise, the binary value MUST be interpreted according to the format
    /// specified in this section. The client and the server SHOULD use the PidTagUserX509Certificate
    /// property instead of the PidTagAddressBookX509Certificate property (section 2.2.4.35) when
    /// looking for certificates.
    /// [MS-OXOCNTC] 2.2.1.10.23 PidTagUserX509Certificate Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagUserX509Certificate property ([MS-OXPROPS] section 2.1050) specifies a list of
    /// certificates for the contact. The format and semantics of this property are specified in [MS-OXOABK]
    /// section 2.2.4.36. This property is optional.
    var userX509Certificate: [Data]? {
        return getProperty(id: .tagUserX509Certificate)
    }
    
    /// [MS-OXOABK] 2.2.4.37 PidTagAddressBookHomeMessageDatabase
    /// Data type: PtypString8 ([MS-OXCDATA] section 2.11.1) in an OAB file, PtypEmbeddedTable ([MSOXCDATA] section 2.11.1.5) when returned from an NSPI server
    /// The PidTagAddressBookHomeMessageDatabase property ([MS-OXPROPS] section 2.538) contains
    /// the DN of a mail user, expressed in the x500-dn format specification described in section 2.2.1.1, of
    /// an Address Book object that represents the mail user's message store database. The x500-
    /// container-dn portion of the DN is an x500-dn string that references an Address Book object that
    /// represents the mail user's mailbox server. The RDN in the object-rdn of the x500-dn for the mailbox
    /// server's Address Book object is the host-name, as specified in [RFC1034], of the server that contains
    /// the mail user's message store database.
    var addressBookHomeMessageDatabase: String? {
        return getProperty(id: .tagAddressBookHomeMessageDatabase)
    }
  
    /// [MS-OXOABK] 2.2.4.38 PidTagAddressBookNetworkAddress
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookNetworkAddress property ([MS-OXPROPS] section 2.547) contains the
    /// Address Book object of a mailbox server that contains a list of names by which a server is known
    /// to the various transports in use by the network. Each PtypString is a remote procedure call (RPC)
    /// protocol sequence, as specified in [MS-RPCE], followed by a colon (":"), followed by the host-name of
    /// the server under that RPC protocol sequence.
    var addressBookNetworkAddress: [String]? {
        return getProperty(id: .tagAddressBookNetworkAddress)
    }
    
    /// [MS-OXOABK] 2.2.4.39 PidTagAddressBookOrganizationalUnitRootDistinguishedName
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookOrganizationalUnitRootDistinguishedName property ([MS-OXPROPS]
    /// section 2.550) contains the DN of the Organization object of the mail user's organization. When
    /// this property is not present, clients obtain the mail user's organization as described in section
    /// 2.2.7.<31>
    var addressBookOrganizationalUnitRootDistinguishedName: String? {
        return getProperty(id: .tagAddressBookOrganizationalUnitRootDistinguishedName)
    }
    
    /// [MS-OXOABK] 2.2.4.40 PidTagThumbnailPhoto
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagThumbnailPhoto<32> property ([MS-OXPROPS] section 2.1039), if present, MUST
    /// contain an image of a mail user's photo in Joint Photographic Experts Group (JPEG) format.
    var thumbnailPhoto: Data? {
        return getProperty(id: .tagThumbnailPhoto)
    }

    /// [MS-OXOABK] 2.2.4.41 PidTagSpokenName
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSpokenName property<33> ([MS-OXPROPS] section 2.1017), if present, MUST contain
    /// an Advanced Systems Format binary media object, as specified in [ASF] section 9.5, that contains a
    /// recording of the mail user's name pronunciation. The major media type MUST be set to 73647561-
    /// 0000-0010-8000-00AA00389B71, the media subtype MUST be set to 00000001-0000-0010-8000-
    /// 00AA00389B71, and the format type MUST be set to 05589f81-c356-11ce-bf01-00aa0055595a.
    var spokenName: Data? {
        return getProperty(id: .tagSpokenName)
    }

    /// [MS-OXOABK] 2.2.4.42 PidTagAddressBookAuthorizedSenders
    /// Data type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookAuthorizedSenders property<34> ([MS-OXPROPS] section 2.505)
    /// indicates whether delivery restrictions exist for the specified recipient. A value other than NULL
    /// indicates that delivery restrictions exist for this recipient. The address book does not contain the lists
    /// of senders who are allowed for this recipient; it only indicates whether such restrictions exist.
    var addressBookAuthorizedSenders: Data? {
        return getProperty(id: .tagAddressBookAuthorizedSenders)
    }

    /// [MS-OXOABK] 2.2.4.43 PidTagAddressBookUnauthorizedSenders
    /// Data type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookUnauthorizedSenders property<35> ([MS-OXPROPS] section 2.568)
    /// indicates whether delivery restrictions exist for the specified recipient. A value other than NULL
    /// indicates that delivery restrictions exist for this recipient. The address book does not contain the lists
    /// of senders who are prohibited for this recipient; it only indicates whether such restrictions exist.
    var addressBookUnauthorizedSenders: Data? {
        return getProperty(id: .tagAddressBookUnauthorizedSenders)
    }

    /// [MS-OXOABK] 2.2.4.44 PidTagAddressBookDistributionListMemberSubmitAccepted
    /// Data type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDistributionListMemberSubmitAccepted property<36> ([MS-OXPROPS]
    /// section 2.512) indicates whether delivery restrictions exist for the specified recipient. A value other
    /// than NULL indicates that delivery restrictions exist for this recipient. The address book does not
    /// contain the lists of the group of senders who are allowed for this recipient; it only indicates whether
    /// such restrictions exist.
    var addressBookDistributionListMemberSubmitAccepted: Data? {
        return getProperty(id: .tagAddressBookDistributionListMemberSubmitAccepted)
    }

    /// [MS-OXOABK] 2.2.4.45 PidTagAddressBookDistributionListMemberSubmitRejected
    /// Data type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDistributionListMemberSubmitRejected property<37> ([MS-OXPROPS]
    /// section 2.513) indicates whether delivery restrictions exist for this recipient. A value other than NULL
    /// indicates that delivery restrictions exist for this recipient. The address book does not contain the lists
    /// of the group of senders who are prohibited for this recipient; it only indicates whether such restrictions
    /// exist.
    var addressBookDistributionListMemberSubmitRejected: Data? {
        return getProperty(id: .tagAddressBookDistributionListMemberSubmitRejected)
    }

    /// [MS-OXOABK] 2.2.5.1 PidTagAddressBookManager
    /// Data type: PtypObject ([MS-OXCDATA] section 2.11.1.5)
    /// The PidTagAddressBookManager property ([MS-OXPROPS] section 2.542) contains one row that
    /// references a mail user's manager.
    var addressBookManager: Data? {
        return getProperty(id: .tagAddressBookManagerOrTagAddressBookManagerDistinguishedName)
    }
    
    /// [MS-OXOABK] 2.2.5.2 PidTagAddressBookReports
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookReports property ([MS-OXPROPS] section 2.561) lists all of the mail
    /// user's direct reports.
    var addressBookReports: Data? {
        return getProperty(id: .tagAddressBookReports)
    }
    
    /// [MS-OXOABK] 2.2.5.3 PidTagAddressBookIsMemberOfDistributionList
    /// Data type: PtypString8 ([MS-OXCDATA] section 2.11.1) in an OAB file, PtypEmbeddedTable ([MSOXCDATA] section 2.11.1.5) when returned from an NSPI server.
    /// The PidTagAddressBookIsMemberOfDistributionList property<41> ([MS-OXPROPS] section
    /// 2.540) is an Address Book object that lists all the distribution lists for which a specified object is a
    /// member.
    var addressBookIsMemberOfDistributionList: String? {
        return getProperty(id: .tagAddressBookIsMemberOfDistributionList)
    }
    
    /// [MS-OXOABK] 2.2.5.4 PidTagAddressBookOwnerBackLink
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookOwnerBackLink property ([MS-OXPROPS] section 2.552) is a mail user
    /// list that contains the distribution lists that the mail user owns.
    var addressBookOwnerBackLink: Data? {
        return getProperty(id: .tagAddressBookOwnerBackLink)
    }
    
    /// [MS-OXOABK] 2.2.5.5 PidTagAddressBookPublicDelegates
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookPublicDelegates property ([MS-OXPROPS] section 2.560) contains a list of
    /// mail users who are allowed to send mail on behalf of the mailbox owner.
    var addressBookPublicDelegates: Data? {
        return getProperty(id: .tagAddressBookPublicDelegates)
    }

    /// [MS-OXOABK] 2.2.5.6 PidTagAddressBookHierarchicalShowInDepartments
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookHierarchicalShowInDepartments property ([MS-OXPROPS] section
    /// 2.537) is a mail user list that contains all of the Department objects of which the mail user is a
    /// member.
    var addressBookHierarchicalShowInDepartments: Data? {
        return getProperty(id: .tagAddressBookHierarchicalShowInDepartments)
    }

    /// [MS-OXOABK] 2.2.6.1 PidTagAddressBookMember
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookMember property<42> ([MS-OXPROPS] section 2.544) contains the
    /// members of a distribution list. If the distribution list is also a departmental group (as specified by
    /// the PidTagAddressBookHierarchicalIsHierarchicalGroup property (section 2.2.6.5)), the
    /// PidTagAddressBookMember property contains the members of the department and the child
    /// departmental groups in the hierarchy of departments.
    var addressBookMember: Data? {
        return getProperty(id: .tagAddressBookMember)
    }
    
    /// [MS-OXOABK] 2.2.6.2 PidTagAddressBookOwner
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookOwner property ([MS-OXPROPS] section 2.551) contains one row that
    /// references a distribution list's owner.
    var addressBookOwner: Data? {
        return getProperty(id: .tagAddressBookOwner)
    }
    
    /// [MS-OXOABK] 2.2.6.3 PidTagContainerContents
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContainerContents property ([MS-OXPROPS] section 2.637) contains a distribution list
    /// that is always empty. An NSPI server MUST define this value for distribution lists. This value is not
    /// present for any other objects.
    /// [MS-OXCFXICS] 2.2.1.7 Properties That Denote Subobjects
    /// The properties in the following tables denote subobjects of the messaging objects and can be used
    /// in the following:
    ///  The property inclusion and exclusion lists of ROPs that configure download operations. For
    /// example, the RopSynchronizationConfigure ROP (section 2.2.3.2.1.1) and the
    /// RopFastTransferSourceCopyTo ROP (section 2.2.3.1.1.1) both configure download operations.
    ///  As values of MetaTagFXDelProp meta-properties, as specified in section 2.2.4.1.5.1.
    /// PidTagContainerContents
    /// Identifies all normal messages in the current folder.
    var containerContents: Data? {
        return getProperty(id: .tagContainerContents)
    }
    
    /// [MS-OXOABK] 2.2.6.4 PidTagAddressBookFolderPathname
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookFolderPathname property ([MS-OXPROPS] section 2.531) has been
    /// deprecated and MUST be ignored by clients.
    var addressBookFolderPathname: String? {
        return getProperty(id: .tagAddressBookFolderPathname)
    }
    
    /// [MS-OXOABK] 2.2.6.5 PidTagAddressBookHierarchicalIsHierarchicalGroup
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookHierarchicalIsHierarchicalGroup property<43> ([MS-OXPROPS] section
    /// 2.534) contains TRUE (0x01) if the distribution list represents a departmental group. Members of
    /// this departmental group that are also distribution lists with the
    /// PidTagAddressBookHierarchicalIsHierarchicalGroup property set to TRUE represent the child
    /// department of this departmental group in a hierarchy of departments. Other members represent
    /// members of this departmental group. If the distribution list is not a departmental group, the
    /// PidTagAddressBookHierarchicalIsHierarchicalGroup property can be either FALSE (0x00) or
    /// absent.
    var addressBookHierarchicalIsHierarchicalGroup: Bool? {
        return getProperty(id: .tagAddressBookHierarchicalIsHierarchicalGroup)
    }
    
    /// [MS-OXOABK] 2.2.7.1 PidTagAddressBookRoomContainers
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookRoomContainers property ([MS-OXPROPS] section 2.563) contains a list
    /// of DNs representing the address book containers that hold Resource objects, such as conference
    /// rooms and equipment. Messaging clients use this list to determine which containers have mainly
    /// Resource objects so that they can perform special actions on these containers, such as displaying a
    /// different column set when browsing address lists that are represented by these containers, or using
    /// features that require selecting from a set of rooms or equipment.
    /// The DNs in the PidTagAddressBookRoomContainers property each use the x500-dn format
    /// specification, as specified in section 2.2.1.1, with the additional requirement that there is no
    /// container-rdn in its x500-dn and that the RDN of the object-rdn follows the container-guid format
    /// specification. When the RDN is extracted from the DN, it represents the GUID of the address book
    /// container that this is referencing. Messaging clients compare this GUID to the GUID of another
    /// address book container by extracting that GUID from the container-guid of the other container's DN,
    /// which follows the addresslist-dn format specification. If the GUIDs are the same, the other address
    /// book container is a room container.
    var addressBookRoomContainers: [String]? {
        return getProperty(id: .tagAddressBookHierarchicalIsHierarchicalGroup)
    }
    
    /// [MS-OXOABK] 2.2.7.2 PidTagAddressBookHierarchicalRootDepartment
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookHierarchicalRootDepartment property ([MS-OXPROPS] section 2.536)
    /// contains a reference to either the root Department object or the root departmental group in the
    /// department hierarchy for an organization.<45> The table has either zero rows or one row, which
    /// references a Department object or departmental group. If either the Organization object is missing,
    /// this property is missing, or the property value is empty, the NSPI server does not have a department
    /// hierarchy for that organization.
    var addressBookHierarchicalRootDepartment: Data? {
        return getProperty(id: .tagAddressBookHierarchicalRootDepartment)
    }
    
    /// [MS-OXOABK] 2.2.8.1 PidTagAddressBookHierarchicalChildDepartments
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookHierarchicalChildDepartments property ([MS-OXPROPS] section 2.532)
    /// contains a Department object that references the child departments in a hierarchy of departments.
    var addressBookHierarchicalChildDepartments: Data? {
        return getProperty(id: .tagAddressBookHierarchicalChildDepartments)
    }
    
    /// [MS-OXOABK] 2.2.8.2 PidTagAddressBookHierarchicalParentDepartment
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookHierarchicalParentDepartment property ([MS-OXPROPS] section 2.535)
    /// contains a Department object that references all of the departments to which this specified
    /// department is a child department.
    var addressBookHierarchicalParentDepartment: Data? {
        return getProperty(id: .tagAddressBookHierarchicalParentDepartment)
    }
    
    /// [MS-OXOABK] 2.2.8.3 PidTagAddressBookHierarchicalDepartmentMembers
    /// Data type: PtypEmbeddedTable ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookHierarchicalDepartmentMembers property ([MS-OXPROPS] section
    /// 2.533) contains a Department object that lists all of the mail users that belong to a specified
    /// department.
    var addressBookHierarchicalDepartmentMembers: Data? {
        return getProperty(id: .tagAddressBookHierarchicalDepartmentMembers)
    }
    
    /// [MS-OXOABK] 2.2.9.1 PidTagAddressBookRoomCapacity
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookRoomCapacity property ([MS-OXPROPS] section 2.562) contains the
    /// maximum occupancy of a specified room.
    var addressBookRoomCapacity: UInt32? {
        return getProperty(id: .tagAddressBookRoomCapacity)
    }
    
    /// [MS-OXOABK] 2.2.9.2 PidTagAddressBookRoomDescription
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookRoomDescription property ([MS-OXPROPS] section 2.564) contains a
    /// description of a Resource object.
    var addressBookRoomDescription: String? {
        return getProperty(id: .tagAddressBookRoomDescription)
    }
    
    /// [MS-OXOABK] 2.2.10.1 PidTagAnr
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAnr property ([MS-OXPROPS] section 2.572) is a special property that is not actually a
    /// property on the Address Book objects themselves. Rather, this property is used by messaging
    /// clients as a property value in the Filter parameter of the NspiGetMatches method,<47> as specified
    /// in [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.10, or in the Filter field of the GetMatches request
    /// body,<48> as specified in [MS-OXCMAPIHTTP] section 2.2.5.5.1. Messaging clients pass this property
    /// as a target string in the NspiGetMatches method or GetMatches request body to identify objects in
    /// an address list that are possible matches for the target string. This operation is known as
    /// ambiguous name resolution (ANR), as specified in [MS-NSPI] and [MS-OXNSPI] section
    /// 3.1.4.7.<49> An address book server responds by returning the Minimal Entry IDs of all Address
    /// Book objects that are possible matches against the target string. This protocol does not prescribe the
    /// choice of ANR results of an address book server.<50>
    /// An offline address book (OAB) does not contain this property for any Address Book objects. It is up
    /// to messaging clients to determine how to perform name matching among the objects in an OAB.
    var anr: String? {
        return getProperty(id: .tagAnr)
    }
    
    /// [MS-OXOABK] 2.2.10.2 PidTagAddressBookManageDistributionList
    /// Data type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookManageDistributionList property ([MS-OXPROPS] section 2.541) is a
    /// property tag for use in display templates for distribution lists. When the value for the
    /// PidTagAddressBookManageDistributionList property is the dwType property tag in a button
    /// control to a CNTRL structure of a display template, it tells messaging clients to include a button in the
    /// user interface to enable them to edit the members of a distribution list. For details about the button
    /// control for a template, see [MS-OXOABKT] section 2.2.2.1.3.6. This is not a property of objects in an
    /// address book.
    var addressBookManageDistributionList: Data? {
        return getProperty(id: .tagAddressBookManageDistributionList)
    }
}
