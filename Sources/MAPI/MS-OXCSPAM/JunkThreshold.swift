//
//  JunkThreshold.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXCSPAM] 2.2.2.5 PidTagJunkThreshold Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagJunkThreshold property ([MS-OXPROPS] section 2.755) indicates how aggressively the client is to send incoming mail to the
/// Junk Email folder. When the value is 0xFFFFFFFF, spam filtering SHOULD NOT be applied; however, the blocked sender domains clause
/// of the Junk Email rule MUST still be applied. A value of 0x80000000 indicates that all mail is spam except those messages from senders
/// on the trusted senders list or sent to recipients on the trusted recipients list. The following table lists the valid values for this property
public enum JunkThreshold: UInt32 {
    case noSpamFiltering = 0xFFFFFFFF
    case lowSpamFiltering = 0x00000006
    case highSpamFiltering = 0x00000003
    case trustedListsOnly = 0x00000000
}
