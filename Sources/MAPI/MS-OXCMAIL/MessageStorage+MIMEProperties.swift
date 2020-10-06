//
//  MessageStorage+MIMEProperties.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-OXCMAIL] 2.5 Message Object Properties
/// This algorithm specifies the following additional properties for Message objects.
///  PidLidClassificationGuid (section 2.5.1)
///  PidLidClassificationKeep (section 2.5.2)
///  PidNameQuarantineOriginalSender (section 2.5.4)
public extension MessageStorage {
    /// [MS-OXCMAIL] 2.5.1 PidLidClassificationGuid
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidClassificationGuid property ([MS-OXPROPS] section 2.54) is an optional property on
    /// Message objects. Its value is the value of the X-Microsoft-ClassID header.
    var classificationGuid: String? {
        return getProperty(name: .lidClassificationGuid)
    }

    /// [MS-OXCMAIL] 2.5.2 PidLidClassificationKeep
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidClassificationKeep property ([MS-OXPROPS] section 2.55) is an optional property on
    /// Message objects. Its value is the value of the X-Microsoft-ClassKeep header.
    var classificationKeep: Bool? {
        return getProperty(name: .lidClassificationKeep)
    }
    
    /// [MS-OXCMAIL] 2.5.3 PidNameCrossReference
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCrossReference property ([MS-OXPROPS] section 2.413) is an optional property on
    /// Message objects. Its value is the value of the XRef header.
    var crossReference: String? {
        return getProperty(name: .nameCrossReference)
    }
    
    /// [MS-OXCMAIL] 2.5.4 PidNameQuarantineOriginalSender
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameQuarantineOriginalSender property ([MS-OXPROPS] section 2.466) is an optional
    /// property on Message objects. Its value is the value of the X-MS-Exchange-OrganizationOriginal-Sender header.
    var quarantineOriginalSender: String? {
        return getProperty(name: .nameQuarantineOriginalSender)
    }
}
