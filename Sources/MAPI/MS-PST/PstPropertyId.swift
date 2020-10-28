//
//  PstPropertyId.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import Foundation

public enum PstPropertyId: UInt16 {
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidBucketCount 0x0001 PtypInteger32
    case tagNameidBucketCount = 0x0001
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamGuid 0x0002 PtypBinary
    case tagNameidStreamGuid = 0x0002
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamEntry 0x0003 PtypBinary
    case tagNameidStreamEntry = 0x0003
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamString 0x0004 PtypBinary
    case tagNameidStreamString = 0x0004

    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E2A PtypBoolean PidTagExchangeRemoteHeader Has Exchange Remote Header
    case tagExchangeRemoteHeader = 0x0E2A

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
    case tagReplItemid = 0x0E30
    
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
    case tagReplChangenum = 0x0E33
    
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
    case tagReplVersionHistory = 0x0E34
    
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
    case tagReplFlags = 0x0E38
    
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
    /// 0x0E3C PtypBinary PidTagReplCopiedfromVersionhistory Replication version information Y
    case tagReplCopiedfromVersionHistory = 0x0E3C
    
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
    /// 0x0E3D PtypBinary PidTagReplCopiedfromItemid Replication item ID information Y
    case tagReplCopiedfromItemid = 0x0E3D
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidBucketBase 0x1000 PtypBinary
    case tagNameidBucketBase = 0x1000
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagItemTemporaryFlags 0x1097 PtypInteger32
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
    /// 0x1097 PtypInteger32 PidTagItemTemporaryFlags Temporary flags Y
    case tagItemTemporaryFlags = 0x1097

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
    /// 0x65C6 PtypInteger32 PidTagSecureSubmitFlags Secure submit flags Y
    case tagSecureSubmitFlags = 0x65C6

    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstBodyPrefix 0x6619 PtypString
    case tagPstBodyPrefix = 0x6619
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstBestBodyProptag 0x661D PtypInteger32
    case tagPstBestBodyProptag = 0x661D
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9
    /// PidTagPstLrNoRestrictions 0x6633 PtypBoolean
    case tagPstLrNoRestrictions = 0x6633
    
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
    case tagPstHiddenCount = 0x6635
    
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
    case tagPstHiddenUnread = 0x6636
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9
    /// PidTagLatestPstEnsure 0x66FA PtypInteger32
    case tagLatestPstEnsure = 0x66FA
    
    /// Unknown - seen in PST files
    case unknown0x66FC = 0x66FC
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstIpmsubTreeDescendant 0x6705 PtypBoolean
    case tagPstIpmsubTreeDescendant = 0x6705
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstSubTreeContainer 0x6772 PtypInteger32
    case tagPstSubTreeContainer = 0x6772
    
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
    case tagLtpParentNid = 0x67F1
    
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
    case tagLtpRowId = 0x67F2
    
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
    case tagLtpRowVer = 0x67F3
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstPassword 0x67FF PtypInteger32
    case tagPstPassword = 0x67FF

    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x6803 PtypBoolean PidTagSendOutlookRecallReport Send recall report. Y
    case tagSendOutlookRecallReport = 0x6803
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x6805 PtypMultipleInteger32 PidTagOfflineAddressBookTruncatedProperties OAB truncated properties. Y
    case tagOfflineAddressBookTruncatedProperties = 0x6805

    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagMapiFormComposeCommand 0x682F PtypString
    case tagMapiFormComposeCommand = 0x682F
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7003 PtypInteger32 PidTagViewDescriptorFlags View descriptor flags. Y
    case tagViewDescriptorFlags = 0x7003
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7004 PtypBinary PidTagViewDescriptorLinkTo View descriptor link. Y
    case tagViewDescriptorLinkTo = 0x7004
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7005 PtypBinary PidTagViewDescriptorViewFolder View descriptor Folder object. Y
    case tagViewDescriptorViewFolder = 0x7005
    
    /// [MS-OXPROPS] 2.1056 PidTagViewDescriptorName
    /// Canonical name: PidTagViewDescriptorName
    /// Description: Contains the view descriptor name.
    /// Property ID: 0x7006
    /// Data type: PtypString, 0x001F
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOCFG] section 2.2.6.2
    /// Alternate names: PR_VD_NAME, PR_VD_NAME_W
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7006 PtypString PidTagViewDescriptorName View descriptor name. And it has an alternate name PidTagViewDescriptorName_W. Y
    case tagViewDescriptorName = 0x7006
    
    /// [MS-OXPROPS] 2.1058 PidTagViewDescriptorVersion
    /// Canonical name: PidTagViewDescriptorVersion
    /// Description: Contains the View Descriptor version.
    /// Property ID: 0x7007
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference:[MS-OXOCFG] section 2.2.6.4
    /// Alternate names: PR_VD_VERSION
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7007 PtypInteger32 PidTagViewDescriptorVersion View descriptor version. Y
    case tagViewDescriptorVersion = 0x7007
    
    case unknown0x1005 = 0x1005
    case unknown0x1021 = 0x1021
    case unknown0x1025 = 0x1025
    case unknown0x1026 = 0x1026
    case unknown0x102F = 0x102F
    case unknown0x103A = 0x103A
    case unknown0x103C = 0x103C
    case unknown0x1057 = 0x1057
    case unknown0x105D = 0x105D
    case unknown0x107D = 0x107D
    case unknown0x1088 = 0x1088
    case unknown0x1089 = 0x1089
    case unknown0x108E = 0x108E
    case unknown0x108F = 0x108F
    case unknown0x1094 = 0x1094
    case unknown0x109B = 0x109B
    case unknown0x109C = 0x109C
    case unknown0x109F = 0x109F
    case unknown0x10A4 = 0x10A4
    case unknown0x10A6 = 0x10A6
    case unknown0x10A7 = 0x10A7
    case unknown0x10AC = 0x10AC
    case unknown0x10AE = 0x10AE
    case unknown0x10AF = 0x10AF
    case unknown0x10B0 = 0x10B0
    case unknown0x10B1 = 0x10B1
    case unknown0x10B5 = 0x10B5
    case unknown0x10B9 = 0x10B9
    case unknown0x10BB = 0x10BB
    case unknown0x10BD = 0x10BD
    case unknown0x10C1 = 0x10C1
    case unknown0x10C7 = 0x10C7
    case unknown0x10C9 = 0x10C9
    case unknown0x10CB = 0x10CB
    case unknown0x10CC = 0x10CC
    case unknown0x10CE = 0x10CE
    case unknown0x10D0 = 0x10D0
    case unknown0x10D1 = 0x10D1
    case unknown0x10D3 = 0x10D3
    case unknown0x10D5 = 0x10D5
    case unknown0x10D9 = 0x10D9
    case unknown0x10DC = 0x10DC
    case unknown0x10E3 = 0x10E3
    case unknown0x10E6 = 0x10E6
    case unknown0x10E7 = 0x10E7
    case unknown0x10E8 = 0x10E8
    case unknown0x10EB = 0x10EB
    case unknown0x10ED = 0x10ED
}
