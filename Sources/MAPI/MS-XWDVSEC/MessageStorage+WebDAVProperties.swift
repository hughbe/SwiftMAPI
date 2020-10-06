//
//  MessageStorage+WebDAVProperties.swift
//  
//
//  Created by Hugh Bellamy on 01/10/2020.
//

/// [MS-XWDVSEC] 2.2 Message Syntax
/// The security descriptor property adds to the set of WebDAV properties, as specified in [RFC2518]
/// section 13. The WebDAV Protocol Security Extensions use the PROPFIND and PROPPATCH WebDAV
/// methods specified in [RFC2518] sections 8.1 and 8.2 to get and set this property. This property is an
/// XML representation of a security descriptor. The type of this property is specified by using XML
/// schema definition (XSD) grammar, as specified in [XMLSCHEMA1/2]. This property is represented
/// by the descriptor XML element, which extends the security_descriptor element defined in the
/// http://schemas.microsoft.com/security/ XML namespace. The XSD for this property is defined as
/// follows.
public extension MessageStorage {
    /// [MS-XWDVSEC] 2.2.2 PidTagSecurityDescriptorAsXml Property
    /// Data type: PtypString
    /// The PidTagSecurityDescriptorAsXml property ([MS-OXPROPS] section 2.989) exposes a security
    /// descriptor that represents an entity's security attributes in XML. These attributes specify who owns
    /// the entity, who can access it, what they can do with it, what level of audit logging can be applied to
    /// the entity, and what kind of restrictions apply to the use of the security descriptor. The security
    /// descriptor is a limited XML version of the SECURITY_DESCRIPTOR structure, as specified in [MSDTYP]. The content of the security descriptor is specified by the security_descriptor element, as
    /// specified in section 2.2.3. The schema that specifies the possible values for the security_descriptor
    /// element is specified in section 2.2.
    /// Note that the XML security descriptor format does not have a way of transmitting the
    /// SECURITY_INFORMATION structure, as specified in [MS-DTYP], which is needed to set the security
    /// descriptor on the entity. Instead, the SECURITY_INFORMATION structure is derived from the
    /// presence or absence of fields in the XML security descriptor. For example, to set only the DACL on an
    /// entity, this property is set with only a DACL in it.
    /// It is possible for a WebDAV client to get this property on an entity when (1) the client created the
    /// entity, (2) the client has administrator rights, (3) the entity is in the client's mailbox, and (4) the
    /// entity is in a public folder.
    /// It is possible for a client to set this property on an entity when (1) the client created the entity, (2)
    /// the client has administrator rights, (3) the entity is in the client's mailbox, and (4) the entity is in a
    /// public folder on which the client has owner permissions.
    var securityDescriptorAsXml: String? {
        return getProperty(id: .tagSecurityDescriptorAsXml)
    }
}
