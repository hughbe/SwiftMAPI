//
//  MessageStorage+RightsBasedEmailProperties.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

import Foundation

/// [MS-OXORMMS] 2.2 Message Syntax
/// A rights-managed email message consists of a set of Message object property constraints,
/// including a Use License, and an attachment containing an encrypted version of the original message.
/// The protocol defines several data formats to support rights-managed email messages in addition to
/// those specified in [MS-DTYP].
/// Unless otherwise specified, rights-managed email Message objects adhere to all property constraints
/// specified in [MS-OXCMSG]. A rights-managed email Message object can also contain other properties,
/// but these properties have no impact on this protocol.<1>
/// [MS-OXORMMS] 2.2.1 Rights-Managed Email Message Property
/// The property specified in section 2.2.1.1 is specific to the Rights-Managed Email Object Protocol.
public extension MessageStorage {
    /// [MS-OXORMMS] 2.2.1.1 PidNameRightsManagementLicense Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidNameRightsManagementLicense property ([MS-OXPROPS] section 2.468) is a named
    /// property that is used to cache the Use License for the rights-managed email message. If the Use
    /// License is successfully obtained, this property SHOULD<2> be present on a rights-managed email
    /// Message object. If the property is present, the first value of this property MUST contain the
    /// compressed Use License for the rights-managed email message. The compression format for the Use
    /// License is specified in [RFC1950]. When uncompressed, the resulting data is a length-prefixed
    /// Unicode string that is formatted as follows.
    var rightsManagementLicense: Data? {
        return getProperty(name: .nameRightsManagementLicense)
    }
}
