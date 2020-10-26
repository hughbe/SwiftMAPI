//
//  OutlookMessage+MessageObjectProperties.swift
//  
//
//  Created by Hugh Bellamy on 26/08/2020.
//

import DataStream
import Foundation

/// [MS-OXCMSG] 2.2 Message Syntax
/// [MS-OXCMSG] 2.2.1 Message Object Properties
/// Message objects can be created and modified by clients and servers. Except where noted, this section defines constraints to which both clients and servers
/// adhere when operating on Message objects.
/// Clients operate on Message objects using the ROPs as specified in section 2.2.3, and the Property and Stream Object Protocol, as specified in [MS-OXCPRPT] section 2.2.
/// Unless otherwise specified, all property constraints specified in [MS-OXPROPS] apply to Message objects. A Message object can also contain other properties defined
/// in [MS-OXPROPS], but these properties have no impact on this protocol.
/// When a property is referred to as "read-only for the client", the server can return Success but not persist any changes to read-only properties.<1>
/// Read-only properties that could not be saved are enumerated in the PropertyProblems field of the RopSetProperties ROP response, as specified in [MS-OXCROPS] section 2.2.8.6.2.
public extension MessageStorage {
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCPRPT] 2.2.1.1 PidTagAccess Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAccess property ([MS-OXPROPS] section 2.499) indicates the operations available to the client for the object.
    /// The value is a bitwise OR of zero or more values from the following table. This property is read-only for the client.
    var access: MessageAccess? {
        guard let rawValue: UInt32 = getProperty(id: .tagAccess) else {
            return nil
        }
        
        return MessageAccess(rawValue: rawValue)
    }

    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCMSG] 2.2.2.1 General Properties
    /// The following properties exist on any Attachment object. These properties are set by the server and
    /// are read-only for the client. 
    /// [MS-OXCPRPT] 2.2.1.2 PidTagAccessLevel Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAccessLevel property ([MS-OXPROPS] section 2.501) indicates the client's access level to the object. This property does not apply to Folder
    /// objects and Logon objects. This value of this property MUST be one of the values in the following table. This property is read-only for the client.
    var accessLevel: MessageAccessLevel? {
        guard let rawValue: UInt32 = getProperty(id: .tagAccessLevel) else {
            return nil
        }
        
        return MessageAccessLevel(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCMSG] 2.2.2.3 PidTagCreationTime Property
    /// Type: PtypTime, in UTC ([MS-OXCDATA] section 2.11.1)
    /// Indicates the time the file referenced by the Attachment object was created, or the time the
    /// Attachment object itself was created.
    /// [MS-OXCPRPT] 2.2.2.3 PidTagCreationTime Property
    /// Type: PtypTime, in UTC ([MS-OXCDATA] section 2.11.1)
    /// Indicates the time the file referenced by the Attachment object was created, or the time the
    /// Attachment object itself was created.
    /// [MS-OXOABK] 2.2.3.16 PidTagCreationTime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCreationTime property ([MS-OXCMSG] section 2.2.2.3) contains the creation date and
    /// time for an Address Book object in Coordinated Universal Time (UTC).
    var creationTime: Date? {
        return getProperty(id: .tagCreationTime)
    }
    
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCMSG] 2.2.2.2 PidTagLastModificationTime Property
    /// Type: PtypTime, in UTC ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastModificationTime property ([MS-OXPROPS] section 2.764) indicates the last time
    /// the file referenced by the Attachment object was modified, or the last time the Attachment object
    /// itself was modified.
    /// [MS-OXCPRPT] 2.2.1.6 PidTagLastModificationTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastModificationTime property ([MS-OXCMSG] section 2.2.2.2) contains the time of the
    /// last modification to the object in UTC. This property is read-only for clients.
    /// [MS-OXOABK] 2.2.3.17 PidTagLastModificationTime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastModificationTime property ([MS-OXCMSG] section 2.2.2.2) contains the date and
    /// time that an Address Book object was last modified in Coordinated Universal Time (UTC).
    var lastModificationTime: Date? {
        return getProperty(id: .tagLastModificationTime)
    }
    
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCPRPT] 2.2.1.5 PidTagLastModifierName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastModifierName property ([MS-OXPROPS] section 2.760) contains the name of the
    /// last mail user to modify the object. This property does not apply to Folder objects and Logon
    /// objects. This property is read-only for clients.
    var lastModifierName: String? {
        return getProperty(id: .tagLastModifierName)
    }
    
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCPRPT] 2.2.1.7 PidTagObjectType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagObjectType property ([MS-OXPROPS] section 2.807) indicates the type of Server
    /// object. This property does not apply to Folder objects and Logon objects. The value of this
    /// property MUST be one of the values in the following table. This property is read-only for the client.
    /// [MS-OXOABK] 2.2.3.10 PidTagObjectType
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagObjectType property ([MS-OXCPRPT] section 2.2.1.7) contains a value that specifies the
    /// type of an object.
    /// The PidTagObjectType property MUST be present for all Address Book objects and MUST have
    /// one of the values listed in the following table.
    /// Value name Value Description
    /// MAILUSER 0x00000006 A mail user, or any Address Book object that is not a distribution list or forum.
    /// DISTLIST 0x00000008 A distribution list.
    /// folder 0x00000003 A messaging forum, such as a bulletin board service or a public or shared folder.
    var objectType: ObjectType? {
        guard let rawValue: UInt32 = getProperty(id: .tagObjectType) else {
            return nil
        }
        
        return ObjectType(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCPRPT] 2.2.1.8 PidTagRecordKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecordKey property ([MS-OXPROPS] section 2.904) contains a unique binary-comparable
    /// identifier for a specific object. Whenever a copy of an object is created, the server generates a new
    /// identifier for the copied object. This property does not apply to Folder objects and Logon objects.
    /// This property is read-only for the client.
    /// [MS-OXOABK] 2.2.3.4 PidTagRecordKey
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecordKey property ([MS-OXCPRPT] section 2.2.1.8) contains a unique binarycomparable identifier for an Address Book object. This value MUST be present on all objects on an
    /// NSPI server and MUST match the value for the PidTagTemplateid property (section 2.2.3.3).
    /// The PidTagRecordKey property is not present on objects in an offline address book (OAB).
    var recordKey: Data? {
        return getProperty(id: .tagRecordKey)
    }
    
    /// [MS-OXCMSG] 2.2.1.1 General Properties
    /// The following properties exist on all Message objects. These properties are read-only for the client.
    /// [MS-OXCPRPT] 2.2.1.9 PidTagSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSearchKey property ([MS-OXPROPS] section 2.991) contains a unique binary-comparable
    /// key that identifies an object for a search. Whenever a copy of an object is created, the key is also
    /// copied from the original object. This property does not apply to Folder objects and Logon objects.
    /// This property is read-only for clients.
    /// [MS-OXOABK] 2.2.3.5 PidTagSearchKey
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSearchKey property ([MS-OXCPRPT] section 2.2.1.9) is formed by concatenating the
    /// ASCII string "EX: " followed by the DN for the object converted to all uppercase, followed by a zerobyte value. This value MUST be present for all Address Book objects on an NSPI server and MUST
    /// be in the aforementioned format.
    /// The PidTagSearchKey property is not present on objects in an offline address book (OAB).
    var searchKey: Data? {
        return getProperty(id: .tagSearchKey)
    }
    
    /// [MS-OXCMSG] 2.2.1.2 PidTagHasAttachments Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHasAttachments property ([MS-OXPROPS] section 2.716) indicates whether the
    /// Message object contains at least one attachment. This property is read-only for the client.
    /// The server computes this property from the mfHasAttach flag of the PidTagMessageFlags property
    /// ([MS-OXPROPS] section 2.791).
    /// [MS-XWDCAL] 2.2.3.5 PidTagHasAttachments
    /// DAV property name: urn:schemas:httpmail:hasattachment
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagHasAttachments property ([MS-OXCMSG] section 2.2.1.2) gets a value that indicates
    /// whether or not the message has attachments. True if the message has attachments; otherwise, false.
    /// For more details about the PidTagHasAttachments property, see [MS-OXPROPS] section 2.707.
    var hasAttachments: Bool? {
        return getProperty(id: .tagHasAttachments)
    }
    
    /// [MS-OXCMSG] 2.2.1.3 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXPROPS] section 2.787) denotes the specific type of the
    /// Message object. It determines the set of properties defined for the message, the kind of information
    /// the message conveys, and how to handle the message.
    /// All characters in this property MUST be from the ASCII characters 0x20 through 0x7F. It MUST NOT
    /// end with a period (ASCII character 0x2E), and its length MUST be greater than zero and less than 256
    /// characters. Furthermore, its length SHOULD be fewer than 128 characters because some operations
    /// require extending the value of the PidTagMessageClass property.
    /// Any equality or matching operations performed against the value of this property MUST be caseinsensitive.
    /// The value of this property is interpreted in groups of characters separated by periods ("."). Each group
    /// specifies a type of object. A message class of "IPM.Note" denotes a standard Message object, and a
    /// message class of "Remote.IPM.Note" indicates a header message object.
    /// [MS-OXOCAL] 2.2.2.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be
    /// "IPM.Appointment" or be prefixed with "IPM.Appointment.".
    /// [MS-OXOCAL] 2.2.6.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be
    /// "IPM.Schedule.Meeting.Request" or MUST be prefixed with "IPM.Schedule.Meeting.Request.".
    /// [MS-OXOCAL] 2.2.7.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST begin with
    /// "IPM.Schedule.Meeting.Resp" and MUST be appended with either ".Pos", ".Tent", or ".Neg", indicating
    /// accept, tentatively accept, or decline, respectively.
    /// [MS-OXOCAL] 2.2.8.1 PidTagMessageClass Property
    /// Type: PtypString8 ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be
    /// "IPM.Schedule.Meeting.Canceled".
    /// [MS-OXOCAL] 2.2.9 Meeting Forward Notification Object
    /// The properties that are specific to Meeting Forward Notification objects are specified in sections
    /// 2.2.9.1 through 2.2.9.4. Unless otherwise specified, these properties MUST exist.
    /// [MS-OXOCAL] .2.10.2.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be
    /// "IPM.OLE.CLASS.{00061055-0000-0000-C000-000000000046}".
    /// [MS-OXOCFG] 2.2.8.9 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXPROPS] section 2.781) SHOULD<27> be set to
    /// "IPM.ConversationAction".
    /// [MS-OXOCFG] 2.2.9.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXPROPS] section 2.781) identifies the message as a
    /// navigation shortcut message, as specified in section 2.2.9. The value is
    /// "IPM.Microsoft.WunderBar.Link".
    /// [MS-OXOCNTC] 2.2.1.11.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. A Contact object MUST have this property set to either "IPM.Contact" or a string
    /// prefixed with "IPM.Contact.".
    /// [MS-OXOCNTC] 2.2.2.4.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. A Personal Distribution List object MUST have this property set to either
    /// "IPM.DistList" or a string prefixed with "IPM.DistList".
    /// [MS-OXODLGT] 2.2.2.1.1 PidTagMessageClass Property
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXPROPS] section 2.781) MUST be set to
    /// "IPM.Microsoft.ScheduleData.FreeBusy".
    /// [MS-OXODOC] 2.2.2.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. For a message to be treated as a Document object by a client, the value of this
    /// property MUST be "IPM.document.<FileType>", where the "<FileType>" substring indicates the type
    /// of the attached file. The value of the substring that follows "IPM.document." is implementationdependent.
    /// [MS-OXOJRNL] 2.2.2.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. The value of this property MUST be "IPM.Activity" or MUST begin with
    /// "IPM.Activity.", in addition to meeting the criteria specified in [MS-OXCMSG].
    /// [MS-OXOMSG] 2.2.1.16 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) contains the object type
    /// classification. This property is set to "IPM.Note" on E-mail objects. The value of the
    /// PidTagMessageClass property for report objects is specified in section 2.2.2.1 of this document.
    /// [MS-OXOMSG] 2.2.2.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) contains a Message object
    /// class name. For report messages, the property is set to the value in the form "REPORT.X.<receipt-
    /// type>", where X is the original message class name, such as "IPM.NOTE" for an E-mail object, and
    /// <receipt-type> is one of the following receipt types:
    ///  IPNRN: Read receipt
    ///  IPNNRN: Non-read receipt
    ///  DR: Delivery receipt
    ///  NDR: Non-delivery report
    /// Therefore, the report messages of the IPM.NOTE message class name are as listed in the following
    /// table.
    /// Report type Message class name (PtypString)
    /// Read receipt REPORT.IPM.NOTE.IPNRN
    /// Non-read receipt REPORT.IPM.NOTE.IPNNRN
    /// Delivery receipt REPORT.IPM.NOTE.DR
    /// Non-delivery report REPORT.IPM.NOTE.NDR
    /// [MS-OXONOTE] 2.2.2.3 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. The value MUST be "IPM.StickyNote" or begin with "IPM.StickyNote.", in addition to
    /// meeting the criteria specified in [MS-OXCMSG] section 2.2.1.3.
    /// [MS-OXOPFFB] 2.2.1.1.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be set to "IPM.Post".
    /// [MS-OXOPOST] 2.2.2.4 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of Message
    /// object. This value MUST be "IPM.Post" or MUST begin with "IPM.Post.", in addition to meeting the
    /// criteria specified in [MS-OXCMSG]. The string is case-insensitive.
    /// [MS-OXORMDR] 2.2.2.1 Properties Shared with the Message and Attachment Object Protocol
    ///  PidTagMessageClass ([MS-OXCMSG] section 2.2.1.3)
    /// The semantics and accepted values are identical to those specified in [MS-OXCMSG].
    /// [MS-OXORSS] 2.2.2.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass ([MS-OXCMSG] section 2.2.1.3) property specifies the type of the
    /// Message object. The value MUST be "IPM.Post.RSS" or begin with "IPM.Post.RSS.".
    /// [MS-OXORULE] 2.2.4.1.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be set on the FAI
    /// message and MUST have a value of "IPM.ExtendedRule.Message".
    /// [MS-OXORULE] 2.2.6.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be set to "IPC.Microsoft
    /// Exchange 4.0.Deferred Action".
    /// [MS-OXORULE] 2.2.7.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be set to "IPC.Microsoft
    /// Exchange 4.0.Deferred Error".
    /// [MS-OXOSMMS] 2.2.2.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. In addition to meeting the criteria specified in [MS-OXCMSG], for SMS objects this
    /// value MUST either be set to "IPM.Note.Mobile.SMS" or begin with "IPM.Note.Mobile.SMS". For MMS
    /// objects, this property MUST either be set to "IPM.Note.Mobile.MMS" or begin with
    /// "IPM.Note.Mobile.MMS.".
    /// [MS-OXOSRCH] 2.2.1.1.1 PidTagMessageClass
    /// Type: PtypString
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. The value of this property MUST be "IPM.Microsoft.WunderBar.SFInfo" to indicate
    /// that the Message object is a search folder definition message.
    /// [MS-OXOTASK] 2.2.2.1.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. The value MUST be "IPM.Task" or begin with "IPM.Task.". The string is caseinsensitive.
    /// [MS-OXOTASK] 2.2.3.3.1 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) specifies the type of the
    /// Message object. The value is one of the following strings and is case-insensitive.
    /// String Type of task communication
    /// "IPM.TaskRequest" Task request
    /// "IPM.TaskRequest.Accept" Task acceptance
    /// "IPM.TaskRequest.Decline" Task rejection
    /// "IPM.TaskRequest.Update" Task update
    /// [MS-OXOUM] 2.2.2.1 Message Classes
    /// For voice messages, the value of the PidTagMessageClass property ([MS-OXOMSG] section
    /// 2.2.2.1) MUST be one the following:
    ///  IPM.Note.Microsoft.Voicemail.UM.CA for original messages taken with audio content by
    /// telephone.
    ///  IPM.Note.Microsoft.Voicemail.UM for original messages taken with audio content by telephone
    /// but not as a result of call answering (for example, if the phone of the recipient did not ring).
    ///  The value of the original PidTagMessageClass property suffixed with .Microsoft.Voicemail for
    /// messages with audio content that was created in response to other messages. For example, a
    /// voice reply to a message of type IPM.Note has the type IPM.Note.Microsoft.Voicemail.
    /// For fax messages, the value of the PidTagMessageClass property MUST be set to
    /// IPM.Note.Microsoft.FAX.CA.
    /// For missed call notifications, the value of the PidTagMessageClass property MUST be set to
    /// IPM.Note.Microsoft.Missed.Voice.
    /// [MS-OXOUM] 2.2.3.1.1 Message Classes
    /// A protected voice message is represented by the following message classes:
    ///  IPM.NOTE.rpmsg.Microsoft.VoiceMail.UM.CA, for original messages taken with audio content
    /// by telephone as a result of call answering.
    ///  IPM.NOTE.rpmsg.Microsoft.VoiceMail.UM, for original messages taken with audio content by
    /// telephone as a result of any scenario other than call answering.
    /// [MS-OXOUM] 2.2.4 UI Configuration
    /// A client application can display an enhanced user interface (UI) for Message objects with the
    /// message classes specified in section 2.2.2.1 for some users and not for others. In addition, the
    /// client can show UI configuration information related to a user's telephony experience for some users
    /// and not for others. The server SHOULD store settings for these options on a per-user basis, and the
    /// client MUST consult these settings before it attempts to implement the aforementioned UI
    /// segmentation.
    /// This could be useful in a scenario in which a certain group of users are not provisioned by their
    /// administrator to receive the message classes specified in section 2.2.2.1 and/or are not provisioned to
    /// have telephony access to their messages.
    /// If the client or server sets or uses this configuration information, it MUST treat this information as a
    /// dictionary stream by using the Configuration Information Protocol, as specified in [MS-OXOCFG].
    /// The dictionary stream object MUST be stored in the Inbox special folder, as specified in [MSOXOSFLD] section 2.2.7.
    /// The dictionary stream MUST have the PidTagMessageClass property ([MS-OXCMSG] section
    /// 2.2.1.3) set on it. The value of this property MUST be IPM.Configuration.UMOLK.UserOptions
    /// [MS-OXSHARE] 2.2.5.2 PidTagMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) MUST be set to "IPM.Sharing" or
    /// a value that begins with "IPM.Sharing.".
    /// [MS-XWDCAL] 2.2.8.10 PidTagMessageClass
    /// DAV property name: http://schemas.microsoft.com/exchange/outlookmessageclass
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) gets or sets the type of
    /// Calendar object.
    /// The PidTagMessageClass property is further specified in [MS-OXOCAL] section 2.2.2.1.
    /// For more details about the PidTagMessageClass property, see [MS-OXPROPS] section 2.778.
    var messageClass: String? {
        return getProperty(id: .tagMessageClass)
    }
    
    /// [MS-OXCMSG] 2.2.1.4 PidTagMessageCodepage Property
    /// Type: PtypInteger32, unsigned
    /// The PidTagMessageCodepage property ([MS-OXPROPS] section 2.788) specifies the code page
    /// used to encode the non-Unicode string properties on this Message object. The Folder object code
    /// page is used if this property is set to 0x00000000.
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
    /// [MS-OXPFOAB] 2.2.1.2 PidTagMessageCodepage
    /// The value of this property is the code page that is used to encode the strings in the message
    /// properties in OAB version 2 files. Note that strings in OAB version 4 files are stored in UTF-8 format.
    /// For details, see [MS-OXCMSG] section 2.2.1.4 and [MS-OXPROPS] section 2.779.
    var messageCodepage: UInt32? {
        return getProperty(id: .tagMessageCodepage)
    }
    
    /// [MS-OXCMSG] 2.2.1.5 PidTagMessageLocaleId Property
    /// Type: PtypInteger32, unsigned
    /// Contains the language code identifier (LCID) of the end-user who created this message. For more
    /// details see [MS-LCID].
    var messageLocaleId: UInt32? {
        return getProperty(id: .tagMessageLocaleId)
    }
    
    /// [MS-OXCMSG] 2.2.1.6 PidTagMessageFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageFlags property ([MS-OXPROPS] section 2.791) specifies the status of the
    /// Message object. Set to zero or to a bitwise OR of one or more of the values from the following
    /// tables.
    /// After the first successful call to the RopSaveChangesMessage ROP ([MS-OXCROPS] section
    /// 2.2.6.3), as described in section 2.2.3.3, these flags are read-only for the client.
    /// [MS-OXORMDR] 2.2.2.1 Properties Shared with the Message and Attachment Object Protocol
    ///  PidTagMessageFlags ([MS-OXCMSG] section 2.2.1.6)
    /// The semantics and accepted values are identical to those specified in [MS-OXCMSG].
    var messageFlags: MessageFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagMessageFlags) else {
            return nil
        }
        
        return MessageFlags(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.7 PidTagMessageSize Property
    /// Type: PtypInteger32, unsigned
    /// Contains the size in bytes consumed by the Message object on the server. This property is read-only
    /// for the client.
    /// [MS-OXCFOLD] 2.2.2.2.1.10 PidTagMessageSize Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageSize property ([MS-OXPROPS] section 2.790) specifies the aggregate size of
    /// messages in the folder.
    /// [MS-OXCSTOR] 2.2.2.1.1.9 PidTagMessageSize Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageSize property ([MS-OXPROPS] section 2.790) contains the cumulative size, in
    /// bytes, of all content in the mailbox. Value is limited to 32 bits and becomes undefined if the content
    /// size exceeds 4 gigabytes.
    /// [MS-OXCFXICS] 2.2.1.6 PidTagMessageSize Property
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageSize property ([MS-OXPROPS] section 2.796) identifies the size of the message
    /// in bytes.
    /// For details about the presence of the PidTagMessageSize property in message change headers, see
    /// section 2.2.3.2.1.1.1.
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
    /// [MS-OXPFOAB] 2.2.1.3 PidTagMessageSize
    /// This property contains the size of the message on the server. For details about this property, see [MSOXCMSG] section 2.2.1.7 and [MS-OXPROPS] section 2.787.
    var messageSize: UInt32? {
        return getProperty(id: .tagMessageSize)
    }

    /// [MS-OXCMSG] 2.2.1.8 PidTagMessageStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// Specifies the status of a message in a contents table. Contains a bitwise OR of zero or more of the
    /// following values.
    var messageStatus: MessageStatus? {
        guard let rawValue: UInt32 = getProperty(id: .tagMessageStatus) else {
            return nil
        }
        
        return MessageStatus(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.9 PidTagSubjectPrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSubjectPrefix property ([MS-OXPROPS] section 2.1033) contains the prefix for the
    /// subject of the message. This property is set by the client but can be an empty string if there is no
    /// subject. The sum of the lengths of the PidTagNormalizedSubject property (section 2.2.1.10) and
    /// the PidTagSubjectPrefix property MUST be less than 254 characters.
    /// More details about the processing of this property are specified in section 3.1.5.13.
    /// [MS-OXOCAL] 2.2.7.2 PidTagSubjectPrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagSubjectPrefix property ([MS-OXCMSG] section 2.2.1.9) is a localized string
    /// that contains an implementation-dependent response to a meeting request to accept, tentatively
    /// accept, decline, or propose a new time for a meeting.
    /// For example, if localized in English, this property can be set to values such as, "Accepted",
    /// "Tentative", "Declined", or "New Time Proposed".
    /// [MS-OXOCAL] 2.2.8.2 PidTagSubjectPrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagSubjectPrefix property ([MS-OXCMSG] section 2.2.1.9) contains an
    /// implementation-dependent localized message that indicates that the meeting was canceled. For
    /// example, in English, this property can be set to "Canceled".
    /// [MS-OXOCAL] 2.2.9.2 PidTagSubjectPrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidTagSubjectPrefix property ([MS-OXCMSG] section 2.2.1.9) MUST be a localized
    /// string that indicates that the object is a Meeting Forward Notification object.
    /// [MS-OXOMSG] 2.2.1.60 PidTagSubjectPrefix Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// On an E-mail object, the PidTagSubjectPrefix property ([MS-OXCMSG] section 2.2.1.9) represents
    /// an action on the e-mail message, such as "RE: " for replying and "FW: " for forwarding. If this
    /// property is absent, there is no subject prefix for the e-mail message.
    /// On report messages, the value of the PidTagSubjectPrefix property is set as follows for the
    /// specified types of reports and responses:
    ///  Delivery receipts: "Delivered: "
    ///  Read receipts: "Read: "
    ///  Sender response on read receipt requests: "Approved: "
    ///  Non-delivery reports: "Undeliverable: "
    ///  Non-read receipts: "Not Read: " or "read: "
    var subjectPrefix: String? {
        return getProperty(id: .tagSubjectPrefix)
    }
    
    /// [MS-OXCMSG] 2.2.1.10 PidTagNormalizedSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXPROPS] section 2.812) contains the normalized
    /// subject of the message, as specified in [MS-OXCMAIL] section 2.2.3.2.6.1. This property is set by the
    /// client but can be an empty string if there is no subject. The sum of the lengths of the
    /// PidTagNormalizedSubject property and the PidTagSubjectPrefix property (section 2.2.1.9) MUST
    /// be less than 254 characters.
    /// More details about obtaining the value of this property are specified in section 3.1.5.13.
    /// [MS-OXOCFG] 2.2.9.2 PidTagNormalizedSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXPROPS] section 2.806) specifies the display name
    /// of the navigation shortcut, as specified in section 2.2.9.
    /// [MS-OXOCNTC] 2.2.1.11.1 PidTagNormalizedSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) specifies a combination of
    /// the full name and company name of the contact. This property is computed by the client according to
    /// an implementation-dependent algorithm that uses values of the PidTagGivenName (section
    /// 2.2.1.1.6), PidTagMiddleName (section 2.2.1.1.5), PidTagSurname (section 2.2.1.1.4),
    /// PidTagGeneration (section 2.2.1.1.2), and PidTagCompanyName (section 2.2.1.6.2) properties.
    /// The client uses the value of the PidTagNormalizedSubject property as the caption of the window
    /// displaying information about this contact. The value of the very similar PidTagDisplayName property
    /// (section 2.2.1.1.8) might contain characters that cannot be displayed as a window caption.
    /// [MS-OXOCNTC] 2.2.2.4.1 PidTagNormalizedSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) specifies the user-visible
    /// name of the personal distribution list. The value of this property MUST be the same as the value of the
    /// PidTagDisplayName property (section 2.2.2.1.1).
    /// [MS-OXODLGT] 2.2.2.1.2 PidTagNormalizedSubject Property
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXPROPS] section 2.806) MUST be set to
    /// "LocalFreebusy".
    /// [MS-OXOPFFB] 2.2.1.1.1 PidTagNormalizedSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) specifies the subject of
    /// the free/busy message. Its value is a string that is derived from the email address of the user. The
    /// email address is the value of the PidTagEmailAddress property ([MS-OXOABK] section 2.2.3.14) of
    /// the Address Book object of the user. The subject is derived by taking the substring, starting with
    /// "/CN", prepending "USER-", and converting all the characters to uppercase.
    /// [MS-OXOSMMS] 2.2.2.4 PidTagNormalizedSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) contains an abbreviated
    /// version of the contents of the message suitable for displaying groups of SMS objects to a user. For
    /// MMS objects, only the constraints specified in [MS-OXCMSG] section 2.2.1.10 apply.
    /// [MS-XWDCAL] 2.2.3.6 PidTagNormalizedSubject
    /// DAV property name: urn:schemas:httpmail:normalizedsubject
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) gets the calculated
    /// normalized subject of the Calendar object. The normalized subject contains the subject with any
    /// prefixes, such as "Re:" and "Fwd:", removed.
    /// For more details about the PidTagNormalizedSubject property, see [MS-OXPROPS] section 2.803.
    var normalizedSubject: String? {
        return getProperty(id: .tagNormalizedSubject)
    }
    
    /// [MS-OXCMSG] 2.2.1.11 PidTagImportance Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagImportance property ([MS-OXPROPS] section 2.738) indicates the level of importance
    /// assigned by the end user to the Message object. This property MUST be set to one of the following
    /// values.
    var importance: MessageImportance? {
        guard let rawValue: UInt32 = getProperty(id: .tagImportance) else {
            return nil
        }
        
        return MessageImportance(rawValue: rawValue)
    }

    /// [MS-OXCMSG] 2.2.1.12 PidTagPriority Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPriority property ([MS-OXPROPS] section 2.871) indicates the client's request for the
    /// priority at which the message is to be sent by the messaging system. This property is set to one of the
    /// following values.
    /// [MS-XWDCAL] 2.2.3.7 PidTagPriority
    /// DAV property name: urn:schemas:httpmail:priority
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagPriority property ([MS-OXCMSG] section 2.2.1.12) gets or sets the priority at which the
    /// message is to be sent by the messaging system.
    /// For more details about the PidTagPriority property, see [MS-OXPROPS] section 2.862.
    var priority: MessagePriority? {
        guard let rawValue: UInt32 = getProperty(id: .tagPriority) else {
            return nil
        }
        
        return MessagePriority(rawValue: rawValue)
    }

    /// [MS-OXCMSG] 2.2.1.13 PidTagSensitivity Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSensitivity property ([MS-OXPROPS] section 2.1010) indicates the sender's assessment
    /// of the sensitivity of the Message object. The value of this property is one of the following.
    /// [MS-XWDCAL] 2.2.8.12 PidTagSensitivity
    /// DAV property name: http://schemas.microsoft.com/exchange/sensitivity
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagSensitivity property ([MS-OXPROPS] section 2.1001) gets or sets message and
    /// appointment sensitivity. The following table lists valid values.
    var sensitivity: MessageSensitivity? {
        guard let rawValue: UInt32 = getProperty(id: .tagSensitivity) else {
            return nil
        }
        
        return MessageSensitivity(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.14 PidLidSmartNoAttach Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSmartNoAttach property ([MS-OXPROPS] section 2.301) is set to TRUE (0x01) if the
    /// Message object has no attachments that are visible to the end user. If this property is unset, a
    /// default value of FALSE (0x00) is used.
    var smartNoAttach: Bool? {
        return getProperty(name: .lidSmartNoAttach)
    }
    
    /// [MS-OXCMSG] 2.2.1.15 PidLidPrivate Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPrivate property ([MS-OXPROPS] section 2.211) is set to TRUE (0x01) if the end user
    /// wants this Message object to be hidden from other users who have access to the Message object.
    var `private`: Bool? {
        return getProperty(name: .lidPrivate)
    }
    
    /// [MS-OXCMSG] 2.2.1.16 PidLidSideEffects Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSideEffects property ([MS-OXPROPS] section 2.299) controls how a Message object is
    /// handled by the client in relation to certain user interface actions by the user, such as deleting a
    /// message. This property is set to a bitwise OR of zero or more of the following flags.
    /// [MS-OXOCAL] 2.2.2.2 PidLidSideEffects Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The possible flag values of the PidLidSideEffects property are specified in [MS-OXCMSG] section
    /// 2.2.1.16. All Calendar objects SHOULD<21> include the following flags:
    ///  seOpenToDelete
    ///  seOpenToCopy
    ///  seOpenToMove
    ///  seCoerceToInbox
    ///  seOpenForCtxMenu
    /// [MS-OXOCAL] 2.2.5.1 PidLidSideEffects Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The possible flag values of the PidLidSideEffects property are specified in [MS-OXCMSG] section
    /// 2.2.1.16. All Meeting Request objects are to include the following flags:
    ///  seOpenToDelete (0x00000001)
    ///  seOpenToCopy (0x00000020)
    ///  seOpenToMove (0x00000040)
    ///  seCannotUndoDelete (0x00000400)
    ///  seCannotUndoCopy (0x00000800)
    ///  seCannotUndoMove (0x00001000)
    var sideEffects: MessageSideEffects? {
        guard let rawValue: UInt32 = getProperty(name: .lidSideEffects) else {
            return nil
        }
        
        return MessageSideEffects(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.17 PidNameKeywords Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameKeywords property ([MS-OXPROPS] section 2.451) contains keywords or categories
    /// for the Message object. The length of each string within the multivalue string is less than 256
    /// characters.
    /// [MS-OXOCAL] 2.2.1.8 PidNameKeywords Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidNameKeywords property ([MS-OXCMSG] section 2.2.1.17) specifies the color to be used
    /// when displaying a Calendar object. If the PidNameKeywords property contains the name of a
    /// category that is described in the category list, as specified in [MS-OXOCFG] section 2.2.5.2.2, the
    /// client displays the Calendar object in the color that is specified for the category. Otherwise, the client
    /// displays the Calendar object in the default color.<6>
    /// [MS-OXOCFG] 2.2.8.7 PidNameKeywords Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// If this conversation is being categorized, the PidNameKeywords property ([MS-OXPROPS] section
    /// 2.447) SHOULD<25> be set to the list of categories that are being set on incoming E-mail objects
    /// in the conversation. Otherwise, this property SHOULD NOT be set.
    /// [MS-OXODOC] 2.2.1.4 PidNameKeywords Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameKeywords property ([MS-OXCMSG] section 2.2.1.17) specifies the categories of the file
    /// attached to the Document object.
    /// [MS-XWDCAL] 2.2.6.1 PidNameKeywords
    /// DAV property names: urn:schemas-microsoft-com:office:office#Keywords,
    /// http://schemas.microsoft.com/exchange/keywords-utf8
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameKeywords property ([MS-OXPROPS] section 2.444) gets or sets a list of keywords for
    /// the Calendar object. This property is further specified in [MS-OXCMSG] section 2.2.1.17.
    var keywords: [String]? {
        return getProperty(name: .nameKeywords)
    }
    
    /// [MS-OXCMSG] 2.2.1.18 PidLidCommonStart Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCommonStart property ([MS-OXPROPS] section 2.63) indicates the start time for the
    /// Message object. The value of this property is less than or equal to the value of the
    /// PidLidCommonEnd property (section 2.2.1.19). This time is interpreted as Coordinated Universal
    /// Time (UTC).
    /// [MS-OXOCAL] 2.2.1.32 PidLidCommonStart Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCommonStart property ([MS-OXPROPS] section 2.64) represents the start date and time
    /// of an event.
    /// The value of this property MUST be equal to the value of the PidLidAppointmentStartWhole
    /// property (section 2.2.1.5).
    /// [MS-OXOTASK] 2.2.2.1.3 PidLidCommonStart Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCommonStart property ([MS-OXCMSG] section 2.2.1.18) specifies the Coordinated
    /// Universal Time (UTC) equivalent of the PidLidTaskStartDate property (section 2.2.2.2.4).
    var commonStart: Date? {
        return getProperty(name: .lidCommonStart)
    }
    
    /// [MS-OXCMSG] 2.2.1.19 PidLidCommonEnd Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCommonEnd property ([MS-OXPROPS] section 2.62) indicates the end time for the
    /// Message object. The value of this property MUST be greater than or equal to the value of the
    /// PidLidCommonStart property (section 2.2.1.18). This time is interpreted as UTC.
    /// [MS-OXOCAL] 2.2.1.33 PidLidCommonEnd Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCommonEnd property ([MS-OXPROPS] section 2.63) represents the end date and time of
    /// an event.
    /// The value of this property MUST be equal to the value of the PidLidAppointmentEndWhole property
    /// (section 2.2.1.6). 
    /// [MS-OXOTASK] 2.2.2.1.4 PidLidCommonEnd Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCommonEnd property ([MS-OXCMSG] section 2.2.1.19) specifies the UTC equivalent of
    /// the PidLidTaskDueDate property (section 2.2.2.2.5).
    var commonEnd: Date? {
        return getProperty(name: .lidCommonEnd)
    }
    
    /// [MS-OXCMSG]2.2.1.20 PidTagAutoForwarded Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAutoForwarded property ([MS-OXPROPS] section 2.614) indicates that this message has
    /// been automatically generated or automatically forwarded. If this property is unset, a default value of
    /// 0x00 is assumed.
    var autoForwarded: Bool? {
        return getProperty(id: .tagAutoForwarded)
    }
    
    /// [MS-OXCMSG] 2.2.1.21 PidTagAutoForwardComment Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAutoForwardComment property ([MS-OXPROPS] section 2.613) contains a comment
    /// added by the autoforwarding agent.
    var autoForwardComment: String? {
        return getProperty(id: .tagAutoForwardComment)
    }
    
    /// [MS-OXCMSG] 2.2.1.22 PidLidCategories Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCategories property ([MS-OXPROPS] section 2.49) contains the array of text labels
    /// assigned to this Message object.
    var categories: [String]? {
        return getProperty(name: .lidCategories)
    }
    
    /// [MS-OXCMSG] 2.2.1.23 PidLidClassification
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidClassification property ([MS-OXPROPS] section 2.52) contains a list of the classification
    /// categories to which this Message object has been assigned.
    var classification: String? {
        return getProperty(name: .lidClassification)
    }
    
    /// [MS-OXCMSG] 2.2.1.24 PidLidClassificationDescription Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidClassificationDescription property ([MS-OXPROPS] section 2.53) contains a humanreadable summary of each of the classification categories included in the PidLidClassification
    /// property (section 2.2.1.23).
    var classificationDescription: String? {
        return getProperty(name: .lidClassificationDescription)
    }
    
    /// [MS-OXCMSG] 2.2.1.25 PidLidClassified Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidClassified property ([MS-OXPROPS] section 2.56) indicates whether the contents of a
    /// message are regarded as classified information.
    var classified: Bool? {
        return getProperty(name: .lidClassified)
    }
    
    /// [MS-OXCMSG] 2.2.1.26 PidTagInternetReferences Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInternetReferences property ([MS-OXPROPS] section 2.749) contains a list of message
    /// IDs (MIDs), as specified in [MS-OXCDATA] section 2.2.1.2, that specify the messages to which this
    /// reply is related. The format of this property is specified in [RFC2822].
    var internetReferences: String? {
        return getProperty(id: .tagInternetReferences)
    }
    
    /// [MS-OXCMSG] 2.2.1.27 PidLidInfoPathFormName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidInfoPathFormName property ([MS-OXPROPS] section 2.149) contains the name of the
    /// form associated with this message, if one exists. The relationship between this property and the
    /// Content-Class MIME header is specified in [MS-OXCMAIL] sections 2.1.3.2.2 and 2.2.3.2.15.
    var infoPathFormName: String? {
        return getProperty(name: .lidInfoPathFormName)
    }
    
    /// [MS-OXCMSG] 2.2.1.28 PidTagMimeSkeleton Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMimeSkeleton property ([MS-OXPROPS] section 2.803) contains all the top level MIME
    /// message headers, all MIME message body part headers, and body part content that is not already
    /// converted to Message object properties, including attachments.
    /// The use of the PidTagMimeSkeleton property for converting between MIME messages and Message
    /// object format is specified in [MS-OXCMAIL] section 2.4.3.1.
    var mimeSkeleton: Data? {
        return getProperty(id: .tagMimeSkeleton)
    }
    
    /// [MS-OXCMSG] 2.2.1.29 PidTagTnefCorrelationKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTnefCorrelationKey property ([MS-OXPROPS] section 2.1047) contains a value that
    /// correlates a Transport Neutral Encapsulation Format (TNEF) attachment with a message. This
    /// property determines whether or not an inbound TNEF file belongs to the message it is attached to. It
    /// is used primarily by transport providers and gateways.
    var tnefCorrelationKey: Data? {
        return getProperty(id: .tagTnefCorrelationKey)
    }
    
    /// [MS-OXCMSG] 2.2.1.30 PidTagAddressBookDisplayNamePrintable Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDisplayNamePrintable property ([MS-OXPROPS] section 2.514) contains
    /// the printable string version of the display name.
    /// [MS-OXOABK] 2.2.3.7 PidTagAddressBookDisplayNamePrintable
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookDisplayNamePrintable property ([MS-OXPROPS] section 2.508) contains
    /// a displayable form of an Address Book object that can be rendered in the client user's own code
    /// page.
    var addressBookDisplayNamePrintable: String? {
        return getProperty(id: .tagAddressBookDisplayNamePrintable)
    }
    
    /// [MS-OXCMSG] 2.2.1.31 PidTagCreatorEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCreatorEntryId property ([MS-OXPROPS] section 2.655) specifies the original author of
    /// the message according to their address book EntryID. The format of an address book EntryID data
    /// type is specified in [MS-OXCDATA] section 2.2.5.2.
    var creatorEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagCreatorEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCMSG] 2.2.1.32 PidTagLastModifierEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastModifierEntryId property ([MS-OXPROPS] section 2.765) specifies the last user to
    /// modify the contents of the message according to their address book EntryID. The format of an
    /// address book EntryID data type is specified in [MS-OXCDATA] section 2.2.5.2.
    var lastModifierEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagLastModifierEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCMSG] 2.2.1.33 PidLidAgingDontAgeMe Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAgingDontAgeMe property ([MS-OXPROPS] section 2.4) specifies whether the message is
    /// to be automatically archived. This property is set to "TRUE" if the message will not be automatically
    /// archived; otherwise, "FALSE".
    var agingDontAgeMe: Bool? {
        return getProperty(name: .lidAgingDontAgeMe)
    }
    
    /// [MS-OXCMSG] 2.2.1.34 PidLidCurrentVersion Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCurrentVersion property ([MS-OXPROPS] section 2.88) specifies the build number of the
    /// client application that sent the message.
    var currentVersion: UInt32? {
        return getProperty(name: .lidCurrentVersion)
    }
    
    /// [MS-OXCMSG] 2.2.1.35 PidLidCurrentVersionName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCurrentVersionName property ([MS-OXPROPS] section 2.89) specifies the name of the
    /// client application that sent the message.
    var currentVersionName: String? {
        return getProperty(name: .lidCurrentVersionName)
    }
    
    /// [MS-OXCMSG] 2.2.1.36 PidTagAlternateRecipientAllowed Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAlternateRecipientAllowed property ([MS-OXPROPS] section 2.577) specifies whether
    /// the sender permits the message to be autoforwarded. This property is set to "TRUE" if autoforwarding
    /// is allowed.
    var alternateRecipientAllowed: Bool? {
        return getProperty(id: .tagAlternateRecipientAllowed)
    }
    
    /// [MS-OXCMSG] 2.2.1.37 PidTagResponsibility Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagResponsibility property ([MS-OXPROPS] section 2.931) specifies whether another mail
    /// agent has ensured that the message will be delivered. This property is set to "TRUE" if another agent
    /// has accepted responsibility; otherwise, "FALSE".
    var responsibility: Bool? {
        return getProperty(id: .tagResponsibility)
    }
    
    /// [MS-OXCMSG] 2.2.1.38 PidTagRowid Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRowid property ([MS-OXPROPS] section 2.939) contains a unique identifier for a
    /// recipient (2) in the message's recipient table. This is a temporary identifier that is valid only for
    /// the life of the Table object.
    var rowid: UInt32? {
        return getProperty(id: .tagRowid)
    }
    
    /// [MS-OXCMSG] 2.2.1.39 PidTagHasNamedProperties Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHasNamedProperties property ([MS-OXPROPS] section 2.718) specifies whether this
    /// Message object supports named properties.
    var hasNamedProperties: UInt32? {
        return getProperty(id: .tagHasNamedProperties)
    }
    
    /// [MS-OXCMSG] 2.2.1.40 PidTagRecipientOrder Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecipientOrder property ([MS-OXPROPS] section 2.902) specifies the location of the
    /// current recipient (2) in the recipient table.
    var recipientOrder: UInt32? {
        return getProperty(id: .tagRecipientOrder)
    }
    
    /// [MS-OXCMSG] 2.2.1.41 PidNameContentBase Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameContentBase property ([MS-OXPROPS] section 2.412) specifies the value of the
    /// Content-Base header, which defines the base Uniform Resource Identifier (URI) for resolving
    /// relative URLs contained within the message body.
    var contentBase: String? {
        return getProperty(name: .nameContentBase)
    }
    
    /// [MS-OXCMSG] 2.2.1.42 PidNameAcceptLanguage Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAcceptLanguage property ([MS-OXPROPS] section 2.366) contains the value of the
    /// Accept-Language header, which defines the natural languages in which the sender prefers to
    /// receive a response. The format of this property is specified in [RFC3282] section 3. The relationship
    /// between this property and the Accept-Language header is specified in [MS-OXCMAIL] sections
    /// 2.1.3.2.16 and 2.2.3.2.11.
    var acceptLanguage: String? {
        return getProperty(name: .nameAcceptLanguage)
    }
    
    /// [MS-OXCMSG] 2.2.1.43 PidTagPurportedSenderDomain Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPurportedSenderDomain property ([MS-OXPROPS] section 2.876) contains the domain
    /// name of the last sender responsible for transmitting the current message.
    var purportedSenderDomain: String? {
        return getProperty(id: .tagPurportedSenderDomain)
    }
    
    /// [MS-OXCMSG] 2.2.1.44 PidTagStoreEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagStoreEntryId property ([MS-OXPROPS] section 2.1028) contains the unique EntryID of
    /// the message store where an object resides. The format of this property is specified in [MSOXCDATA] section 2.2.4.
    var storeEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagStoreEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    // [MS-OXCMSG] 2.2.1.45 PidTagTrustSender
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTrustSender property ([MS-OXPROPS] section 2.1051) specifies whether the message
    /// was delivered through a trusted transport channel.<5> This property is a Boolean integer. Valid
    /// values are given in the following table.
    /// Value            | Meaning
    /// 0x00000000 | Message was not delivered through a trusted transport channel.
    /// 0x00000001 | Message was delivered through a trusted transport channel.
    var trustSender: Bool? {
        guard let rawValue: UInt32 = getProperty(id: .tagTrustSender) else {
            return nil
        }
        
        return rawValue != 0
    }
    
    /// [MS-OXCMSG] 2.2.1.46 PidTagSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSubject property ([MS-OXPROPS] section 2.1033) contains the full subject of an e-mail
    /// message. The full subject is a concatenation of the subject prefix, as identified by the
    /// PidTagSubjectPrefix property (section 2.2.1.9), and the normalized subject, as identified by the
    /// PidTagNormalizedSubject property (section 2.2.1.10). If the PidTagSubjectPrefix property is not
    /// set or is set to an empty string, then the values of the PidTagSubject and
    /// PidTagNormalizedSubject properties are equal.
    /// [MS-OXOCFG] 2.2.8.10 PidTagSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSubject property ([MS-OXPROPS] section 2.1027) SHOULD<28> be set to "Conv.Action:
    /// " followed by the value of the PidTagNormalizedSubject property (section 2.2.9.2) of an E-mail
    /// object in the conversation. This correlates the FAI message to the E-mail objects in the
    /// conversation.
    /// [MS-XWDCAL] 2.2.3.9 PidTagSubject
    /// DAV property name: urn:schemas:httpmail:subject
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagSubject property ([MS-OXPROPS] section 2.1023) gets or sets the subject of the
    /// message. This property corresponds to the Subject header field of [RFC822]. This property differs
    /// from the PidNameInternetSubject property ([MS-OXPROPS] section 2.443) only in that all
    /// characters encoded as specified in [RFC1522] are decoded and returned as Unicode characters.
    var subject: String? {
        return getProperty(id: .tagSubject)
    }
    
    /// [MS-OXCMSG] 2.2.1.47 PidTagMessageRecipients Property
    /// Type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageRecipients property ([MS-OXPROPS] section 2.795) contains a restriction table
    /// that can be used to find all messages containing the recipients (2) in a contents table. The
    /// restriction is a SubObjectRestriction structure, as specified in [MS-OXCDATA] section 2.12.10.
    /// Messages can be searched with this restriction using the RopSetSearchCriteria ROP ([MSOXCROPS] section 2.2.4.4) and the RopRestrict ROP ([MS-OXCROPS] section 2.2.5.3).
    /// [MS-OXCFXICS] Identifies all recipients of the current message.
    var messageRecipients: Data? {
        return getProperty(id: .tagMessageRecipients)
    }
    
    /// [MS-OXCMSG] 2.2.1.48 PidNameContentClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameContentClass property ([MS-OXPROPS] section 2.413) contains a string that identifies
    /// the type of content of a Message object. The value of this property is as follows:
    ///  For an E-mail object, the value is as specified in [MS-OXCMAIL] section 2.2.3.2.15.
    ///  For other Message objects, the value is as specified in the technical document that defines the
    /// particular Message object.
    ///  For the Web Distributed Authoring and Versioning Protocol (WebDAV), the value is as
    /// specified in the technical document that specifies the particular WebDAV extension.
    /// [MS-OXORMMS] 2.2.2.1 PidNameContentClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidNameContentClass property ([MS-OXCMSG] section 2.2.1.48) for a rightsmanaged email message MUST be set to "rpmsg.message".
    /// [MS-OXOUM] 2.2.3.1.2 Message Content
    /// As specified in [MS-OXORMMS], a rights-managed e-mail message consists of a wrapper message
    /// with the original e-mail content encrypted as a BLOB in an attachment. The attachment has the
    /// following properties:
    ///  PidNameContentClass ([MS-OXCMSG] section 2.2.1.48): MUST be set to "rpmsg.message".
    /// [MS-OXSHARE] 2.2.5.1 PidNameContentClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameContentClass property ([MS-OXCMSG] section 2.2.1.48) MUST be set to "Sharing".
    /// [MS-OXOSMMS] 2.2.1.5 PidNameContentClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameContentClass property ([MS-OXCMSG] section 2.2.1.48) MUST be set to one of the
    /// values in the following table.
    /// Value Meaning
    /// MS-OMS-SMS SMS
    /// MS-OMS-MMS MMS
    /// [MS-XWDCAL] 2.2.1.1 PidNameContentClass
    /// DAV property names: DAV:contentclass, Content-Class, urn:schemas:mailheader:contentclass
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameContentClass property ([MS-OXCMSG] section 2.2.1.48) gets or sets the content class
    /// for the Calendar object. For Calendar objects, the value of this property MUST be set to
    /// "urn:content-classes:appointment" for an appointment in the Calendar folder or set to "urn:contentclasses:calendarmessage" for a new meeting request.
    /// For more details about the PidNameContentClass property, see [MS-OXCMAIL] section 2.1.3.2.2.
    var contentClass: String? {
        return getProperty(name: .nameContentClass)
    }
    
    /// [MS-OXCMSG] 2.2.1.49 PidTagLocalCommitTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLocalCommitTime property ([MS-OXPROPS] section 2.772) specifies the time, in UTC,
    /// that the message was last changed. The changes include any change to the read state of the
    /// message.
    /// [MS-OXCFOLD] 2.2.2.2.1.13 PidTagLocalCommitTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLocalCommitTime property ([MS-OXPROPS] section 2.766) specifies the time, in
    /// Coordinated Universal Time (UTC), that the folder was last changed.
    var localCommitTime: Date? {
        return getProperty(id: .tagLocalCommitTime)
    }
    
    /// [MS-OXCMSG] 2.2.1.50 PidNameContentType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameContentType property ([MS-OXPROPS] section 2.414) contains the value of the
    /// Content-Type header, which defines the type of the body part's content. For details about the
    /// Content-Type header, see [MS-OXCMAIL].
    var contentType: String? {
        return getProperty(name: .nameContentType)
    }
    
    /// [MS-OXCMSG] 2.2.1.51 PidTagCreatorName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCreatorName property ([MS-OXPROPS] section 2.656) specifies the name of the
    /// Message object's creator.
    var creatorName: String? {
        return getProperty(id: .tagCreatorName)
    }
    
    /// [MS-OXCMSG] 2.2.1.52 PidTagMessageAttachments Property
    /// Type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageAttachments property ([MS-OXPROPS] section 2.785) contains identifiers that
    /// correspond to a message's attachments.
    /// [MS-OXCFXICS] Identifies all attachments to the current message.
    var messageAttachments: Data? {
        return getProperty(id: .tagMessageAttachments)
    }
    
    /// [MS-OXCMSG] 2.2.1.53 PidTagRead Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRead property ([MS-OXPROPS] section 2.878) indicates whether a message has been
    /// read.
    /// [MS-XWDCAL] 2.2.3.8 PidTagRead
    /// DAV property name: urn:schemas:httpmail:read
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagRead property ([MS-OXPROPS] section 2.869) gets or sets a value that indicates whether
    /// the Calendar object has been read. True if the Calendar object has been read; otherwise, false.
    var read: Bool? {
        return getProperty(id: .tagRead)
    }
    
    /// [MS-OXCMSG] 2.2.1.54 PidTagRecipientDisplayName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecipientDisplayName property ([MS-OXPROPS] section 2.899) specifies the display name of a recipient (2).
    var recipientDisplayName: String? {
        return getProperty(id: .tagRecipientDisplayName)
    }
    
    /// [MS-OXCMSG] 2.2.1.55 PidTagRecipientEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecipientEntryId property ([MS-OXPROPS] section 2.900) contains an EntryID that identifies the Address Book object associated with a recipient (2).
    var recipientEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagRecipientEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.1 PidTagBody Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBody property ([MS-OXPROPS] section 2.618) contains unformatted text, which is the
    /// text/plain MIME format as specified in [RFC1521] section 7.1.2. Processing of the plain text body
    /// from the MIME message format is specified in [MS-OXCMAIL] section 2.1.3.3.1.
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    /// [MS-XWDCAL] 2.2.3.4 PidTagBody
    /// DAV property name: urn:schemas:httpmail:textdescription
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagBody property ([MS-OXCMSG] section 2.2.1.56.1) gets or sets the plain text content of
    /// the message.
    /// For more details about the PidTagBody property, see [MS-OXPROPS] section 2.609
    var body: String? {
        return getProperty(id: .tagBody)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.2 PidTagNativeBody Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNativeBody property ([MS-OXPROPS] section 2.805) indicates the best available format
    /// for storing the message body<6>. The value of this property is limited to one of the property values
    /// shown in the following table
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var nativeBody: MessageNativeBody? {
        guard let rawValue: UInt32 = getProperty(id: .tagNativeBody) else {
            return nil
        }
        
        return MessageNativeBody(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// 2.2.1.56.3 PidTagBodyHtml Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBodyHtml property ([MS-OXPROPS] section 2.621) contains the HTML body as specified
    /// in [RFC2822] section 2.3.
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var bodyHtml: Data? {
        return getProperty(id: .tagBodyHtml)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.4 PidTagRtfCompressed Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRtfCompressed property ([MS-OXPROPS] section 2.941) contains an RTF body
    /// compressed as specified in [MS-OXRTFCP].
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var rtfCompressed: Data? {
        return getProperty(id: .tagRtfCompressed)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.5 PidTagRtfInSync Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRtfInSync property ([MS-OXPROPS] section 2.942) is set to "TRUE" (0x01) if the RTF
    /// body has been synchronized with the contents in the PidTagBody property (section 2.2.1.56.1).
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var rtfInSync: Bool? {
        return getProperty(id: .tagRtfInSync)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.6 PidTagInternetCodepage Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInternetCodepage property ([MS-OXPROPS] section 2.746) indicates the code page
    /// used for the PidTagBody property (section 2.2.1.56.1) or the PidTagBodyHtml property (section
    /// 2.2.1.56.3).
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var internetCodepage: UInt32? {
        return getProperty(id: .tagInternetCodepage)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.7 PidTagBodyContentId Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBodyContentId property ([MS-OXPROPS] section 2.619) contains a GUID corresponding
    /// to the current message body.
    /// This property corresponds to the Content-ID header. The relationship between this property and the
    /// Content-ID header is further specified in [MS-OXCMAIL] sections 2.1.3.4.2.3 and 2.2.3.2.24.
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var bodyContentId: String? {
        return getProperty(id: .tagBodyContentId)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.8 PidTagBodyContentLocation Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBodyContentLocation property ([MS-OXPROPS] section 2.620) contains a globally
    /// unique URI that serves as a label for the current message body. The URI can be either absolute or
    /// relative.
    /// This property corresponds to the Content-Location header. The relationship between this property
    /// and the Content-Location header is further specified in [MS-OXCMAIL] sections 2.1.3.4.2.3 and
    /// 2.2.3.2.26. The format of this property is further specified in [RFC2110].
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var bodyContentLocation: String? {
        return getProperty(id: .tagBodyContentLocation)
    }
    
    /// [MS-OXCMSG] 2.2.1.56 Body Properties
    /// Body properties are a group of related properties that specify the body text format and contents and
    /// conform to the specification in [MS-OXBBODY]. The body properties are valid on any Message
    /// object.
    /// [MS-OXCMSG] 2.2.1.56.9 PidTagHtml Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHtml property ([MS-OXPROPS] section 2.733) contains the message body text in HTML
    /// format.
    /// [MS-OXOTASK] 2.2.2.1.2 Body Properties
    /// The properties specified in [MS-OXCMSG] section 2.2.1.56 are used to specify Rich Text Format
    /// (RTF) for the body of a Task object.
    var html: Data? {
        return getProperty(id: .tagBodyHtml)
    }
    
    /// [MS-OXCMSG] 2.2.1.57 Contact Linking Properties
    /// Contact linking properties are a group of related properties that are valid on any Message object
    /// containing information about the linked Contact objects.
    /// [MS-OXCMSG] 2.2.1.57.1 PidLidContactLinkEntry Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkEntry property ([MS-OXPROPS] section 2.70) contains the list of address
    /// book EntryIDs linked to by this Message object.
    var contactLinkEntry: ContactLinkEntry? {
        guard let data: Data = getProperty(name: .lidContactLinkEntry) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? ContactLinkEntry(dataStream: &dataStream)
    }
    
    /// [MS-OXCMSG] 2.2.1.57 Contact Linking Properties
    /// Contact linking properties are a group of related properties that are valid on any Message object
    /// containing information about the linked Contact objects.
    /// [MS-OXCMSG] 2.2.1.57.2 PidLidContacts Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContacts property ([MS-OXPROPS] section 2.77) contains the PidTagDisplayName
    /// property ([MS-OXOABK] section 2.2.3.1) of each address book EntryID referenced in the value of
    /// the PidLidContactLinkEntry property (section 2.2.1.57.1). This property can also include names not
    /// referenced in the PidLidContactLinkEntry property.
    var contacts: [String]? {
        return getProperty(name: .lidContacts)
    }
    
    /// [MS-OXCMSG] 2.2.1.57 Contact Linking Properties
    /// Contact linking properties are a group of related properties that are valid on any Message object
    /// containing information about the linked Contact objects.
    /// [MS-OXCMSG] 2.2.1.57.3 PidLidContactLinkName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkName property ([MS-OXPROPS] section 2.74) contains the elements of the
    /// PidLidContacts property (section 2.2.1.57.2), separated by a semicolon and a space ("; ").
    var contactLinkName: String? {
        return getProperty(name: .lidContactLinkName)
    }
    
    /// [MS-OXCMSG] 2.2.1.57 Contact Linking Properties
    /// Contact linking properties are a group of related properties that are valid on any Message object
    /// containing information about the linked Contact objects.
    /// [MS-OXCMSG] 2.2.1.57.4 PidLidContactLinkSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidContactLinkSearchKey property ([MS-OXPROPS] section 2.75) contains the list of
    /// search keys for the Contact object linked to by this Message object. Search keys are used to find
    /// related objects. Search keys for address book data are further specified by the PidTagSearchKey
    /// property ([MS-OXCPRPT] section 2.2.1.9).
    var contactLinkSearchKey: Data? {
        return getProperty(name: .lidContactLinkSearchKey)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.1 PidTagArchiveTag Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagArchiveTag property ([MS-OXPROPS] section 2.863) specifies the GUID of an archive
    /// tag. The PidTagArchiveTag property can be present on both Message objects and folders and can
    /// be set by both client and server.
    var archiveTag: Data? {
        return getProperty(id: .tagArchiveTag)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.2 PidTagPolicyTag Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPolicyTag property ([MS-OXPROPS] section 2.863) specifies the GUID of a retention
    /// tag. The PidTagPolicyTag property can be present on both Message objects and folders and can
    /// be set by both client and server.
    var policyTag: UUID? {
        guard let data: Data = getProperty(id: .tagPolicyTag) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.read(type: UUID.self)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.3 PidTagRetentionPeriod Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRetentionPeriod property ([MS-OXPROPS] section 2.934) specifies the number of days
    /// that a Message object can be retained. The PidTagRetentionPeriod property can be present on
    /// both Message objects and folders and can be set by both client and server.
    /// The presence of the PidTagRetentionPeriod property on a Message object indicates that the
    /// retention tag on that Message object was explicitly applied by the end user. If the value of the
    /// PidTagRetentionPeriod property is 0, the Message object never expires.
    /// When the PidTagRetentionPeriod property is present on a folder, it has no special significance; it
    /// simply specifies the retention period that corresponds to the retention tag on that folder.
    var retentionPeriod: UInt32? {
        return getProperty(id: .tagRetentionPeriod)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.4 PidTagStartDateEtc Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagStartDateEtc property ([MS-OXPROPS] section 2.1026) has the following structure.
    var startDateEtc: StartDateEtc? {
        guard let data: Data = getProperty(id: .tagStartDateEtc) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? StartDateEtc(dataStream: &dataStream)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.5 PidTagRetentionDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRetentionDate property ([MS-OXPROPS] section 2.932) specifies the date, in UTC, after
    /// which a Message object is expired by the server. The PidTagRetentionDate property can be
    /// present only on Message objects, not on folders. If the property is not present, the Message object
    /// never expires. The PidTagRetentionDate property can be set by both client and server.
    /// The value of the PidTagRetentionDate property is calculated from the values of other properties.
    /// The values used in the calculation depend on whether the Message object has a specific retention
    /// policy. (A Message object will have the default retention policy in the absence of a specific retention
    /// policy.) The explicit method of calculation is as follows:
    ///  When the Message object has a specific retention policy:
    /// PidTagRetentionDate = PidTagMessageDeliveryTime ([MS-OXOMSG] section 2.2.3.9) +
    /// PidTagRetentionPeriod (section 2.2.1.58.3). If the PidTagMessageDeliveryTime property does
    /// not exist, the PidTagCreationTime property (section 2.2.2.3) is used.
    ///  When the Message object has the default retention policy:
    /// PidTagRetentionDate = PidTagMessageDeliveryTime + default retention period. If the
    /// PidTagMessageDeliveryTime property does not exist, the PidTagCreationTime property is used.
    var retentionDate: Date? {
        return getProperty(id: .tagRetentionDate)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.6 PidTagRetentionFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRetentionFlags property ([MS-OXPROPS] section 2.933) contains flags that specify the
    /// status or nature of an item's retention tag or archive tag. The PidTagRetentionFlags property can
    /// be present on both Message objects and folders and can be set by both client and server.
    /// The value of the PidTagRetentionFlags property is a bitwise OR of zero or more of the values from
    /// the following table.
    var retentionFlags: RetentionFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagRetentionFlags) else {
            return nil
        }
        
        return RetentionFlags(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.7 PidTagArchivePeriod Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagArchivePeriod property ([MS-OXPROPS] section 2.580) specifies the number of days that
    /// a Message object can remain unarchived. The PidTagArchivePeriod property can be present on
    /// both Message objects and folders and can be set by both client and server.
    /// The presence of the PidTagArchivePeriod property on a Message object indicates that the archive
    /// tag on that Message object was explicitly applied by the end user. If the value of
    /// PidTagArchivePeriod is 0, the Message object is never archived by the server.
    /// When the PidTagArchivePeriod property is present on a folder, it has no special significance; it
    /// simply specifies the archive period that corresponds to the archive tag on that folder.
    var archivePeriod: UInt32? {
        return getProperty(id: .tagArchivePeriod)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.58.8 PidTagArchiveDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagArchiveDate property ([MS-OXPROPS] section 2.579) specifies the date, in UTC, after
    /// which a Message object is archived by the server. The PidTagArchiveDate property can be present
    /// on only Message objects, not on folders, and can be set by both client and server. If the
    /// PidTagArchiveDate property is not present, the Message object is never archived by the server.
    /// The value of the PidTagArchiveDate property is calculated from the values of other properties as
    /// follows:
    /// PidTagArchiveDate = start date + PidTagArchivePeriod (section 2.2.1.58.7)
    /// The start date is obtained from the last eight bytes of the PidTagStartDateEtc property (section 2.2.1.58.4).
    var archiveDate: Date? {
        return getProperty(id: .tagArchiveDate)
    }
    
    /// [MS-OXCMSG] 2.2.1.58 Retention and Archive Properties
    /// Retention and archive properties specify information about the retention policy or archive policy.
    /// These properties are valid on e-mail Message objects. Some of these properties are also valid on
    /// folders. The retention policy and the archive policy are independent features. The server can enable
    /// one of these policies, both of these policies, or neither of them. For details about how the retention
    /// policy and archive policy settings are communicated between client and server, see [MS-OXOCFG]
    /// section 2.2.5.2.3.
    /// [MS-OXCMSG] 2.2.1.59 PidNameMSIPLabels Property
    /// Type: PtypString [MS-OXCDATA] section 2.11.1
    /// The PidNameMSIPLabels property ([MS-OXPROPS] section 2.460) contains the string that specifies the CLP Labels information.
    var msipLabels: String? {
        return getProperty(name: .nameMSIPLabels)
    }
    
    /// [MS-OXCMSG] 2.2.2.5 PidTagAttachSize Property
    /// Type: PtypInteger32, unsigned ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachSize property ([MS-OXPROPS] section 2.608) contains the size in bytes consumed by the Attachment object
    /// on the server. This property is read-only for the client.
    var attachSize: UInt32? {
        return getProperty(id: .tagAttachSize)
    }
    
    /// [MS-OXCMSG] 2.2.2.6 PidTagAttachNumber Property
    /// Type: PtypInteger32, unsigned ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachNumber property ([MS-OXPROPS] section 2.603) identifies the Attachment object within its Message object.
    /// The value of this property MUST be unique among the Attachment objects in a message.
    var attachNumber: UInt32? {
        return getProperty(id: .tagAttachNumber)
    }
    
    /// [MS-OXCMSG] 2.2.2.7 PidTagAttachDataBinary Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachDataBinary property ([MS-OXPROPS] section 2.589) contains the contents of the file to be attached.
    var attachDataBinary: Data? {
        return getProperty(id: .tagAttachDataBinary)
    }
    
    /// [MS-OXCMSG] 2.2.2.8 PidTagAttachDataObject Property
    /// Type: PtypObject ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachDataObject property ([MS-OXPROPS] section 2.590) contains the binary representation of the Attachment
    /// object in an application-specific format.
    /// [MS-OXCFXICS] 2.2.1.7 Properties That Denote Subobjects
    /// The properties in the following tables denote subobjects of the messaging objects and can be used in the following:
    ///  The property inclusion and exclusion lists of ROPs that configure download operations. For
    /// example, the RopSynchronizationConfigure ROP (section 2.2.3.2.1.1) and the
    /// RopFastTransferSourceCopyTo ROP (section 2.2.3.1.1.1) both configure download operations.
    ///  As values of MetaTagFXDelProp meta-properties, as specified in section 2.2.4.1.5.1.Identifies the Embedded Message object of the current attachment.
    /// Clients do not use this property as a value of the MetaTagFXDelProp
    /// meta-property.
    /// PidTagAttachDataObject
    /// Identifies the Embedded Message object of the current attachment.
    /// Clients do not use this property as a value of the MetaTagFXDelProp
    /// meta-property.
    /// [MS-OXORMDR] 2.2.2.1 Properties Shared with the Message and Attachment Object Protocol
    ///  PidTagAttachDataObject ([MS-OXCMSG] section 2.2.2.8)
    /// The semantics and accepted values are identical to those specified in [MS-OXCMSG].
    var attachDataObject: Data? {
        return getProperty(id: .tagAttachDataBinary)
    }
    
    /// [MS-OXCMSG] 2.2.2.9 PidTagAttachMethod Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachMethod property ([MS-OXPROPS] section 2.601) represents the way the contents
    /// of an attachment are accessed. This property is set to one of the following values.
    /// [MS-OXOCAL] 2.2.10.1.3 PidTagAttachMethod Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagAttachMethod property ([MS-OXCMSG] section 2.2.2.9) MUST be
    /// afEmbeddedMessage (0x00000005), which indicates that the exception data in the
    /// PidTagAttachDataObject property ([MS-OXCMSG] section 2.2.2.8) is an Embedded Message
    /// object.
    /// [MS-OXORSS] 2.2.3.1 Attachment Objects
    /// [MS-OXORSS] 2.2.3.1.1 Full Article Attachment Objects
    /// A full article Attachment object contains the contents of the linked document. Its
    /// PidTagAttachMethod property ([MS-OXCMSG] section 2.2.2.9) MUST be set to 0x00000001
    /// (afByValue). The PidLidPostRssItemLink property (section 2.2.1.2) MUST be set to the URL from
    /// which the document was downloaded.
    /// An RSS object MUST NOT have more than one full article Attachment object.
    /// [MS-OXORSS] 2.2.3.1.2 Enclosure Attachment Objects
    /// An enclosure Attachment object contains the contents of an enclosure. For an atom entry, the
    /// enclosure is a file referenced in the href attribute of a link element that has its rel attribute set to
    /// "enclosure". For an RSS item, the enclosure is a file referenced in the enclosure element.
    /// An enclosure Attachment object MUST have the PidTagAttachMethod property ([MS-OXCMSG]
    /// section 2.2.2.9) set to 0x00000001 (afByValue). The PidLidPostRssItemLink property (section
    /// 2.2.1.2) MUST be set to the URL from which the enclosure was downloaded.
    /// [MS-OXORSS] 2.2.3.1.3 Other Attachment Objects
    /// An RSS object MUST NOT have Attachment objects other than full article Attachment objects and
    /// enclosure Attachment objects.
    /// [MS-OXPFOAB] 2.2.2 Full OAB Messages
    /// [MS-OXPFOAB] 2.2.2.1 Properties and Attachments
    /// [MS-OXPFOAB] 2.2.2.1.1 PidTagOfflineAddressBookMessageClass
    /// This property is set to 1 for all full OAB messages. For details, see [MS-OXPROPS] section 2.808.
    /// 2.2.2.1.2 Full OAB Message Attachments – Version 2 and Version 3a
    /// Multiple compressed files are attached to the OAB version 2 and OAB version 3a full OAB by using the
    /// Offline Address Book (OAB) Format and Schema, as specified in [MS-OXOAB]. These are the Browse
    /// file, RDN Index file, ANR Index file, Details file, and one or more display template files.
    /// OAB version 2 and OAB version 3a attachments have their own properties and are described in the
    /// following subsections.
    /// [MS-OXPFOAB] 2.2.2.1.2.2 PidTagAttachMethod
    /// This property MUST be set to 1 (ATTACH_BY_VALUE). For details, see [MS-OXPROPS] section
    /// 2.592.<4>
    /// [MS-OXPFOAB] 2.2.2.1.3 Full OAB Message Attachments – Version 4
    /// Multiple compressed files are attached to the OAB version 4 full OAB, as specified in [MS-OXOAB].
    /// These are the Data file and one or more display template files.
    /// OAB version 4 attachments have their own properties, which are described in the following
    /// subsections.
    /// [MS-OXPFOAB] 2.2.3 Differential OAB Messages
    /// [MS-OXPFOAB] 2.2.3.1 Properties and Attachments
    /// [MS-OXPFOAB] 2.2.3.1.1 PidTagOfflineAddressBookMessageClass
    /// This property MUST be set to 2 for all differential OAB messages. For details, see [MS-OXPROPS]
    /// section 2.808.
    /// [MS-OXPFOAB] 2.2.3.1.2 Differential OAB Message Attachments – Version 2 and Version 3a
    /// One compressed file is attached to the OAB version 2 or OAB version 3a differential OAB, as specified
    /// in [MS-OXOAB]. This is a Changes file.
    /// This attachment has its own properties, which are defined in the following subsections.
    /// [MS-OXPFOAB] 2.2.3.1.2.2 PidTagAttachMethod
    /// This property MUST be set to 1 (ATTACH_BY_VALUE). For details, see [MS-OXPROPS] section 2.592
    /// for details.<6>
    /// [MS-OXPFOAB] 2.2.3.1.3 Differential OAB Message Attachments – Version 4
    /// One compressed file, a Changes file, can be attached to the OAB version 4 differential OAB message,
    /// as specified in [MS-OXOAB].
    /// The Differential Patch file MUST be the first attachment on this message.
    /// These attachments have their own properties, which are defined in the following subsections.
    /// [MS-OXPFOAB] 2.2.3.1.3.2 PidTagAttachMethod
    /// This property MUST be set to 1 (ATTACH_BY_VALUE). For details, see [MS-OXPROPS] section
    /// 2.592.<7>
    var attachMethod: AttachMethod? {
        guard let rawValue: UInt32 = getProperty(id: .tagAttachMethod) else {
            return nil
        }
        
        return AttachMethod(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.2.10 PidTagAttachLongFilename Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachLongFilename property ([MS-OXPROPS] section 2.595) contains the full file name and extension of the
    /// Attachment object.
    /// [MS-OXOUM] 2.2.3.1.2 Message Content
    /// As specified in [MS-OXORMMS], a rights-managed e-mail message consists of a wrapper message with the original e-mail
    /// content encrypted as a BLOB in an attachment. The attachment has the following properties:
    ///  PidTagAttachLongFilename ([MS-OXCMSG] section 2.2.2.11): MUST be set to "message.rpmsg".
    var attachLongFilename: String? {
        return getProperty(id: .tagAttachLongFilename)
    }
    
    /// [MS-OXCMSG] 2.2.2.11 PidTagAttachFilename Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachFilename property ([MS-OXPROPS] section 2.593) contains the 8.3 name of the
    /// value of the PidTagAttachLongFilename property (section 2.2.2.10).
    /// [MS-OXPFOAB] 2.2.2 Full OAB Messages
    /// [MS-OXPFOAB] 2.2.2.1 Properties and Attachments
    /// [MS-OXPFOAB] 2.2.2.1.1 PidTagOfflineAddressBookMessageClass
    /// This property is set to 1 for all full OAB messages. For details, see [MS-OXPROPS] section 2.808.
    /// [MS-OXPFOAB] 2.2.2.1.2 Full OAB Message Attachments – Version 2 and Version 3a
    /// Multiple compressed files are attached to the OAB version 2 and OAB version 3a full OAB by using the
    /// Offline Address Book (OAB) Format and Schema, as specified in [MS-OXOAB]. These are the Browse
    /// file, RDN Index file, ANR Index file, Details file, and one or more display template files.
    /// OAB version 2 and OAB version 3a attachments have their own properties and are described in the
    /// following subsections.
    /// [MS-OXPFOAB] 2.2.2.1.2.1 PidTagAttachFilename
    /// This property is set to the values that correspond to each of the files listed in the following table. For
    /// details about this property, see [MS-OXPROPS] section 2.584.
    /// OAB file PidTagAttachFilename value MUST start with PidTagAttachFilename value SHOULD be
    /// Browse b browse2.oab
    /// RDN Index r rdndex2.oab
    /// ANR Index a anrdex.oab
    /// Details d details2.oab
    /// Template l *
    /// Template m *
    /// The following Augmented Backus-Naur Form (ABNF), as specified in [RFC5234], defines the
    /// constraints of the display template file name.
    /// TmpltFilename = ("lng" LocaleIdentifier ".oab") / ("mac" LocaleIdentifier ".oab")
    /// LocaleIdentifier = (%x31-39 / ALPHA) *HEXDIG;for example, 409 and cc08 but not 0409
    /// "LocaleIdentifier" is a value from [MS-LCID] but can also have the value 8411 to indicate the special
    /// Japanese template with phonetic "Yomi" properties, as specified in [MS-OXOABKT].
    /// [MS-OXPFOAB] 2.2.2.1.3 Full OAB Message Attachments – Version 4
    /// Multiple compressed files are attached to the OAB version 4 full OAB, as specified in [MS-OXOAB].
    /// These are the Data file and one or more display template files.
    /// OAB version 4 attachments have their own properties, which are described in the following
    /// subsections.
    /// [MS-OXPFOAB] 2.2.2.1.3.1 PidTagAttachFilename
    /// This property is set to the values that correspond to each of the files listed in the following table. For
    /// details, see [MS-OXPROPS] section 2.584.
    /// OAB file PidTagAttachFilename value MUST start with PidTagAttachFilename value MUST be
    /// Data d data.oab
    /// Template l *
    /// Template m *
    /// *The following ABNF, as specified in [RFC5234], defines the constraints of the display template file
    /// name.
    /// TmpltFilename = ("lng" LocaleIdentifier ".oab") / ("mac" LocaleIdentifier ".oab")
    /// LocaleIdentifier = (%x31-39 / ALPHA) *HEXDIG;for example, 409 and cc08 but not 0409
    /// "LocaleIdentifier" is a value from [MS-LCID], but it can also have the value 8411 to indicate the
    /// special Japanese template with phonetic "Yomi" properties, as specified in [MS-OXOABKT].
    /// [MS-OXPFOAB] 2.2.3 Differential OAB Messages
    /// [MS-OXPFOAB] 2.2.3.1 Properties and Attachments
    /// [MS-OXPFOAB] 2.2.3.1.2 Differential OAB Message Attachments – Version 2 and Version 3a
    /// One compressed file is attached to the OAB version 2 or OAB version 3a differential OAB, as specified
    /// in [MS-OXOAB]. This is a Changes file.
    /// This attachment has its own properties, which are defined in the following subsections.
    /// [MS-OXPFOAB] 2.2.3.1.2.1 PidTagAttachFilename
    /// The value for this property SHOULD be "changes.oab". For details, see [MS-OXPROPS] section 2.584.
    /// [MS-OXPFOAB] 2.2.3.1.3 Differential OAB Message Attachments – Version 4
    /// One compressed file, a Changes file, can be attached to the OAB version 4 differential OAB message,
    /// as specified in [MS-OXOAB].
    /// The Differential Patch file MUST be the first attachment on this message.
    /// These attachments have their own properties, which are defined in the following subsections.
    /// [MS-OXPFOAB] 2.2.3.1.3.1 PidTagAttachFilename
    /// This property is set to the value that corresponds to each of the files listed in the following table. For
    /// details, see [MS-OXPROPS] section 2.584.
    /// OAB file PidTagAttachFilename value MUST start with PidTagAttachFilename value SHOULD be
    /// Differential Patch b binpatch.oab
    /// Changes file c changes.oab
    var attachFilename: String? {
        return getProperty(id: .tagAttachFilename)
    }
        
    var name: String? {
        return displayName ?? attachLongFilename ?? attachFilename
    }
    
    /// [MS-OXCMSG] 2.2.2.12 PidTagAttachExtension Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachExtension property ([MS-OXPROPS] section 2.592) contains a file name extension
    /// that indicates the document type of an attachment.
    var attachExtension: String? {
        return getProperty(id: .tagAttachExtension)
    }
    
    /// [MS-OXCMSG] 2.2.2.13 PidTagAttachLongPathname Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachLongPathname property ([MS-OXPROPS] section 2.596) contains the fully
    /// qualified path and file name with extension.
    /// that indicates the document type of an attachment.
    var attachLongPathname: String? {
        return getProperty(id: .tagAttachLongPathname)
    }
    
    /// [MS-OXCMSG] 2.2.2.14 PidTagAttachPathname Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachPathname property ([MS-OXPROPS] section 2.604) contains the 8.3 name of the
    /// value of the PidTagAttachLongPathname property (section 2.2.2.13).
    var attachPathname: String? {
        return getProperty(id: .tagAttachPathname)
    }
    
    /// [MS-OXCMSG] 2.2.2.15 PidTagAttachTag Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachTag property ([MS-OXPROPS] section 2.609) contains the identifier information for
    /// the application that supplied the Attachment object's data. This property can be left unset; if set, it
    /// MUST be one of the following.
    /// Definition Data Comments
    /// TNEF {0x2A,86,48,86,F7,14,03,0A,01} The TNEF format is specified in [MS-OXTNEF].
    /// afStorage {0x2A,86,48,86,F7,14,03,0A,03,02,01} Data is in an application-specific format.
    /// MIME {0x2A,86,48,86,F7,14,03,0A,04} Conversion between Message object and MIME formats
    /// is specified in [MS-OXCMAIL].
    var attachTag: Data? {
        return getProperty(id: .tagAttachTag)
    }
    
    /// [MS-OXCMSG] 2.2.2.16 PidTagRenderingPosition Property
    /// Type: PtypInteger32, unsigned ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRenderingPosition property ([MS-OXPROPS] section 2.914) represents an offset, in
    /// rendered characters, to use when rendering an attachment within the main message text.
    /// The values specify a relative ordering of the rendered attachment in the text. If a message has three
    /// attachments with values of 200, 100, and 500 for the PidTagRenderingPosition property, these
    /// will be rendered in the same order as if the attachments had the values 2, 1, and 5. A detailed
    /// example of this property is provided in [MS-OXRTFEX] section 3.2.
    /// The value 0xFFFFFFFF indicates a hidden attachment that is not to be rendered in the main text.
    var renderingPosition: UInt32? {
        return getProperty(id: .tagRenderingPosition)
    }
    
    /// [MS-OXCMSG] 2.2.2.17 PidTagAttachRendering Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachRendering property ([MS-OXPROPS] section 2.607) contains a Windows Metafile
    /// Format (WMF) metafile as specified in [MS-WMF] for the Attachment object.
    var attachRendering: Data? {
        return getProperty(id: .tagAttachRendering)
    }

    /// [MS-OXCMSG] 2.2.2.18 PidTagAttachFlags Property
    /// Type: PtypInteger32, as a bit field ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachFlags property ([MS-OXPROPS] section 2.594) indicates which body formats might
    /// reference this attachment when rendering data. This property contains a bitwise OR of zero or more of
    /// the following flags. If this property is absent or its value is 0x00000000, the attachment is available
    /// to be rendered in any format.
    var attachFlags: AttachFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagAttachFlags) else {
            return nil
        }
        
        return AttachFlags(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.2.19 PidTagAttachTransportName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachTransportName property ([MS-OXPROPS] section 2.610) contains the name of an
    /// attachment file, modified so that it can be correlated with TNEF messages, as specified in [MSOXTNEF].
    var attachTransportName: String? {
        return getProperty(id: .tagAttachTransportName)
    }
    
    /// [MS-OXCMSG] 2.2.2.20 PidTagAttachEncoding Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachEncoding property ([MS-OXPROPS] section 2.591) contains encoding information
    /// about the Attachment object. If the attachment is in MacBinary format, this property is set to
    /// "{0x2A,86,48,86,F7,14,03,0B,01}"; otherwise, it is unset. This property is used to indicate that the
    /// attachment content, which is the value of the PidTagAttachDataBinary property (section 2.2.2.7),
    /// MUST be encoded in the MacBinary format, as specified in [MS-OXCMAIL]. Clients SHOULD<10>
    /// correctly detect MacBinary I, MacBinaryII, and MacBinary III formats.
    var attachEncoding: Data? {
        return getProperty(id: .tagAttachEncoding)
    }
    
    /// [MS-OXCMSG] 2.2.2.21 PidTagAttachAdditionalInformation Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachAdditionalInformation property ([MS-OXPROPS] section 2.585) MUST be set to
    /// an empty string if the PidTagAttachEncoding property (section 2.2.2.20) is unset. If the
    /// PidTagAttachEncoding property is set, the PidTagAttachAdditionalInformation property MUST
    /// be set to a string of the format ":CREA:TYPE", where ":CREA" is the four-letter Macintosh file creator
    /// code, and ":TYPE" is a four-letter Macintosh type code.
    var attachAdditionalInformation: Data? {
        return getProperty(id: .tagAttachAdditionalInformation)
    }
    
    /// [MS-OXCMSG] 2.2.2.22 PidTagAttachmentLinkId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachmentLinkId property ([MS-OXPROPS] section 2.600) is the type of Message object to which this attachment is linked.
    /// This property MUST be set to 0x00000000 unless overridden by other protocols that extend the Message and Attachment Object
    /// Protocol as noted in section 1.4.
    var attachmentLinkId: UInt32? {
        return getProperty(id: .tagAttachmentLinkId)
    }
    
    /// [MS-OXCMSG] 2.2.2.23 PidTagAttachmentFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachmentFlags property ([MS-OXPROPS] section 2.598) indicates special handling for
    /// this Attachment object. This property MUST be set to 0x00000000 unless overridden by other
    /// protocols that extend the Message and Attachment Object Protocol as noted in section 1.4
    /// [MS-OXOCAL] 2.2.10.1 Exception Attachment Object
    /// The Exception Attachment object MUST have the properties listed in sections 2.2.10.1.1 through
    /// 2.2.10.1.6.
    /// [MS-OXOCAL] 2.2.10.1.2 PidTagAttachmentFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagAttachmentFlags property ([MS-OXCMSG] section 2.2.2.23) MUST include
    /// the afException flag (0x00000002).
    var attachmentFlags: UInt32? {
        return getProperty(id: .tagAttachmentFlags)
    }
    
    /// [MS-OXCMSG] 2.2.2.24 PidTagAttachmentHidden Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAttachmentHidden property ([MS-OXPROPS] section 2.599) is set to TRUE (0x01) if this
    /// Attachment object is hidden from the end user.
    /// [MS-OXOCAL] 2.2.10.1 Exception Attachment Object
    /// The Exception Attachment object MUST have the properties listed in sections 2.2.10.1.1 through 2.2.10.1.6.
    /// [MS-OXOCAL] 2.2.10.1.1 PidTagAttachmentHidden Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagAttachmentHidden property ([MS-OXCMSG] section 2.2.2.24) MUST be TRUE.
    var attachmentHidden: Bool? {
        return getProperty(id: .tagAttachmentHidden)
    }
    
    /// [MS-OXCMSG] 2.2.2.25 PidTagTextAttachmentCharset Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTextAttachmentCharset property ([MS-OXPROPS] section 2.1044) specifies the
    /// character set of messages for messages with a text body. This property corresponds to the charset
    /// parameter of the Content-Type header, as specified in [MS-OXCMAIL] section 2.2.3.4.1.2.
    var textAttachmentCharset: String? {
        return getProperty(id: .tagTextAttachmentCharset)
    }
    
    /// [MS-OXCMSG] 2.2.2.26 PidNameAttachmentProviderType
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAttachmentProviderType property ([MS-OXPROPS] section 2.372) contains the type
    /// of web service manipulating the attachment.
    /// Value Description
    /// OneDrivePro The web reference attachment belongs to a OneDrive for Business
    /// service.
    /// OneDriveConsumer The web reference attachment belongs to a OneDrive Consumer
    /// service.
    var attachmentProviderType: String? {
        return getProperty(name: .nameAttachmentProviderType)
    }
    
    /// [MS-OXCMSG] 2.2.2.27 PidNameAttachmentOriginalPermissionType
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAttachmentOriginalPermissionType property ([MS-OXPROPS] section 2.370)
    /// contains the original permission type data associated with a web reference attachment.
    var attachmentOriginalPermissionType: AttachmentPermissionType? {
        guard let rawValue: UInt32 = getProperty(name: .nameAttachmentOriginalPermissionType) else {
            return nil
        }
        
        return AttachmentPermissionType(rawValue: rawValue)
    }
    
    /// [MS-OXCMSG] 2.2.2.28 PidNameAttachmentPermissionType
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAttachmentPermissionType property ([MS-OXPROPS] section 2.371) contains the
    /// permission type data associated with a web reference attachment.
    var attachmentPermissionType: AttachmentPermissionType? {
        guard let rawValue: UInt32 = getProperty(name: .nameAttachmentPermissionType) else {
            return nil
        }
        
        return AttachmentPermissionType(rawValue: rawValue)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidTagAttachMimeTag ([MS-OXPROPS]
    /// section 2.602)
    /// The Content-Type header.
    /// [MS-OXORMMS] 2.2.3.2 PidTagAttachMimeTag Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagAttachMimeTag property ([MS-OXCMSG] section 2.2.2.29) for a rightsmanaged email message MUST be set to "application/x-microsoft-rpmsg-message".
    /// [MS-OXOUM] 2.2.3.1.2 Message Content
    /// As specified in [MS-OXORMMS], a rights-managed e-mail message consists of a wrapper message
    /// with the original e-mail content encrypted as a BLOB in an attachment. The attachment has the
    /// following properties:
    ///  PidTagAttachMimeTag ([MS-OXCMSG] section 2.2.2.29): MUST be set to "application/xmicrosoft-rpmsg-message".
    var attachMimeTag: String? {
        return getProperty(id: .tagAttachMimeTag)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidTagAttachContentId ([MS-OXPROPS]
    /// section 2.587)
    /// A content identifier unique to this Message object that matches a corresponding "cid:"
    /// URI scheme reference in the HTML body of the Message object.
    var attachContentId: String? {
        return getProperty(id: .tagAttachContentId)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidTagAttachContentLocation ([MSOXPROPS] section 2.588)
    /// A relative or full URI that matches a corresponding reference in the HTML body of
    /// the Message object.
    var attachContentLocation: String? {
        return getProperty(id: .tagAttachContentLocation)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidTagAttachContentBase ([MS-OXPROPS]
    /// section 2.586)
    /// The base of a relative URI. MUST be set if the PidTagAttachContentLocation property contains a relative URI.
    var attachContentBase: String? {
        return getProperty(id: .tagAttachContentBase)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidTagAttachPayloadClass ([MS-OXPROPS]
    /// section 2.605)
    /// The class name of an object that can display the contents of the message.
    var attachPayloadClass: String? {
        return getProperty(id: .tagAttachPayloadClass)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidTagAttachPayloadProviderGuidString
    /// ([MS-OXPROPS] section 2.606)
    /// The GUID of the software application that can display the contents of the message.
    var attachPayloadProviderGuidString: String? {
        return getProperty(id: .tagAttachPayloadProviderGuidString)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidNameAttachmentMacContentType ([MSOXPROPS] section 2.368)
    /// The Content-Type header of the Macintosh attachment.
    var attachmentMacContentType: String? {
        return getProperty(name: .nameAttachmentMacContentType)
    }

    /// [MS-OXCMSG] 2.2.2.29 MIME Properties
    /// The following properties contain MIME information and can be left unset. For details about MIME
    /// specifications, see [RFC2045]. For the specification on mapping these properties, see [MS-OXCMAIL].
    /// The types in the following table are specified in [MS-OXCDATA] section 2.11.1.
    /// PidNameAttachmentMacContentType ([MSOXPROPS] section 2.368)
    /// The headers and resource fork data associated with the Macintosh attachment.
    var attachmentMacInfo: Data? {
        return getProperty(name: .nameAttachmentMacInfo)
    }
}
