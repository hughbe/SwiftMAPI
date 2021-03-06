//
//  FolderMask.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

/// Contains a bitmask of flags that indicate the validity of the entry identifiers of the folders in a message store.
/// A folder's entry identifier can become invalid if a user deletes the folder or if the message store becomes corrupted.
/// One or more of the following flags can be set for the bitmask:
public struct ValidFolderMask: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// The IPM folder subtree has a valid entry identifier. See PR_IPM_SUBTREE_ENTRYID (PidTagIpmSubtreeEntryId).
    public static let ipmSubtreeValid = ValidFolderMask(rawValue: 0x00000001)
    
    /// The interpersonal message (IPM) receive folder has a valid entry identifier. See IMsgStore::GetReceiveFolder.
    public static let ipmInboxValid = ValidFolderMask(rawValue: 0x00000002)

    /// The IPM Outbox folder has a valid entry identifier. See PR_IPM_OUTBOX_ENTRYID (PidTagIpmOutboxEntryId).
    public static let ipmOutboxValid = ValidFolderMask(rawValue: 0x00000004)

    /// The IPM Deleted Items folder has a valid entry identifier. See PR_IPM_WASTEBASKET_ENTRYID (PidTagIpmWastebasketEntryId).
    public static let ipmWasteBasketValid = ValidFolderMask(rawValue: 0x00000008)
    
    /// The IPM Sent Items folder has a valid entry identifier. See PR_IPM_SENTMAIL_ENTRYID (PidTagIpmSentMailEntryId).
    public static let ipmSentMailValid = ValidFolderMask(rawValue: 0x00000010)
    
    /// The views folder has a valid entry identifier. See PR_VIEWS_ENTRYID (PidTagViewsEntryId).
    public static let viewsValid = ValidFolderMask(rawValue: 0x00000020)
    
    /// The common views folder has a valid entry identifier. See PR_COMMON_VIEWS_ENTRYID (PidTagCommonViewsEntryId).
    public static let commonViewsValid = ValidFolderMask(rawValue: 0x00000040)
    
    /// The finder folder has a valid entry identifier. See PR_FINDER_ENTRYID (PidTagFinderEntryId).
    public static let finderValid = ValidFolderMask(rawValue: 0x00000080)

    public static let all: ValidFolderMask = [.ipmSubtreeValid, .ipmInboxValid, .ipmOutboxValid, ipmWasteBasketValid, .ipmSentMailValid, .viewsValid, .commonViewsValid, .finderValid]
}
