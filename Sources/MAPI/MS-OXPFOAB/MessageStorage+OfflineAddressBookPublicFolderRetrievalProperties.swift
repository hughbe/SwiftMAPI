//
//  MessageStorage+OfflineAddressBookPublicFolderRetrievalProperties.swift
//  
//
//  Created by Hugh Bellamy on 01/10/2020.
//

import Foundation

/// [MS-OXPFOAB] 2.2.2 Full OAB Messages
/// [MS-OXPFOAB] 2.2.2.1 Properties and Attachments
/// [MS-OXPFOAB] 2.2.3 Differential OAB Messages
/// [MS-OXPFOAB] 2.2.3.1 Properties and Attachments
public extension MessageStorage {
    /// [MS-OXPFOAB] 2.2.2.1.1 PidTagOfflineAddressBookMessageClass
    /// This property is set to 1 for all full OAB messages. For details, see [MS-OXPROPS] section 2.808.
    /// [MS-OXPFOAB] 2.2.3.1.1 PidTagOfflineAddressBookMessageClass
    /// This property MUST be set to 2 for all differential OAB messages. For details, see [MS-OXPROPS] section 2.808.
    var offlineAddressBookMessageClass: UInt32? {
        return getProperty(id: .tagOfflineAddressBookMessageClassOrTagVoiceMessageSenderName)
    }
}
