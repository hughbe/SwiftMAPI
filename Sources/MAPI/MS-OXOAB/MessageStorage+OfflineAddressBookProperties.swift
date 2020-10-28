//
//  MessageStorage+OfflineAddressBookProperties.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import Foundation

/// [MS-OXOAB] 2.12 Properties
/// The properties that are common to both full and differential OAB messages are defined in the following subsections.
public extension MessageStorage {
    /// [MS-OXOAB] 2.12.1 PidTagOfflineAddressBookContainerGuid
    /// The PidTagOfflineAddressBookContainerGuid property ([MS-OXPROPS] section 2.809) contains a
    /// GUID that identifies a set of full and differential OAL files that form a complete OAL, ordered by their
    /// OAL data sequence numbers, as specified by the PidTagOfflineAddressBookSequence property
    /// in section 2.12.4. A server MUST set this property to the same value for every full and differential
    /// OAB message in a sequence, but the server MUST set this to a different value for unrelated sequences
    /// of files.
    /// [MS-OXOPFOAB] 2.2 Message Syntax
    /// [MS-OXOPFOAB] 2.2.1 OAB Messages
    /// OAB data is stored as a set of properties and attachments on a message in the public folders
    /// message store.<1> The message is referred to as the full OAB message or differential OAB
    /// message. The location of this message is specified in section 3. Unless otherwise specified, the OAB
    /// messages adhere to the format specified in [MS-OXCMSG].
    /// There are two types of OAB messages — full messages and differential messages — with some
    /// additional differences related to the version of the OAB. Full messages contain all of the information
    /// that is needed to create a current OAB. Differential messages contain enough information to update a
    /// previous OAB to a more current OAB. The following properties are common to all OAB messages that
    /// use public folder retrieval.
    ///  PidTagOfflineAddressBookName, as specified in [MS-OXOAB] section 2.12.3.
    ///  PidTagOfflineAddressBookSequence, as specified in [MS-OXOAB] section 2.12.4.
    ///  PidTagOfflineAddressBookContainerGuid, as specified in [MS-OXOAB] section 2.12.1.
    ///  PidTagOfflineAddressBookDistinguishedName, as specified in [MS-OXOAB] section 2.12.2.
    ///  PidTagSortLocaleId, as specified in section 2.2.1.1.
    ///  PidTagMessageCodepage, as specified in section 2.2.1.2
    ///  PidTagParentEntryId, as specified in section 2.2.1.4.
    ///  PidTagEntryId, as specified in section 2.2.1.5.
    var offlineAddressBookContainerGuid: String? {
        return getProperty(id: .tagOfflineAddressBookContainerGuidOrTagRwRulesStreamOrTagSenderTelephoneNumber)
    }
    
    /// [MS-OXOAB] 2.12.2 PidTagOfflineAddressBookDistinguishedName
    /// The PidTagOfflineAddressBookDistinguishedName property ([MS-OXPROPS] section 2.810)
    /// contains the distinguished name (DN) (1) of the address list that is contained in the OAB
    /// message. This DN (1) is addresslist-x500-DN, as specified in section 2.1. It MUST match the DN (1)
    /// that is returned by the name service provider interface (NSPI) protocol for the address list.
    /// [MS-OXOPFOAB] 2.2 Message Syntax
    /// [MS-OXOPFOAB] 2.2.1 OAB Messages
    /// OAB data is stored as a set of properties and attachments on a message in the public folders
    /// message store.<1> The message is referred to as the full OAB message or differential OAB
    /// message. The location of this message is specified in section 3. Unless otherwise specified, the OAB
    /// messages adhere to the format specified in [MS-OXCMSG].
    /// There are two types of OAB messages — full messages and differential messages — with some
    /// additional differences related to the version of the OAB. Full messages contain all of the information
    /// that is needed to create a current OAB. Differential messages contain enough information to update a
    /// previous OAB to a more current OAB. The following properties are common to all OAB messages that
    /// use public folder retrieval.
    ///  PidTagOfflineAddressBookName, as specified in [MS-OXOAB] section 2.12.3.
    ///  PidTagOfflineAddressBookSequence, as specified in [MS-OXOAB] section 2.12.4.
    ///  PidTagOfflineAddressBookContainerGuid, as specified in [MS-OXOAB] section 2.12.1.
    ///  PidTagOfflineAddressBookDistinguishedName, as specified in [MS-OXOAB] section 2.12.2.
    ///  PidTagSortLocaleId, as specified in section 2.2.1.1.
    ///  PidTagMessageCodepage, as specified in section 2.2.1.2
    ///  PidTagParentEntryId, as specified in section 2.2.1.4.
    ///  PidTagEntryId, as specified in section 2.2.1.5.
    var offlineAddressBookDistinguishedName: String? {
        return getProperty(id: .tagFaxNumberOfPagesOrTagOfflineAddressBookDistinguishedName)
    }
    
    /// [MS-OXOAB] 2.12.3 PidTagOfflineAddressBookName
    /// The PidTagOfflineAddressBookName property ([MS-OXPROPS] section 2.812) contains the name
    /// of the address list that is contained in the OAB message.
    /// [MS-OXOPFOAB] 2.2 Message Syntax
    /// [MS-OXOPFOAB] 2.2.1 OAB Messages
    /// OAB data is stored as a set of properties and attachments on a message in the public folders
    /// message store.<1> The message is referred to as the full OAB message or differential OAB
    /// message. The location of this message is specified in section 3. Unless otherwise specified, the OAB
    /// messages adhere to the format specified in [MS-OXCMSG].
    /// There are two types of OAB messages — full messages and differential messages — with some
    /// additional differences related to the version of the OAB. Full messages contain all of the information
    /// that is needed to create a current OAB. Differential messages contain enough information to update a
    /// previous OAB to a more current OAB. The following properties are common to all OAB messages that
    /// use public folder retrieval.
    ///  PidTagOfflineAddressBookName, as specified in [MS-OXOAB] section 2.12.3.
    ///  PidTagOfflineAddressBookSequence, as specified in [MS-OXOAB] section 2.12.4.
    ///  PidTagOfflineAddressBookContainerGuid, as specified in [MS-OXOAB] section 2.12.1.
    ///  PidTagOfflineAddressBookDistinguishedName, as specified in [MS-OXOAB] section 2.12.2.
    ///  PidTagSortLocaleId, as specified in section 2.2.1.1.
    ///  PidTagMessageCodepage, as specified in section 2.2.1.2
    ///  PidTagParentEntryId, as specified in section 2.2.1.4.
    ///  PidTagEntryId, as specified in section 2.2.1.5.
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list
    /// the FAI Message objects in the Folder object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of NID_ASSOC_CONTENTS_TABLE_TEMPLATE
    /// (0x60F). The FAI contents table template MUST have no data rows, and MUST contain the following property columns.
    /// 0x6800 PtypString PidTagOfflineAddressBookName OAB name. And it hasan alternate name PidTagOfflineAddressBookName_W. Y
    var offlineAddressBookName: String? {
        return getProperty(id: .tagOfflineAddressBookName)
    }
    
    /// [MS-OXOAB] 2.12.4 PidTagOfflineAddressBookSequence
    /// The PidTagOfflineAddressBookSequence property ([MS-OXPROPS] section 2.813) contains the
    /// OAL data sequence number of the attached full or differential OAL files.
    /// An integer that is associated with offline address list (OAL) data that represents the generation
    /// number of this data. The value of the initial sequence number is "1". Each subsequent data generation
    /// process that produces a data set that is not identical to the previous data set is incremented by one.
    /// [MS-OXOPFOAB] 2.2 Message Syntax
    /// [MS-OXOPFOAB] 2.2.1 OAB Messages
    /// OAB data is stored as a set of properties and attachments on a message in the public folders
    /// message store.<1> The message is referred to as the full OAB message or differential OAB
    /// message. The location of this message is specified in section 3. Unless otherwise specified, the OAB
    /// messages adhere to the format specified in [MS-OXCMSG].
    /// There are two types of OAB messages — full messages and differential messages — with some
    /// additional differences related to the version of the OAB. Full messages contain all of the information
    /// that is needed to create a current OAB. Differential messages contain enough information to update a
    /// previous OAB to a more current OAB. The following properties are common to all OAB messages that
    /// use public folder retrieval.
    ///  PidTagOfflineAddressBookName, as specified in [MS-OXOAB] section 2.12.3.
    ///  PidTagOfflineAddressBookSequence, as specified in [MS-OXOAB] section 2.12.4.
    ///  PidTagOfflineAddressBookContainerGuid, as specified in [MS-OXOAB] section 2.12.1.
    ///  PidTagOfflineAddressBookDistinguishedName, as specified in [MS-OXOAB] section 2.12.2.
    ///  PidTagSortLocaleId, as specified in section 2.2.1.1.
    ///  PidTagMessageCodepage, as specified in section 2.2.1.2
    ///  PidTagParentEntryId, as specified in section 2.2.1.4.
    ///  PidTagEntryId, as specified in section 2.2.1.5. 
    var offlineAddressBookSequence: UInt32? {
        return getProperty(id: .tagOfflineAddressBookSequenceOrTagVoiceMessageDuration)
    }
}
