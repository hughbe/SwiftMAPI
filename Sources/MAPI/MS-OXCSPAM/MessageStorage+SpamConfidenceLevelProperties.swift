//
//  MessageStorage+SpamConfidenceLevelProperties.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCSPAM] 2.2 Message Syntax
/// [MS-OXCSPAM] 2.2.1 Message Object Properties
/// The properties persisted on a Message object are listed in sections 2.2.1.1 through 2.2.1.3.
/// [MS-OXCSPAM] 2.2.2 Junk Email Rule Properties
/// The properties persisted on the Junk Email rule are listed in sections 2.2.2.1 through 2.2.2.6.
/// [MS-OXCSPAM] 2.2.3 Inbox Folder Properties
/// The property listed in section 2.2.3.1 is on the Inbox folder.
public extension MessageStorage {
    /// [MS-OXCSPAM] 2.2.1.1 PidLidSpamOriginalFolder Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSpamOriginalFolder property ([MS-OXPROPS] section 2.302) specifies the folder that contained the message before the
    /// message was moved into the Junk Email folder. The value of this property is the entry ID of the folder.
    var spamOriginalFolder: EntryID? {
        guard let data: Data = getProperty(name: .lidSpamOriginalFolder) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCSPAM] 2.2.1.2 PidNameExchangeJunkEmailMoveStamp Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameExchangeJunkEmailMoveStamp property ([MS-OXPROPS] section 2.422), if present
    /// and valid, indicates that either the message was already processed or the message is safe. The value
    /// of this property is valid only if it matches the value at index 5 of the PidTagAdditionalRenEntryIds
    /// property (section 2.2.3.1).
    /// If the PidNameExchangeJunkEmailMoveStamp property is not present or if the value of the
    /// PidNameExchangeJunkEmailMoveStamp property is not valid, the message MUST be processed
    /// by the client's spam filter.
    /// [MS-OXORSS] 2.2.2.1 PidNameExchangeJunkEmailMoveStamp Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameExchangeJunkEmailMoveStamp property ([MS-OXCSPAM] section 2.2.1.2) MUST be
    /// set on all RSS objects.
    var exchangeJunkEmailMoveStamp: UInt32? {
        return getProperty(name: .nameExchangeJunkEmailMoveStamp)
    }
    
    /// [MS-OXCSPAM] 2.2.1.3 PidTagContentFilterSpamConfidenceLevel Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContentFilterSpamConfidenceLevel property ([MS-OXPROPS] section 2.641) indicates
    /// the likelihood that the e-mail message is spam. The value MUST be in the range -1 to 9 (inclusive).
    /// The value -1 indicates that the message is not spam, and a value greater than -1 indicates that the
    /// message likely is spam. The greater the number, the higher the likelihood that the message is spam,
    /// with 9 indicating the highest likelihood. This property SHOULD be set by the server's spam filter
    /// before the Junk Email rule is executed.
    var contentFilterSpamConfidenceLevel: Int32? {
        guard let rawValue: UInt32 = getProperty(id: .tagContentFilterSpamConfidenceLevel) else {
            return nil
        }
        
        return Int32(bitPattern: rawValue)
    }
    
    /// [MS-OXCSPAM] 2.2.2.1 PidTagJunkAddRecipientsToSafeSendersList Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagJunkAddRecipientsToSafeSendersList property ([MS-OXPROPS] section 2.751) MUST
    /// be set to either 0 (zero) or 1. The value 1 indicates that the mail recipients are to be added to the
    /// safe senders list. The value zero indicates that the mail recipients are not to be added to the safe
    /// senders list. The safe senders list is a collection of e-mail addresses that represent senders whose
    /// messages are never marked as spam.
    var junkAddRecipientsToSafeSendersList: UInt32? {
        return getProperty(id: .tagJunkAddRecipientsToSafeSendersList)
    }
    
    /// [MS-OXCSPAM] 2.2.2.2 PidTagJunkIncludeContacts Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagJunkIncludeContacts property ([MS-OXPROPS] section 2.752) indicates whether e-mail
    /// messages from contacts can be treated as junk.
    /// If this property is set to 1, the Junk Email rule MUST specify conditions such that e-mail messages
    /// from contacts are never treated as junk. If this property is set to 0 (zero), the Junk Email rule MUST
    /// specify conditions such that e-mail messages from contacts can be treated as junk. The conditions of
    /// the Junk Email rule are specified in the PidTagExtendedRuleMessageCondition property ([MSOXORULE] section 2.2.4.1.10). For details about creating the Junk Email rule, see section 3.1.4.1.
    var junkIncludeContacts: Bool? {
        guard let rawValue: UInt32 = getProperty(id: .tagJunkIncludeContacts) else {
            return nil
        }
        
        return rawValue != 0
    }
    
    /// [MS-OXCSPAM] 2.2.2.3 PidTagJunkPermanentlyDelete Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagJunkPermanentlyDelete property ([MS-OXPROPS] section 2.753) indicates whether
    /// spam messages can be permanently deleted. If this property is set to 1, messages identified as spam
    /// can be permanently deleted. If this property is set to 0 (zero), messages identified as spam cannot be
    /// permanently deleted.
    var junkPermanentlyDelete: Bool? {
        guard let rawValue: UInt32 = getProperty(id: .tagJunkPermanentlyDelete) else {
            return nil
        }
        
        return rawValue != 0
    }
    
    /// [MS-OXCSPAM] 2.2.2.4 PidTagJunkPhishingEnableLinks Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagJunkPhishingEnableLinks property ([MS-OXPROPS] section 2.754) indicates whether
    /// the phishing stamp on the message can be ignored. If the value is nonzero (TRUE), the phishing
    /// stamp, as specified in [MS-OXPHISH] section 2.2.1.1, can be ignored. If the value is zero (FALSE), the
    /// phishing stamp on the message cannot be ignored.
    var junkPhishingEnableLinks: Bool? {
        return getProperty(id: .tagJunkPhishingEnableLinks)
    }
    
    /// [MS-OXCSPAM] 2.2.2.5 PidTagJunkThreshold Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagJunkThreshold property ([MS-OXPROPS] section 2.755) indicates how aggressively the
    /// client is to send incoming mail to the Junk Email folder. When the value is 0xFFFFFFFF, spam
    /// filtering SHOULD NOT be applied; however, the blocked sender domains clause of the Junk Email
    /// rule MUST still be applied. A value of 0x80000000 indicates that all mail is spam except those
    /// messages from senders on the trusted senders list or sent to recipients on the trusted recipients list.
    /// The following table lists the valid values for this property.
    var junkThreshold: JunkThreshold? {
        guard let rawValue: UInt32 = getProperty(id: .tagJunkPhishingEnableLinks) else {
            return nil
        }
        
        return JunkThreshold(rawValue: rawValue)
    }
    
    /// [MS-OXCSPAM] 2.2.2.6 PidTagReportTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportTime property ([MS-OXPROPS] section 2.922) indicates the last time the contact
    /// list that is controlled by the PidTagJunkIncludeContacts property (section 2.2.2.2) was updated.
    var reportTime: Date? {
        return getProperty(id: .tagReportTime)
    }
}
