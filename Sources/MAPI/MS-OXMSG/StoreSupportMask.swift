//
//  StoreSupportMask.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXMSG] 2.1.1.1 PidTagStoreSupportMask
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagStoreSupportMask property ([MS-OXPROPS] section 2.1024) indicates whether string
/// properties within the .msg file are Unicode-encoded or not. This property defines multiple flags, but
/// only the STORE_UNICODE_OK flag is valid. All other bits MUST be ignored. The settings for this
/// property are summarized in the following table.
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstoresupportmask-canonical-property
public struct StoreSupportMask: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// STORE_ENTRYID_UNIQUE (1, 0x00000001) Entry identifiers for the objects in the message store are unique, that is, never reused
    /// during the life of the store.
    public static let entryIdUnique = StoreSupportMask(rawValue: 0x00000001)
    
    /// STORE_READONLY (2, 0x00000002) All interfaces for the message store have a read-only access level.
    public static let readOnly = StoreSupportMask(rawValue: 0x00000002)

    /// STORE_SEARCH_OK (4, 0x00000004) The message store supports search-results folders.
    public static let searchOk = StoreSupportMask(rawValue: 0x00000004)
    
    /// STORE_MODIFY_OK (8, 0x00000008) The message store supports modification of its existing messages.
    public static let modifyOk = StoreSupportMask(rawValue: 0x00000008)
    
    /// STORE_CREATE_OK (16, 0x00000010) The message store supports creation of new messages.
    public static let createOk = StoreSupportMask(rawValue: 0x00000010)
    
    /// STORE_ATTACH_OK (32, 0x00000020) The message store supports attachments (OLE or non-OLE) to messages.
    public static let attachOk = StoreSupportMask(rawValue: 0x00000020)
    
    /// STORE_OLE_OK (64, 0x00000040) The message store supports OLE attachments. The OLE data can be accessed through an
    /// IStorage interface, such as that available through the PR_ATTACH_DATA_OBJ (PidTagAttachDataObject) property.
    public static let oleOk = StoreSupportMask(rawValue: 0x00000040)

    /// STORE_SUBMIT_OK (128, 0x00000080) The message store supports marking a message for submission.
    public static let submitOk = StoreSupportMask(rawValue: 0x00000080)
    
    /// STORE_NOTIFY_OK (256, 0x00000100) The message store supports notifications.
    public static let notifyOk = StoreSupportMask(rawValue: 0x00000100)

    /// STORE_MV_PROPS_OK (512, 0x00000200) The message store supports multivalued properties, guarantees the stability of value
    /// order in a multivalued property throughout a save operation, and supports instantiation of multivalued properties in tables.
    public static let mvPropsOk = StoreSupportMask(rawValue: 0x00000200)
    
    /// STORE_CATEGORIZE_OK (1024, 0x00000400) The message store supports categorized views of tables.
    public static let categorizeOk = StoreSupportMask(rawValue: 0x00000400)

    /// STORE_RTF_OK (2048, 0x00000800) The message store supports Rich Text Format (RTF) messages, usually compressed, and
    /// the store itself keeps PR_BODY and PR_RTF_COMPRESSED synchronized.
    public static let rtfOk = StoreSupportMask(rawValue: 0x00000800)

    /// STORE_RESTRICTION_OK (4096, 0x00001000) The message store supports restrictions.
    public static let restrictionOk = StoreSupportMask(rawValue: 0x00001000)

    /// STORE_SORT_OK (8192, 0x00002000) The message store supports sorting views of tables.
    public static let sortOk = StoreSupportMask(rawValue: 0x00002000)
    
    /// STORE_PUBLIC_FOLDERS (16384, 0x00004000) The folders in this store are public (multi-user), not private (possibly
    /// multi-instance but not multi-user).
    public static let publicFolders = StoreSupportMask(rawValue: 0x00004000)

    /// STORE_UNCOMPRESSED_RTF (32768, 0x00008000) The message store supports storage of RTF messages in uncompressed
    /// form. An uncompressed RTF stream is identified by the value dwMagicUncompressedRTF in the stream header. The
    /// dwMagicUncompressedRTF value is defined in the RTFLIB.H file.
    public static let uncompressedRtf = StoreSupportMask(rawValue: 0x00008000)

    /// STORE_HTML_OK (65536, 0x00010000) The message store supports HTML messages, stored in the PR_BODY_HTML
    /// (PidTagBodyHtml) property. If your development environment uses a MAPIDEFS.H file that does not include STORE_HTML_OK,
    /// use the value 0x00010000 instead.
    public static let htmlOk = StoreSupportMask(rawValue: 0x00010000)

    /// STORE_ANSI_OK (131072, 0x00020000) The message store supports properties that contain ANSI (8-bit) characters.
    public static let ansiOk = StoreSupportMask(rawValue: 0x00020000)
    
    /// STORE_UNICODE_OK (262144, 0x00040000) Indicates that the message store supports Unicode storage. A client can look
    /// for the presence of the flag to decide whether to request or to save Unicode information to the store.
    public static let unicodeOk = StoreSupportMask(rawValue: 0x00040000)
    
    /// STORE_LOCALSTORE (524288, 0x00080000) This flag is reserved and should not be used.
    public static let localStore = StoreSupportMask(rawValue: 0x00080000)
    
    /// STORE_ITEMPROC (2097152, 0x00200000) In a wrapped PST store, indicates that when a new message arrives at the store,
    /// the store performs rules and spam filter processing on the message separately. The store calls IMAPISupport::Notify, setting
    /// fnevNewMail in the NOTIFICATION structure that is passed as a parameter, and then passes the details of the new message
    /// to the listening client. Subsequently, when the listening client receives the notification, it does not process rules on the message.
    public static let itemProc = StoreSupportMask(rawValue: 0x00200000)
    
    /// STORE_PUSHER_OK (8388608, 0x00800000) The MAPI Protocol Handler will not crawl the store, and the store is responsible
    /// for pushing any changes through notifications to the indexer to have messages indexed.
    public static let pusherOk = StoreSupportMask(rawValue: 0x00800000)
    
    /// STORE_RULES_OK (268435456, 0x10000000) Indicates that rules should be stored in this PST store even if it is not the default store. When STORE_RULES_OK is used in conjunction with NON_EMS_XP_SAVE, rules are able to run on non-default PST wrapped stores.
    public static let rulesOk = StoreSupportMask(rawValue: 0x10000000)

    
    public static let all: StoreSupportMask = [.entryIdUnique, .readOnly, .searchOk, .modifyOk, .createOk, .attachOk, .oleOk, .submitOk, .notifyOk, .mvPropsOk, .categorizeOk, .rtfOk, .restrictionOk, .sortOk, .publicFolders, .uncompressedRtf, .htmlOk, .ansiOk, .unicodeOk, .localStore, .itemProc, .pusherOk, .rulesOk]
}
