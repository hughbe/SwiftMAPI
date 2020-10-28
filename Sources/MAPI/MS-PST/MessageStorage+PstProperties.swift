//
//  MessageStorage+PstProperties.swift
//
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream
import Foundation

public extension MessageStorage {
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidBucketCount 0x0001 PtypInteger32
    var nameidBucketCount: UInt32? {
        return getProperty(id: PstPropertyId.tagNameidBucketCount.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamGuid 0x0002 PtypBinary
    var nameidStreamGuid: Data? {
        return getProperty(id: PstPropertyId.tagNameidStreamGuid.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamEntry 0x0003 PtypBinary
    var nameidStreamEntry: Data? {
        return getProperty(id: PstPropertyId.tagNameidStreamEntry.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamString 0x0004 PtypBinary
    var nameidStreamString: Data? {
        return getProperty(id: PstPropertyId.tagNameidStreamString.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidBucketBase 0x1000 PtypBinary
    var nameidBucketBase: Data? {
        return getProperty(id: PstPropertyId.tagNameidBucketBase.rawValue)
    }
     
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstBodyPrefix 0x6619 PtypString
    var pstBodyPrefix: String? {
        return getProperty(id: PstPropertyId.tagPstBodyPrefix.rawValue)
    }
     
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstBestBodyProptag 0x661D PtypInteger32
    var pstBestBodyProptag: UInt32? {
        return getProperty(id: PstPropertyId.tagPstBestBodyProptag.rawValue)
    }
     
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9
    /// PidTagPstLrNoRestrictions 0x6633 PtypBoolean
    var pstLrNoRestrictions: Bool? {
        return getProperty(id: PstPropertyId.tagPstLrNoRestrictions.rawValue)
    }
     
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstHiddenCount 0x6635 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x6636 PtypInteger32 PidTagPstHiddenUnread Unread hidden items in sub-Folder object. Y
    var pstHiddenCount: UInt32? {
        return getProperty(id: PstPropertyId.tagPstHiddenCount.rawValue)
    }
     
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstHiddenUnread 0x6636 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x6636 PtypInteger32 PidTagPstHiddenUnread Unread hidden items in sub-Folder object. Y
    var pstHiddenUnread: UInt32? {
        return getProperty(id: PstPropertyId.tagPstHiddenUnread.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstIpmsubTreeDescendant 0x6705 PtypBoolean
    var pstIpmsubTreeDescendant: Bool? {
        return getProperty(id: PstPropertyId.tagPstIpmsubTreeDescendant.rawValue)
    }
     
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9
    /// PidTagLatestPstEnsure 0x66FA PtypInteger32
    var latestPstEnsure: UInt32? {
        return getProperty(id: PstPropertyId.tagLatestPstEnsure.rawValue)
    }
     
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstSubTreeContainer 0x6772 PtypInteger32
    var pstSubTreeContainer: UInt32? {
        return getProperty(id: PstPropertyId.tagPstSubTreeContainer.rawValue)
    }
     
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLtpParentNid 0x67F1 PtypInteger32
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x67F1 PtypInteger32 PidTagLtpParentNid LTP Parent NID
    var ltpParentNid: UInt32? {
        return getProperty(id: PstPropertyId.tagLtpParentNid.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLtpRowId 0x67F2 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID. Y
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP row ID Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP row ID. Y
    /// [MS-PST] 2.4.5.3 Recipient Table
    /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
    /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
    /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
    /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
    /// [MS-PST] 2.4.5.3.1 Recipient Table Template
    /// Each PST MUST have one recipient table template, which is identified with an NID value of
    /// NID_RECIPIENT_TABLE (0x692). The recipient table template defines the set of columns for every
    /// new Recipient Table that is created. The recipient table template MUST have no data rows, and MUST
    /// contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID.
    /// [MS-PST] 2.4.6.1 Attachment Table
    /// The Attachment Table is a standard TC structure where each of its rows maps to an Attachment
    /// object. Each row contains sufficient metadata to identify or display a representation of the
    /// Attachment object, but the full Attachment object data is stored in a separate subnode. The
    /// Attachment table is optional, and can be absent from Message objects that do not contain any
    /// Attachment objects.
    /// [MS-PST] 2.4.6.1.1 Attachment Table Template
    /// Each PST MUST have one attachment table template, which is identified with an NID value of
    /// NID_ATTACHMENT_TABLE (0x671). The attachment table template defines the set of columns for
    /// every new Attachment Table that is created. The attachment table template MUST have no data rows,
    /// and MUST contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID
    var ltpRowId: UInt32? {
        return getProperty(id: PstPropertyId.tagLtpRowId.rawValue)
    }

    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLtpRowVer 0x67F3 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version. Y
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP row version Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP row version. Y
    /// [MS-PST] 2.4.5.3 Recipient Table
    /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
    /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
    /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
    /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
    /// [MS-PST] 2.4.5.3.1 Recipient Table Template
    /// Each PST MUST have one recipient table template, which is identified with an NID value of
    /// NID_RECIPIENT_TABLE (0x692). The recipient table template defines the set of columns for every
    /// new Recipient Table that is created. The recipient table template MUST have no data rows, and MUST
    /// contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version.
    /// [MS-PST] 2.4.6.1 Attachment Table
    /// The Attachment Table is a standard TC structure where each of its rows maps to an Attachment
    /// object. Each row contains sufficient metadata to identify or display a representation of the
    /// Attachment object, but the full Attachment object data is stored in a separate subnode. The
    /// Attachment table is optional, and can be absent from Message objects that do not contain any
    /// Attachment objects.
    /// [MS-PST] 2.4.6.1.1 Attachment Table Template
    /// Each PST MUST have one attachment table template, which is identified with an NID value of
    /// NID_ATTACHMENT_TABLE (0x671). The attachment table template defines the set of columns for
    /// every new Attachment Table that is created. The attachment table template MUST have no data rows,
    /// and MUST contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version
    var ltpRowVer: UInt32? {
        return getProperty(id: PstPropertyId.tagLtpRowVer.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstPassword 0x67FF PtypInteger32
    var pstPassword: UInt32? {
        return getProperty(id: PstPropertyId.tagPstPassword.rawValue)
    }
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagMapiFormComposeCommand 0x682F PtypString
    var mapiFormComposeCommand: String? {
        return getProperty(id: PstPropertyId.tagMapiFormComposeCommand.rawValue)
    }
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E30 PtypInteger32 PidTagReplItemid Replication Item ID. N
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x0E30 PtypInteger32 PidTagReplItemid Replication item ID Y
    var replItemId: UInt32? {
        return getProperty(id: .tagReplItemid)
    }
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E33 PtypInteger64 PidTagReplChangenum Replication Change Number. N
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x0E33 PtypInteger64 PidTagReplChangenum Replication change number Y
    var replChangenum: UInt64? {
        return getProperty(id: .tagReplChangenum)
    }
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E34 PtypBinary PidTagReplVersionHistory Replication Version History. N
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x0E34 PtypBinary PidTagReplVersionHistory Replication version history Y
    var replVersionHistory: Data? {
        return getProperty(id: .tagReplVersionHistory)
    }
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E38 PtypInteger32 PidTagReplFlags Replication flags. Y
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x0E38 PtypInteger32 PidTagReplFlags Replication flags Y
    var replFlags: UInt32? {
        return getProperty(id: .tagReplFlags)
    }
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F).
    /// The FAI contents table template MUST have no data rows, and MUST contain the following property columns.
    /// 0x7003 PtypInteger32 PidTagViewDescriptorFlags View descriptor flags. Y
    var viewDescriptorFlags: UInt32? {
        return getProperty(id: .tagViewDescriptorFlags)
    }
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F).
    /// The FAI contents table template MUST have no data rows, and MUST contain the following property columns.
    /// 0x7004 PtypBinary PidTagViewDescriptorLinkTo View descriptor link. Y
    var viewDescriptorLinkTo: Data? {
        return getProperty(id: .tagViewDescriptorLinkTo)
    }

    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F).
    /// The FAI contents table template MUST have no data rows, and MUST contain the following property columns.
    /// 0x7005 PtypBinary PidTagViewDescriptorViewFolder View descriptor Folder object. Y
    var viewDescriptorViewFolder: Data? {
        return getProperty(id: .tagViewDescriptorViewFolder)
    }
}
