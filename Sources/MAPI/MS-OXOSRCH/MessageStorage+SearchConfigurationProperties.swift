//
//  MessageStorage+SearchConfigurationProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import DataStream
import Foundation

/// [MS-OXOSRCH] 2.2 Message Syntax
/// [MS-OXOSRCH] 2.2.1 Search Folder Definition Message
/// A search folder definition message is stored as an FAI message, as described in [MS-OXCMSG]
/// section 1.3.2, in the FAI contents table, as specified in [MS-OXCFOLD] section 3.1.1.2, of the
/// Common Views folder, as specified in [MS-OXOSFLD] section 2.2.1, within a message store. A
/// search folder definition message is used to persist a search folder within a mailbox, thereby
/// enabling the client to maintain the user's search folders across multiple machines and reliably recreate them if needed. A search folder ceases to exist if its search folder definition message is deleted.
/// For more details about how a search folder definition message relates to a search folder and a search
/// folder container, see section 2.2.4.
/// A search folder definition message has properties that describe the search criteria. These properties
/// are specified in the following subsections.
/// 2.2.1.2 Additional Properties
/// The following subsections provide details about properties that are specific to a search folder
/// definition message. For general details about properties, see [MS-OXPROPS]. The property data
/// types are defined in [MS-OXCDATA] section 2.11.1.
/// [MS-OXOSRCH] 2.2.2 Search Folder Container
/// Although the search folder definition message persists, a search folder container only exists if
/// the search folder is an active search folder. If a search folder is inactive, the search folder
/// container will not exist. For more details about active and inactive search folders, and the
/// relationship between search folder definition messages and search folder containers, see section 2.2.4.
/// A search folder container is created and modified as described in sections 3.1.4.1 and 3.1.4.3. A
/// search folder container uses search criteria, a feature that is not unique to this protocol. These
/// folders also require the use of several common properties.
/// [MS-OXOSRCH] 2.2.2.1 Common Properties
/// The following subsections provide details about properties that are common to most Folder objects,
/// including a search folder container. For general details about properties, see [MS-OXPROPS]. The
/// property data types are defined in [MS-OXCDATA] section 2.11.1.
/// [MS-OXOSRCH] 2.2.2 Search Folder Container
/// Although the search folder definition message persists, a search folder container only exists if
/// the search folder is an active search folder. If a search folder is inactive, the search folder
/// container will not exist. For more details about active and inactive search folders, and the
/// relationship between search folder definition messages and search folder containers, see section 2.2.4.
/// A search folder container is created and modified as described in sections 3.1.4.1 and 3.1.4.3. A
/// search folder container uses search criteria, a feature that is not unique to this protocol. These
/// folders also require the use of several common properties.
/// [MS-OXOSRCH] 2.2.2.1 Common Properties
/// The following subsections provide details about properties that are common to most Folder objects,
/// including a search folder container. For general details about properties, see [MS-OXPROPS]. The
/// property data types are defined in [MS-OXCDATA] section 2.11.1.
public extension MessageStorage {
    /// [MS-OXOSRCH] 2.2.1.2.1 PidTagSearchFolderId
    /// Type: PtypBinary
    /// PidTagSearchFolderId property ([MS-OXPROPS] section 2.985) contains a GUID that identifies
    /// the search folder. The value of this property MUST NOT change.
    /// The GUID of the search folder definition message MUST match the GUID of the corresponding
    /// search folder container. For details about the relationship between the search folder definition
    /// message and the search folder container, see section 2.2.4.
    var searchFolderId: UUID? {
        guard let data: Data = getProperty(id: .tagSearchFolderIdOrTagScheduleInfoDelegatorWantsCopyOrTagWlinkGroupHeaderID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? dataStream.readGUID(endianess: .littleEndian)
    }

    /// [MS-OXOSRCH] 2.2.1.2.2 PidTagSearchFolderTemplateId
    /// Type: PtypInteger32
    /// The PidTagSearchFolderTemplateId property ([MS-OXPROPS] section 2.990) specifies the ID of the template that is being used for
    /// the search. For more details about search templates, see section 2.2.3.
    var searchFolderTemplateId: SearchFolderTemplateId? {
        guard let rawValue: UInt32 = getProperty(id: .tagScheduleInfoResourceTypeOrTagSearchFolderTemplateId) else {
            return nil
        }
        
        return SearchFolderTemplateId(rawValue: rawValue)
    }

    /// [MS-OXOSRCH] 2.2.1.2.3 PidTagSearchFolderTag
    /// Type: PtypInteger32
    /// The PidTagSearchFolderTag property ([MS-OXPROPS] section 2.989) contains a 4-byte value that
    /// marks the current search folder. The value of this property does not have to be unique, but it MUST
    /// change with every update of the search folder definition message; otherwise, another client
    /// accessing the message store will not be able to determine whether the search folder has changed.
    /// The tag of the search folder definition message MUST match the tag of the corresponding search
    /// folder container. For details about the relationship between the search folder definition message and
    /// the search folder container, see section 2.2.4.
    var searchFolderTag: UInt32? {
        return getProperty(id: .tagFreeBusyPublishStartOrTagSearchFolderTagOrTagWlinkSaveStamp)
    }

    /// [MS-OXOSRCH] 2.2.1.2.4 PidTagSearchFolderLastUsed
    /// Type: PtypInteger32
    /// The PidTagSearchFolderLastUsed property ([MS-OXPROPS] section 2.986) specifies the last time the search folder was accessed.
    /// It is formatted as the number of minutes since midnight (Coordinated Universal Time (UTC)) January 1, 1601. This property is set to
    /// the current time when the search folder definition message is created.
    var searchFolderLastUsed: Date? {
        guard let rawValue: UInt32 = getProperty(id: .tagSearchFolderLastUsed) else {
            return nil
        }
        
        return Date(minutesSince1601: rawValue)
    }

    /// [MS-OXOSRCH] 2.2.1.2.5 PidTagSearchFolderExpiration
    /// Type: PtypInteger32
    /// The PidTagSearchFolderExpiration property ([MS-OXPROPS] section 2.984) specifies the time at which the search folder container
    /// will be stale and has to be updated or re-created. It is formatted as the number of minutes since midnight (UTC) January 1, 1601.
    var searchFolderExpiration: Date? {
        guard let rawValue: UInt32 = getProperty(id: .tagSearchFolderExpiration) else {
            return nil
        }
        
        return Date(minutesSince1601: rawValue)
    }

    /// [MS-OXOSRCH] 2.2.1.2.6 PidTagSearchFolderStorageType
    /// Type: PtypInteger32
    /// The PidTagSearchFolderStorageType property ([MS-OXPROPS] section 2.988) contains flags that control the presence and content of
    /// certain fields within the PidTagSearchFolderDefinition property (section 2.2.1.2.8 ). These flags are duplicated within the
    /// PidTagSearchFolderDefinition property.
    /// The specific flags to use depend on the template; section 2.2.3 specifies the correct flags for each template definition.
    /// The flags are stored as a 4-byte integer. The following table shows the flags in big-endian order.
    /// (The flags are in network byte order within the PidTagSearchFolderDefinition property.)
    var searchFolderStorageType: SearchFolderStorageType? {
        guard let rawValue: UInt32 = getProperty(id: .tagGatewayNeedsToRefreshOrTagSearchFolderStorageType) else {
            return nil
        }
        
        return SearchFolderStorageType(rawValue: rawValue.bigEndian)
    }

    /// [MS-OXOSRCH] 2.2.1.2.7 PidTagSearchFolderEfpFlags
    /// Type: PtypInteger32
    /// The PidTagSearchFolderEfpFlags property ([MS-OXPROPS] section 2.983) contains flags that
    /// control how a folder is displayed. The flag settings MAY match the two bits of the b field of the
    /// ExtendedFlags subproperty of the search folder container, as specified in section 2.2.2.1.2.
    var searchFolderEfpFlags: UInt32? {
        return getProperty(id: .tagFreeBusyPublishEndOrTagSearchFolderEfpFlags)
    }
    
    /// [MS-OXOSRCH] 2.2.1.2.8 PidTagSearchFolderDefinition
    /// Type: PtypBinary
    /// The PidTagSearchFolderDefinition property ([MS-OXPROPS] section 2.982) contains data that
    /// specifies the search criteria and search options. The structure of this property is specified as follows.
    /// The presence and specific content of some fields are dependent upon the template that is used for the
    /// search. The template ID, specified in the PidTagSearchFolderTemplateId property (section
    /// 2.2.1.2.2), identifies the template to be used. For details about the templates and how they affect the
    /// fields of the PidTagSearchFolderDefinition property, see section 2.2.3.
    var searchFolderDefinition: SearchFolderDefinition? {
        guard let data: Data = getProperty(id: .tagScheduleInfoDelegateEntryIdsOrTagSearchFolderDefinition) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SearchFolderDefinition(dataStream: &dataStream)
    }
    
    /// [MS-OXOSRCH] 2.2.1.2.9 PidTagSearchFolderRecreateInfo
    /// Type: PtypBinary
    /// This property SHOULD NOT be used.
    var searchFolderRecreateInfo: Data? {
        return getProperty(id: .tagSearchFolderRecreateInfoOrTagScheduleInfoDelegateNames)
    }

    /// [MS-OXOSRCH] 2.2.2.1.2 PidTagExtendedFolderFlags
    /// Type: PtypBinary
    /// The PidTagExtendedFolderFlags property ([MS-OXPROPS] section 2.685) is a binary large object (BLOB) that contains subproperties of a Folder object.
    /// These subproperties control folder configuration that is shared between client and server. Each subproperty is formatted as specified in [MS-OXOCFG] section 2.2.7.1.
    /// The PidTagExtendedFolderFlags property of a search folder container MUST include at least the SearchFolderTag, SearchFolderID, and ExtendedFlags subproperties
    /// with the settings as specified in the following table.
    /// Subproperty name Id field Cb field Data field
    /// SearchFolderTag 0x03 0x04 A 4-byte value that matches the value of the PidTagSearchFolderTag property (section 2.2.1.2.3) of the search folder definition message.
    /// SearchFolderID 0x02 0x10 A GUID that matches the GUID stored in the PidTagSearchFolderId property (section 2.2.1.2.1) of the search folder definition message.
    /// ExtendedFlags 0x01 0x04 A 4-byte value, as specified in [MS-OXOCFG] section 2.2.7.1.2.
    /// The two bits of the b field are set to 10 if the value of the PidTagSearchFolderTemplateId property (section 2.2.1.2.2) is 0x00000003 or 0x00000004; otherwise, the two bits of the b
    /// field are set to 01.
    /// [MS-OXOCFG] 2.2.7 Folder Flags
    /// Folder flags consist of a collection of small properties packed into a single binary property on a folder.
    /// The primary purpose of the folder flags is to store Boolean flags that affect the folder's display options.
    /// The folder flags can also be used to store additional properties, such as a unique identifier for the
    /// folder that can be used to associate it with a specific feature or with a description of that folder that
    /// has been saved elsewhere.
    /// The PidTagExtendedFolderFlags property ([MS-OXOSRCH] section 2.2.2.1.2) can be set on a
    /// folder. If the property is set, the value of this property MUST be a binary stream that contains
    /// encoded subproperties for the folder. The format of the binary stream MUST be as follows.
    /// [MS-OXOSRCH] 2.2.2.1.2 PidTagExtendedFolderFlags
    /// Type: PtypBinary
    /// The PidTagExtendedFolderFlags property ([MS-OXPROPS] section 2.685) is a binary large object
    /// (BLOB) that contains subproperties of a Folder object. These subproperties control folder
    /// configuration that is shared between client and server. Each subproperty is formatted as specified in
    /// [MS-OXOCFG] section 2.2.7.1.
    /// The PidTagExtendedFolderFlags property of a search folder container MUST include at least the
    /// SearchFolderTag, SearchFolderID, and ExtendedFlags subproperties with the settings as
    /// specified in the following table.
    /// Subproperty name Id field Cb field Data field
    /// SearchFolderTag 0x03 0x04 A 4-byte value that matches the value of the PidTagSearchFolderTag
    /// property (section 2.2.1.2.3) of the search folder definition message.
    /// SearchFolderID 0x02 0x10 A GUID that matches the GUID stored in the PidTagSearchFolderId property
    /// (section 2.2.1.2.1) of the search folder definition message.
    /// ExtendedFlags 0x01 0x04 A 4-byte value, as specified in [MS-OXOCFG] section 2.2.7.1.2.
    /// The two bits of the b field are set to 10 if the value of the PidTagSearchFolderTemplateId property (section 2.2.1.2.2) is 0x00000003 or 0x00000004;
    /// otherwise, the two bits of the b field are set to 01.
    var extendedFolderFlags: ExtendedFolderFlags? {
        guard let data: Data = getProperty(id: .tagExtendedFolderFlags) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ExtendedFolderFlags(dataStream: &dataStream)
    }
}
