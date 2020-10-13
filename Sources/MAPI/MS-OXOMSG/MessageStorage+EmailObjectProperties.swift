//
//  MessageStorage+EmailObjectProperties.swift
//
//
//  Created by Hugh Bellamy on 26/08/2020.
//

import DataStream
import Foundation

/// [MS-OXOMSG] 2.2 Message Syntax
/// An E-mail object can be created and modified by clients and servers. Except where noted, this
/// section defines constraints to which both clients and servers adhere when operating on E-mail objects.
/// Clients operate on E-mail objects by using the Message and Attachment Object Protocol, which is
/// specified in [MS-OXCMSG]. How a server operates on E-mail objects is implementation-dependent,
/// but the results of any such operations are to be exposed to clients in a manner that is consistent with
/// the Email Object Protocol.
/// Unless otherwise specified, E-mail objects adhere to all property constraints specified in [MSOXPROPS] and all property constraints specified in [MS-OXCMSG]. An E-mail object can also contain
/// other properties, as specified in [MS-OXPROPS], but these properties have no impact on this protocol.
/// When a property is referred to as "read-only for the client", the server returns an error and ignores
/// any request to change the value of that property.
/// Message senders are identified by the from properties and the sender properties on an E-mail object.
/// In general, the from properties and the sender properties will identify the same messaging user; for
/// example, the e-mail message appears to have been sent by the actual sender of the e-mail message.
/// In some cases, however, an e-mail message is sent by one user (the actual sender) on behalf of
/// another user (the represented sender). In this case, the from properties identify the represented
/// sender, and the sender properties identify the actual sender.
/// Message object properties can be considered as belonging to certain groups based on the type of
/// messaging sub-object they represent. The first four groups represent actual senders, represented
/// senders, represented recipients, and actual recipients. Other properties correspond to the Body and
/// Subject sub-objects of a message. A separate class of properties is used to specify the To recipients,
/// carbon copy (Cc) recipients, and blind carbon copy (Bcc) recipients of an e-mail message. The
/// remaining properties that do not fall under these groups are used to specify either other subobjects
/// related to message management, or to control the method or timing of message delivery.
/// An actual recipient is the owner of the mailbox that receives the e-mail message. The following
/// properties are associated with actual recipients:
///  PidTagMessageRecipientMe (section 2.2.1.19)
///  PidTagReceivedByAddressType (section 2.2.1.36)
///  PidTagReceivedByEmailAddress (section 2.2.1.37)
///  PidTagReceivedByEntryId (section 2.2.1.38)
///  PidTagReceivedByName (section 2.2.1.39)
///  PidTagReceivedBySearchKey (section 2.2.1.40)
///  PidTagRecipientType (section 2.2.3.1)
/// The represented sender of an e-mail message is the messaging user or user agent on whose behalf
/// the e-mail message was sent (or will be sent). The following from properties are associated only with
/// the represented sender:
///  PidTagSentRepresentingAddressType (section 2.2.1.54)
///  PidTagSentRepresentingEmailAddress (section 2.2.1.55)
///  PidTagSentRepresentingEntryId (section 2.2.1.56)
///  PidTagSentRepresentingName (section 2.2.1.57)
///  PidTagSentRepresentingSearchKey (section 2.2.1.58)
///  PidTagOriginalSentRepresentingAddressType (section 2.2.2.11)
///  PidTagOriginalSentRepresentingEmailAddress (section 2.2.2.12)
///  PidTagOriginalSentRepresentingEntryId (section 2.2.2.13)
///  PidTagOriginalSentRepresentingName (section 2.2.2.14)
///  PidTagOriginalSentRepresentingSearchKey (section 2.2.2.15)
/// The actual sender is the owner of the mailbox that sent (or will send) the e-mail message. The
/// following from properties are associated with the actual sender:
///  PidTagSenderAddressType (section 2.2.1.48)
///  PidTagSenderEmailAddress (section 2.2.1.49)
///  PidTagSenderEntryId (section 2.2.1.50)
///  PidTagSenderName (section 2.2.1.51)
///  PidTagSenderSearchKey (section 2.2.1.52)
///  PidTagOriginalSenderAddressType (section 2.2.2.6)
///  PidTagOriginalSenderEmailAddress (section 2.2.2.7)
///  PidTagOriginalSenderEntryId (section 2.2.2.8)
///  PidTagOriginalSenderName (section 2.2.2.9)
///  PidTagOriginalSenderSearchKey (section 2.2.2.10)
/// The recipients (2) subobject is a collection of recipients (2), each of which is a messaging user to
/// whom e-mail messages will be (or have been) delivered. As with senders, there are two types of
/// recipients (2): represented recipients and actual recipients. Within each of these types, there are
/// three subclasses of recipients (2) for an e-mail message: To recipients, Cc recipients, and Bcc
/// recipients.
/// A represented recipient is the messaging user or user agent on whose behalf the e-mail message is
/// being received. The following recipient properties are associated with represented recipients:
///  PidTagReceivedRepresentingAddressType (section 2.2.1.23)
///  PidTagReceivedRepresentingEmailAddress (section 2.2.1.24)
///  PidTagReceivedRepresentingEntryId (section 2.2.1.25)
///  PidTagReceivedRepresentingName (section 2.2.1.26)
///  PidTagReceivedRepresentingSearchKey (section 2.2.1.27)
/// Another set of from properties is used to identify three subclasses of recipients (2) for an e-mail
/// message: To recipients, Cc recipients, and Bcc recipients.
/// The following from properties are associated with To recipients:
///  PidTagDisplayTo (section 2.2.1.9)
///  PidTagMessageToMe (section 2.2.1.17)
///  PidTagOriginalDisplayTo (section 2.2.2.3)
/// The following from properties are associated with Cc recipients:
///  PidTagDisplayCc (section 2.2.1.8)
///  PidTagMessageCcMe (section 2.2.1.18)
///  PidTagOriginalDisplayCc (section 2.2.2.4)
/// The following from properties are associated with Bcc recipients:
///  PidTagDisplayBcc (section 2.2.1.7)
///  PidTagOriginalDisplayBcc (section 2.2.2.5)
/// The Subject subobject is a short text string that is intended to inform a recipient (1) as to the contents
/// or purpose of the e-mail message. The following properties are associated with the subject:
///  PidTagNormalizedSubject ([MS-OXCMSG] section 2.2.1.10)
///  PidTagSubjectPrefix (section 2.2.1.60)
///  PidTagOriginalSubject (section 2.2.2.16)
/// The Body subobject, as specified in [MS-OXBBODY], contains the main contents of the e-mail
/// message. The following properties are associated with the body:
///  PidTagBlockStatus (section 2.2.1.1)
///  PidTagBody ([MS-OXCMSG] section 2.2.1.56.1)
///  PidTagBodyHtml ([MS-OXCMSG] section 2.2.1.56.3)
///  PidTagRtfCompressed ([MS-OXCMSG] section 2.2.1.56.4)
///  PidTagRtfInSync ([MS-OXCMSG] section 2.2.1.56.5)
///  PidTagMessageEditorFormat (section 2.2.1.78)
/// Many properties that are not associated with the preceding core E-mail objects are included with an email message in support of other particular subobjects. The following subobjects, along with their
/// associated properties, fall into this category:
///  Conversations
///  PidTagConversationIndex ([MS-OXOCFG] section 2.2.8.8)
///  PidTagConversationTopic (section 2.2.1.5)
/// If an e-mail message in the conversation thread is given a new subject, this e-mail message
/// starts the new conversation thread with a new value for both the PidTagConversationTopic
/// and PidTagConversationIndex properties.
///  Client Options
///  PidTagIconIndex (section 2.2.1.10)
///  PidTagMessageClass ([MS-OXCMSG] section 2.2.1.3)
///  PidTagReadReceiptRequested (section 2.2.1.29)
///  PidTagReadReceiptEntryId (section 2.2.2.26)
///  PidTagReadReceiptSearchKey (section 2.2.2.28)
///  PidTagOriginalSensitivity (section 2.2.1.22)
///  PidTagRecipientReassignmentProhibited (section 2.2.1.42)
///  PidTagReplyRequested (section 2.2.1.45)
///  PidTagResponseRequested (section 2.2.1.46)
///  PidTagReplyRecipientEntries (section 2.2.1.43)
///  PidTagReplyRecipientNames (section 2.2.1.44)
///  PidLidAutoProcessState (section 2.2.1.73)
///  PidLidVerbStream (section 2.2.1.74)
///  PidLidVerbResponse (section 2.2.1.75)
/// Finally, the following properties are set by an e-mail client or server to control how messages are
/// delivered:
///  PidTagExpiryTime (section 2.2.3.7)
///  PidTagInternetMessageId (section 2.2.1.12)
///  PidTagOriginatorDeliveryReportRequested (section 2.2.1.20)
///  PidTagOriginatorNonDeliveryReportRequested (section 2.2.1.21)
///  PidTagSendRichInfo ([MS-OXOABK] section 2.2.3.18)
///  PidTagTransportMessageHeaders (section 2.2.1.61)
///  PidTagOriginalDeliveryTime (section 2.2.2.2)
///  PidTagOriginalSubmitTime (section 2.2.2.17)
///  PidTagParentKey (section 2.2.2.18)
///  PidTagReportTag (section 2.2.2.22)
///  PidTagReportText (section 2.2.2.23)
///  PidTagMessageFlags ([MS-OXCMSG] section 2.2.1.6)
///  PidTagMessageDeliveryTime (section 2.2.3.9)
///  PidTagDeferredSendNumber (section 2.2.3.2)
///  PidTagDeferredSendUnits (section 2.2.3.3)
///  PidTagDeferredSendTime (section 2.2.3.4)
///  PidTagExpiryNumber (section 2.2.3.5)
///  PidTagExpiryUnits (section 2.2.3.6)
/// [MS-OXOMSG] 2.2.1 E-Mail Object Properties
/// The properties in the sub-sections of this section are specific to E-mail objects.
/// [MS-OXOMSG] 2.2.2 Message Status Reports Properties
/// [MS-OXOMSG] 2.2.3 E-Mail Submission Properties
/// The following are properties of the recipients (2) identified in the recipient table. These properties
/// are used to control server behavior during message submission.
public extension MessageStorage {
    /// [MS-OXOMSG] 2.2.1.1 PidTagBlockStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagBlockStatus property ([MS-OXPROPS] section 2.611) indicates whether the user's
    /// preference for viewing external content (such as links to images on a Hypertext Transfer Protocol
    /// (HTTP) server) is allowed or blocked in the message body.
    /// A client can ignore this property and always allow or always block external content based on factors
    /// that are determined by the implementer. For example, a client can always allow or always block
    /// external content based on whether the sender is on a safe senders list. For information about the safe
    /// senders list, see the description of the PidTagJunkAddRecipientsToSafeSendersList property in
    /// [MS-OXCSPAM] section 2.2.2.1.
    /// Valid values for this property are given in the following table.
    /// Value Meaning
    /// 0x00000000 Default value. Block external content.
    /// Variable nonzero value Allow or block external content, as described following this table.
    /// If this property is used, the default (0x00000000) is to block the external content. However, if the
    /// value of this property falls within a specific range, as described in this section, viewing external
    /// content is allowed. The allowed value is computed from the PidTagMessageDeliveryTime property
    /// (section 2.2.3.9): because the sender of a message does not have knowledge of this value, the sender
    /// cannot reliably set the value of the PidTagBlockStatus property to the allowed values.
    /// To compute the allowed values, convert the value of the PidTagMessageDeliveryTime property to a
    /// PtypFloatingTime ([MS-OXCDATA] section 2.11.1) type (floatdate), where the date is represented
    /// as the number of days from 00:00:00, December 30, 1899, Coordinated Universal Time (UTC).
    /// Apply the following formula.
    /// result = ((floatdate - floor(floatdate)) * 100000000) + 3;
    /// where floor(x) returns the largest integer ≤ x.
    /// Convert the value result to a 32-bit integer computed value.
    /// When a client first receives the message, it SHOULD set the value of the PidTagBlockStatus
    /// property to this computed value to allow external content. However, when determining whether to
    /// accept external content, clients SHOULD allow external content if the absolute value of the difference
    /// between the computed value and the value of the PidTagBlockStatus property is 1 or less. After the
    /// message is received and the value of the PidTagBlockStatus property has been calculated, clients
    /// SHOULD persist the value of this property for future reference.
    /// The server MUST NOT alter the value of this property.
    var blockStatus: UInt32? {
        return getProperty(id: .tagBlockStatus)
    }
    
    /// [MS-OXOMSG] 2.2.1.2 PidTagConversationId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationId property<1> ([MS-OXPROPS] section 2.643) is a computed value,
    /// derived from other conversation-related properties, that identifies a message as belonging to a
    /// specific conversation. This property is computed by the application, server or client. The computed
    /// value of the PidTagConversationId property SHOULD be derived from the values of the following
    /// properties.
    /// If the value of the PidTagConversationIndexTracking property (section 2.2.1.4) is set to 0x01
    /// (TRUE), and the value of the PidTagConversationIndex property (section 2.2.1.3) is at least 22
    /// bytes long and the first byte of the value of the PidTagConversationIndex property is 0x01, then
    /// the value of the PidTagConversationId property MUST be the GUID portion of the
    /// PidTagConversationIndex property.
    /// Otherwise, if the PidTagConversationTopic property (section 2.2.1.5) is set, the value of the
    /// PidTagConversationId property MUST be computed as follows:
    /// 1. The application MUST use up to 255 of the first nonzero characters of the little-endian UTF-16
    /// representation of the PidTagConversationTopic property.
    /// 2. The application MUST convert the characters to their upper-case forms, mapping "i" to "I"
    /// regardless of the user's locale.
    /// 3. The application MUST perform an MD5 hash, as specified in [RFC1321], on the characters and use
    /// the resulting 16-byte hash as the value of the PidTagConversationId property.
    /// Otherwise, if none of the above conditions were met, the PidTagConversationId property MUST NOT
    /// be set, in which case it will be undefined for the Message object.
    var conversationId: Data? {
        return getProperty(id: .tagConversationId)
    }
    
    /// [MS-OXOMSG] 2.2.1.3 PidTagConversationIndex Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationIndex property ([MS-OXPROPS] section 2.644) indicates the relative
    /// position of this message within a conversation thread. It is set according to the description in the
    /// following diagram.
    /// [MS-OXOPOST] 2.2.2.1 PidTagConversationIndex Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationIndex property ([MS-OXOMSG] section 2.2.1.3) specifies the depth of the
    /// reply in a hierarchical representation of Post objects in one conversation.
    /// [MS-OXOSRCH] 2.2.8.8 PidTagConversationIndex Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationIndex property ([MS-OXPROPS] section 2.644) SHOULD<26> be set to a
    /// 22-byte array as specified below.
    var conversationIndex: ConversationIndex? {
        guard let data: Data = getProperty(id: .tagConversationIndex) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? ConversationIndex(dataStream: &dataStream)
    }
    
    /// [MS-OXOMSG] 2.2.1.4 PidTagConversationIndexTracking Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationIndexTracking property ([MS-OXPROPS] section 2.645) is set to 0x01
    /// (TRUE) if the GUID portion of the value of the PidTagConversationIndex property (section 2.2.1.3)
    /// will be used to compute the value of the PidTagConversationId property (section 2.2.1.2),
    /// assuming the client or server application implements the PidTagConversationId property.
    /// Otherwise, this property is set to 0x00 (FALSE).
    var conversationIndexTracking: Bool? {
        return getProperty(id: .tagConversationIndexTracking)
    }
    
    /// [MS-OXOMSG] 2.2.1.5 PidTagConversationTopic Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationTopic property ([MS-OXPROPS] section 2.646) contains an unchanging
    /// copy of the original subject.<4> The property is set to the same value as the
    /// PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) on an E-mail object when it
    /// is submitted.
    /// [MS-OXOPOST] 2.2.2.2 PidTagConversationTopic Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagConversationTopic property ([MS-OXOMSG] section 2.2.1.5) contains an unchanging
    /// copy of the original subject. This property MUST be set to the same value as that of the
    /// PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) on a new Post object when it
    /// is first saved.
    var conversationTopic: String? {
        return getProperty(id: .tagConversationTopic)
    }
    
    /// [MS-OXOMSG] 2.2.1.6 PidTagDeferredDeliveryTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDeferredDeliveryTime property ([MS-OXPROPS] section 2.656) contains the date and
    /// time, in UTC, at which the sender prefers the message to be delivered. This property MAY be included
    /// in the response. If the property is absent, the message is delivered as soon as possible. If it is
    /// present, the property SHOULD have the same value as the PidTagDeferredSendTime property
    /// (section 2.2.3.4).
    /// A client sets both the PidTagDeferredDeliveryTime property and the PidTagDeferredSendTime
    /// property for deferred delivery of a message before submission.<5>
    var deferredDeliveryTime: Date? {
        return getProperty(id: .tagDeferredDeliveryTime)
    }
    
    /// [MS-OXOMSG] 2.2.1.7 PidTagDisplayBcc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayBcc property ([MS-OXPROPS] section 2.668) is set to a list of Bcc recipient
    /// display names, separated by semicolons, if an e-mail message has Bcc recipients. Otherwise, this
    /// property contains an empty string, as specified in [MS-OXCMSG] section 3.2.5.2. This property is
    /// read-only for the client.
    var displayBcc: String? {
        return getProperty(id: .tagDisplayBcc)
    }
    
    /// [MS-OXOMSG] 2.2.1.8 PidTagDisplayCc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayCc property ([MS-OXPROPS] section 2.669) is set to a list of Cc recipient display
    /// names, separated by semicolons, if an e-mail message has Cc recipients. Otherwise, this property
    /// contains an empty string, as specified in [MS-OXCMSG] section 3.2.5.2. This property is read-only for
    /// the client.
    var displayCc: String? {
        return getProperty(id: .tagDisplayCc)
    }
    
    /// [MS-OXOMSG] 2.2.1.9 PidTagDisplayTo Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDisplayTo property ([MS-OXPROPS] section 2.672) is set to a list of the primary
    /// recipient display names, separated by semicolons, if an e-mail message has primary recipients.
    /// Otherwise, this property contains an empty string, as specified in [MS-OXCMSG] section 3.2.5.2. This
    /// property is read-only for the client.
    var displayTo: String? {
        return getProperty(id: .tagDisplayTo)
    }

    /// [MS-OXOMSG] 2.2.1.10 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXPROPS] section 2.731) specifies the icon to be used by the
    /// user interface when displaying a group of E-mail objects. This property, if it exists, is a hint to the
    /// client: it can ignore the value of this property and use another method of determining what icon to
    /// display to the user, such as using the values of the PidTagMessageClass property ([MS-OXCMSG]
    /// section 2.2.1.3) or the PidTagMessageFlags property ([MS-OXCMSG] section 2.2.1.6). Examples of
    /// values for the PidTagIconIndex property are shown in the following table.
    /// Mail item state Mail item icon index
    /// New mail 0xFFFFFFFF
    /// Read mail 0x00000100
    /// Unread mail 0x00000101
    /// Submitted mail 0x00000102
    /// Unsent mail 0x00000103
    /// Receipt mail 0x00000104
    /// Replied mail 0x00000105
    /// Forwarded mail 0x00000106
    /// Remote mail 0x00000107
    /// Delivery receipt 0x00000108
    /// Read receipt 0x00000109
    /// Non-delivery report 0x0000010A
    /// Non-read receipt 0x0000010B
    /// Recall_S mails 0x0000010C
    /// Recall_F mail 0x0000010D
    /// Tracking mail 0x0000010E
    /// Out of Office mail 0x0000011B
    /// Recall mail 0x0000011C
    /// Tracked mail 0x00000130
    /// [MS-OXOCAL] 2.2.1.49 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagIconIndex property ([MS-OXPROPS] section 2.737) indicates that an icon is
    /// used with the object. It SHOULD be set to one of the values in the following table. A value of -1 means
    /// that the property is not set to a specific value and it is up to the client to determine the correct icon to
    /// display for this item.
    /// Icon Value Used by
    /// Single-instance appointment 0x00000400 Appointment object
    /// Recurring appointment 0x00000401 Appointment object
    /// Single-instance meeting 0x00000402 Meeting object
    /// Recurring meeting 0x00000403 Meeting object
    /// Meeting request/full update 0x00000404 Meeting Request object, Meeting Update object
    /// Accept meeting request 0x00000405 Meeting Response object
    /// Decline meeting request 0x00000406 Meeting Response object
    /// Tentatively accept meeting request 0x00000407 Meeting Response object
    /// Meeting cancellation 0x00000408 Meeting Cancellation object
    /// Meeting update/Informational update 0x00000409 Meeting Update object
    /// Forward notification 0x0000040B Meeting Forward Notification object
    /// [MS-OXOJRNL] 2.2.2.3 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXOMSG] section 2.2.1.10) specifies which icon is to be used
    /// by a user interface when displaying the Journal object. The valid values for this property are
    /// specified in the following table.
    /// Value Meaning
    /// 0x00000601 Conversation
    /// 0x00000612 Document
    /// 0x00000602 E-mail message
    /// 0x00000609 Fax
    /// 0x0000060C Letter
    /// 0x00000613 Meeting
    /// 0x00000614 Meeting cancellation
    /// 0x00000603 Meeting request
    /// 0x00000604 Meeting response
    /// 0x00000610 A database application file
    /// 0x0000060E A spreadsheet application file
    /// 0x0000060F A slide-show presentation application file
    /// 0x0000060D A word processing application file
    /// 0x00000608 Note
    /// 0x0000060A Phone call
    /// 0x00000615 Remote session
    /// 0x0000060B Task
    /// 0x00000606 Task request
    /// 0x00000607 Task response
    /// 0x00000003 Other
    /// [MS-OXONOTE] 2.2.2.2 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXOMSG] section 2.2.1.10) specifies which icon a user
    /// interface is to use when displaying a group of Note objects. The value of this property MUST be
    /// 0x00000300 added to the value of the PidLidNoteColor property (section 2.2.1.1).
    /// [MS-OXOPOST] 2.2.2.3 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXOMSG] section 2.2.1.10) specifies which icon is to be used
    /// by a user interface when displaying a group of Post objects. This value MUST be 0x00000001.
    /// [MS-OXOSMMS] 2.2.2.1 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXOMSG] section 2.2.1.10) specifies which icon is to be used
    /// by a user interface when displaying a group of SMS objects and/or MMS objects. This property
    /// SHOULD<1> be set; if set, the value MUST be 0xFFFFFFFF.
    /// [MS-OXOTASK] 2.2.2.1.5 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXOMSG] section 2.2.1.10) specifies which icon is to be used
    /// by a user interface to represent the Task object. If this property exists, its value is a hint to the
    /// client's user interface. The user interface can ignore the value and use another method of determining
    /// which icon to display to the user. The behavior of the user interface and the method of determining
    /// which icon to display are implementation-dependent.
    /// The value is one of the following.
    /// Value Meaning
    /// 0x00000501 The Task object has not been assigned and is a recurring task.
    /// 0x00000502 The Task object is the task assignee's copy of the Task object.
    /// 0x00000503 The Task object is the task assigner's copy of the Task object.
    /// 0x00000500 None of the other conditions apply.
    /// [MS-OXOTASK] 2.2.3.3.2 PidTagIconIndex Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagIconIndex property ([MS-OXOMSG] section 2.2.1.10) specifies which icon is to be used
    /// by a user interface to represent the task communication. If this property exists, its value is a hint to
    /// the client's user interface. The user interface can ignore the value and use another method of
    /// determining which icon to display to the user.
    /// The value is one of the following.
    /// Value Type of task communication
    /// 0x00000504 Task request
    /// 0x00000505 Task acceptance
    /// 0x00000506 Task rejection
    /// 0x00000500 Task update
    /// 0xFFFFFFFF Unspecified
    var iconIndex: UInt32? {
        return getProperty(id: .tagIconIndex)
    }
    
    /// [MS-OXOMSG] 2.2.1.11 PidTagInternetMailOverrideFormat Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInternetMailOverrideFormat property ([MS-OXPROPS] section 2.741) indicates the
    /// encoding method and Hypertext Markup Language (HTML) inclusion for attachments and SHOULD
    /// be set on an outgoing e-mail message. This property is broken up into subportions, as shown in the
    /// following table. Note that "X" indicates that the bit is not to be set, and if set, the bit is to be ignored;
    /// the format of the diagram is little-endian.
    var internetMailOverrideFormat: UInt32? {
        return getProperty(id: .tagInternetMailOverrideFormat)
    }
    
    /// [MS-OXOMSG] 2.2.1.12 PidTagInternetMessageId Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInternetMessageId property ([MS-OXPROPS] section 2.742) corresponds to the
    /// Message-id field, as specified in [RFC2822]. This property SHOULD be present on all e-mail
    /// messages. More details about the conversion between this property and the Message-id field are
    /// specified in [MS-OXCMAIL] section 2.1.3.2.11.
    var internetMessageId: String? {
        return getProperty(id: .tagInternetMessageId)
    }
    
    /// [MS-OXOMSG] 2.2.1.13 PidTagInReplyToId Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInReplyToId property ([MS-OXPROPS] section 2.736) corresponds to the in-reply-to
    /// field, as specified in [RFC2822], and contains the value of the original message's
    /// PidTagInternetMessageId property (section 2.2.1.12). This property is set on all message replies.
    var inReplyToId: String? {
        return getProperty(id: .tagInReplyToId)
    }
    
    /// [MS-OXOMSG] 2.2.1.14 PidTagLastVerbExecuted Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastVerbExecuted property ([MS-OXPROPS] section 2.761) specifies the last verb
    /// executed for the message item to which it is related. This property is used by the client to display the
    /// last operation performed on the item. The possible values for the PidTagLastVerbExecuted property
    /// are shown in the following table.
    /// Verb name Alternate name Value
    /// Open NOTEIVERB_OPEN 0
    /// ReplyToSender NOTEIVERB_REPLYTOSENDER 102
    /// ReplyToAll NOTEIVERB_REPLYTOALL 103
    /// Forward NOTEIVERB_FORWARD 104
    /// Print NOTEIVERB_PRINT 105
    /// Save as NOTEIVERB_SAVEAS 106
    /// ReplyToFolder NOTEIVERB_REPLYTOFOLDER 108
    /// Save NOTEIVERB_SAVE 500
    /// Properties NOTEIVERB_PROPERTIES 510
    /// Followup NOTEIVERB_FOLLOWUP 511
    /// Verb name Alternate name Value
    /// Accept NOTEIVERB_ACCEPT 512
    /// Tentative NOTEIVERB_TENTATIVE 513
    /// Reject NOTEIVERB_REJECT 514
    /// Decline NOTEIVERB_DECLINE 515
    /// Invite NOTEIVERB_INVITE 516
    /// Update NOTEIVERB_UPDATE 517
    /// Cancel NOTEIVERB_CANCEL 518
    /// SilentInvite NOTEIVERB_SILENTINVITE 519
    /// SilentCancel NOTEIVERB_SILENTCANCEL 520
    /// RecallMessage NOTEIVERB_RECALL_MESSAGE 521
    /// ForwardResponse NOTEIVERB_FORWARD_RESPONSE 522
    /// ForwardCancel NOTEIVERB_FORWARD_CANCEL 523
    /// FollowupClear NOTEIVERB_FOLLOWUPCLEAR 524
    /// ForwardAppointment NOTEIVERB_FORWARD_APPT 525
    /// OpenResend NOTEIVERB_OPENRESEND 526
    /// StatusReport NOTEIVERB_STATUSREPORT 527
    /// JournalOpen NOTEIVERB_JOURNALOPEN 528
    /// JournalOpenLink NOTEIVERB_JOURNALOPENLINK 529
    /// ComposeReplace NOTEIVERB_COMPOSEREPLACE 530
    /// Edit NOTEIVERB_EDIT 531
    /// DeleteProcess NOTEIVERB_DELETEPROCESS 532
    /// TentativeAppointmentTime NOTEIVERB_TENTPNTIME 533
    /// EditTemplate NOTEIVERB_EDITTEMPLATE 534
    /// FindInCalendar NOTEIVERB_FINDINCALENDAR 535
    /// ForwardAsFile NOTEIVERB_FORWARDASFILE 536
    /// ChangeAttendees NOTEIVERB_CHANGE_ATTENDEES 537
    /// RecalculateTitle NOTEIVERB_RECALC_TITLE 538
    /// PropertyChange NOTEIVERB_PROP_CHANGE 539
    /// ForwardAsVcal NOTEIVERB_FORWARD_AS_VCAL 540
    /// ForwardAsIcal NOTEIVERB_FORWARD_AS_ICAL 541
    /// ForwardAsBusinessCard NOTEIVERB_FORWARD_AS_BCARD 542
    /// DeclineAppointmentTime NOTEIVERB_DECLPNTIME 543
    /// Process NOTEIVERB_PROCESS 544
    /// OpenWithWord NOTEIVERB_OPENWITHWORD 545
    /// OpenInstanceOfSeries NOTEIVERB_OPEN_INSTANCE_OF_SERIES 546
    /// FilloutThisForm NOTEIVERB_FILLOUT_THIS_FORM 547
    /// FollowupDefault NOTEIVERB_FOLLOWUP_DEFAULT 548
    /// ReplyWithMail NOTEIVERB_REPLY_WITH_MAIL 549
    /// ToDoToday NOTEIVERB_TODO_TODAY 566
    /// ToDoTomorrow NOTEIVERB_TODO_TOMORROW 567
    /// ToDoThisWeek NOTEIVERB_TODO_THISWEEK 568
    /// ToDoNextWeek NOTEIVERB_TODO_NEXTWEEK 569
    /// ToDoThisMonth NOTEIVERB_TODO_THISMONTH 570
    /// ToDoNextMonth NOTEIVERB_TODO_NEXTMONTH 571
    /// ToDoNoDate NOTEIVERB_TODO_NODATE 572
    /// FollowupComplete NOTEIVERB_FOLLOWUPCOMPLETE 573
    /// CopyToPostFolder NOTEIVERB_COPYTOPOSTFOLDER 574
    /// SeriesInvitationUpdateToPartialAttendeeList NOTEIVERB_PARTIALRECIP_SILENTINVITE 579
    /// SeriesCancellationUpdateToPartialAttendeeList NOTEIVERB_PARTIALRECIP_SILENTCANCEL 580
    var lastVerbExecuted: UInt32? {
        return getProperty(id: .tagLastVerbExecuted)
    }
    
    /// [MS-OXOMSG] 2.2.1.15 PidTagLastVerbExecutionTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLastVerbExecutionTime property ([MS-OXPROPS] section 2.762) contains the date and
    /// time, in UTC, during which the operation represented by the value of the PidTagLastVerbExecuted
    /// property (section 2.2.1.14) took place.
    var lastVerbExecutionTime: Date? {
        return getProperty(id: .tagLastVerbExecutionTime)
    }
    
    /// [MS-OXOMSG] 2.2.1.17 PidTagMessageToMe Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageToMe property ([MS-OXPROPS] section 2.794) is an optional property indicating
    /// that the receiving mailbox owner is one of the primary recipients of an e-mail message. If this
    /// property is present, it is set to either 0x01, in which case, the receiving mailbox owner is specifically
    /// named as a primary recipient of an e-mail message and is not part of a distribution list; or 0x00, in
    /// which case the receiving mailbox owner is not a primary recipient of an e-mail message. The default is
    /// 0x00.
    var messageToMe: Bool? {
        return getProperty(id: .tagMessageToMe)
    }
    
    /// [MS-OXOMSG] 2.2.1.18 PidTagMessageCcMe Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageCcMe property ([MS-OXPROPS] section 2.780) is an optional property indicating
    /// that the receiving mailbox owner is a Cc recipient of an e-mail message. If this property is present,
    /// it is set to either 0x01, in which case the receiving mailbox owner is specifically named as a Cc
    /// recipient of an e-mail message and is not part of a distribution list; or 0x00, in which case the
    /// receiving mailbox owner is not a Cc recipient of an e-mail message. The default is 0x00.
    var messageCcMe: Bool? {
        return getProperty(id: .tagMessageCcMe)
    }
    
    /// [MS-OXOMSG] 2.2.1.19 PidTagMessageRecipientMe Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageRecipientMe property ([MS-OXPROPS] section 2.788) is an optional property
    /// indicating that the receiving mailbox owner is a primary or a Cc recipient of an e-mail message. If
    /// this property is present, it is set to either 0x01, in which case the receiving mailbox owner is
    /// specifically named as a primary or a Cc recipient of an e-mail message and is not part of a
    /// distribution list, or 0x00, in which case the receiving mailbox owner is not a primary and not a Cc
    /// recipient of an e-mail message. The default is 0x00.
    var messageRecipientMe: Bool? {
        return getProperty(id: .tagMessageRecipientMe)
    }
    
    /// [MS-OXOMSG] 2.2.1.20 PidTagOriginatorDeliveryReportRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginatorDeliveryReportRequested property ([MS-OXPROPS] section 2.839) indicates
    /// whether an e-mail sender requests an e-mail delivery receipt from an e-mail client or server. This
    /// property is set to either 0x01, in which case the sender requests the delivery report be sent to the email sender or designated report receiver when the e-mail message is delivered, or 0x00 if the e-mail
    /// sender does not want to receive the delivery receipt.
    var originatorDeliveryReportRequested: Bool? {
        return getProperty(id: .tagOriginatorDeliveryReportRequested)
    }
    
    /// [MS-OXOMSG] 2.2.1.21 PidTagOriginatorNonDeliveryReportRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginatorNonDeliveryReportRequested property ([MS-OXPROPS] section 2.840)
    /// specifies whether an e-mail sender requests suppression of non-delivery reports. If this property is
    /// absent, the server automatically generates and sends a non-delivery report to the e-mail sender. If
    /// this property is present, it is set to either 0x00, in which case the e-mail sender requests suppression
    /// of non-delivery reports, or 0x01, in which case the non-delivery report is generated and sent.
    var originatorNonDeliveryReportRequested: Bool? {
        return getProperty(id: .tagOriginatorNonDeliveryReportRequested)
    }
    
    /// [MS-OXOMSG] 2.2.1.22 PidTagOriginalSensitivity Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSensitivity property ([MS-OXPROPS] section 2.831) contains the sensitivity
    /// value of the original e-mail message. This property is set on replying and forwarding e-mail messages
    /// by using the value of the PidTagSensitivity property ([MS-OXCMSG] section 2.2.1.13) of the original
    /// message.
    var originalSensitivity: MessageSensitivity? {
        guard let rawValue: UInt32 = getProperty(id: .tagOriginalSensitivity) else {
            return nil
        }
        
        return MessageSensitivity(rawValue: rawValue)
    }
    
    /// [MS-OXOMSG] 2.2.1.23 PidTagReceivedRepresentingAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedRepresentingAddressType property ([MS-OXPROPS] section 2.887) contains
    /// the e-mail address type for the end user represented by the receiving mailbox owner, as specified
    /// in the AddressType field of the RecipientRow structure (section 2.2.4.3 and [MS-OXCDATA] section
    /// 2.8.3.2). If the receiving mailbox owner receives the e-mail message on his or her own behalf, this
    /// property is set to the value of the PidTagReceivedByAddressType property (section 2.2.1.36).
    var receivedRepresentingAddressType: String? {
        return getProperty(id: .tagReceivedRepresentingAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.1.24 PidTagReceivedRepresentingEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedRepresentingEmailAddress property ([MS-OXPROPS] section 2.888) contains
    /// the e-mail address for the end user represented by the receiving mailbox owner, as specified in the
    /// EmailAddress field of the RecipientRow structure ([MS-OXCDATA] section 2.8.3.2). If the receiving
    /// mailbox owner receives the e-mail message on his or her own behalf, this property is set to the value
    /// of the PidTagReceivedByEmailAddress property (section 2.2.1.37).
    var receivedRepresentingEmailAddress: String? {
        return getProperty(id: .tagReceivedRepresentingEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.25 PidTagReceivedRepresentingEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedRepresentingEntryId property ([MS-OXPROPS] section 2.889) contains an
    /// address book EntryID that identifies the end user represented by the receiving mailbox owner, as
    /// specified in the EntryID field of the RecipientRow structure ([MS-OXCDATA] section 2.8.3.2). If the
    /// receiving mailbox owner receives the e-mail message on his or her own behalf, this property is set to
    /// the value of the PidTagReceivedByEntryId property (section 2.2.1.38).
    var receivedRepresentingEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagReceivedRepresentingEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOMSG] 2.2.1.26 PidTagReceivedRepresentingName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedRepresentingName property ([MS-OXPROPS] section 2.890) contains the
    /// display name for the end user represented by the receiving mailbox owner, as specified by the
    /// DisplayName field of the RecipientRow structure ([MS-OXCDATA] section 2.8.3.2). If the receiving
    /// mailbox owner receives the e-mail on his or her own behalf, this property is set to the value of the
    /// PidTagReceivedByName property (section 2.2.1.39).
    var receivedRepresentingName: String? {
        return getProperty(id: .tagReceivedRepresentingName)
    }

    /// [MS-OXOMSG] 2.2.1.27 PidTagReceivedRepresentingSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedRepresentingSearchKey property ([MS-OXPROPS] section 2.891) identifies an
    /// address book search key that contains a binary-comparable key of the end user represented by the
    /// receiving mailbox owner, as specified by the SearchKey field of the RecipientRow structure ([MSOXCDATA] section 2.8.3.2). This property is computed in the same way that the value of the
    /// PidTagReceivedBySearchKey property (section 2.2.1.40) is computed. If the receiving mailbox
    /// owner receives the e-mail message on his or her own behalf, this property is set to a value that is
    /// identical to the value of the PidTagReceivedBySearchKey property.
    var receivedRepresentingSearchKey: Data? {
        return getProperty(id: .tagReceivedRepresentingSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.1.28 PidTagReceivedRepresentingSmtpAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedRepresentingSmtpAddress property ([MS-OXPROPS] section 2.892) contains
    /// the SMTP email address of the user represented by the receiving mailbox owner.
    var receivedRepresentingSmtpAddress: String? {
        return getProperty(id: .tagReceivedRepresentingSmtpAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.29 PidTagReadReceiptRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptRequested property ([MS-OXPROPS] section 2.877) specifies whether the
    /// e-mail sender requests a read receipt from all recipients (1) when this e-mail message is read or
    /// opened. If this property is absent, no read receipt is sent to the e-mail's sender. If the property is
    /// present, it is set to either 0x01, in which case the e-mail message's sender requests the read receipt
    /// from an e-mail client or server, or 0x00, in which case no read receipt is requested by the e-mail
    /// message's sender.
    /// If an E-mail object that has its PidTagReadReceiptRequested property set to 0x01 is deleted, or it
    /// expires due to the time limit set by the PidTagExpiryTime property (section 2.2.3.7) before the read
    /// receipt for this e-mail is generated, a non-read receipt is generated and sent to the e-mail
    /// message's sender or designated receipt recipient (1).
    var readReceiptRequested: Bool? {
        return getProperty(id: .tagReadReceiptRequested)
    }
    
    /// [MS-OXOMSG] 2.2.1.30 PidTagReadReceiptSmtpAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptSmtpAddress property ([MS-OXPROPS] section 2.879) contains the SMTP
    /// email address of the user to whom a read receipt is directed.
    var readReceiptSmtpAddress: String? {
        return getProperty(id: .tagReadReceiptSmtpAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.31 PidTagNonReceiptNotificationRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNonReceiptNotificationRequested property ([MS-OXPROPS] section 2.805) specifies
    /// whether the e-mail sender requests a non-read receipt from all recipients (1) if this message is
    /// deleted without being read. This property is set to 0x01 if the e-mail sender requests a non-read
    /// receipt from all recipients; otherwise, it is set to 0x00.
    var nonReceiptNotificationRequested: Bool? {
        return getProperty(id: .tagNonReceiptNotificationRequested)
    }
    
    /// [MS-OXOMSG] 2.2.1.32 PidTagOriginalAuthorEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalAuthorEntryId property ([MS-OXPROPS] section 2.817) contains an Address
    /// Book EntryID structure ([MS-OXCDATA] section 2.2.5.2) and is defined in report messages to identify
    /// the user who sent the original message.
    var originalAuthorEntryId: Data? {
        return getProperty(id: .tagOriginalAuthorEntryId)
    }
    
    /// [MS-OXOMSG] 2.2.1.33 PidTagOriginalAuthorName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalAuthorName property ([MS-OXPROPS] section 2.818) contains the display name
    /// of the sender of the original message referenced by a report message.
    var originalAuthorName: String? {
        return getProperty(id: .tagOriginalAuthorName)
    }
    
    /// [MS-OXOMSG] 2.2.1.34 PidTagReportDisposition Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportDisposition property ([MS-OXPROPS] section 2.914) contains a string indicating
    /// whether the original message was displayed to the user or deleted. It is only defined on report
    /// messages. Valid values for this property are as follows.
    /// Value Description
    /// displayed The message was viewed by the user.
    /// deleted The message was erased by the user without being read.
    var reportDisposition: String? {
        return getProperty(id: .tagReportDisposition)
    }
    
    /// [MS-OXOMSG] 2.2.1.35 PidTagReportDispositionMode Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportDispositionMode property ([MS-OXPROPS] section 2.915) contains a description
    /// of the action that a client has performed on behalf of a user (report messages only). Valid values for
    /// this property are as follows,
    /// Value Description
    /// manual-action/ MDN-sent-manually The client displayed a prompt to the user before sending the
    /// report message.
    /// manual-action/ MDN-sentautomatically
    /// The client did not display a prompt to the user before sending the
    /// report message.
    var reportDispositionMode: String? {
        return getProperty(id: .tagReportDispositionMode)
    }
    
    /// [MS-OXOMSG] 2.2.1.36 PidTagReceivedByAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedByAddressType property ([MS-OXPROPS] section 2.881) contains the e-mail
    /// message receiver's e-mail address type, as specified by the AddressType field of the
    /// RecipientRow structure ([MS-OXCDATA] section 2.8.3.2).
    var receivedByAddressType: String? {
        return getProperty(id: .tagReceivedByAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.1.37 PidTagReceivedByEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedByEmailAddress property ([MS-OXPROPS] section 2.882) contains the e-mail
    /// message receiver's e-mail address, as specified by the EmailAddress field of the RecipientRow
    /// structure ([MS-OXCDATA] section 2.8.3.2).
    var receivedByEmailAddress: String? {
        return getProperty(id: .tagReceivedByEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.38 PidTagReceivedByEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedByEntryId property ([MS-OXPROPS] section 2.883) identifies an address book
    /// EntryID that contains the e-mail message receiver of the E-mail object. The address book EntryID
    /// data format is specified by the EntryID field of the RecipientRow structure ([MS-OXCDATA] section
    /// 2.8.3.2).
    var receivedByEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagReceivedByEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOMSG] 2.2.1.39 PidTagReceivedByName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedByName property ([MS-OXPROPS] section 2.884) contains the e-mail message
    /// receiver's display name, as specified by the DisplayName field of the RecipientRow structure
    /// ([MS-OXCDATA] section 2.8.3.2).
    var receivedByName: String? {
        return getProperty(id: .tagReceivedByName)
    }
    
    /// [MS-OXOMSG] 2.2.1.40 PidTagReceivedBySearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedBySearchKey property ([MS-OXPROPS] section 2.885) identifies an address
    /// book search key that contains a binary-comparable key that is used to identify correlated objects for
    /// a search. This property is computed and set by concatenating the message receiver's AddressType
    /// and EmailAddress with a colon in between (for example, <TYPE>:<E-MAIL ADDRESS>), as specified
    /// by the SearchKey field of the RecipientRow structure ([MS-OXCDATA] section 2.8.3.2).
    var receivedBySearchKey: Data? {
        return getProperty(id: .tagReceivedBySearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.1.41 PidTagReceivedBySmtpAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceivedBySmtpAddress property ([MS-OXPROPS] section 2.886) contains the email
    /// message receiver's SMTP email address.
    var receivedBySmtpAddress: String? {
        return getProperty(id: .tagReceivedBySmtpAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.42 PidTagRecipientReassignmentProhibited Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecipientReassignmentProhibited property ([MS-OXPROPS] section 2.900) specifies
    /// whether adding additional or different recipients (1), when forwarding the message, is prohibited for
    /// the e-mail message. This property is set based on the value of the e-mail message's
    /// PidTagSensitivity property ([MS-OXCMSG] section 2.2.1.13). If the PidTagSensitivity property is
    /// set to 0x00000000 (normal) or 0x00000003 (confidential), this property is set to 0x00 or is absent,
    /// meaning that adding additional or different recipients (1) to the e-mail message is allowed. If the
    /// PidTagSensitivity property of the E-mail object is set to 0x00000001 (personal) or 0x00000002
    /// (private), this property is set to 0x01 to prevent adding additional or different recipients (1) of this email message through forwarding.
    var recipientReassignmentProhibited: Bool? {
        return getProperty(id: .tagRecipientReassignmentProhibited)
    }
    
    /// [MS-OXOMSG] 2.2.1.43 PidTagReplyRecipientEntries Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyRecipientEntries property ([MS-OXPROPS] section 2.909) identifies a
    /// FlatEntryList structured array of address book EntryIDs for recipients (2) that will receive a
    /// reply. When the PidTagReplyRecipientEntries property and the PidTagReplyRecipientNames
    /// property (section 2.2.1.44) are defined, the reply is sent to all the recipients (2) identified by these
    /// two properties. If this property is absent, a reply is sent only to the user identified by the
    /// PidTagSenderEntryId property (section 2.2.1.50). If present, the property is set to a FlatEntryList
    /// structure of recipient (2) EntryIDs, as specified in [MS-OXCDATA] section 2.3.3.
    /// The PidTagReplyRecipientEntries property and the PidTagReplyRecipientNames property MUST
    /// be set in a way that they contain the same number of recipients (2) in the same order.
    var replyRecipientEntries: Data? {
        return getProperty(id: .tagReplyRecipientEntries)
    }
    
    /// [MS-OXOMSG] 2.2.1.45 PidTagReplyRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyRequested property ([MS-OXPROPS] section 2.911) specifies whether a reply to
    /// the e-mail message is requested by the e-mail message's sender. If this property is absent, the reply
    /// to the e-mail message is not requested. If the property is present, it is set to either 0x01 if an e-mail
    /// sender requests a reply to the e-mail from recipients (1) or 0x00, which is the same handling as if
    /// the property is absent.
    /// [MS-OXOCAL] 2.2.1.37 PidTagReplyRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyRequested property ([MS-OXPROPS] section 2.917) specifies whether the
    /// organizer requests a reply from the attendees.
    /// For Calendar objects, this property MUST have the same value as the PidTagResponseRequested
    /// property ([MS-OXOMSG] section 2.2.1.46).
    /// [MS-OXOFLAG] 2.2.1.4 PidTagReplyRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyRequested property ([MS-OXOMSG] section 2.2.1.45) indicates whether a reply is
    /// requested by the message's sender. This property SHOULD NOT be changed on a meeting-related
    /// object because this property has a specialized meaning for meeting-related objects, as specified in
    /// [MS-OXOCAL]. This property SHOULD NOT<4> exist on a Task object. For a Message object that is
    /// neither a meeting-related object nor a Task object, this property SHOULD be set as follows for
    /// flags:<5>
    ///  For a basic flag, color flag, time flag, or a recipient flag: 0x01 (TRUE)
    ///  For a complete flag: 0x00 (FALSE)
    ///  For a sender flag: the PidTagReplyRequested property is not present
    /// The server does not set the PidTagReplyRequested property.
    var replyRequested: Bool? {
        return getProperty(id: .tagReplyRequested)
    }
    
    /// [MS-OXOMSG] 2.2.1.46 PidTagResponseRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagResponseRequested property ([MS-OXPROPS] section 2.924) specifies whether an email sender requests a response to a meeting request, as specified in [MS-OXOCAL] section 2.2.1.36,
    /// or requests a voting response (section 2.2.1.75). If present, this property is set to either 0x01, in
    /// which case the response to the e-mail message is requested, or 0x00, in which case the response to
    /// the e-mail message is not requested. The default is 0x00.
    /// [MS-OXOCAL] 2.2.1.36 PidTagResponseRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// When the value of the PidTagResponseRequested property ([MS-OXOMSG] section 2.2.1.46) is
    /// FALSE, Meeting Response objects are not sent to the organizer. When the value of this property is
    /// TRUE and the client or server automatically responds (for more details, see sections 2.2.12.2,
    /// 2.2.12.3, and 2.2.12.4), a Meeting Response object is sent to the organizer. Otherwise, when the
    /// value is TRUE, the client or server can send a Meeting Response object but SHOULD prompt the user
    /// first to verify that the user wants a response sent.
    /// [MS-OXOFLAG] 2.2.1.5 PidTagResponseRequested Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagResponseRequested property ([MS-OXOMSG] section 2.2.1.46) has identical values and
    /// semantics to the PidTagReplyRequested property ([MS-OXOMSG] section 2.2.1.45) in terms of this
    /// protocol, and therefore, the client updates these values in an identical manner.
    /// The server does not set the PidTagResponseRequested property.
    /// [MS-XWDCAL] 2.2.2.43 PidTagResponseRequested
    /// DAV property names: urn:schemas:calendar:responserequested,
    /// http://schemas.microsoft.com/mapi/response_requested
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagResponseRequested property ([MS-OXPROPS] section 2.921) gets or sets a value that
    /// indicates whether the originator of the meeting requested a response. True if a response is
    /// requested; otherwise, false.
    /// This property corresponds to the RSVP property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.2.5.
    /// For outgoing meeting requests, if the value for the PidTagResponseRequested property is
    /// "TRUE", the iCalendar RSVP property of all attendees SHOULD be set to "TRUE", or if the value for the
    /// PidTagResponseRequested property is "FALSE", the RSVP property of all attendees SHOULD be set
    /// to "FALSE". For incoming meeting requests, if the iCalendar RSVP property of any attendee is "TRUE",
    /// then the PidTagResponseRequested property SHOULD be set to "TRUE", or if RSVP for all
    /// attendees is "FALSE", then the PidTagResponseRequested property SHOULD be set to "FALSE".
    /// [MS-XWDCAL] 2.2.7.76 PidTagResponseRequested
    /// DAV property names: http://schemas.microsoft.com/mapi/response_requested,
    /// urn:schemas:calendar:responserequested
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagResponseRequested property ([MS-OXPROPS] section 2.921) gets or sets a value that
    /// indicates whether the organizer of the meeting requested a response. True if a response is
    /// requested; otherwise, false.
    /// This property corresponds to the RSVP property ([MS-OXCICAL] section 2.1.3.1.1.20.2.5). For
    /// outgoing meeting requests, if the value of the PidTagResponseRequested property is "TRUE", the
    /// iCalendar RSVP property of all attendees SHOULD be set to "TRUE", or if the value of the
    /// PidTagResponseRequested property is "FALSE", the RSVP property of all attendees SHOULD be set
    /// to "FALSE". For incoming meeting requests, if the value of the iCalendar RSVP property of any
    /// attendee is "TRUE", then PidTagResponseRequested SHOULD be set to "TRUE", or if the value of
    /// the RSVP property for all attendees is "FALSE", then the PidTagResponseRequested property
    /// SHOULD be set to "FALSE". The PidTagResponseRequested property SHOULD be set to "FALSE" if
    /// the meeting does not have an organizer. The organizer is an attendee with the
    /// PidNameCalendarIsOrganizer property ([MS-OXPROPS] section 2.386) set to "TRUE".
    /// For more details about the PidTagResponseRequested property, see [MS-OXOCAL] section
    /// 2.2.1.36.
    var responseRequested: Bool? {
        return getProperty(id: .tagResponseRequested)
    }
    
    /// [MS-OXOMSG] 2.2.1.44 PidTagReplyRecipientNames Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyRecipientNames property ([MS-OXPROPS] section 2.910) contains a list of display
    /// names for recipients (1) that are to get a reply. If this property is absent, a reply is sent only to the
    /// user identified by the PidTagSenderName property (section 2.2.1.51). If present, the property is set
    /// to one string containing the address book entry's recipient (2) display names separated by
    /// semicolons.
    var replyRecipientNames: String? {
        return getProperty(id: .tagReplyRecipientNames)
    }
    
    /// [MS-OXOMSG] 2.2.1.48 PidTagSenderAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderAddressType property ([MS-OXPROPS] section 2.994) contains the sending
    /// mailbox owner's e-mail address type, as specified by the AddressType field of the RecipientRow
    /// structure ([MS-OXCDATA] section 2.8.3.2 and section 2.2.4.3).
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSenderAddressType ([MS-OXOMSG] section 2.2.1.48)
    var senderAddressType: String? {
        return getProperty(id: .tagSenderAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.1.49 PidTagSenderEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderEmailAddress property ([MS-OXPROPS] section 2.995) contains the sending
    /// mailbox owner's e-mail address, as specified by the EmailAddress field of the RecipientRow
    /// structure ([MS-OXCDATA] section 2.8.3.2).
    /// [MS-OXORSS] 2.2.2.4 PidTagSenderEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderEmailAddress property ([MS-OXOMSG] section 2.2.1.49) contains the value of
    /// the email child element of the author element of an atom entry. If the email element is not present,
    /// this property is set to an empty string. This property does not apply to an RSS item.
    var senderEmailAddress: String? {
        return getProperty(id: .tagSenderEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.50 PidTagSenderEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderEntryId property ([MS-OXPROPS] section 2.996) identifies an address book
    /// EntryID that contains the sending mailbox owner's address book EntryID, as specified by the
    /// address book EntryID ([MS-OXCDATA] section 2.2.5.2).
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSenderEntryId ([MS-OXOMSG] section 2.2.1.50)
    var senderEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagSenderEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOMSG] 2.2.1.51 PidTagSenderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderName property ([MS-OXPROPS] section 2.998) contains the sending mailbox
    /// owner's display name, as specified by the DisplayName field of the RecipientRow structure ([MSOXCDATA] section 2.8.3.2).
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSenderName ([MS-OXOMSG] section 2.2.1.51)
    /// [MS-OXORSS] 2.2.2.3 PidTagSenderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderName property ([MS-OXOMSG] section 2.2.1.51) contains origination information
    /// about the RSS object.
    /// This property is set as follows:
    ///  For an RSS item, this property is set to the value of the author or title element.
    ///  For an atom entry, this property is set to the value of the title element or to the value of the
    /// name child element of the author element.
    ///  If none of the specified elements exist in the RSS item or the atom entry, this property is set to an
    /// empty string.
    var senderName: String? {
        return getProperty(id: .tagSenderName)
    }
    
    /// [MS-OXOMSG] 2.2.1.52 PidTagSenderSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderSearchKey property ([MS-OXPROPS] section 2.999) identifies an address book
    /// search key that contains a binary-comparable key computed by concatenating the value of the
    /// sending mailbox owner's PidTagAddressType property ([MS-OXOABK] section 2.2.3.13) and
    /// PidTagEmailAddress property ([MS-OXOABK] section 2.2.3.14) with a colon in between (for
    /// example, <TYPE>:<E_MAIL ADDRESS>), as specified by the SearchKey field of the RecipientRow
    /// structure ([MS-OXCDATA] section 2.8.3.2).
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSenderSearchKey ([MS-OXOMSG] section 2.2.1.52)
    var senderSearchKey: Data? {
        return getProperty(id: .tagSenderSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.1.53 PidTagSenderSmtpAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderSmtpAddress property ([MS-OXPROPS] section 2.1000) contains the Simple
    /// Mail Transfer Protocol (SMTP) e-mail address format of the e-mail address of the sending mailbox
    /// owner.
    var senderSmtpAddress: String? {
        return getProperty(id: .tagSenderSmtpAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.54 PidTagSentRepresentingAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingAddressType property ([MS-OXPROPS] section 2.1006) contains an
    /// e-mail address type (section 2.2.4.3) for the end user represented by the sending mailbox owner. If
    /// the sending mailbox owner is sending on his or her own behalf, this property MUST be set to the value
    /// of the PidTagSenderAddressType property (section 2.2.1.48).
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSentRepresentingAddressType ([MS-OXOMSG] section 2.2.1.54)
    var sentRepresentingAddressType: String? {
        return getProperty(id: .tagSentRepresentingAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.1.55 PidTagSentRepresentingEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingEmailAddress property ([MS-OXPROPS] section 2.1007) contains an
    /// e-mail address, as specified by the EmailAddress field of the RecipientRow structure ([MSOXCDATA] section 2.8.3.2), for the end user who is represented by the sending mailbox owner. If a
    /// sending mailbox owner is sending on his or her own behalf, this property is set to the value of the
    /// PidTagSenderEmailAddress property (section 2.2.1.49).
    /// [MS-OXORSS] 2.2.2.6 PidTagSentRepresentingEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingEmailAddress property ([MS-OXOMSG] section 2.2.1.55) contains
    /// the contents of the email child element of the author element of an atom entry. If the email element
    /// is not present, this property is set to an empty string. This property does not apply to an RSS item.
    var sentRepresentingEmailAddress: String? {
        return getProperty(id: .tagSentRepresentingEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.56 PidTagSentRepresentingEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingEntryId property ([MS-OXPROPS] section 2.1008) identifies an
    /// address book EntryID, as specified by the address book EntryID ([MS-OXCDATA] section 2.2.5.2),
    /// that contains the identifier of the end user who is represented by the sending mailbox owner. If the
    /// sending mailbox owner is sending on his or her own behalf, this property is set to the value of the
    /// PidTagSenderEntryId property (section 2.2.1.50).
    var sentRepresentingEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagSentRepresentingEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOMSG] 2.2.1.57 PidTagSentRepresentingName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingName property ([MS-OXPROPS] section 2.1010) contains the display
    /// name for the end user who is represented by the sending mailbox owner. If a sending mailbox owner
    /// is sending on his or her own behalf, this property MUST be set to the value of the
    /// PidTagSenderName property (section 2.2.1.51).
    /// [MS-OXORSS] 2.2.2.5 PidTagSentRepresentingName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingName property ([MS-OXOMSG] section 2.2.1.57) contains origination
    /// information about the RSS object.
    /// This property is set as follows:
    ///  For an RSS item, this property is set to the value of the author or title element.
    ///  For an atom entry, this property is set either to the value of the title element or to the value of
    /// the name child element of the author element.
    ///  If none of the specified elements exist in the RSS item or the atom entry, this property is set to an
    /// empty string.
    var sentRepresentingName: String? {
        return getProperty(id: .tagSentRepresentingName)
    }
    
    /// [MS-OXOMSG] 2.2.1.58 PidTagSentRepresentingSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingSearchKey property ([MS-OXPROPS] section 2.1011) identifies an
    /// address book search key, as specified by the SearchKey field of the RecipientRow structure
    /// ([MS-OXCDATA] section 2.8.3.2), that contains a binary-comparable key that represents the end user
    /// who is represented by the sending mailbox owner. If a sending mailbox owner sends on his or her
    /// own behalf, this property is set to the value of the PidTagSenderSearchKey property (section
    /// 2.2.1.52).
    var sentRepresentingSearchKey: Data? {
        return getProperty(id: .tagSentRepresentingSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.1.59 PidTagSentRepresentingSmtpAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSentRepresentingSmtpAddress property ([MS-OXPROPS] section 2.1012) contains the
    /// SMTP e-mail address of the end user who is represented by the sending mailbox owner.
    var sentRepresentingSmtpAddress: String? {
        return getProperty(id: .tagSentRepresentingSmtpAddress)
    }
    
    /// [MS-OXOMSG] 2.2.1.61 PidTagTransportMessageHeaders Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTransportMessageHeaders property ([MS-OXPROPS] section 2.1044) contains
    /// transport-specific message envelope information for e-mail, as specified in [RFC2821]. For outgoing
    /// messages with recipients (1) who have an SMTP address type, and for incoming messages from a
    /// sender who has an SMTP address type, the client and server respectively MUST set this property to a
    /// copy of the beginning of the message stream as received from SMTP, up to the first blank line (double
    /// CRLF, as specified in [RFC5234].).
    var transportMessageHeaders: String? {
        return getProperty(id: .tagTransportMessageHeaders)
    }

    /// [MS-OXOMSG] 2.2.1.62 PidLidInternetAccountName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidInternetAccountName property ([MS-OXPROPS] section 2.152) specifies the user-visible
    /// e-mail account name through which the e-mail message is sent. The format of this string is
    /// implementation-dependent. This property can be used by the client to determine which server to
    /// direct the mail to but is optional and the value has no meaning to the server.
    var internetAccountName: String? {
        return getProperty(name: .lidInternetAccountName)
    }

    /// [MS-OXOMSG] 2.2.1.63 PidLidInternetAccountStamp Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidInternetAccountStamp property ([MS-OXPROPS] section 2.153) specifies the e-mail
    /// account ID through which the e-mail message is sent. The format of this string is implementationdependent. This property can be used by the client to determine which server to direct the mail to but
    /// is optional and the value has no meaning to the server.
    var internetAccountStamp: String? {
        return getProperty(name: .lidInternetAccountStamp)
    }

    /// [MS-OXOMSG] 2.2.1.64 PidTagPrimarySendAccount Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagPrimarySendAccount property ([MS-OXPROPS] section 2.863) specifies the first server
    /// to be used by a client to send the mail with. The format of this property is implementation-dependent.
    /// This property can be used by the client to determine which server to direct the mail to but is optional
    /// and the value has no meaning to the server.
    var primarySendAccount: String? {
        return getProperty(id: .tagPrimarySendAccount)
    }

    /// [MS-OXOMSG] 2.2.1.65 PidTagNextSendAcct Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNextSendAcct property ([MS-OXPROPS] section 2.800) specifies the server that a client
    /// is currently attempting to use to send mail. The format of this property is implementation-dependent.
    /// This property can be used by the client to determine which server to direct the mail to but is optional
    /// and the value has no meaning to the server.
    var nextSendAcct: String? {
        return getProperty(id: .tagNextSendAcct)
    }

    /// [MS-OXOMSG] 2.2.1.66 PidLidUseTnef Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidUseTnef property ([MS-OXPROPS] section 2.347) is set to 0x01 (TRUE) if Transport
    /// Neutral Encapsulation Format (TNEF) is included on a message when the message is converted
    /// from TNEF to MIME or SMTP format. Otherwise, this property is set to 0x00 (FALSE). If this property
    /// is absent, implementers of this protocol MUST NOT include TNEF on the message.
    /// This property is set by either the client or the server, depending on which one is performing the
    /// conversion. For information about conversions involving TNEF and MIME, see [MS-OXTNEF] and [MSOXCMAIL].
    var useTnef: String? {
        return getProperty(name: .lidUseTnef)
    }

    /// [MS-OXOMSG] 2.2.1.73 PidLidAutoProcessState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAutoProcessState property ([MS-OXPROPS] section 2.40) specifies the options used in
    /// the processing of voting and tracking for e-mail messages. The property can be absent, in which case
    /// the default value of 0x00000000 is used. If set, this property is set to one of the values in the
    /// following table.
    var autoProcessState: MessageAutoProcessState? {
        guard let rawValue: UInt32 = getProperty(name: .lidAutoProcessState) else {
            return nil
        }
        
        return MessageAutoProcessState(rawValue: rawValue)
    }

    /// [MS-OXOMSG] 2.2.1.74 PidLidVerbStream Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidVerbStream property ([MS-OXPROPS] section 2.350) specifies what voting responses the
    /// user can make in response to the message. The format is of this property is shown in the following
    /// diagram.
    var verbStream: Data? {
        return getProperty(name: .lidVerbStream)
    }
    
    /// [MS-OXOMSG] 2.2.1.75 PidLidVerbResponse Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidVerbResponse property ([MS-OXPROPS] section 2.349) specifies the voting option that a
    /// respondent has selected. Corresponds to one of the values of the DisplayName field in the
    /// VoteOption structure (section 2.2.1.74.1). If present, this property MUST be set to the textual
    /// description of the user interface element selected by the user.
    var verbResponse: String? {
        return getProperty(name: .lidVerbResponse)
    }

    /// [MS-OXOMSG] 2.2.1.76 PidTagTargetEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagTargetEntryId property ([MS-OXPROPS] section 2.1033) is used in conjunction with an
    /// optimizing send client. The semantics of an optimizing send are specified in section 3.2.4.4 and
    /// section 3.3.5.1.3.
    var targetEntryId: Data? {
        return getProperty(id: .tagTargetEntryId)
    }
    
    /// [MS-OXOMSG] 2.2.1.77 PidTagAutoResponseSuppress Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAutoResponseSuppress property ([MS-OXPROPS] section 2.609) specifies whether a
    /// client or server application can forego sending automated replies in response to this message. Valid
    /// values are given in the following table.
    /// Value Meaning
    /// -1 Suppress all automatic replies.
    /// 0 Do not suppress any automatic replies.
    /// Values greater than 0 Suppress those replies indicated by the bits set on this
    /// value, as specified in the following table.
    /// When the value of this property is greater than 0, it is interpreted as a bitwise OR of one or more of
    /// the following values.
    /// Value Meaning
    /// 0x00000001 Suppress delivery reports.
    /// 0x00000002 Suppress non-delivery reports.
    /// 0x00000004 Suppress read notifications from clients that receive
    /// the message.
    /// 0x00000008 Suppress non-read notifications from clients that
    /// receive the message.
    /// 0x00000010 Suppress Out of Office (OOF) messages.
    /// 0x00000020 Suppress all auto-reply messages other than OOF
    /// notifications.
    var autoResponseSuppress: UInt32? {
        return getProperty(id: .tagAutoResponseSuppress)
    }

    /// [MS-OXOMSG] 2.2.1.78 PidTagMessageEditorFormat Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageEditorFormat property ([MS-OXPROPS] section 2.784) specifies the format that
    /// an e-mail editor can use for editing the message body. Valid values are listed in the following table.
    var messageEditorFormat: MessageEditorFormat? {
        guard let rawValue: UInt32 = getProperty(id: .tagMessageEditorFormat) else {
            return nil
        }
        
        return MessageEditorFormat(rawValue: rawValue)
    }
    
    /// [MS-OXOMSG] 2.2.1.79 PidTagMessageSubmissionId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMessageSubmissionId property ([MS-OXPROPS] section 2.793) contains a unique
    /// identifier that indicates where the message originated. This property is optionally set, at the
    /// implementer's discretion, by a message transfer agent (MTA).
    var submissionId: UInt32? {
        return getProperty(id: .tagMessageSubmissionId)
    }

    /// 2.2.1.80 PidTagSenderIdStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSenderIdStatus property ([MS-OXPROPS] section 2.997) contains the results reported
    /// by the Sender ID agent, which compares the IP address of the message sender against the domain
    /// (called the purported responsible domain) of the sender's e-mail address. The value of this property
    /// indicates the likelihood that the current message is spam. Valid values are given in the following
    /// table.
    var senderIdStatus: MessageSenderStatus? {
        guard let rawValue: UInt32 = getProperty(id: .tagSenderIdStatus) else {
            return nil
        }
        
        return MessageSenderStatus(rawValue: rawValue)
    }
    
    /// [MS-OXOMSG] 2.2.1.81 PidTagListHelp Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagListHelp property ([MS-OXPROPS] section 2.763) contains a Uniform Resource
    /// Identifier (URI) that provides detailed help information for the mailing list from which this e-mail
    /// message was sent. This property corresponds to the List-Help header in MIME, which is specified in
    /// [RFC2369]. Conversion between this property and the List-Help header is specified in [MS-OXCMAIL]
    /// section 2.1.3.2.15.
    var listHelp: String? {
        return getProperty(id: .tagListHelp)
    }
    
    /// [MS-OXOMSG] 2.2.1.82 PidTagListSubscribe Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagListSubscribe property ([MS-OXPROPS] section 2.764) contains the URI that subscribes
    /// a recipient (2) to the message's associated mailing list. This property corresponds to the ListSubscribe header in MIME, which is specified in [RFC2369]. Conversion between this property and
    /// the List-Subscribe header is specified in [MS-OXCMAIL] section 2.1.3.2.15.
    var listSubscribe: String? {
        return getProperty(id: .tagListSubscribe)
    }
    
    /// [MS-OXOMSG] 2.2.1.83 PidTagListUnsubscribe Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagListUnsubscribe property ([MS-OXPROPS] section 2.765) contains the URI that
    /// unsubscribes a recipient (2) from the message's associated mailing list. This property corresponds to
    /// the List-Unsubscribe header in MIME, which is specified in [RFC2369]. Conversion between this
    /// property and the List-Unsubscribe header is specified in [MS-OXCMAIL] section 2.1.3.2.15.
    var listUnsubscribe: String? {
        return getProperty(id: .tagListUnsubscribe)
    }
    
    /// [MS-OXOMSG] 2.2.1.84 PidTagDelegatedByRule Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDelegatedByRule property ([MS-OXPROPS] section 2.660) specifies whether the
    /// message was resent due to the triggering of a delegate rule. This property is set to 0x01 (TRUE) if
    /// the message was resent; otherwise, it is set to 0x00 (FALSE). Delegate rules are specified in [MSOXODLGT] section 2.2.3.
    var delegatedByRule: Bool? {
        return getProperty(id: .tagDelegatedByRule)
    }
    
    /// [MS-OXOMSG] 2.2.1.85 PidTagOriginalMessageId Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalMessageId property ([MS-OXPROPS] section 2.825) is included in reply or
    /// resend messages to designate the message ID of the original message.
    var originalMessageId: String? {
        return getProperty(id: .tagOriginalMessageId)
    }
    
    /// [MS-OXOMSG] 2.2.1.86 PidTagOriginalMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalMessageClass property ([MS-OXPROPS] section 2.824) is included in reply or
    /// resend messages to designate the value of the PidTagMessageClass property ([MS-OXCMSG]
    /// section 2.2.1.3) from the original message.
    var originalMessageClass: String? {
        return getProperty(id: .tagOriginalMessageClass)
    }
    
    /// [MS-OXOMSG] 2.2.2.2 PidTagOriginalDeliveryTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalDeliveryTime property ([MS-OXPROPS] section 2.819) is set on read
    /// receipt/non-read receipt objects or replying/forwarding Message objects by using the value of the
    /// PidTagMessageDeliveryTime property (section 2.2.3.9) from the original message.
    var originalDeliveryTime: Date? {
        return getProperty(id: .tagOriginalDeliveryTime)
    }
    
    /// [MS-OXOMSG] 2.2.2.3 PidTagOriginalDisplayTo Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalDisplayTo property ([MS-OXPROPS] section 2.822) is set on report messages
    /// by using the value of the PidTagDisplayTo property (section 2.2.1.9) from the original message, if
    /// present.
    var originalDisplayTo: String? {
        return getProperty(id: .tagOriginalDisplayTo)
    }
    
    /// [MS-OXOMSG] 2.2.2.4 PidTagOriginalDisplayCc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalDisplayCc property ([MS-OXPROPS] section 2.821) is set on report messages
    /// by using the value of the PidTagDisplayCc property (section 2.2.1.8) from the original message, if
    /// present.
    var originalDisplayCc: String? {
        return getProperty(id: .tagOriginalDisplayCc)
    }
    
    /// [MS-OXOMSG] 2.2.2.5 PidTagOriginalDisplayBcc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalDisplayBcc property ([MS-OXPROPS] section 2.820) is set on report messages
    /// by using the value of the PidTagDisplayBcc property (section 2.2.1.7) from the original message, if
    /// present.
    var originalDisplayBcc: String? {
        return getProperty(id: .tagOriginalDisplayBcc)
    }
    
    /// [MS-OXOMSG] 2.2.2.6 PidTagOriginalSenderAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSenderAddressType property ([MS-OXPROPS] section 2.826) is set on delivery
    /// report messages by using the value of the original message sender's PidTagSenderAddressType
    /// property (section 2.2.1.48), as specified by AddressType field of the RecipientRow structure ([MSOXCDATA] section 2.8.3.2).
    var originalSenderAddressType: String? {
        return getProperty(id: .tagOriginalSenderAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.2.7 PidTagOriginalSenderEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSenderEmailAddress property ([MS-OXPROPS] section 2.827) is set on delivery
    /// report messages to the value of the original message sender's PidTagSenderEmailAddress
    /// property (section 2.2.1.49).
    var originalSenderEmailAddress: String? {
        return getProperty(id: .tagOriginalSenderEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.2.8 PidTagOriginalSenderEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSenderEntryId property ([MS-OXPROPS] section 2.828) contains an address
    /// book EntryID that is set on delivery report messages to the value of the PidTagSenderEntryId
    /// property (section 2.2.1.50) from the original e-mail message.
    var originalSenderEntryId: Data? {
        return getProperty(id: .tagOriginalSenderEntryId)
    }
    
    /// [MS-OXOMSG] 2.2.2.9 PidTagOriginalSenderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSenderName property ([MS-OXPROPS] section 2.829) is set on delivery report
    /// messages to the value of the original message sender's PidTagSenderName property (section
    /// 2.2.1.51).
    var originalSenderName: String? {
        return getProperty(id: .tagOriginalSenderName)
    }
    
    /// [MS-OXOMSG] 2.2.2.10 PidTagOriginalSenderSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSenderSearchKey property ([MS-OXPROPS] section 2.830) contains an
    /// address book search key that is set on delivery report messages to the value of the
    /// PidTagSenderSearchKey property (section 2.2.1.52) of the original e-mail message.
    var originalSenderSearchKey: Data? {
        return getProperty(id: .tagOriginalSenderSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.2.11 PidTagOriginalSentRepresentingAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSentRepresentingAddressType property ([MS-OXPROPS] section 2.832)
    /// contains the address type of the end user who is represented by the original e-mail message sender.
    /// It is set to the value of the PidTagSentRepresentingAddressType property (section 2.2.1.54) of
    /// the original e-mail message.
    var originalSentRepresentingAddressType: String? {
        return getProperty(id: .tagOriginalSentRepresentingAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.2.12 PidTagOriginalSentRepresentingEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSentRepresentingEmailAddress property ([MS-OXPROPS] section 2.833)
    /// contains the e-mail address of the end user who is represented by the original e-mail message sender.
    /// It is set to the value of the PidTagSentRepresentingEmailAddress property (section 2.2.1.55) of
    /// the original e-mail message.
    var originalSentRepresentingEmailAddress: String? {
        return getProperty(id: .tagOriginalSentRepresentingEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.2.13 PidTagOriginalSentRepresentingEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSentRepresentingEntryId property ([MS-OXPROPS] section 2.834) identifies
    /// an address book EntryID that contains the entry identifier of the end user who is represented by the
    /// original message sender. It is set to the value of the PidTagSentRepresentingEntryId property
    /// (section 2.2.1.56) of the original message.
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSentRepresentingEntryId ([MS-OXOMSG] section 2.2.1.56)
    var originalSentRepresentingEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagOriginalSentRepresentingEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream)
    }
    
    /// [MS-OXOMSG] 2.2.2.14 PidTagOriginalSentRepresentingName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSentRepresentingName property ([MS-OXPROPS] section 2.835) contains the
    /// display name of the end user who is represented by the original e-mail message sender; set to the
    /// value of the PidTagSentRepresentingName property (section 2.2.1.57) of the original e-mail
    /// message.
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSentRepresentingName ([MS-OXOMSG] section 2.2.1.57)
    var originalSentRepresentingName: String? {
        return getProperty(id: .tagOriginalSentRepresentingName)
    }
    
    /// [MS-OXOMSG] 2.2.2.15 PidTagOriginalSentRepresentingSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSentRepresentingSearchKey property ([MS-OXPROPS] section 2.836)
    /// identifies an address book search key that contains the value of the SearchKey field of the
    /// RecipientRow structure ([MS-OXCDATA] section 2.8.3.2) for the end user who is represented by the
    /// original message sender. It is set to the value of the PidTagSentRepresentingSearchKey property
    /// (section 2.2.1.58) of the original message.
    /// [MS-OXOCAL] 2.2.2.5 Sender Properties
    /// The following properties are specified in [MS-OXOMSG] to represent the sender of an E-mail object.
    /// They are used in this protocol to represent the creator of a Post object:
    ///  PidTagSentRepresentingSearchKey ([MS-OXOMSG] section 2.2.1.58)
    var originalSentRepresentingSearchKey: Data? {
        return getProperty(id: .tagOriginalSentRepresentingSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.2.16 PidTagOriginalSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSubject property ([MS-OXPROPS] section 2.837) specifies the subject of the
    /// original message and is set to the concatenated values of the PidTagSubjectPrefix property (section
    /// 2.2.1.60) and the PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) of the
    /// original message.
    var originalSubject: String? {
        return getProperty(id: .tagOriginalSubject)
    }
    
    /// [MS-OXOMSG] 2.2.2.17 PidTagOriginalSubmitTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOriginalSubmitTime property ([MS-OXPROPS] section 2.838) specifies the original email message's submission date and time and is set to the value of the PidTagClientSubmitTime
    /// property (section 2.2.3.11). The property is used in reports only, and once set, it MUST NOT be
    /// changed.
    var originalSubmitTime: Date? {
        return getProperty(id: .tagOriginalSubmitTime)
    }
    
    /// [MS-OXOMSG] 2.2.2.18 PidTagParentKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagParentKey property ([MS-OXPROPS] section 2.854) contains the search key that is used
    /// to correlate the original message and the reports about the original message. The server sets the
    /// property on the report message to the value of the PidTagSearchKey property ([MS-OXCPRPT]
    /// section 2.2.1.9) of the original e-mail message.
    var parentKey: Data? {
        return getProperty(id: .tagParentKey)
    }
    
    /// [MS-OXOMSG] 2.2.2.19 PidTagReportEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportEntryId property ([MS-OXPROPS] section 2.916) is an optional property that can
    /// appear on a report message. This property contains an address book EntryID, as specified in [MSOXCDATA] section 2.2.5.2, that represents the application that generated the report message.
    var reportEntryId: Data? {
        return getProperty(id: .tagReportEntryId)
    }
    
    /// [MS-OXOMSG] 2.2.2.20 PidTagReportName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportName property ([MS-OXPROPS] section 2.918) is an optional property that can
    /// appear on a report message. This property contains the display name for the application that
    /// generated the report message.
    var reportName: String? {
        return getProperty(id: .tagReportName)
    }
    
    /// [MS-OXOMSG] 2.2.2.21 PidTagReportSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportSearchKey property ([MS-OXPROPS] section 2.919) is an optional property that
    /// can appear on a report message. This property contains an address book search key, as specified
    /// in [MS-OXCDATA] section 2.8.3.2, representing the application that generated the report message.
    var reportSearchKey: Data? {
        return getProperty(id: .tagReportSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.2.22 PidTagReportTag Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportTag property ([MS-OXPROPS] section 2.920) contains the data that is used to
    /// correlate the report and the original message. The property can be absent if the sender does not
    /// request a reply or response to the original e-mail message. If the original E-mail object has either
    /// the PidTagResponseRequested property (section 2.2.1.46) set to 0x01 or the
    /// PidTagReplyRequested property (section 2.2.1.45) set to 0x01, then the property is set on the
    /// original E-mail object by using the following format.
    var reportTag: Data? {
        return getProperty(id: .tagReportTag)
    }
    
    /// [MS-OXOMSG] 2.2.2.23 PidTagReportText Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportText property ([MS-OXPROPS] section 2.921) contains the optional text for a
    /// report message. If this property is present, the server sets it to the user-readable text of the report
    /// message.
    var reportText: String? {
        return getProperty(id: .tagReportText)
    }
    
    /// [MS-OXOMSG] 2.2.2.24 PidTagReadReceiptAddressType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptAddressType property ([MS-OXPROPS] section 2.873) contains the
    /// address type of the end user to whom a read receipt is directed.
    var readReceiptAddressType: String? {
        return getProperty(id: .tagReadReceiptAddressType)
    }
    
    /// [MS-OXOMSG] 2.2.2.25 PidTagReadReceiptEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptEmailAddress property ([MS-OXPROPS] section 2.874) contains the e-mail
    /// address of the user to whom a read receipt is directed.
    var readReceiptEmailAddress: String? {
        return getProperty(id: .tagReadReceiptEmailAddress)
    }
    
    /// [MS-OXOMSG] 2.2.2.26 PidTagReadReceiptEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptEntryId property ([MS-OXPROPS] section 2.875) contains an address
    /// book EntryID, as specified in [MS-OXCDATA] section 2.2.5.2, that represents the user to whom a
    /// read receipt is directed. This property is only used and validated if the
    /// PidTagReadReceiptRequested property (section 2.2.1.29) is set to 0x01. This property can be
    /// absent, in which case, the value of the PidTagReportEntryId property (section 2.2.2.19) is used as
    /// an alternative value. If neither property is present, the value of the PidTagSenderEntryId property
    /// (section 2.2.1.50) is used to identify the user who receives the read receipt.
    var readReceiptEntryId: Data? {
        return getProperty(id: .tagReadReceiptEntryId)
    }
    
    /// [MS-OXOMSG] 2.2.2.27 PidTagReadReceiptName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptName property ([MS-OXPROPS] section 2.876) contains the display name
    /// for the end user to whom a read receipt is directed.
    var readReceiptName: String? {
        return getProperty(id: .tagReadReceiptName)
    }
    
    /// [MS-OXOMSG] 2.2.2.28 PidTagReadReceiptSearchKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReadReceiptSearchKey property ([MS-OXPROPS] section 2.878) contains an address
    /// book search key, as specified in [MS-OXCDATA] section 2.8.3.2, that represents the user to whom a
    /// read receipt is directed. This property is only used and validated if the
    /// PidTagReadReceiptRequested property (section 2.2.1.29) is set to 0x01. The property can be
    /// absent, in which case the PidTagReportSearchKey property (section 2.2.2.21) is used as an
    /// alternative. If neither property is present, the PidTagSenderSearchKey property (section 2.2.1.52)
    /// is used to identify the user who receives the read receipt.
    var readReceiptSearchKey: Data? {
        return getProperty(id: .tagReadReceiptSearchKey)
    }
    
    /// [MS-OXOMSG] 2.2.2.29 PidTagDeliverTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDeliverTime property ([MS-OXPROPS] section 2.665) contains the delivery time for a
    /// report message.
    var deliverTime: Date? {
        return getProperty(id: .tagDeliverTime)
    }
    
    /// [MS-OXOMSG] 2.2.2.30 PidTagNonDeliveryReportDiagCode Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNonDeliveryReportDiagCode property ([MS-OXPROPS] section 2.802) contains a
    /// diagnostic code for a non-delivery report. For more details, see [MS-OXCMAIL] section 2.2.3.7.1.3.
    var nonDeliveryReportDiagCode: UInt32? {
        return getProperty(id: .tagNonDeliveryReportDiagCode)
    }
    
    /// [MS-OXOMSG] 2.2.2.31 PidTagNonDeliveryReportReasonCode Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNonDeliveryReportReasonCode property ([MS-OXPROPS] section 2.803) contains a
    /// value that provides information on the reason for a non-delivery report, as specified in [MSOXCMAIL] section 2.2.3.7.1.3.
    var nonDeliveryReportReasonCode: UInt32? {
        return getProperty(id: .tagNonDeliveryReportReasonCode)
    }
    
    /// [MS-OXOMSG] 2.2.2.32 PidTagNonDeliveryReportStatusCode Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagNonDeliveryReportStatusCode property ([MS-OXPROPS] section 2.804) contains a
    /// value derived from the Status header on a non-delivery report, as specified in [MS-OXCMAIL]
    /// section 2.2.3.7.1.3.
    var nonDeliveryReportStatusCode: UInt32? {
        return getProperty(id: .tagNonDeliveryReportStatusCode)
    }
    
    /// [MS-OXOMSG] 2.2.2.33 PidTagReceiptTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReceiptTime property ([MS-OXPROPS] section 2.880) contains the sent time for a read
    /// receipt.
    var receiptTime: Date? {
        return getProperty(id: .tagReceiptTime)
    }

    /// [MS-OXOMSG] 2.2.2.34 PidTagRemoteMessageTransferAgent Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRemoteMessageTransferAgent property ([MS-OXPROPS] section 2.907) contains the
    /// name of the server that reported delivery status that resulted in a delivery receipt or non-delivery
    /// report. The value of this property corresponds to the value of the Remote-MTA header, as specified
    /// in [RFC3464].
    var remoteMessageTransferAgent: String? {
        return getProperty(id: .tagRemoteMessageTransferAgent)
    }

    /// [MS-OXOMSG] 2.2.2.35 PidTagReportingMessageTransferAgent Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReportingMessageTransferAgent property ([MS-OXPROPS] section 2.917) contains the
    /// name of the server that generated the delivery receipt or non-delivery report. The value of this
    /// property corresponds to the value of the Reporting-MTA header, as specified in [RFC3464].
    var reportingMessageTransferAgent: String? {
        return getProperty(id: .tagReportingMessageTransferAgent)
    }

    /// [MS-OXOMSG] 2.2.2.36 PidTagSupplementaryInfo Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSupplementaryInfo property ([MS-OXPROPS] section 2.1029) contains supplementary
    /// information about a delivery receipt or a non-delivery report. For more details, see [MS-OXCMAIL]
    /// section 2.2.3.7.1.2.
    var supplementaryInfo: String? {
        return getProperty(id: .tagSupplementaryInfo)
    }
    
    /// [MS-OXPROPS] 2.2.3.11 PidTagClientSubmitTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The server sets the value of the PidTagClientSubmitTime property ([MS-OXPROPS] section 2.629)
    /// to the current time (in UTC) when the e-mail message is submitted.
    var clientSubmitTime: Date? {
        return getProperty(id: .tagClientSubmitTime)
    }
}
