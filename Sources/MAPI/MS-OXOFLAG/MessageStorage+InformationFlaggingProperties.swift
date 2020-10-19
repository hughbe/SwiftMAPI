//
//  MessageStorage+InformationFlaggingProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXOFLAG] 2.2 Message Syntax
/// A Message object can have its flag state changed by the client. Constraints for setting flags on a
/// Message object are defined in section 2.2.1 through section 2.2.3.
/// When a value is specified as not present, the property MUST NOT exist on the Message object, and if it
/// exists, it MUST be deleted. Setting a property to 0 or to a zero-length string does not delete the
/// property from the Message object.
/// [MS-OXOFLAG] 2.2.1 Properties Specific to the Informational Flagging Protocol
public extension MessageStorage {
    /// [MS-OXOFLAG] 2.2.1.1 PidTagFlagStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFlagStatus property ([MS-OXPROPS] section 2.691) specifies the flag state of the Message object.
    /// This property is present on the Message object only if the object has been flagged and is not present otherwise
    /// It MUST NOT exist on a meeting-related object, and it SHOULD NOT<1> exist on a Task object. When acting on
    /// other Message objects, this property is set to one of the following values.
    var flagStatus: FlagStatus? {
        guard let rawValue: UInt32 = getProperty(id: .tagFlagStatus) else {
            return nil
        }
        
        return FlagStatus(rawValue: rawValue)
    }
    
    /// [MS-OXOFLAG] 2.2.1.2 PidTagFollowupIcon Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFollowupIcon property ([MS-OXPROPS] section 2.697) specifies the color of the flag that
    /// is set on the Message object. The flag will appear with the specified color in the UI. This property
    /// SHOULD NOT<2> exist on a Task object. When acting on other Message objects, this property is set
    /// to one of the following values. If this property is not present on a flagged object, the flag has no color.
    /// This property can be set to any of these values for a color flag, but it MUST be set to 0x00000006 for
    /// a time flag and a recipient flag.
    var followupIcon: FollowupIcon? {
        guard let rawValue: UInt32 = getProperty(id: .tagFollowupIcon) else {
            return nil
        }
        
        return FollowupIcon(rawValue: rawValue)
    }
    
    /// [MS-OXOFLAG] 2.2.1.3 PidTagFlagCompleteTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFlagCompleteTime property ([MS-OXPROPS] section 2.690) specifies the date and time,
    /// in Coordinated Universal Time (UTC), that the Message object was flagged as completed. The
    /// time's smallest resolution MUST be minutes, and the value MUST be a multiple of 600,000,000. This
    /// property is present on the Message object only if the object's PidTagFlagStatus property (section
    /// 2.2.1.1) is set to 0x00000001. This property MUST NOT exist on a meeting-related object; it
    /// SHOULD NOT<3> exist on a Task object.
    var flagCompleteTime: Date? {
        return getProperty(id: .tagFollowupIcon)
    }
    
    /// [MS-OXOFLAG] 2.2.1.6 PidTagToDoItemFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagToDoItemFlags property ([MS-OXPROPS] section 2.1042) specifies the type of flag that
    /// is set on a Message object.<6> The possible bit values are as follows. All bits not specified in the
    /// table are reserved. They MUST be ignored but SHOULD be preserved if they are set.
    var toDoItemFlags: ToDoItemFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagToDoItemFlags) else {
            return nil
        }
        
        return ToDoItemFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOFLAG] 2.2.1.7 PidTagSwappedToDoData Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSwappedToDoData property ([MS-OXPROPS] section 2.1031) acts as the secondary
    /// flag storage location if sender flags or sender reminders are supported.<7> This secondary
    /// storage location can be used by the client to maintain a second set of the flagging-related property
    /// values that do not affect the flag state of the Message object.
    /// Properties for a sender flag or a sender reminder can be stored in the PidTagSwappedToDoData
    /// property without exposing the sender flag or sender reminder information to the recipients of the
    /// message. Similarly, properties for a recipient flag or a recipient reminder can be stored in the
    /// PidTagSwappedToDoData property for informational purposes on a previously sent message. For
    /// details about reminders, see [MS-OXORMDR].
    /// The PidTagSwappedToDoData property contains the following fields. The mapping of these fields to
    /// the primary flag storage location is specified in each field description.
    /// [MS-OXORMDR] 2.2.2.2 Properties Shared with the Informational Flagging Protocol
    /// This protocol shares the following properties with the Informational Flagging Protocol:
    ///  PidTagSwappedToDoData ([MS-OXOFLAG] section 2.2.1.7)
    /// The semantics and accepted values are identical to those specified in [MS-OXOFLAG].
    var swappedToDoData: Data? {
        return getProperty(id: .tagSwappedToDoData)
    }
    
    /// [MS-OXOFLAG] 2.2.1.8 PidTagSwappedToDoStore Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSwappedToDoStore property ([MS-OXPROPS] section 2.1032) specifies a binary value
    /// that is used to determine the need for post-transmit processing of an e-mail message, as specified in
    /// section 3.1.4.3. If the PidTagSwappedToDoData property (section 2.2.1.7) is set on a Draft
    /// Message object, then the PidTagSwappedToDoStore property is set to the value of the
    /// PidTagStoreEntryId property ([MS-OXCMSG] section 2.2.1.44) of the E-mail object; otherwise, the
    /// PidTagSwappedToDoStore property is not set.
    /// [MS-OXORMDR] 2.2.2.2 Properties Shared with the Informational Flagging Protocol
    /// This protocol shares the following properties with the Informational Flagging Protocol:
    ///  PidTagSwappedToDoStore ([MS-OXOFLAG] section 2.2.1.8)
    /// The semantics and accepted values are identical to those specified in [MS-OXOFLAG].
    var swappedToDoStore: Data? {
        return getProperty(id: .tagSwappedToDoStore)
    }
    
    /// [MS-OXOFLAG] 2.2.1.9 PidLidFlagRequest Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFlagRequest property ([MS-OXPROPS] section 2.136) specifies user-supplied text to be
    /// associated with the flag that is set on the Message object. If the user does not supply a value, this
    /// property is set to "Follow up". This property SHOULD NOT exist on a meeting-related object.
    /// The client ignores the PidLidFlagRequest property if the PidLidFlagString property (section
    /// 2.2.1.10) is set to a nonzero value. The server always uses the PidLidFlagRequest property.
    /// [MS-XWDCAL] 2.2.7.25 PidLidFlagRequest
    /// DAV property names: http://schemas.microsoft.com/mapi/request,
    /// urn:schemas:httpmail:messageflag
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidFlagRequest property ([MS-OXOFLAG] section 2.2.1.9) gets or sets the user-specified
    /// text associated with the flag.
    /// For more details about the PidLidFlagRequest property, see [MS-OXPROPS] section 2.136.
    var flagRequest: String? {
        return getProperty(name: .lidFlagRequest)
    }
    
    /// [MS-OXOFLAG] 2.2.1.10 PidLidFlagString Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFlagString property ([MS-OXPROPS] section 2.137) contains an integer that identifies a
    /// predefined text string to be associated with the flag. This property MUST NOT exist on meetingrelated objects and is optional on other Message objects. Setting this property is optional for the
    /// client. The server does not read or set this property. If this property is either not present on the object
    /// or set to 0x00000000, the client associates the value of the PidLidFlagRequest property (section
    /// 2.2.1.9) with the flag; otherwise, the client uses the text identified by this property.
    /// The predefined text strings and their associated integer identifiers are specified in the following tables.
    /// All strings can be translated into the user's language, if appropriate.
    /// The predefined text strings for Contact objects are as follows.
    /// Value English string
    /// 0x0000006E "Follow up"
    /// 0x0000006F "Call"
    /// 0x00000070 "Arrange Meeting"
    /// 0x00000071 "Send E-mail"
    /// 0x00000072 "Send Letter"
    /// The predefined text strings for all other Message objects are as follows.
    /// Value English string
    /// 0x00000001 "Call"
    /// 0x00000002 "Do not Forward"
    /// 0x00000003 "Follow up"
    /// 0x00000004 "For Your Information"
    /// 0x00000005 "Forward"
    /// 0x00000006 "No Response Necessary"
    /// 0x00000007 "Read"
    /// 0x00000008 "Reply"
    /// 0x00000009 "Reply to All"
    /// 0x0000000A "Review"
    var flagString: UInt32? {
        return getProperty(name: .lidFlagString)
    }
    
    /// [MS-OXOFLAG] 2.2.1.11 PidLidValidFlagStringProof Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidValidFlagStringProof property ([MS-OXPROPS] section 2.348) MUST NOT exist on
    /// meeting-related objects. On objects that are not sendable (received mail and objects that are not
    /// mail), this property is optional. If present, this property is set equal to the
    /// PidTagMessageDeliveryTime property ([MS-OXOMSG] section 2.2.3.9) when modifying the
    /// PidLidFlagRequest property (section 2.2.1.9). Setting this property is optional for the client. The
    /// server does not read or set this property.
    /// This property can be used to validate whether the PidLidFlagRequest property was set by an agent
    /// with knowledge of the value of the PidTagMessageDeliveryTime property. Since the value of the
    /// PidTagMessageDeliveryTime property cannot be predicted by the sender, if the value of the
    /// PidLidValidFlagStringProof property is equal to the value of the PidTagMessageDeliveryTime
    /// property, it is reasonably certain that the value of the PidLidFlagRequest property did not originate
    /// from the sender of the message. A client can decide how to present the value of the
    /// PidLidFlagRequest property to the end user based on the result of this comparison in accordance
    /// with the specific security policy of the client.
    /// If the client ignores the PidLidFlagRequest property due to the value of the PidLidFlagString
    /// property (section 2.2.1.10), the client also ignores the PidLidValidFlagStringProof property.
    var validFlagStringProof: Date? {
        return getProperty(name: .lidValidFlagStringProof)
    }
    
    /// [MS-OXOFLAG] 2.2.1.12 PidLidToDoTitle Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidToDoTitle property ([MS-OXPROPS] section 2.346) specifies user-supplied text to identify
    /// the Message object in a consolidated to-do list. The PidLidToDoTitle property MUST NOT be set
    /// on a Task object.
    /// To indicate an empty property, the PidLidToDoTitle property SHOULD NOT be set to the zero-length
    /// string and instead SHOULD be deleted. If this property does not exist on an object, a client
    /// SHOULD<8> set this property to the value of the PidTagNormalizedSubject property ([MSOXCMSG] section 2.2.1.10).
    /// On a Draft Message object, if the client implements sender flags, this property SHOULD be set to
    /// the value of the PidLidFlagRequest property (section 2.2.1.9).
    var toDoTitle: String? {
        return getProperty(name: .lidToDoTitle)
    }
    
    /// [MS-OXOFLAG] 2.2.1.13 PidLidToDoOrdinalDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidToDoOrdinalDate property ([MS-OXPROPS] section 2.344) specifies the time that an
    /// object is flagged. When an object is flagged, this property SHOULD<9> be set to the current time in
    /// UTC.
    /// This property SHOULD be used to determine the order of objects in a consolidated to-do list. If the
    /// client allows a user to reorder tasks within the consolidated to-do list via dragging or other
    /// mechanisms, the client can use any suitable algorithm to determine the new value of this property
    /// such that the task appears in the correct place when this property is used as a sorting field. When this
    /// property is used to sort objects and two or more of the objects have the same value for this property,
    /// the objects with the matching values will tie for placement in the list. In this case, the
    /// PidLidToDoSubOrdinal property (section 2.2.1.14) is used to break the tie.
    var toDoOrdinalDate: Date? {
        return getProperty(name: .lidToDoOrdinalDate)
    }
    
    /// [MS-OXOFLAG] 2.2.1.14 PidLidToDoSubOrdinal Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidToDoSubOrdinal property ([MS-OXPROPS] section 2.345) specifies a string that is used to
    /// break a tie for placement within a sorted list of Message objects. When the
    /// PidLidToDoOrdinalDate property (section 2.2.1.13) is used to sort objects and two or more of the
    /// objects have the same value for this property, the objects with the matching values tie for placement
    /// in the list. In this case, the PidLidToDoSubOrdinal property is used to break the tie. If used, this
    /// property MUST be sorted lexicographically.
    /// The component characters of the string consist of only the numerals 0 through 9. This property
    /// SHOULD be initially set to "5555555". The length of this property MUST NOT exceed 254 characters
    /// (excluding the terminating null character).
    var toDoSubOrdinal: String? {
        return getProperty(name: .lidToDoSubOrdinal)
    }
}
