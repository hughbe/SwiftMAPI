//
//  MessageStorage+ClientExtensionProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXCEXT] 2.2.2 Known Entity Properties
/// The following properties contain information about known entities, as specified in [MS-OWEMXML],
/// contained in Message objects.
public extension MessageStorage {
    /// [MS-OXCEXT] 2.2.2.1 PidNameExtractedAddresses Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedAddresses property ([MS-OXPROPS] section 2.432) on a
    /// Message object contains an XML document with a single AddressSet element, as specified in
    /// section 2.2.3.1.3.
    var extractedAddresses: String? {
        return getProperty(name: .nameExtractedAddresses)
    }

    /// [MS-OXCEXT] 2.2.2.2 PidNameExtractedContacts Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedContacts property ([MS-OXPROPS] section 2.433) on a
    /// Message object contains an XML document with a single ContactSet element, as specified in
    /// section 2.2.3.1.10.
    var extractedContacts: String? {
        return getProperty(name: .nameExtractedContacts)
    }

    /// [MS-OXCEXT] 2.2.2.3 PidNameExtractedEmails Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedEmails property ([MS-OXPROPS] section 2.434) on a Message
    /// object contains an XML document with a single EmailSet element, as specified in section
    /// 2.2.3.1.14.
    var extractedEmails: String? {
        return getProperty(name: .nameExtractedEmails)
    }

    /// [MS-OXCEXT] 2.2.2.4 PidNameExtractedMeetings Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedMeetings property ([MS-OXPROPS] section 2.435) on a
    /// Message object contains an XML document with a single MeetingSet element, as specified in
    /// section 2.2.3.1.20.
    var extractedMeetings: String? {
        return getProperty(name: .nameExtractedMeetings)
    }

    /// [MS-OXCEXT] 2.2.2.5 PidNameExtractedPhones Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedPhones property ([MS-OXPROPS] section 2.436) on a Message
    /// object contains an XML document with a single PhoneSet element, as specified in section
    /// 2.2.3.1.27.
    var extractedPhones: String? {
        return getProperty(name: .nameExtractedPhones)
    }

    /// [MS-OXCEXT] 2.2.2.6 PidNameExtractedTasks Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedTasks property ([MS-OXPROPS] section 2.437) on a Message
    /// object contains an XML document with a single TaskSet element, as specified in section 2.2.3.1.32.
    var extractedTasks: String? {
        return getProperty(name: .nameExtractedTasks)
    }

    /// [MS-OXCEXT] 2.2.2.7 PidNameExtractedUrls Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameExtractedUrls ([MS-OXPROPS] section 2.438) property on a Message
    /// object contains an XML document with a single UrlSet element, as specified in section 2.2.3.1.36.
    var extractedUrls: String? {
        return getProperty(name: .nameExtractedUrls)
    }
}
