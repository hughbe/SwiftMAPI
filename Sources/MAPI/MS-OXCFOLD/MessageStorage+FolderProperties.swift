//
//  OutlookMessage+FolderProperties.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import DataStream
import Foundation

/// [MS-OXCFOLD] 2.2.2 Folder Object Properties
/// A Folder object can be created and modified by clients and servers. Except where noted, the
/// constraints to which both clients and servers adhere when operating on a Folder object are defined in
/// sections 2.2.2.1 through 2.2.2.2.2.9. Unless otherwise specified, a Folder object adheres to all
/// property constraints specified in [MS-OXPROPS]. A Folder object can also contain other properties, as
/// specified in [MS-OXOSFLD] and [MS-OXOSRCH].
/// When a property is specified as read-only, it means that the property can be set only by the server
/// and clients SHOULD NOT try to change the value of this property. For details about how the server
/// handles a client's attempt to set a read-only property, see [MS-OXCPRPT] section 3.2.5.4.
/// [MS-OXCFOLD] 2.2.2.2.1 Read-Only Properties
/// [MS-OXCFOLD] 2.2.2.2.2 Read/Write Properties
public extension MessageStorage {
    /// [MS-OXCFOLD] 2.2.2.2.1.1 PidTagContentCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContentCount property ([MS-OXPROPS] section 2.640) specifies the number of messages
    /// in a folder, as computed by the message store. The value does not include FAI entries in the folder.
    /// [MS-OXCSTOR] 2.2.2.1.1.6 PidTagContentCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContentCount property ([MS-OXPROPS] section 2.640) contains the cumulative count of
    /// non-folder associated information (FAI) messages in the mailbox.
    /// [MS-OXCTABL] 2.2.1.5 PidTagContentCount
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContentCount property ([MS-OXCFOLD] section 2.2.2.2.1.1) specifies the number of
    /// rows under the header row. This property is set whether the header row is collapsed or expanded.
    var contentCount: UInt32? {
        return getProperty(id: .tagContentCount)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.2 PidTagContentUnreadCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContentUnreadCount property ([MS-OXPROPS] section 2.642) specifies the number of
    /// unread messages in a folder, as computed by the message store.
    /// [MS-OXCTABL] 2.2.1.6 PidTagContentUnreadCount
    /// Data type: PtypInteger32 property ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContentUnreadCount property ([MS-OXCFOLD] section 2.2.2.2.1.2) specifies the
    /// number of rows under the header row that have the PidTagRead property ([MS-OXPROPS] section
    /// 2.878) set to "FALSE" (0x00). This value is set whether the header row is collapsed or expanded.
    var contentUnreadCount: UInt32? {
        return getProperty(id: .tagContentUnreadCount)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.3 PidTagDeletedOn Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDeletedOn property ([MS-OXPROPS] section 2.664) specifies the time when the folder
    /// was soft deleted.
    var deletedOn: Date? {
        return getProperty(id: .tagDeletedOn)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.4 PidTagAddressBookEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookEntryId property ([MS-OXPROPS] section 2.515) contains an Address
    /// Book EntryID structure, as specified in [MS-OXCDATA] section 2.2.5.2, that specifies the nameservice entry ID of a directory object that refers to a public folder. This property is set only for
    /// public folders.<10> For details about public folders, see [MS-OXCSTOR] section 1.3.1.
    var addressBookEntryId: AddressBookEntryID? {
        guard let data: Data = getProperty(id: .tagAddressBookEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? AddressBookEntryID(dataStream: &dataStream)
    }

    /// [MS-OXCFOLD] 2.2.2.2.1.5 PidTagFolderFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFolderFlags property ([MS-OXPROPS] section 2.695) contains a computed value that
    /// specifies the type or state of a folder. The value is a bitwise OR of zero or more values from the
    /// following table.
    var folderFlags: FolderFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagFolderFlags) else {
            return nil
        }
        
        return FolderFlags(rawValue: rawValue)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.6 PidTagFolderId Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFolderId property ([MS-OXPROPS] section 2.694) contains a FID structure ([MSOXCDATA] section 2.2.1.1) that uniquely identifies a folder.
    /// [MS-OXCFXICS] 2.2.1.2.2 PidTagFolderId Property
    /// Data type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFolderId property ([MS-OXPROPS] section 2.700) contains the Folder ID structure ([MSOXCDATA] section 2.2.1.1) of the folder currently being synchronized.
    /// For details about the presence of the PidTagFolderId property in message change headers, see the
    /// SynchronizationExtraFlags field in section 2.2.3.2.1.1.1.
    var folderId: UInt64? {
        return getProperty(id: .tagFolderId)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.7 PidTagParentEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagParentEntryId property ([MS-OXPROPS] section 2.852) contains a Folder EntryID
    /// structure, as specified in [MS-OXCDATA] section 2.2.4.1, that specifies the entry ID of the folder that
    /// contains the message or subfolder.
    /// [MS-OXPFOAB] 2.2 Message Syntax
    /// [MS-OXPFOAB] 2.2.1 OAB Messages
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
    /// [MS-OXPFOAB] 2.2.1.4 PidTagParentEntryId
    /// This property contains the entry ID for a folder that contains the offline address book (OAB) public
    /// folder message. For details, see [MS-OXPROPS] section 2.849.<2>
    var parentEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagParentEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.8 PidTagHierarchyChangeNumber Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHierarchyChangeNumber property ([MS-OXPROPS] section 2.714) specifies the number
    /// of subfolders in the folder. The value of this property monotonically increases every time a subfolder is
    /// added to or deleted from the folder.
    var hierarchyChangeNumber: UInt32? {
        return getProperty(id: .tagHierarchyChangeNumber)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.9 PidTagHierRev Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHierRev property ([MS-OXPROPS] section 2.715) specifies the time, in Coordinated
    /// Universal Time (UTC), to trigger the client in cached mode to synchronize the folder hierarchy.
    var hierRev: Date? {
        return getProperty(id: .tagHierRev)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.11 PidTagMessageSizeExtended Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageSizeExtended property ([MS-OXPROPS] section 2.791) specifies the 64-bit
    /// version of the PidTagMessageSize property (section 2.2.2.2.1.10).
    /// [MS-OXCSTOR] 2.2.2.1.1.10 PidTagMessageSizeExtended Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageSizeExtended property ([MS-OXPROPS] section 2.791) contains the cumulative
    /// size, in bytes, of all content in the mailbox.
    var messageSizeExtended: UInt64? {
        return getProperty(id: .tagMessageSize)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.12 PidTagSubfolders Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSubfolders property ([MS-OXPROPS] section 2.1026) specifies whether the folder has
    /// any subfolders. The value of this property is nonzero if the folder has subfolders; the value is zero
    /// otherwise.
    var subfolders: Bool? {
        return getProperty(id: .tagSubfolders)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.14 PidTagLocalCommitTimeMax Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLocalCommitTimeMax property ([MS-OXPROPS] section 2.767) specifies the most
    /// recent time that a top level object within a folder was changed. Top level objects include messages
    /// and subfolders within the folder but not objects within the folder's subfolders.
    var localCommitTimeMax: Date? {
        return getProperty(id: .tagLocalCommitTimeMax)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.1.15 PidTagDeletedCountTotal Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDeletedCountTotal property ([MS-OXPROPS] section 2.663) specifies the total number
    /// of messages that have been deleted from a folder, excluding messages that have been deleted from
    /// the folder's subfolders.
    var deletedCountTotal: UInt32? {
        return getProperty(id: .tagDeletedCountTotal)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.1 PidTagAttributeHidden Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttributeHidden property ([MS-OXPROPS] section 2.605) specifies whether the folder is
    /// hidden. The value of this property is nonzero if the folder is hidden; the value is zero otherwise.
    /// [MS-XWDCAL] 2.2.1.7 PidTagAttributeHidden
    /// DAV property name: DAV:ishidden
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagAttributeHidden property ([MS-OXCFOLD] section 2.2.2.2.2.1) gets or sets a value that
    /// indicates whether an item is hidden, as specified in [MS-WDVME]. True if the item is hidden;
    /// otherwise, false.
    /// For more details about the PidTagAttributeHidden property, see [MS-OXPROPS] section 2.602.
    var attributeHidden: Bool? {
        return getProperty(id: .tagAttributeHidden)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.2 PidTagComment Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagComment property ([MS-OXPROPS] section 2.631) contains a comment about the
    /// purpose or content of the folder. This property is present only if the client sets it when the folder is
    /// created. The client sets the property by specifying a comment in the Comment field of the
    /// RopCreateFolder request (section 2.2.1.2).
    /// [MS-OXCSTOR] 2.2.2.1.2.1 PidTagComment Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagComment property ([MS-OXPROPS] section 2.631) contains a mailbox comment.<14>
    /// [MS-OXOABK] 2.2.3.31 PidTagComment
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagComment property ([MS-OXCFOLD] section 2.2.2.2.2.2) contains a comment about the
    /// purpose or content of an Address Book object.
    /// [MS-XWDCAL] 2.2.1.9 PidTagComment
    /// DAV property names: DAV:comment, http://schemas.microsoft.com/exchange/summaryutf8
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagComment property ([MS-OXCFOLD] section 2.2.2.2.2.2) gets or sets a comment for the
    /// Calendar object.
    /// For more details about the PidTagComment property, see [MS-OXPROPS] section 2.628.
    var comment: String? {
        return getProperty(id: .tagComment)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.3 PidTagContainerClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContainerClass property ([MS-OXPROPS] section 2.636) specifies the type of Message
    /// object that the folder contains. The value of this property MUST begin with "IPF.".
    /// [MS-OXOCAL] 2.2.11.1 PidTagContainerClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagContainerClass property ([MS-OXPROPS] section 2.642) for all Calendar
    /// folders MUST be set to "IPF.Appointment".
    /// [MS-OXOSRCH] 2.2.2.1.1 PidTagContainerClass
    /// Type: PtypString
    /// The PidTagContainerClass property ([MS-OXCFOLD] section 2.2.2.2.2.3) MUST be set to "IPF.Note"
    /// for the Folder object to be recognized as a search folder container.
    /// [MS-OXOSFLD] 2.2.8 PidTagContainerClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContainerClass property ([MS-OXPROPS] section 2.636), located on the special folder,
    /// specifies the type of Message object that the folder contains. An implementation MUST set this
    /// property to the string that specifies the correct Container class for the special folder, as specified in
    /// section 2.2.1.
    /// [MS-XWDCAL] 2.2.8.7 PidTagContainerClass
    /// DAV property name: http://schemas.microsoft.com/exchange/outlookfolderclass
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagContainerClass property ([MS-OXOCAL] section 2.2.11.1) gets or sets the container
    /// class for the Calendar folder.
    /// For more details about the PidTagContainerClass property, see [MS-OXPROPS] section 2.633.
    var containerClass: String? {
        return getProperty(id: .tagContainerClass)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.4 PidTagContainerHierarchy Property
    /// Type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagContainerHierarchy property ([MS-OXPROPS] section 2.639) contains identifiers of the
    /// subfolders that are contained in the folder. This property is used in a download operation, as specified
    /// in [MS-OXCFXICS] section 2.2.1.7 and section 3.2.5.10.
    /// [MS-OXCFXICS] Identifies all subfolders of the current folder. Clients use this
    /// property in inclusion and exclusion lists, but do not use this
    /// property as a value of the MetaTagFXDelProp meta-property.
    /// [MS-OXOSRCH] 2.2.2.1.1 PidTagContainerClass
    /// Type: PtypString
    /// The PidTagContainerClass property ([MS-OXCFOLD] section 2.2.2.2.2.3) MUST be set to "IPF.Note"
    /// for the Folder object to be recognized as a search folder container.
    var containerHierachy: Data? {
        return getProperty(id: .tagContainerHierarchy)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.5 PidTagDisplayName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayName property ([MS-OXPROPS] section 2.670) specifies the display name of the
    /// folder. Sibling folders MUST have unique display names.
    /// [MS-OXCMSG] 2.2.2.4 PidTagDisplayName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayName property ([MS-OXPROPS] section 2.676) contains the name of the
    /// attachment as input by the end user. This property is set to the same value as the
    /// PidTagAttachLongFilename property (section 2.2.2.13).
    /// [MS-OXORMMS] 2.2.3.1 PidTagAttachLongFilename Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagAttachLongFilename property ([MS-OXCMSG] section 2.2.2.10) for a
    /// rights-managed email message MUST be set to "message.rpmsg". 
    /// [MS-OXOCNTC] 2.2.1.1.8 PidTagDisplayName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayName property ([MS-OXPROPS] section 2.672) specifies the full name of the
    /// contact. The full name is formatted according to an implementation-dependent algorithm that uses
    /// the values of the PidTagDisplayNamePrefix (section 2.2.1.1.3), PidTagGivenName (section
    /// 2.2.1.1.6), PidTagMiddleName (section 2.2.1.1.5), PidTagSurname (section 2.2.1.1.4), and
    /// PidTagGeneration (section 2.2.1.1.2) properties. This property is optional.
    /// [MS-OXODLGT] 2.2.1.1.1 PidTagDisplayName Property
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayName property ([MS-OXPROPS] section 2.670) MUST be set to "Freebusy Data".
    /// [MS-OXODOC] 2.2.2.2 PidTagDisplayName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) specifies the name of the
    /// attachment. A Document object SHOULD have this property set.
    /// [MS-OXOPFFB] 2.2.1.1.1 PidTagDisplayName Property
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayName property ([MS-OXPROPS] section 2.670) MUST be set to "Freebusy Data".
    /// [MS-OXOSRCH] 2.2.1.1.2 PidTagDisplayName
    /// Type: PtypString
    /// The PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) specifies the name of the
    /// search folder. The client SHOULD use this property value as the display name of the search folder
    /// container.
    var displayName: String? {
        return getProperty(id: .tagDisplayName)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.6 PidTagFolderAssociatedContents Property
    /// Type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFolderAssociatedContents property ([MS-OXPROPS] section 2.693) contains identifiers
    /// of the FAI messages that are contained in the folder. This property is used in a download operation,
    /// as specified in [MS-OXCFXICS] section 2.2.1.7 and section 3.2.5.10.
    /// [MS-OXCFXICS] Identifies all FAI messages in the current folder.
    var folderAssociatedContents: Data? {
        return getProperty(id: .tagFolderAssociatedContents)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.7 PidTagFolderType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFolderType property ([MS-OXPROPS] section 2.696) specifies the type of the folder.
    /// The valid values of the PidTagFolderType property are listed in the following table.
    var folderType: FolderType? {
        guard let rawValue: UInt32 = getProperty(id: .tagFolderType) else {
            return nil
        }
        
        return FolderType(rawValue: rawValue)
    }
    
    /// [MS-OXCFOLD] 2.2.2.2.2.8 PidTagRights Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRights property ([MS-OXPROPS] section 2.929) specifies the client's folder permissions.
    /// This property's format is the same as that of the PidTagMemberRights property ([MS-OXCPERM]
    /// section 2.2.7). The FreeBusyDetailed flag and the FreeBusySimple flag do not apply to the
    /// PidTagRights property.
    var rights: MessageRights? {
        guard let rawValue: UInt32 = getProperty(id: .tagRights) else {
            return nil
        }
        
        return MessageRights(rawValue: rawValue)
    }
}
