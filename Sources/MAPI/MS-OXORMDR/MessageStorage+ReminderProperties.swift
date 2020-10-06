//
//  MessageStorage+ReminderProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXORMDR] 2.2 Message Syntax
/// Clients can create and modify reminders on any type of Message object by using the Message and
/// Attachment Object Protocol, as specified in [MS-OXCMSG].
/// 2.2.1 Properties Used to Specify and/or Decode Reminders
/// Properties that are used to specify the reminder for a given Message object are specified in section
/// 2.2.1.1 through section 2.2.1.9. These properties are set by the client to ensure that the user is
/// reminded at the time and in the manner that the user wants.
public extension MessageStorage {
    /// [MS-OXORMDR] 2.2.1.1 PidLidReminderSet Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderSet property ([MS-OXPROPS] section 2.222) specifies whether a reminder is
    /// set on the Message object.
    /// If a Recurring Calendar object has the PidLidReminderSet property set to TRUE, the client can
    /// override this value for exceptions. For details, see the definition of the PidLidAppointmentRecur
    /// property in [MS-OXOCAL] section 2.2.1.44.
    /// If the PidLidReminderSet property is set to FALSE on a Recurring Calendar object, reminders are
    /// disabled for the entire series, including exceptions.
    /// For Recurring Task objects, the PidLidReminderSet property cannot be overridden by exceptions.
    /// For details, see [MS-OXOTASK] section 2.2.2.2.6.
    /// [MS-OXOFLAG] 2.2.3 Properties Shared with the Reminder Settings Protocol
    /// The following properties are shared by this protocol and the Reminder Settings Protocol, as specified
    /// in [MS-OXORMDR]:
    ///  PidLidReminderSet ([MS-OXORMDR] section 2.2.1.1)
    /// Unless noted in section 2.2.3.1, the semantics and accepted values of these properties are identical to
    /// those specified in [MS-OXORMDR].
    /// [MS-XWDCAL] 2.2.7.56 PidLidReminderSet
    /// DAV property name: http://schemas.microsoft.com/mapi/reminderset
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderSet property ([MS-OXORMDR] section 2.2.1.1) gets or sets a calculated value
    /// that indicates whether a reminder is set on the object. True if a reminder is set on the object;
    /// otherwise, false.
    /// For more details about the PidLidReminderSet property, see [MS-OXPROPS] section 2.222
    var reminderSet: Bool? {
        return getProperty(name: .lidReminderSet)
    }
    
    /// [MS-OXORMDR] 2.2.1.2 PidLidReminderSignalTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderSignalTime property ([MS-OXPROPS] section 2.223) specifies the time when a
    /// reminder transitions from pending to overdue. This property MUST be set if the PidLidReminderSet
    /// property (section 2.2.1.1) is set to TRUE. Clients MUST set the value of this property in Coordinated
    /// Universal Time (UTC).
    /// This property is not overridden by exceptions; there is a single signal time per Recurring Calendar
    /// object.
    /// The value of this property is not interpreted strictly as UTC. For details, see [MS-OXOCAL] section
    /// 3.1.5.5.
    /// [MS-OXOFLAG] 2.2.3 Properties Shared with the Reminder Settings Protocol
    /// The following properties are shared by this protocol and the Reminder Settings Protocol, as specified
    /// in [MS-OXORMDR]:
    ///  PidLidReminderSignalTime ([MS-OXORMDR] section 2.2.1.2)
    /// Unless noted in section 2.2.3.1, the semantics and accepted values of these properties are identical to
    /// those specified in [MS-OXORMDR].
    /// [MS-XWDCAL] 2.2.7.57 PidLidReminderSignalTime
    /// DAV property name: http://schemas.microsoft.com/mapi/remindernexttime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderSignalTime property ([MS-OXORMDR] section 2.2.1.2) gets or sets the
    /// calculated time when a reminder transitions from pending to overdue.
    /// For more details about the PidLidReminderSignalTime property, see [MS-OXPROPS] section 2.223.
    var reminderSignalTime: Date? {
        return getProperty(name: .lidReminderSignalTime)
    }
    
    /// [MS-OXORMDR] 2.2.1.3 PidLidReminderDelta Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderDelta property ([MS-OXPROPS] section 2.218) specifies the interval, in minutes,
    /// between the time at which the reminder first becomes overdue and the start time of the Calendar
    /// object. This property MUST be set on Calendar objects. For all Message objects other than Calendar
    /// objects, this property SHOULD be set to 0x00000000 and is ignored.
    /// When a reminder is dismissed for one instance of a Recurring Calendar object, the value of this
    /// property is used in the calculation of the signal time for the next instance. For details about creating
    /// Calendar objects, see [MS-OXOCAL] section 3.1.4.1.
    /// [MS-XWDCAL] 2.2.7.52 PidLidReminderDelta
    /// DAV property name: http://schemas.microsoft.com/mapi/reminderdelta
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderDelta property ([MS-OXPROPS] section 2.218) gets or sets the calculated
    /// interval, in minutes, between the time at which the reminder first becomes overdue and the start
    /// time of the Calendar object.
    /// For more details about the PidLidReminderDelta property, see [MS-OXORMDR] section 2.2.1.3.
    var reminderDelta: UInt32? {
        return getProperty(name: .lidReminderDelta)
    }
    
    /// [MS-OXORMDR] 2.2.1.4 PidLidReminderTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderTime property ([MS-OXPROPS] section 2.224) specifies the initial signal time
    /// for Message objects other than Calendar objects. For Calendar objects, the value of this property
    /// represents the time after which the user would be late; that is, the start time of the appointment.
    /// Clients MUST set the value in UTC.
    /// [MS-OXOFLAG] 2.2.3 Properties Shared with the Reminder Settings Protocol
    /// The following properties are shared by this protocol and the Reminder Settings Protocol, as specified
    /// in [MS-OXORMDR]:
    ///  PidLidReminderTime ([MS-OXORMDR] section 2.2.1.4)
    /// Unless noted in section 2.2.3.1, the semantics and accepted values of these properties are identical to
    /// those specified in [MS-OXORMDR].
    /// [MS-XWDCAL] 2.2.7.58 PidLidReminderTime
    /// DAV property name: http://schemas.microsoft.com/mapi/remindertime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// For non-Calendar objects, the PidLidReminderTime property ([MS-OXORMDR] section 2.2.1.4) gets
    /// or sets the initial signal time. For Calendar objects, gets or sets the time after which the user
    /// would be late; that is, the start time of the appointment.
    /// For more details about the PidLidReminderTime property, see [MS-OXPROPS] section 2.224.
    var reminderTime: Date? {
        return getProperty(name: .lidReminderTime)
    }
    
    /// [MS-OXORMDR] 2.2.1.5 PidLidReminderOverride Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderOverride property ([MS-OXPROPS] section 2.220), if set to TRUE, specifies that
    /// the client SHOULD respect the values of the PidLidReminderPlaySound property (section 2.2.1.6)
    /// and the PidLidReminderFileParameter property (section 2.2.1.7). Otherwise, a client can use
    /// default values in place of the values of the PidLidReminderPlaySound and
    /// PidLidReminderFileParameter properties.
    /// [MS-XWDCAL] 2.2.7.54 PidLidReminderOverride
    /// DAV property name: http://schemas.microsoft.com/mapi/reminderoverride
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderOverride property ([MS-OXORMDR] section 2.2.1.5) gets or sets a value that
    /// indicates whether the client SHOULD adhere to the values of PidLidReminderPlaySound ([MSOXORMDR] section 2.2.1.6) and PidLidReminderFileParameter ([MS-OXORMDR] section 2.2.1.7)
    /// as specified in sections 2.2.7.55 and 2.2.7.53 respectively. True if the values SHOULD be adhered to;
    /// otherwise, false.
    /// For more details about the PidLidReminderOverride property, see [MS-OXPROPS] section 2.220.
    var reminderOverride: Bool? {
        return getProperty(name: .lidReminderOverride)
    }
    
    /// [MS-OXORMDR] 2.2.1.6 PidLidReminderPlaySound Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderPlaySound property ([MS-OXPROPS] section 2.221), if set to TRUE, specifies
    /// that the client SHOULD play a sound when the reminder becomes overdue.
    /// [MS-XWDCAL] 2.2.7.55 PidLidReminderPlaySound
    /// DAV property name: http://schemas.microsoft.com/mapi/reminderplaysound
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderPlaySound property ([MS-OXORMDR] section 2.2.1.6) gets or sets a value that
    /// indicates whether the client SHOULD play a sound when the reminder becomes overdue. True if the
    /// client SHOULD play a sound; otherwise, false.
    /// For more details about the PidLidReminderPlaySound property, see [MS-OXPROPS] section 2.221.
    var reminderPlaySound: Bool? {
        return getProperty(name: .lidReminderPlaySound)
    }
    
    /// [MS-OXORMDR] 2.2.1.7 PidLidReminderFileParameter Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderFileParameter property ([MS-OXPROPS] section 2.219) SHOULD specify the
    /// full path (but MAY specify only the file name) of the sound<1> that a client SHOULD play when the
    /// reminder for the Message object becomes overdue. If this property is not present, the client can
    /// use a default value.
    /// [MS-XWDCAL] 2.2.7.53 PidLidReminderFileParameter
    /// DAV property name: http://schemas.microsoft.com/mapi/reminderfileparam
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderFileParameter property ([MS-OXORMDR] section 2.2.1.7) gets or sets the file
    /// name of the sound that a client SHOULD play when the reminder for that object becomes overdue.
    /// For more details about the PidLidReminderFileParameter property, see [MS-OXPROPS] section
    /// 2.219.
    var reminderFileParameter: String? {
        return getProperty(name: .lidReminderFileParameter)
    }
    
    /// [MS-OXORMDR] 2.2.1.8 PidTagReplyTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyTime property ([MS-OXOFLAG] section 2.2.3.1), upon receipt of a Message
    /// object, specifies the due time that the sender wants, presumably for an associated work item. The
    /// value of this property is otherwise ignored. Clients MUST set the value in UTC.
    /// [MS-OXOFLAG] 2.2.3 Properties Shared with the Reminder Settings Protocol
    /// The following properties are shared by this protocol and the Reminder Settings Protocol, as specified
    /// in [MS-OXORMDR]:
    ///  PidTagReplyTime (section 2.2.3.1)
    /// Unless noted in section 2.2.3.1, the semantics and accepted values of these properties are identical to
    /// those specified in [MS-OXORMDR].
    /// [MS-OXOFLAG] 2.2.3.1 PidTagReplyTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// On a Draft Message object, if the sender desires to set a deadline for the recipient, the
    /// PidTagReplyTime property ([MS-OXPROPS] section 2.913) is set to the desired deadline, in UTC.
    /// The server does not set the PidTagReplyTime property.
    var replyTime: Date? {
        return getProperty(id: .tagReplyTime)
    }
    
    /// [MS-OXORMDR] 2.2.1.9 PidLidReminderType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidReminderType property ([MS-OXPROPS] section 2.227) SHOULD NOT<2> be set, and its
    /// value MUST be ignored.
    /// [MS-XWDCAL] 2.2.7.61 PidLidReminderType
    /// DAV property name: http://schemas.microsoft.com/mapi/remindertype
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderType property ([MS-OXPROPS] section 2.227) SHOULD NOT be set and MUST
    /// be ignored.
    var reminderType: UInt32? {
        return getProperty(name: .lidReminderType)
    }
}
