//
//  MessageStorage+BulkDataTransferProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCFXICS] 2.2.1 Properties
/// [MS-OXCFXICS] 2.2.1.1 ICS State Properties
/// ICS uses a set of properties known as the ICS state properties to enable a server to narrow down the
/// set of data passed during an Incremental Change Synchronization (ICS) to the client. The ICS state
/// properties specify the state of the local replica, bounded by the synchronization scope that is
/// configured by the RopSynchronizationConfigure ROP (section 2.2.3.2.1.1). Details about the ROPs
/// used to upload the ICS state properties to the server are included in section 2.2.3.2.2. Details about
/// how the ICS state properties are used by the client and server are included in sections 3.3.5.2 and
/// 3.2.5.2 respectively.
/// All ICS state properties are of the PtypBinary type ([MS-OXCDATA] section 2.11.1), and contain a
/// serialized IDSET structure in the replica GUID (REPLGUID)-based form, as specified in section
/// 2.2.2.4.2. For details on serializing an IDSETs, see section 3.1.5.4. For details on creating a compact
/// IDSET, see section 3.1.5.5.
/// All properties specified in this section are part of the ICS state. Two of these properties are used for
/// hierarchy synchronization operations: MetaTagIdsetGiven (section 2.2.1.1.1) and
/// MetaTagCnsetSeen (section 2.2.1.1.2). All four properties are used for content synchronization
/// operations.
/// The ICS state specifies the state of the local replica bounded by the synchronization scope included by
/// the client in the RopSynchronizationConfigure ROP request (section 2.2.3.2.1.1).
/// [MS-OXCFXICS] 2.2.1.2 Messaging Object Identification and Change Tracking Properties
/// This section specifies details about the properties that are used by this protocol to identify messages,
/// folders, and track changes.
/// For details about how messaging object and change identification values are created and modified
/// by the protocol roles, see section 3.1.5.3.
/// [MS-OXCFXICS] 2.2.1.3 Meta-Properties for Encoding Differences in Replica Content
/// Because servers do not maintain a per-client state, the following properties are not persisted on
/// servers and are only present as data in the FastTransfer streams.
/// All properties are of the PtypBinary ([MS-OXCDATA] section 2.11.1) type, and contain a serialized
/// IDSET in the replica ID (REPLID)-based form, as specified in section 2.2.2.4.1.
/// [MS-OXCFXICS] 2.2.1.4 Conflict Resolution Properties
/// This section specifies details about the properties that are used in conflict resolution.
/// [MS-OXCFXICS] 2.2.1.7 Properties That Denote Subobjects
/// The properties in the following tables denote subobjects of the messaging objects and can be used
/// in the following:
///  The property inclusion and exclusion lists of ROPs that configure download operations. For
/// example, the RopSynchronizationConfigure ROP (section 2.2.3.2.1.1) and the
/// RopFastTransferSourceCopyTo ROP (section 2.2.3.1.1.1) both configure download operations.
///  As values of MetaTagFXDelProp meta-properties, as specified in section 2.2.4.1.5.1.
public extension MessageStorage {
    /// [MS-OXCFXICS] 2.2.1.1.1 MetaTagIdsetGiven ICS State Property
    /// Property ID: 0x4017
    /// Data type: PtypInteger32, 0x0003 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagIdsetGiven property contains a serialization of REPLGUID-based IDSET structures, as
    /// specified in section 2.2.2.4.2. The IDSETs contain Folder ID structures ([MS-OXCDATA] section
    /// 2.2.1.1) for hierarchy synchronization operations, or Message ID structures for content
    /// synchronization operations, that exist in the local replica of the client. The IDSETs MUST NOT
    /// include any IDs that are not in the local replica of the client. Because of this restriction on IDs, this
    /// property often does not compress as well as the MetaTagCnset* properties, which makes the
    /// MetaTagIdsetGiven property grow larger than the MetaTagCnset* properties. For more details
    /// about compression of IDSETs, see section 3.1.5.5.
    /// For more details about sending and receiving this property, see sections 3.2.5.2.1 and 3.3.5.13.
    var idsetGiven: UInt32? {
        return getProperty(id: .tagIdsetGiven)
    }
    
    /// [MS-OXCFXICS] 2.2.1.1.2 MetaTagCnsetSeen ICS State Property
    /// Property ID: 0x6796
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagCnsetSeen property contains a serialization of REPLGUID-based CNSET structures, as
    /// specified in section 2.2.2.4. The CN structures, as specified in section 2.2.2.1, in the CNSET track
    /// changes to folders (for hierarchy synchronization operations) or normal messages (for content
    /// synchronization operations) in the current synchronization scope that have been previously
    /// communicated to a client, and are reflected in its local replica.
    var cnseetSeen: Data? {
        return getProperty(id: .tagCnsetSeen)
    }
    
    /// [MS-OXCFXICS] 2.2.1.1.3 MetaTagCnsetSeenFAI ICS State Property
    /// Property ID: 0x67DA
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagCnsetSeenFAI property contains a serialization of REPLGUID-based IDSET structures,
    /// as specified in section 2.2.2.4. The semantics of this property are identical to the MetaTagCnsetSeen
    /// property (section 2.2.1.1.2), except that this property contains IDs for folder associated
    /// information (FAI) messages and is therefore only used in content synchronization operations.
    var cnseetSeenFAI: Data? {
        return getProperty(id: .tagCnsetSeenFAI)
    }
    
    /// [MS-OXCFXICS] 2.2.1.1.4 MetaTagCnsetRead ICS State Property
    /// Property ID: 0x67D2
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagCnsetRead property contains a serialization of REPLGUID-based CNSET structures, as
    /// specified in section 2.2.2.4. The CN structures, as specified in section 2.2.2.1, in the CNSET track
    /// changes to the read state for messages in the current synchronization scope that have been
    /// previously communicated to the client and are reflected in its local replica. This property does not
    /// track whether messages have been read, it only tracks changes to the read state of a message. For
    /// more details about tracking read state changes, see section 3.2.5.6.
    /// The read state of a message is determined by the PidTagMessageFlags property ([MS-OXCMSG]
    /// section 2.2.1.6), which contains a bitmask of flags that indicate the origin and current state of the
    /// message.
    var cnseetRead: Data? {
        return getProperty(id: .tagCnsetRead)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.1 PidTagMid Property
    /// Data type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMid property ([MS-OXPROPS] section 2.801) contains the MID structure ([MS-OXCDATA]
    /// section 2.2.1.2) of the message currently being synchronized.
    /// For details about the presence of the PidTagMid property in message change headers, see the
    /// SynchronizationExtraFlags field in section 2.2.3.2.1.1.1.
    /// [MS-XWDCAL] 2.2.8.11 PidTagMid
    /// DAV property name: http://schemas.microsoft.com/exchange/mid
    /// Data type: PtypInteger64 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagMid property ([MS-OXCFXICS] section 2.2.1.2.1) gets the message ID (MID), as specified
    /// in [MS-OXCDATA] section 2.2.1.2.
    /// For more details about the PidTagMid property, see [MS-OXPROPS] section 2.792.
    var mid: UInt64? {
        return getProperty(id: .tagMid)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.3 PidTagChangeNumber Property
    /// Data type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagChangeNumber property ([MS-OXPROPS] section 2.632) contains the CN structure, as
    /// specified in section 2.2.2.1, that identifies the last change to the message or folder that is currently
    /// being synchronized.
    /// For details about the presence of the PidTagChangeNumber property in message change headers,
    /// see the SynchronizationExtraFlags field in section 2.2.3.2.1.1.1.
    var changeNumber: UInt64? {
        return getProperty(id: .tagChangeNumber)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.4 PidTagParentFolderId Property
    /// Data type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagParentFolderId property ([MS-OXPROPS] section 2.859) contains the Folder ID
    /// structure ([MS-OXCDATA] section 2.2.1.1) that identifies the parent folder of the messaging object
    /// being synchronized.
    var parentFolderId: FolderID? {
        guard let rawValue: UInt64 = getProperty(id: .tagParentFolderId) else {
            return nil
        }
        
        return FolderID(rawValue: rawValue)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.5 PidTagSourceKey Property
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSourceKey property ([MS-OXPROPS] section 2.1022) contains a serialized XID structure,
    /// as specified in section 2.2.2.2, that specifies the internal identifier for the folder or message.
    /// For more details about how clients generate this property, see section 3.3.5.2.1. For more details
    /// about how servers generate or output this property value, see section 3.2.5.5.
    var sourceKey: XID? {
        guard let data: Data = getProperty(id: .tagSourceKey) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? XID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.6 PidTagParentSourceKey Property
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagParentSourceKey property ([MS-OXPROPS] section 2.861) specifies the
    /// PidTagSourceKey property (section 2.2.1.2.5) of the current folder's parent folder.
    var parentSourceKey: XID? {
        guard let data: Data = getProperty(id: .tagParentSourceKey) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? XID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.7 PidTagChangeKey Property
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagChangeKey property ([MS-OXPROPS] section 2.631) contains a serialized XID structure, as specified in section 2.2.2.2, that identifies the last change
    /// to the messaging object. If the last change to the messaging object was imported from the client by using the RopSynchronizationImportMessageChange ROP
    /// (section 2.2.3.2.4.2), the value of the PidTagChangeKey property that is saved to the message store by the server contains the value for the PidTagChangeKey
    /// property that was passed in the PropertyValues field of the RopSynchronizationImportMessageChange ROP request buffer.
    /// If the last change to a messaging object was made by the server, the value of the PidTagChangeKey property that is saved to the message store by the server
    /// contains an XID generated from the PidTagChangeNumber property (section 2.2.1.2.3). For more details about generating XIDs based on internal identifiers, see section 3.1.5.3.
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    var changeKey: XID? {
        guard let data: Data = getProperty(id: .tagChangeKey) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? XID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.8 PidTagPredecessorChangeList Property
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPredecessorChangeList property ([MS-OXPROPS] section 2.867) contains
    /// PredecessorChangeList structures, as specified in section 2.2.2.3. The
    /// PidTagPredecessorChangeList property contains all the XID structures, as specified in section
    /// 2.2.2.2, from all replicas (1) that have been integrated into the current version of the messaging
    /// object. This property is used in conflict detection by all protocol roles.
    var predecessorChangeList: PredecessorChangeList? {
        guard let data: Data = getProperty(id: .tagPredecessorChangeList) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? PredecessorChangeList(dataStream: &dataStream)
    }
    
    /// [MS-OXCFXICS] 2.2.1.2.9 PidTagOriginalEntryId Property
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalEntryId property ([MS-OXPROPS] section 2.829) contains the original EntryID of
    /// the message, which is used to associate the full message item being downloaded from the server with
    /// the message header previously stored on the client.
    var originalEntryId: Data? {
        return getProperty(id: .tagOriginalEntryId)
    }
    
    /// [MS-OXCFXICS] 2.2.1.3.1 MetaTagIdsetDeleted Meta-Property
    /// Property ID: 0x67E5
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagIdsetDeleted property contains a serialization of a REPLID-based IDSET structures,
    /// as specified in section 2.2.2.4.1. The IDSETs contain the IDs of folders (for hierarchy
    /// synchronization operations) or messages (for content synchronization operations) that were
    /// hard deleted or soft deleted since the last synchronization identified by the initial ICS state. For
    /// more details about how an IDSET is serialized, see section 3.1.5.4.
    var idsetDeleted: Data? {
        return getProperty(id: .tagIdsetDeleted)
    }
    
    /// [MS-OXCFXICS] 2.2.1.3.2 MetaTagIdsetNoLongerInScope Meta-Property
    /// Property ID: 0x4021
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagIdsetNoLongerInScope property contains a serialization of a REPLID-based IDSET
    /// structures, as specified in section 2.2.2.4.1. The IDSETs contain the IDs of messages that got out of
    /// the synchronization scope since the last synchronization identified by the initial ICS state.
    /// Messages that no longer match a restriction are considered out of synchronization scope. For more
    /// details about how an IDSET is serialized, see section 3.1.5.4.
    /// Note that messages moved to another folder are considered soft deleted in the source folder; hard
    /// deleted and soft deleted messages are reported in the MetaTagIdsetDeleted property (section
    /// 2.2.1.3.1).
    var idsetNoLongerInScope: Data? {
        return getProperty(id: .tagIdsetSoftDeleted)
    }
    
    /// [MS-OXCFXICS] 2.2.1.3.3 MetaTagIdsetExpired Meta-Property
    /// Property ID: 0x6793
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagIdsetExpired property<1> contains a serialization of REPLID-based IDSET structures.
    /// The IDSETs contain IDs of expired Message objects in a public folder that expired since the last
    /// synchronization identified by the initial ICS state. For more details about how an IDSET is serialized,
    /// see section 3.1.5.4.
    var idsetExpired: Data? {
        return getProperty(id: .tagIdsetExpired)
    }
    
    /// [MS-OXCFXICS] 2.2.1.3.4 MetaTagIdsetRead Meta-Property
    /// Property ID: 0x402D
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagIdsetRead property contains a serialization of REPLID-based IDSET structures. The
    /// IDSETs contain IDs of messages that were marked as read (as specified by the
    /// PidTagMessageFlags property in [MS-OXCMSG] section 2.2.1.6) since the last synchronization, as
    /// identified by the initial ICS state. For more details about how an IDSET is serialized, see section
    /// 3.1.5.4.
    var idsetRead: Data? {
        return getProperty(id: .tagIdsetRead)
    }
    
    /// [MS-OXCFXICS] 2.2.1.3.5 MetaTagIdsetUnread Meta-Property
    /// Property ID: 0x402E
    /// Data type: PtypBinary, 0x0102 ([MS-OXCDATA] section 2.11.1)
    /// The MetaTagIdsetUnread property contains a serialization of REPLID-based IDSET structures. The
    /// IDSETs contain IDs of messages that were marked as unread (as specified by the
    /// PidTagMessageFlags property in [MS-OXCMSG] section 2.2.1.6) since the last synchronization, as
    /// identified by the initial ICS state. For more details about how an IDSET is serialized, see section
    /// 3.1.5.4.
    var idsetUnread: Data? {
        return getProperty(id: .tagIdsetUnread)
    }

    /// [MS-OXCFXICS] 2.2.1.4.1 PidTagResolveMethod Property
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagResolveMethod property ([MS-OXPROPS] section 2.929) specifies how to resolve any
    /// conflicts with the message. This property is not required.
    /// The following table defines valid values for the PidTagResolveMethod property.
    var resolveMethod: ResolveMethod? {
        guard let rawValue: UInt32 = getProperty(id: .tagResolveMethod) else {
            return nil
        }
        
        return ResolveMethod(rawValue: rawValue)
    }
    
    /// [MS-OXCFXICS] 2.2.1.4.2 PidTagConflictEntryId Property
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConflictEntryId property ([MS-OXPROPS] section 2.641) contains the EntryID of the
    /// conflict resolve message, as specified in section 3.1.5.6.2.1.
    var conflictEntryId: Data? {
        return getProperty(id: .tagConflictEntryId)
    }
    
    /// [MS-OXCFXICS] 2.2.1.4.3 PidTagInConflict Property
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInConflict property ([MS-OXPROPS] section 2.739) specifies whether the attachment
    /// represents an alternate replica.
    var inConflict: Bool? {
        return getProperty(id: .tagInConflict)
    }
    
    /// [MS-OXCFXICS] 2.2.1.5 PidTagAssociated Property
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAssociated property ([MS-OXPROPS] section 2.584) specifies whether the message being
    /// synchronized is an FAI message.
    var associated: Bool? {
        return getProperty(id: .tagAssociated)
    }
}
