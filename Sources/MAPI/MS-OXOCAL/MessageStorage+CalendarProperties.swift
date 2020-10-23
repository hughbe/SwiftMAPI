//
//  MessageStorage+CalendarProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import DataStream
import Foundation

/// [MS-OXOCAL] 2.2 Message Syntax
/// Calendar objects and meeting-related objects can be created and modified by clients and servers.
/// Clients operate on Calendar objects and meeting-related objects by using the Message and
/// Attachment Object Protocol, as specified in [MS-OXCMSG]. How servers operate on these objects is
/// implementation-dependent, but the results of any such operations MUST be exposed to clients as
/// specified by the Appointment and Meeting Object Protocol.
/// Unless otherwise specified, Calendar objects and meeting-related objects MUST adhere to all property
/// constraints specified in [MS-OXCMSG]. An object can contain other properties but these properties do
/// not have any impact on the Appointment and Meeting Object Protocol.<1>
/// When a property is referred to as "read-only for the client", it means that a client SHOULD NOT
/// attempt to change the value of this property and that a server returns an error and ignores any
/// request to change the value of this property.
/// [MS-OXOCAL] 2.2.1 Common Properties
/// Properties that are common to all object types in the Appointment and Meeting Object Protocol are
/// specified in sections 2.2.1.1 through 2.2.1.56.9. Unless otherwise specified, these properties exist on
/// all Calendar objects and meeting-related objects. Unless otherwise specified, all common
/// properties are ordered little-endian.
/// [MS-OXOCAL] 2.2.2 Calendar Object
/// Properties that are specific to Calendar objects, (which include Appointment objects and Meeting
/// objects) are specified in sections 2.2.2.1 through 2.2.2.4. Unless otherwise specified, these
/// properties will exist. Note that Calendar objects can also have the following reminder-related
/// properties, as specified in [MS-OXORMDR]:
///  PidLidReminderSet ([MS-OXORMDR] section 2.2.1.1)
///  PidLidReminderSignalTime ([MS-OXORMDR] section 2.2.1.2)
///  PidLidReminderDelta ([MS-OXORMDR] section 2.2.1.3)
///  PidLidReminderTime ([MS-OXORMDR] section 2.2.1.4)
///  PidLidReminderOverride ([MS-OXORMDR] section 2.2.1.5)
///  PidLidReminderPlaySound ([MS-OXORMDR] section 2.2.1.6)
///  PidLidReminderFileParameter ([MS-OXORMDR] section 2.2.1.7).
/// [MS-OXOCAL] 2.2.3 Appointment Object
/// There are no additional properties specific to Appointment objects not already specified for
/// Calendar objects.
/// [MS-OXOCAL] 2.2.4 Meeting Object
/// The properties that are specific to Meeting objects are specified in sections 2.2.4.1 through
/// 2.2.4.10.7. These properties have no meaning for Appointment objects. Unless otherwise specified,
/// these properties will exist.
/// [MS-OXOCAL] 2.2.5 Meeting-Related Objects
/// Properties that are specific to meeting-related objects are specified in sections 2.2.5.1 through
/// 2.2.5.7. These include Meeting Request objects, Meeting Update objects, Meeting Cancellation
/// objects, Meeting Response objects, and Meeting Forward Notification objects. Unless
/// otherwise specified, these properties MUST exist.
/// [MS-OXOCAL] 2.2.6 Meeting Request/Update Object
/// The properties that are specific to Meeting Request objects and Meeting Update objects are
/// specified in sections 2.2.6.1 through 2.2.6.12. Unless otherwise specified, these properties will exist.
/// [MS-OXOCAL] 2.2.7 Meeting Response Object
/// A Meeting Response object takes the form of one of three types: accept, tentatively accept, or
/// decline. The properties specified in sections 2.2.7.1 through 2.2.7.8 apply to all response types,
/// except where individually noted. Unless otherwise specified, these properties will exist.
/// [MS-OXOCAL] 2.2.8 Meeting Cancellation Object
/// The properties that are specific to Meeting Cancellation objects are specified in section 2.2.8.1
/// through section 2.2.8.6. Unless otherwise specified, these properties will exist.
/// [MS-OXOCAL] 2.2.9 Meeting Forward Notification Object
/// The properties that are specific to Meeting Forward Notification objects are specified in sections
/// 2.2.9.1 through 2.2.9.4. Unless otherwise specified, these properties MUST exist.
/// [MS-OXOCAL] 2.2.10 Exceptions
/// An exception specifies changes to an instance of a recurring series. Two objects define an exception:
///  The Exception Attachment object holds attachment-related information. One Exception
/// Attachment object SHOULD exist for each instance listed in the ModifiedInstanceDates field of
/// the PidLidAppointmentRecur property (section 2.2.1.44) on the Calendar object. Note that
/// there are circumstances in which the number of Exception Attachment objects will not match the
/// number of values in the ModifiedInstanceDates field of the PidLidAppointmentRecur
/// property. For example, when an Exception Attachment object cannot be found in the set of
/// attachments, a client or server can create it. In some cases, this erroneously leads to multiple
/// Exception Attachment objects for an instance.
///  The Exception Embedded Message object contains the modifications to an instance. One
/// Exception Embedded Message object MUST exist for each Exception Attachment object.
/// The properties that are specific to the Exception Attachment object that make up the exception are
/// specified in sections 2.2.10.1.1 through 2.2.10.1.6. The properties that are specific to the Exception
/// Embedded Message object that make up the exception are specified in sections 2.2.10.2.1 through
/// 2.2.10.2.7. Unless otherwise specified, these properties will exist.
/// [MS-OXOCAL] 2.2.10.2 Exception Embedded Message Object
/// The data stored in the Embedded Message object that is represented by the
/// PidTagAttachDataObject property ([MS-OXCMSG] section 2.2.2.8) contains properties that are
/// specific to the exception. Any property that is not set on the Exception Embedded Message object
/// is obtained from the recurrence series. The following properties SHOULD NOT be set on an Exception
/// Embedded Message object; if they are set, they are not used by the client or server:
///  PidLidAppointmentLastSequence (section 2.2.4.2)
///  PidLidMeetingWorkspaceUrl (section 2.2.1.48)
///  PidLidContacts ([MS-OXCMSG] section 2.2.1.57.2)
///  PidTagSensitivity ([MS-OXCMSG] section 2.2.1.13)
///  PidLidPrivate ([MS-OXCMSG] section 2.2.1.15)
///  PidNameKeywords ([MS-OXCMSG] section 2.2.1.17)
/// The properties that are specific to the Exception Embedded Message object are specified in sections
/// 2.2.10.2.1 through 2.2.10.2.7.
/// [MS-OXOCAL] 2.2.11 Calendar Folder
/// For a folder to be treated as a Calendar folder, unless otherwise specified, it MUST have the
/// properties specified in sections 2.2.11.1 and 2.2.11.2. When creating Calendar objects, the client or
/// server SHOULD create them in the Calendar special folder. Note that an end user can create
/// calendar items in any Calendar folder. However, free/busy status information is calculated only
/// from the Calendar special folder.
/// [MS-OXOCAL] 2.2.12 Delegate Information Object
/// The properties that are set on the Delegate Information object, as specified in [MS-OXODLGT], are
/// specified in sections 2.2.12.1 through 2.2.12.5.
public extension MessageStorage {
    /// [MS-OXOCAL] 2.2.1.1 PidLidAppointmentSequence Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentSequence property ([MS-OXPROPS] section 2.25) specifies the sequence
    /// number of a Meeting object. A Meeting object begins with the sequence number set to 0 (zero) and
    /// is incremented each time the organizer sends out a Meeting Update object. The sequence number
    /// is copied onto the Meeting Response object so that the client or server knows which version of the
    /// meeting is being responded to. This property is unsigned. For more details about when and how a
    /// client increments the sequence number, see section 3.1.5.4.
    /// [MS-XWDCAL] 2.2.7.9 PidLidAppointmentSequence
    /// DAV property name: http://schemas.microsoft.com/mapi/apptsequence
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentSequence property ([MS-OXOCAL] section 2.2.1.1) gets or sets the
    /// sequence number of a Meeting object.
    /// For more details about the PidLidAppointmentSequence property, see [MS-OXPROPS] section 2.25.
    var appointmentSequence: UInt32? {
        return getProperty(name: .lidAppointmentSequence)
    }
    
    /// [MS-OXOCAL] 2.2.1.2 PidLidBusyStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidBusyStatus property ([MS-OXPROPS] section 2.48) specifies the availability of a user for
    /// the event described by the object. This property MUST be one of the values specified in the following
    /// table.
    /// [MS-OXOCAL] 2.2.8.5 PidLidBusyStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidBusyStatus property (section 2.2.1.2) MUST be set to "olFree"
    /// (0x00000000).
    /// [MS-XWDCAL] 2.2.7.17 PidLidBusyStatus
    /// DAV property name: http://schemas.microsoft.com/mapi/busystatus
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidBusyStatus property ([MS-OXOCAL] section 2.2.1.2) gets or sets the calculated
    /// availability of a user for the event described by the object. Valid values are specified in [MS-OXOCAL]
    /// section 2.2.1.2.
    /// For more details about the PidLidBusyStatus property, see [MS-OXPROPS] section 2.47.
    var busyStatus: BusyStatus? {
        guard let rawValue: UInt32 = getProperty(name: .lidBusyStatus) else {
            return nil
        }
        
        return BusyStatus(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.3 PidLidAppointmentAuxiliaryFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentAuxiliaryFlags property ([MS-OXPROPS] section 2.8) specifies a bit field
    /// that describes the auxiliary state of the object. This property is not required. The individual flags that
    /// can be set are specified in the following diagram.
    var appointmentAuxiliaryFlags: AppointmentAuxiliaryFlags? {
        guard let rawValue: UInt32 = getProperty(name: .lidAppointmentAuxiliaryFlags) else {
            return nil
        }
        
        return AppointmentAuxiliaryFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.4 PidLidLocation Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidLocation property ([MS-OXPROPS] section 2.160) specifies the location of the event. This
    /// property is not required.
    /// [MS-XWDCAL] 2.2.2.4 PidLidLocation
    /// DAV property name: urn:schemas:calendar:location
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidLocation property ([MS-OXOCAL] section 2.2.1.4) gets or sets the calculated location of
    /// an appointment or meeting.
    /// This property corresponds to the LOCATION property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.15.
    /// For more details about the PidLidLocation property, see [MS-OXPROPS] section 2.159.
    var eventLocation: String? {
        return getProperty(name: .lidLocation)
    }
    
    /// [MS-OXOCAL] 2.2.1.5 PidLidAppointmentStartWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentStartWhole property ([MS-OXPROPS] section 2.29) specifies the start date
    /// and time of the event in Coordinated Universal Time (UTC). The value of this property MUST be
    /// less than or equal to the value of the PidLidAppointmentEndWhole property (section 2.2.1.6). For
    /// a recurring series, the value of this property is the start date and time of the first instance according
    /// to the recurrence pattern. Note that for some appointments, the value of this time property is not
    /// interpreted strictly as a UTC time. For more details about how this property is interpreted, see section
    /// 3.1.5.5.<3>
    /// [MS-OXOCAL] 2.2.10.2.3 PidLidAppointmentStartWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentStartWhole property (section 2.2.1.5) MUST exist on an Exception
    /// Embedded Message object, even if the exception has the same start date and time as the instance
    /// in the recurring series to which it corresponds. PidLidAppointmentStartWhole contains the start
    /// date and time of the exception and is specified in UTC.
    /// [MS-XWDCAL] 2.2.7.12 PidLidAppointmentStartWhole
    /// DAV property name: http://schemas.microsoft.com/mapi/apptstartwhole
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentStartWhole property ([MS-OXOCAL] section 2.2.1.5) gets or sets the
    /// calculated start date and time of the event; MUST be in UTC and MUST be less than the value of the
    /// PidLidAppointmentEndWhole property ([MS-OXOCAL] section 2.2.1.6).
    /// For more details about the PidLidAppointmentStartWhole property, see [MS-OXPROPS] section
    /// 2.29.
    var appointmentStartWhole: Date? {
        return getProperty(name: .lidAppointmentStartWhole)
    }
    
    /// [MS-OXOCAL] 2.2.1.6 PidLidAppointmentEndWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentEndWhole property ([MS-OXPROPS] section 2.14) specifies the end date
    /// and time for the event in UTC. The value of this property MUST be greater than or equal to the value
    /// of the PidLidAppointmentStartWhole property (section 2.2.1.5). For a recurring series, the value
    /// of this property is the end date and time of the first instance according to the recurrence pattern.
    /// Note that for some appointments, the value of this time property is not interpreted strictly as a UTC
    /// time. For more details about how this property is interpreted, see section 3.1.5.5.<4>
    /// [MS-OXOCAL] 2.2.10.2.4 PidLidAppointmentEndWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentEndWhole property (section 2.2.1.6) MUST exist on an Exception object,
    /// even if the exception has the same end date and time as the instance in the recurring series to
    /// which it corresponds. PidLidAppointmentEndWhole contains the end date and time of the exception
    /// and is specified in UTC.
    /// [MS-XWDCAL] 2.2.7.5 PidLidAppointmentEndWhole
    /// DAV property name: http://schemas.microsoft.com/mapi/apptendwhole
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentEndWhole property ([MS-OXOCAL] section 2.2.1.6) gets or sets the
    /// calculated end date and time for the event in UTC and MUST be greater than the value of the
    /// PidLidAppointmentStartWhole property ([MS-OXOCAL] section 2.2.1.5).
    /// For more details about the PidLidAppointmentEndWhole property, see [MS-OXPROPS] section
    /// 2.14.
    var appointmentEndWhole: Date? {
        return getProperty(name: .lidAppointmentEndWhole)
    }
    
    /// [MS-OXOCAL] 2.2.1.7 PidLidAppointmentDuration Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentDuration property ([MS-OXPROPS] section 2.11) specifies the length of the
    /// event, in minutes. This property is not required. If set, the value MUST be the number of minutes
    /// between the value of the PidLidAppointmentStartWhole property section 2.2.1.5) and the value of
    /// the PidLidAppointmentEndWhole property (section 2.2.1.6).<5>
    /// [MS-XWDCAL] 2.2.7.2 PidLidAppointmentDuration
    /// DAV property name: http://schemas.microsoft.com/mapi/apptduration
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentDuration property ([MS-OXOCAL] section 2.2.1.7) gets or sets the length of
    /// the event, in minutes.
    /// For more details about the PidLidAppointmentDuration property, see [MS-OXPROPS] section 2.11.
    var appointmentDuration: UInt32? {
        return getProperty(name: .lidAppointmentDuration)
    }

    /// [MS-OXOCAL] 2.2.1.9 PidLidAppointmentSubType Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentSubType property ([MS-OXPROPS] section 2.31) specifies whether the
    /// event is an all-day event, as specified by the user. A value of TRUE indicates that the event is an allday event, in which case the values of the PidLidAppointmentStartWhole property (section
    /// 2.2.1.5) and the PidLidAppointmentEndWhole property (section 2.2.1.6) MUST both be midnight
    /// so that the duration is a multiple of 24 hours and is at least 24 hours. A value of FALSE or the absence
    /// of this property indicates that the event is not an all-day event. Note that the client or server cannot
    /// infer the value as TRUE when a user happens to create an event that is 24 hours long, even if the
    /// event starts and ends at midnight.
    /// [MS-XWDCAL] 2.2.7.14 PidLidAppointmentSubType
    /// DAV property names: http://schemas.microsoft.com/mapi/apptsubtype,
    /// urn:schemas:calendar:alldayevent
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentSubType property ([MS-OXOCAL] section 2.2.1.9) gets or sets a value that
    /// indicates whether the event is an all-day event. True if the event is an all-day event; otherwise, false.
    /// For more details about the PidLidAppointmentSubType property, see [MS-OXPROPS] section 2.31.
    var appointmentSubType: Bool? {
        return getProperty(name: .lidAppointmentSubType)
    }
    
    /// [MS-OXOCAL] 2.2.1.10 PidLidAppointmentStateFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentStateFlags property ([MS-OXPROPS] section 2.30) is a bit field that
    /// specifies the appointment state of the object. This property is not required. The individual flags that
    /// can be set are as follows.
    /// [MS-XWDCAL] 2.2.7.13 PidLidAppointmentStateFlags
    /// DAV property name: http://schemas.microsoft.com/mapi/apptstateflags
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentStateFlags property ([MS-OXOCAL] section 2.2.1.10) gets or sets the
    /// calculated bit field that describes the state of the object. The flag values are specified in [MS-OXOCAL]
    /// section 2.2.1.10.
    /// For more details about the PidLidAppointmentStateFlags property, see [MS-OXPROPS] section
    /// 2.30.
    var appointmentStateFlags: AppointmentStateFlags? {
        guard let rawValue: UInt32 = getProperty(name: .lidAppointmentStateFlags) else {
            return nil
        }
        
        return AppointmentStateFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.11 PidLidResponseStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidResponseStatus property ([MS-OXPROPS] section 2.232) specifies the response status of
    /// an attendee. This property MUST be set to one of the values listed in the following table.
    /// [MS-OXOCAL] 2.2.8.4 PidLidResponseStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidResponseStatus property (section 2.2.1.11) MUST be set to
    /// "respNotResponded" (0x00000005).
    /// [MS-XWDCAL] 2.2.2.6 PidLidResponseStatus
    /// DAV property names: urn:schemas:calendar:attendeestatus,
    /// http://schemas.microsoft.com/mapi/responsestatus
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidResponseStatus property ([MS-OXOCAL] section 2.2.1.11) gets or sets the calculated
    /// response status of the attendee.
    /// For more details about the PidLidResponseStatus property, see [MS-OXPROPS] section 2.231.
    /// [MS-XWDCAL] 2.2.7.65 PidLidResponseStatus
    /// DAV property names: http://schemas.microsoft.com/mapi/responsestatus,
    /// urn:schemas:calendar:attendeestatus
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidResponseStatus property ([MS-OXOCAL] section 2.2.1.11) gets or sets the calculated
    /// response status of the attendee.
    /// For more details about PidLidResponseStatus, see [MS-OXPROPS] section 2.231.
    var responseStatus: ResponseStatus? {
        guard let rawValue: UInt32 = getProperty(name: .lidResponseStatus) else {
            return nil
        }
        
        return ResponseStatus(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.12 PidLidRecurring Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidRecurring property ([MS-OXPROPS] section 2.217) specifies whether the object
    /// represents a recurring series. A value of TRUE indicates that the object represents a recurring
    /// series. A value of FALSE or the absence of this property indicates that the object represents either a
    /// single instance or an exception (including an orphan instance). Note the difference between this
    /// property and the PidLidIsRecurring property (section 2.2.1.13).
    /// [MS-XWDCAL] 2.2.7.51 PidLidRecurring
    /// DAV property name: http://schemas.microsoft.com/mapi/recurring
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidRecurring property ([MS-OXOCAL] section 2.2.1.12) gets or sets the calculated value that
    /// indicates whether the object represents a recurring series.
    /// For more details about the PidLidRecurring property, see [MS-OXPROPS] section 2.216.
    var recurring: Bool? {
        return getProperty(name: .lidRecurring)
    }
    
    /// [MS-OXOCAL] 2.2.1.13 PidLidIsRecurring Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidIsRecurring property ([MS-OXPROPS] section 2.157) specifies whether the object is
    /// associated with a recurring series. A value of TRUE indicates that the object represents either a
    /// recurring series or an exception (including an orphan instance). A value of FALSE or the absence of
    /// this property<7> indicates that the object represents a single instance. Note the difference between
    /// this property and the PidLidRecurring property (section 2.2.1.12).
    /// [MS-XWDCAL] 2.2.7.30 PidLidIsRecurring
    /// DAV property name: http://schemas.microsoft.com/mapi/is_recurring
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidIsRecurring property ([MS-OXOCAL] section 2.2.1.13) gets or sets a value that indicates
    /// whether the object is associated with a recurring series. True if the object represents either a
    /// recurring series or an exception (including an orphan instance); otherwise, false.
    /// For more details about the PidLidIsRecurring property, see [MS-OXPROPS] section 2.156.
    var isRecurring: Bool? {
        return getProperty(name: .lidIsRecurring)
    }
    
    /// [MS-OXOCAL] 2.2.1.14 PidLidClipStart Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// For single-instance Calendar objects, the PidLidClipStart property ([MS-OXPROPS] section 2.61)
    /// specifies the start date and time of the event in UTC. For a recurring series, this property specifies
    /// midnight in the user's machine time zone, on the date of the first instance, then is persisted in UTC.
    /// This property is not required.
    var clipStart: Date? {
        return getProperty(name: .lidClipStart)
    }
    
    /// [MS-OXOCAL] 2.2.1.15 PidLidClipEnd Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// For single-instance Calendar objects, the PidLidClipEnd property ([MS-OXPROPS] section 2.60)
    /// specifies the end date and time of the event in UTC. For a recurring series, this property specifies
    /// midnight in the user's machine time zone, on the date of the last instance of the recurring series, then
    /// is persisted in UTC, unless the recurring series has no end, in which case the value MUST be "31
    /// August 4500, 11:59 P.M" This property is not required.
    var clipEnd: Date? {
        return getProperty(name: .lidClipEnd)
    }
    
    /// [MS-OXOCAL] 2.2.1.16 PidLidAllAttendeesString Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidAllAttendeesString property ([MS-OXPROPS] section 2.5) specifies a list of all the
    /// attendees except for the organizer, including Resource objects and unsendable attendees. The
    /// value for each attendee is the PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of
    /// the attendee's Address Book object. Separate entries are delimited by a semicolon followed by a
    /// space. This property is not required.
    /// [MS-XWDCAL] 2.2.7.1 PidLidAllAttendeesString
    /// DAV property name: http://schemas.microsoft.com/mapi/allattendeesstring
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAllAttendeesString property ([MS-OXOCAL] section 2.2.1.16) gets or sets a list of all the
    /// attendees except for the organizer, including resources and unsendable attendees.
    /// For more details about the PidLidAllAttendeesString property, see [MS-OXPROPS] section 2.5.
    var allAttendeesString: String? {
        return getProperty(name: .lidAllAttendeesString)
    }
    
    /// [MS-OXOCAL] 2.2.1.17 PidLidToAttendeesString Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidToAttendeesString property ([MS-OXPROPS] section 2.344) contains a list of all the
    /// sendable attendees who are also required attendees. The value for each attendee is the
    /// PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of the attendee's Address Book
    /// object. Separate entries are delimited by a semicolon followed by a space. This property is not
    /// required.
    var toAttendeesString: String? {
        return getProperty(name: .lidToAttendeesString)
    }

    /// [MS-OXOCAL] 2.2.1.18 PidLidCcAttendeesString Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidCcAttendeesString property ([MS-OXPROPS] section 2.51) contains a list of all the
    /// sendable attendees who are also optional attendees. The value for each attendee is the
    /// PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of the attendee's Address Book
    /// object. Separate entries are delimited by a semicolon followed by a space. This property is not
    /// required.
    var ccAttendeesString: String? {
        return getProperty(name: .lidCcAttendeesString)
    }
    
    /// [MS-OXOCAL] 2.2.1.19 PidLidNonSendableTo Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidNonSendableTo property ([MS-OXPROPS] section 2.180) contains a list of all the
    /// unsendable attendees who are also required attendees. The value for each attendee is the
    /// PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of the attendee's Address Book
    /// object. Separate entries are delimited by a semicolon followed by a space. This property is not
    /// required.
    /// [MS-XWDCAL] 2.2.7.39 PidLidNonSendableTo
    /// DAV property name: http://schemas.microsoft.com/mapi/nonsendableto
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidNonSendableTo property ([MS-OXOCAL] section 2.2.1.19) gets or sets a list of all the
    /// unsendable attendees who are also required attendees.
    /// For more details about the PidLidNonSendableTo property, see [MS-OXPROPS] section 2.179.
    var nonSendableTo: String? {
        return getProperty(name: .lidNonSendableTo)
    }

    /// [MS-OXOCAL] 2.2.1.20 PidLidNonSendableCc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidNonSendableCc property ([MS-OXPROPS] section 2.179) contains a list of all the
    /// unsendable attendees who are also optional attendees. The value for each attendee is the
    /// PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of the attendee's Address Book
    /// object. Separate entries are delimited by a semicolon followed by a space. This property is not
    /// required.
    /// [MS-XWDCAL] 2.2.7.38 PidLidNonSendableCc
    /// DAV property name: http://schemas.microsoft.com/mapi/nonsendablecc
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidNonSendableCc property ([MS-OXOCAL] section 2.2.1.20) gets or sets a list of all the
    /// unsendable attendees who are also optional attendees.
    /// For more details about the PidLidNonSendableCc property, see [MS-OXPROPS] section 2.178.
    var nonSendableCc: String? {
        return getProperty(name: .lidNonSendableCc)
    }
    
    /// [MS-OXOCAL] 2.2.1.21 PidLidNonSendableBcc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidNonSendableBcc property ([MS-OXPROPS] section 2.178) contains a list of all the
    /// unsendable attendees who are also Resource objects. The value for each attendee is the
    /// PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of the attendee's Address Book
    /// object. Separate entries are delimited by a semicolon followed by a space. This property is not
    /// required.
    /// [MS-XWDCAL] 2.2.7.37 PidLidNonSendableBcc
    /// DAV property name: http://schemas.microsoft.com/mapi/nonsendablebcc
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidNonSendableBcc property ([MS-OXOCAL] section 2.2.1.21) gets or sets a list of all the
    /// unsendable attendees who are also resources.
    /// For more details about the PidLidNonSendableBcc property, see [MS-OXPROPS] section 2.177.
    var nonSendableBcc: String? {
        return getProperty(name: .lidNonSendableBcc)
    }
    
    /// [MS-OXOCAL] 2.2.1.22 PidLidNonSendToTrackStatus Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNonSendToTrackStatus property ([MS-OXPROPS] section 2.183) contains the value from
    /// the response table, as specified in section 2.2.1.11, for each attendee listed in the
    /// PidLidNonSendableTo property (section 2.2.1.19 ). This property is required only when the
    /// PidLidNonSendableTo property is set. The number of values in this property MUST equal the
    /// number of values in the PidLidNonSendableTo property. Each PtypInteger32 value ([MSOXCDATA] section 2.11.1) in this property corresponds to the attendee in the PidLidNonSendableTo
    /// property at the same index.
    /// [MS-XWDCAL] 2.2.7.42 PidLidNonSendToTrackStatus
    /// DAV property name: http://schemas.microsoft.com/mapi/nonsendtotrackstatus
    /// Data type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1.6.1)
    /// The PidLidNonSendToTrackStatus property ([MS-OXOCAL] section 2.2.1.22) gets or sets the value
    /// from the response table, as specified in [MS-OXOCAL] section 2.2.1.11, for each attendee listed in the
    /// PidLidNonSendableTo property ([MS-OXOCAL] section 2.2.1.19).
    /// For more details about the PidLidNonSendToTrackStatus property, see [MS-OXPROPS] section
    /// 2.182.
    var nonSendToTrackStatus: [UInt32]? {
        return getProperty(name: .lidNonSendToTrackStatus)
    }
    
    /// [MS-OXOCAL] 2.2.1.23 PidLidNonSendCcTrackStatus Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNonSendCcTrackStatus property ([MS-OXPROPS] section 2.182) contains the value from
    /// the response table, as specified in section 2.2.1.11, for each attendee listed in the
    /// PidLidNonSendableCc property (section 2.2.1.20). This property is required only when the
    /// PidLidNonSendableCc property is set. The number of values in this property MUST equal the
    /// number of values in the PidLidNonSendableCc property. Each PtypInteger32 value ([MSOXCDATA] section 2.11.1) in this property corresponds to the attendee in the PidLidNonSendableCc
    /// property at the same index.
    /// [MS-XWDCAL] 2.2.7.41 PidLidNonSendCcTrackStatus
    /// DAV property name: http://schemas.microsoft.com/mapi/nonsendcctrackstatus
    /// Data type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1.6.1)
    /// The PidLidNonSendCcTrackStatus property ([MS-OXOCAL] section 2.2.1.23) gets or sets the value
    /// from the response table for each attendee listed in the PidLidNonSendableCc property ([MSOXOCAL] section 2.2.1.20).
    /// For additional information about the PidLidNonSendCcTrackStatus property, see [MS-OXPROPS]
    /// section 2.181.
    var nonSendCcTrackStatus: [UInt32]? {
        return getProperty(name: .lidNonSendCcTrackStatus)
    }
    
    /// [MS-OXOCAL] 2.2.1.24 PidLidNonSendBccTrackStatus Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNonSendBccTrackStatus property ([MS-OXPROPS] section 2.181) contains the value
    /// from the response table, as specified in section 2.2.1.11, for each attendee listed in the
    /// PidLidNonSendableBcc property (section 2.2.1.21). This property is required only when the
    /// PidLidNonSendableBcc property is set. The number of values in this property MUST equal the
    /// number of values in the PidLidNonSendableBcc property. Each PtypInteger32 value ([MSOXCDATA] section 2.11.1) in this property corresponds to the attendee in the
    /// PidLidNonSendableBcc property at the same index.
    /// [MS-XWDCAL] 2.2.7.40 PidLidNonSendBccTrackStatus
    /// DAV property name: http://schemas.microsoft.com/mapi/nonsendbcctrackstatus
    /// Data type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1.6.1)
    /// The PidLidNonSendBccTrackStatus property ([MS-OXOCAL] section 2.2.1.24) gets or sets a value
    /// from the response table, as specified in [MS-OXOCAL] section 2.2.1.11, for each attendee listed in the
    /// PidLidNonSendableBcc property ([MS-OXOCAL] section 2.2.1.21).
    /// For more details about the PidLidNonSendBccTrackStatus property, see [MS-OXPROPS] section
    /// 2.180.
    var nonSendBccTrackStatus: [UInt32]? {
        return getProperty(name: .lidNonSendBccTrackStatus)
    }
    
    /// [MS-OXOCAL] 2.2.1.25 PidLidAppointmentUnsendableRecipients Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentUnsendableRecipients property ([MS-OXPROPS] section 2.35) contains a
    /// list of unsendable attendees. This property is not required but SHOULD be set.<8> It has the
    /// following format.
    var appointmentUnsendableRecipients: Data? {
        return getProperty(name: .lidAppointmentUnsendableRecipients)
    }
    
    /// [MS-OXOCAL] 2.2.1.26 PidLidAppointmentNotAllowPropose Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidAppointmentNotAllowPropose property ([MS-OXPROPS] section
    /// 2.17) indicates that attendees are not allowed to propose a new date and/or time for the meeting. A
    /// value of FALSE or the absence of this property indicates that the attendees are allowed to propose a
    /// new date and/or time. This property is meaningful only on Meeting objects, Meeting Request
    /// objects, and Meeting Update objects.
    var appointmentNotAllowPropose: Bool? {
        return getProperty(name: .lidAppointmentNotAllowPropose)
    }

    /// [MS-OXOCAL] 2.2.1.27 PidLidGlobalObjectId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidGlobalObjectId property ([MS-OXPROPS] section 2.143) specifies the unique identifier of the Calendar object.
    /// After it is set for a Calendar object, the value of this property MUST NOT change.
    /// The fields in this binary large object (BLOB) are specified in the following table. All fields have little-endian byte order.
    var globalObjectId: GlobalObjectId? {
        guard let data: Data = getProperty(name: .lidGlobalObjectId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? GlobalObjectId(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.28 PidLidCleanGlobalObjectId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// Contains the value of the PidLidGlobalObjectId property (section 2.2.1.27) for an object that represents an Exception object to a recurring series, where the
    /// Year, Month, and Day fields are all zero.
    /// The format of the PidLidCleanGlobalObjectId property ([MS-OXPROPS] section 2.58) is the same as that of the PidLidGlobalObjectId property.
    /// The value of this property MUST be equal to the value of PidLidGlobalObjectId, except the YH, YL, M, and D fields MUST all be zero. All objects that refer to
    /// an instance of a recurring series (including an orphan instance), as well as the recurring series itself, will have the same value for this property.
    var cleanGlobalObjectId: GlobalObjectId? {
        guard let data: Data = getProperty(name: .lidCleanGlobalObjectId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? GlobalObjectId(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.29 PidTagOwnerAppointmentId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOwnerAppointmentId property ([MS-OXPROPS] section 2.856) specifies a quasi-unique
    /// value among all Calendar objects in a user's mailbox. The value of this property can assist a client
    /// or server in finding a Calendar object but is not guaranteed to be unique among all objects.<9> This
    /// property is not required on objects.
    /// [MS-XWDCAL] 2.2.7.75 PidTagOwnerAppointmentId
    /// DAV property name: http://schemas.microsoft.com/mapi/owner_appt_id
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagOwnerAppointmentId property ([MS-OXOCAL] section 2.2.1.29) gets or sets a
    /// calculated quasi-unique value among all Calendar objects in a user's mailbox.
    /// For more details about the PidTagOwnerAppointmentId property, see [MS-OXPROPS] section
    /// 2.847.
    var ownerAppointmentId: UInt32? {
        return getProperty(id: .tagOwnerAppointmentId)
    }

    /// [MS-OXOCAL] 2.2.1.30 PidTagStartDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagStartDate property ([MS-OXPROPS] section 2.1025) SHOULD be set, and when set, it
    /// MUST be equal to the value of the PidLidAppointmentStartWhole property (section 2.2.1.5).
    /// [MS-XWDCAL] 2.2.7.77 PidTagStartDate
    /// DAV property name: http://schemas.microsoft.com/mapi/start_date
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagStartDate property ([MS-OXPROPS] section 2.1015) gets or sets a calculated value that
    /// SHOULD be set, and when set, it MUST be equal to the value of the PidLidAppointmentStartWhole
    /// property ([MS-OXOCAL] section 2.2.1.5), as specified in section 2.2.7.12.
    var startDate: Date? {
        return getProperty(id: .tagStartDate)
    }

    /// [MS-OXOCAL] 2.2.1.31 PidTagEndDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagEndDate property ([MS-OXPROPS] section 2.682) SHOULD be set, and when set, it MUST
    /// be equal to the value of the PidLidAppointmentEndWhole property (section 2.2.1.6).
    /// [MS-XWDCAL] 2.2.7.74 PidTagEndDate
    /// DAV property name: http://schemas.microsoft.com/mapi/end_date
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagEndDate property ([MS-OXOCAL] section 2.2.1.31) gets or sets a calculated value that
    /// SHOULD be set and, when set, MUST be equal to the value of the PidLidAppointmentEndWhole
    /// property ([MS-OXOCAL] section 2.2.1.6), as specified in section 2.2.7.5.
    /// For more details about the PidTagEndDate property, see [MS-OXPROPS] section 2.673.
    var endDate: Date? {
        return getProperty(id: .tagEndDate)
    }

    /// [MS-OXOCAL] 2.2.1.34 PidLidOwnerCriticalChange Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidOwnerCriticalChange property ([MS-OXPROPS] section 2.200) specifies the date and
    /// time at which a Meeting Request object was sent by the organizer. The value is specified in UTC.
    /// [MS-XWDCAL] 2.2.2.5 PidLidOwnerCriticalChange
    /// DAV property names: urn:schemas:calendar:dtstamp,
    /// http://schemas.microsoft.com/mapi/owner_critical_change
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOwnerCriticalChange property ([MS-OXOCAL] section 2.2.1.34) gets or sets the date and
    /// time at which a Meeting Request object was sent by the organizer. The value is specified in
    /// Coordinated Universal Time (UTC).
    /// This property corresponds to the DTSTAMP property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.9.
    /// For more details about the PidLidOwnerCriticalChange property, see [MS-OXPROPS] section 2.199.
    /// [MS-XWDCAL] 2.2.7.46 PidLidOwnerCriticalChange
    /// DAV property names: http://schemas.microsoft.com/mapi/owner_critical_change,
    /// urn:schemas:calendar:dtstamp
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOwnerCriticalChange property ([MS-OXOCAL] section 2.2.1.34) gets or sets the date and
    /// time at which a Meeting Request object was sent by the organizer. The value is specified in UTC.
    /// This property corresponds to the DTSTAMP property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.9
    /// For more details about the PidLidOwnerCriticalChange property, see [MS-OXPROPS] section 2.199.
    var ownerCriticalChange: Date? {
        return getProperty(name: .lidOwnerCriticalChange)
    }

    /// [MS-OXOCAL] 2.2.1.35 PidLidIsException Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidIsException property ([MS-OXPROPS] section 2.156) indicates that
    /// the object represents an exception (including an orphan instance). A value of FALSE indicates that
    /// the object represents a recurring series or a single-instance object. The absence of this property
    /// for any object indicates a value of FALSE except for the Exception Embedded Message object,
    /// which assumes a value of TRUE.
    /// [MS-XWDCAL] 2.2.7.29 PidLidIsException
    /// DAV property name: http://schemas.microsoft.com/mapi/is_exception
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidIsException property ([MS-OXOCAL] section 2.2.1.35) gets or sets a calculated value that
    /// indicates wither the object represents an exception (including an orphan instance). True if the object
    /// represents an exception. False if the object represents a recurring series or a single instance. The
    /// absence of this property for any object indicates a value of "FALSE" except for the Exception
    /// Embedded Message object, which assumes a value of "TRUE".
    /// For more details about the PidLidIsException property, see [MS-OXPROPS] section 2.155.
    var isException: Bool? {
        return getProperty(name: .lidIsException)
    }
    
    /// [MS-OXOCAL] 2.2.1.39 PidLidTimeZoneStruct Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTimeZoneStruct property ([MS-OXPROPS] section 2.343) is set on a recurring series to
    /// specify time zone information. This property specifies how to convert time fields between local time
    /// and UTC. The fields in this BLOB are encoded in little-endian byte order.
    /// [MS-XWDCAL] 2.2.7.70 PidLidTimeZoneStruct
    /// DAV property name: http://schemas.microsoft.com/mapi/timezonestruct
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidTimeZoneStruct property ([MS-OXOCAL] section 2.2.1.39) gets or sets the calculated
    /// information to convert the values in time fields between local time and UTC.
    /// For more details about the PidLidTimeZoneStruct property, see [MS-OXPROPS] section 2.342.
    var timeZoneStruct: TimeZoneStruct? {
        guard let data: Data = getProperty(name: .lidTimeZoneStruct) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? TimeZoneStruct(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.40 PidLidTimeZoneDescription Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidTimeZoneDescription property ([MS-OXPROPS] section 2.342) specifies a humanreadable
    /// description of the time zone that is represented by the data in the PidLidTimeZoneStruct
    /// property (section 2.2.1.39).
    /// [MS-XWDCAL] 2.2.7.69 PidLidTimeZoneDescription
    /// DAV property name: http://schemas.microsoft.com/mapi/timezonedesc
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidTimeZoneDescription property ([MS-OXOCAL] section 2.2.1.40) gets or sets the
    /// calculated human-readable description of the time zone that is represented by the data in the
    /// PidLidTimeZoneStruct property, as specified in section 2.2.7.70.
    /// For more details about the PidLidTimeZoneDescription property, see [MS-OXPROPS] section 2.341.
    var timeZoneDescription: String? {
        return getProperty(name: .lidTimeZoneDescription)
    }
    
    /// [MS-OXOCAL] 2.2.1.41 PidLidAppointmentTimeZoneDefinitionRecur Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentTimeZoneDefinitionRecur property ([MS-OXPROPS] section 2.33) contains
    /// time zone information that specifies how to convert the meeting date and time on a recurring
    /// series to and from UTC.
    /// The PidLidAppointmentTimeZoneDefinitionRecur property contains one TZRule structure, as
    /// specified in section 2.2.1.41.1, that is marked with the TZRULE_FLAG_EFFECTIVE_TZREG flag,
    /// which specifies the effective time zone rule.
    /// If the effective TZRule structure's lBias, lStandardBias, lDaylightBias, stStandardDate, and
    /// stDaylightDate fields are not equal to the corresponding fields in the PidLidTimeZoneStruct
    /// property (section 2.2.1.39), the PidLidAppointmentTimeZoneDefinitionRecur and
    /// PidLidTimeZoneStruct properties are considered inconsistent. If the
    /// PidLidAppointmentTimeZoneDefinitionRecur property is not set or is inconsistent with the
    /// associated PidLidTimeZoneStruct structure, the values in the PidLidTimeZoneStruct property are
    /// used to determine the effective time zone rule.<10>
    /// The fields in this structure are encoded in little-endian byte order.
    var appointmentTimeZoneDefinitionRecur: AppointmentTimeZoneDefinition? {
        guard let data: Data = getProperty(name: .lidAppointmentTimeZoneDefinitionRecur) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? AppointmentTimeZoneDefinition(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.42 PidLidAppointmentTimeZoneDefinitionStartDisplay Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentTimeZoneDefinitionStartDisplay property ([MS-OXPROPS] section 2.34)
    /// specifies time zone information that indicates the time zone of the PidLidAppointmentStartWhole
    /// property (section 2.2.1.5). The value of this property is used to convert the start date and time from
    /// UTC to this time zone for display purposes. The fields in this BLOB are encoded as specified in section
    /// 2.2.1.41, with one exception: For each TZRule structure specified by this property, the R flag in the
    /// TZRule flags field is not set (for example, if the TZRule structure is the effective rule (2), the value
    /// of the field TZRule flags field is TZRULE_FLAG_EFFECTIVE_TZREG (0x0002); otherwise, it will be
    /// 0x0000).
    var appointmentTimeZoneDefinitionStartDisplay: AppointmentTimeZoneDefinition? {
        guard let data: Data = getProperty(name: .lidAppointmentTimeZoneDefinitionStartDisplay) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? AppointmentTimeZoneDefinition(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.43 PidLidAppointmentTimeZoneDefinitionEndDisplay Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentTimeZoneDefinitionEndDisplay property ([MS-OXPROPS] section 2.32)
    /// specifies time zone information that indicates the time zone of the PidLidAppointmentEndWhole
    /// property (section 2.2.1.6). The format, constraints, and computation of this property are the same as
    /// specified for the PidLidAppointmentTimeZoneDefinitionStartDisplay property (section 2.2.1.42).
    var appointmentTimeZoneDefinitionEndDisplay: AppointmentTimeZoneDefinition? {
        guard let data: Data = getProperty(name: .lidAppointmentTimeZoneDefinitionEndDisplay) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? AppointmentTimeZoneDefinition(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.44 PidLidAppointmentRecur Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentRecur property ([MS-OXPROPS] section 2.22) specifies the dates and times
    /// when a recurring series occurs by using one of the recurrence patterns and ranges specified in
    /// this section. The value of this property also contains information about both modified and deleted
    /// exceptions and information such as dates, subject, location, and other properties of exceptions. The
    /// binary data in this property for Recurring Calendar objects is stored as the
    /// AppointmentRecurrencePattern structure specified in section 2.2.1.44.5. This property MUST NOT
    /// exist on single-instance Calendar objects.
    /// The following are some limitations of recurrences:
    ///  Multiple instances cannot start on the same day.
    ///  Occurrences cannot overlap; specifically, an exception that modifies the start date of an instance
    /// in the recurring series can occur only on a date that is sometime after the end of the prior
    /// instance and before the start of the next instance in the recurring series. The same is true if the
    /// prior or next instance in the recurring series is an exception. Note that calculating exception
    /// overlap is an implementation-specific choice.<11>
    /// The schedule of a recurring series is determined by its recurrence pattern and range. This section
    /// specifies the types of recurrence ranges and recurrence patterns that are supported by this protocol.
    /// Recurrence Range
    /// The recurrence range identifies how long the event will continue. This protocol supports three ranges:
    ///  Ends after a specific number of occurrences
    ///  Ends by a given date
    ///  Continues indefinitely
    /// Recurrence Pattern
    /// The recurrence pattern determines the frequency of an event. The RecurrencePattern structure
    /// (section 2.2.1.44.1) is also used to define recurring tasks, as specified in [MS-OXOTASK] section
    /// 2.2.2.2.15.
    /// The following table lists the types of recurrences that are supported by this protocol.
    /// Recurrence type Description Example
    /// Daily recurrence Schedules events according to one of the  following patterns:
    ///  Every n number of days.
    ///  Every weekday.
    /// An event that repeats every three days, starting on Monday, April 30, 2007, and
    /// continuing through Friday, June 8, 2007.
    /// Weekly recurrence
    /// Schedules events according to the following pattern:
    ///  Every n weeks on one or more particular days of the week.
    /// An event repeats every two weeks, on Tuesdays, starting on Monday, April 30,
    /// 2007, and ending after five occurrences.
    /// Monthly recurrence
    /// Schedules events according to one of the following patterns:
    ///  On the nth day of every month.
    ///  On a specific day of the week on the first, second, third, fourth, or last week of every
    /// month (for example, the first Tuesday of the month).
    /// An event that repeats on the fourth of every month, effective Monday, April 30, 2007, without an end date.
    /// Every n months recurrence
    /// A combination of the monthly and weekly patterns. An every n months pattern can
    /// schedule events according to one of the following patterns:
    ///  On the mth day every n months.
    ///  On any day of the week on the first, second, third, fourth, or last week every n months
    /// (for example, the third Thursday of the month).
    /// An event that occurs on the last Thursday of every two months, effective March 12,
    /// 2007, with an end date of December 31, 2007.
    /// Month end recurrence
    /// Schedules events to repeat on the last day of every n months.
    /// An event that repeats on the last day of every month, effective Monday, April 30, 2007, without an end date.
    /// Yearly recurrence
    /// Schedules events according to one of the following patterns:
    ///  On the mth day of the nth month, of every year.
    ///  On any day of the week on the first, second, third, fourth, or last week of the nth month,
    /// of every year.
    /// The yearly recurrence pattern is based on a 12-month interval, and therefore uses the monthly
    /// recurrence parameters to represent all the yearly recurrences.
    /// A birthday that occurs every June 22, and is an all-day event.
    /// [MS-OXORMDR] 2.2.2.4 Properties Shared with the Appointment and Meeting Object Protocol
    /// This protocol shares the following properties with the Appointment and Meeting Object Protocol:
    ///  PidLidAppointmentRecur ([MS-OXOCAL] section 2.2.1.44)
    /// Unless otherwise noted, the semantics and accepted values are identical to those specified in [MSOXOCAL].
    /// [MS-XWDCAL] 2.2.7.6 PidLidAppointmentRecur
    /// DAV property name: http://schemas.microsoft.com/mapi/apptrecur
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentRecur property ([MS-OXOCAL] section 2.2.1.44) gets or sets the dates and
    /// times when a recurring series occurs by using one of the recurrence patterns and ranges specified
    /// in [MS-OXOCAL] section 2.2.1.44.
    /// For more details about the PidLidAppointmentRecur property, see [MS-OXPROPS] section 2.22.
    var appointmentRecur: AppointmentRecurrencePattern? {
        guard let data: Data = getProperty(name: .lidAppointmentRecur) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? AppointmentRecurrencePattern(dataStream: &dataStream)
    }
    
    /// [MS-OXOCAL] 2.2.1.45 PidLidRecurrenceType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidRecurrenceType property ([MS-OXPROPS] section 2.216) specifies the recurrence type of
    /// the recurring series by using one of the values listed in the following table.
    /// [MS-XWDCAL] 2.2.7.50 PidLidRecurrenceType
    /// DAV property name: http://schemas.microsoft.com/mapi/recurtype
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidRecurrenceType property ([MS-OXOCAL] section 2.2.1.45) gets or sets the calculated
    /// recurrence type of the recurring series by using one of the values listed in [MS-OXOCAL] section
    /// 2.2.1.45.
    /// For more details about the PidLidRecurrenceType property, see [MS-OXPROPS] section 2.215.
    var recurrenceType: RecurrenceType? {
        guard let rawValue: UInt32 = getProperty(name: .lidRecurrenceType) else {
            return nil
        }
        
        return RecurrenceType(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.46 PidLidRecurrencePattern Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidRecurrencePattern property ([MS-OXPROPS] section 2.215) specifies a description of the
    /// recurrence pattern of the Calendar object. This property is not required, but if set, it is set to a
    /// description of the recurrence specified by the PidLidAppointmentRecur property (section 2.2.1.44).
    /// [MS-XWDCAL] 2.2.7.49 PidLidRecurrencePattern
    /// DAV property name: http://schemas.microsoft.com/mapi/recurpattern
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidRecurrencePattern property ([MS-OXOCAL] section 2.2.1.46) gets or sets a description
    /// of the recurrence pattern of the Calendar object.
    /// For more details about the PidLidRecurrencePattern property, see [MS-OXPROPS] section 2.214.
    var recurrencePattern: String? {
        return getProperty(name: .lidRecurrencePattern)
    }
    
    /// [MS-OXOCAL] 2.2.1.47 PidLidLinkedTaskItems Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLinkedTaskItems property ([MS-OXPROPS] section 2.159) specifies a list of
    /// PidTagEntryId properties ([MS-OXCPERM] section 2.2.4) of Task objects related to the Calendar
    /// object that are set by a client.<17> This property is not required.
    var linkedTaskItems: String? {
        return getProperty(name: .lidLinkedTaskItems)
    }
    
    /// [MS-OXOCAL] 2.2.1.48 PidLidMeetingWorkspaceUrl Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidMeetingWorkspaceUrl property ([MS-OXPROPS] section 2.172) specifies the URL of the
    /// Meeting Workspace, as specified in [MS-MEETS], that is associated with a Calendar object. This
    /// property is not required.
    /// [MS-XWDCAL] 2.2.7.32 PidLidMeetingWorkspaceUrl
    /// DAV property name: http://schemas.microsoft.com/mapi/meetingworkspaceurl
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidMeetingWorkspaceUrl property ([MS-OXOCAL] section 2.2.1.48) gets or sets the URL of
    /// the Meeting Workspace, as specified in [MS-MEETS], that is associated with a Calendar object.
    /// For more details about the PidLidMeetingWorkspaceUrl property, see [MS-OXPROPS] section
    /// 2.171.
    var meetingWorkspaceUrl: String? {
        return getProperty(name: .lidMeetingWorkspaceUrl)
    }
    
    /// [MS-OXOCAL] 2.2.1.50 PidLidAppointmentColor Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentColor property ([MS-OXPROPS] section 2.9) specifies the color to be used
    /// when displaying a Calendar object. The client SHOULD set this property for backward compatibility
    /// with older clients. The valid values for this property are listed in the following table.
    var appointmentColor: AppointmentColor? {
        guard let rawValue: UInt32 = getProperty(name: .lidAppointmentColor) else {
            return nil
        }
        
        return AppointmentColor(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.51 PidNameMeetingDoNotForward Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidNameMeetingDoNotForward property ([MS-OXPROPS] section 2.37) specifies whether to
    /// allow the meeting to be forwarded.
    /// When set to TRUE, the meeting cannot be forwarded by an attendee. Only the organizer can add more
    /// attendees to the meeting. When set to FALSE, an attendee can forward the meeting.
    var meetingDoNotForward: Bool? {
        return getProperty(name: .nameMeetingDoNotForward)
    }
    
    /// [MS-OXOCAL] 2.2.1.52 PidNameBirthdayContactAttributionDisplayName
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidNameBirthdayContactAttributionDisplayName property ([MS-OXPROPS] section 2.377)
    /// indicates the name of the contact associated with the birthday event.
    var birthdayContactAttributionDisplayName: String? {
        return getProperty(name: .nameBirthdayContactAttributionDisplayName)
    }

    /// [MS-OXOCAL] 2.2.1.53 PidNameBirthdayContactEntryId
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidNameBirthdayContactEntryId property ([MS-OXPROPS] section 2.378) indicates the
    /// EntryID of the contact associated with the birthday event.
    var birthdayContactEntryId: Data? {
        return getProperty(name: .nameBirthdayContactEntryId)
    }

    /// [MS-OXOCAL] 2.2.1.54 PidNameBirthdayContactPersonGuid
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidNameBirthdayContactPersonGuid property ([MS-OXPROPS] section 2.379) indicates the
    /// person ID's GUID of the contact associated with the birthday event.
    var birthdayContactPersonGuid: Data? {
        return getProperty(name: .nameBirthdayContactPersonGuid)
    }

    /// [MS-OXOCAL] 2.2.1.55 PidNameIsBirthdayContactWritable
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidNameIsBirthdayContactWritable property ([MS-OXPROPS] section 2.451) indicates
    /// whether the contact associated with the birthday event is writable.
    var isBirthdayContactWritable: Bool? {
        return getProperty(name: .nameIsBirthdayContactWritable)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.1 PidLidAutoStartCheck Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAutoStartCheck property ([MS-OXPROPS] section 2.42) specifies whether to
    /// automatically start the conferencing application when a reminder for the meeting fires.
    /// If the associated object is a Calendar object, the client SHOULD set the PidLidAutoStartCheck
    /// property to FALSE.
    /// When set to TRUE, this property indicates that the conferencing application can start. A value of FALSE
    /// indicates that either this property doesn't apply to its associated object or the conferencing application
    /// is not to start automatically.
    /// [MS-OXORMDR] 2.2.2.4 Properties Shared with the Appointment and Meeting Object Protocol
    /// This protocol shares the following properties with the Appointment and Meeting Object Protocol:
    ///  PidLidAutoStartCheck ([MS-OXPROPS] section 2.41)
    /// Unless otherwise noted, the semantics and accepted values are identical to those specified in [MSOXOCAL].
    var autoStartCheck: Bool? {
        return getProperty(name: .lidAutoStartCheck)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.2 PidLidConferencingCheck Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// When set to TRUE (0x00000001), the PidLidConferencingCheck property ([MS-OXPROPS] section
    /// 2.66) indicates that the associated meeting is one of the following types:
    ///  "Windows Media Services"
    ///  "Windows NetMeeting"
    ///  "Exchange Conferencing"
    /// If this property is set, PidLidConferencingType (section 2.2.1.56.3) is also to be set. This property
    /// is set to TRUE only on Meeting objects or meeting-related objects.
    /// [MS-OXORMDR] 2.2.2.4 Properties Shared with the Appointment and Meeting Object Protocol
    /// This protocol shares the following properties with the Appointment and Meeting Object Protocol:
    ///  PidLidConferencingCheck ([MS-OXOCAL] section 2.2.1.51.2)
    /// Unless otherwise noted, the semantics and accepted values are identical to those specified in [MSOXOCAL].
    var conferencingCheck: Bool? {
        return getProperty(name: .lidConferencingCheck)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.3 PidLidConferencingType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConferencingType ([MS-OXPROPS] section 2.67) property specifies the type of the
    /// meeting. The value of this property MUST be set to one of the values listed in the following table.
    var conferencingType: ConferencingType? {
        guard let rawValue: UInt32 = getProperty(name: .lidConferencingType) else {
            return nil
        }
        
        return ConferencingType(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.4 PidLidDirectory Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidDirectory property ([MS-OXPROPS] section 2.95) specifies the directory server to be used
    /// with NetMeeting.
    var directory: String? {
        return getProperty(name: .lidDirectory)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.5 PidLidAllowExternalCheck Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAllowExternalCheck property ([MS-OXPROPS] section 2.6) is deprecated.<19> The value
    /// of this property MAY<20> be set to TRUE.
    var allowExternalCheck: Bool? {
        return getProperty(name: .lidAllowExternalCheck)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.6 PidLidOrganizerAlias Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidOrganizerAlias property ([MS-OXPROPS] section 2.196) specifies the e-mail address of
    /// the organizer.
    var organizerAlias: String? {
        return getProperty(name: .lidOrganizerAlias)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.7 PidLidCollaborateDoc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidCollaborateDoc property ([MS-OXPROPS] section 2.62) specifies the document to be
    /// launched when the user joins the meeting. This property is valid only when the
    /// PidLidConferencingType property (section 2.2.1.56.3) has the value 0x00000000.
    var collaborateDoc: String? {
        return getProperty(name: .lidCollaborateDoc)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.8 PidLidNetShowUrl Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidNetShowUrl property ([MS-OXPROPS] section 2.176) specifies the URL to be launched
    /// when the user joins the meeting. This property is valid only when the PidLidConferencingType
    /// property (section 2.2.1.56.3) has the value 0x00000001 or 0x00000002.
    /// For meetings that have 0x00000001 as the value of the PidLidConferencingType property, the URL
    /// is supplied by a user. For meetings that have 0x00000002 as the value of the
    /// PidLidConferencingType property, the URL is generated as follows:
    ///  For each blind carbon copy (Bcc) recipient of a Meeting Request object, open the associated
    /// folder of the Calendar folder in the recipient's (1) mailbox.
    ///  Find the message for which the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3)
    /// has a value of EXCH_CONFERENCE. If the message is not found, move on to the next Bcc
    /// recipient. If the message is found, open it and get its PidTagLocation property ([MS-OXOCNTC]
    /// section 2.2.1.10.5).
    ///  Append the value of the PidLidGlobalObjectId property (section 2.2.1.27) of the Meeting
    /// object encoded with base64 encoding.
    ///  Append the string "&p=" followed by the value of the PidLidOnlinePassword property (section
    /// 2.2.1.56.9).
    ///  Finally, convert the string to Unicode.
    /// If there are multiple Exchange Conferencing mailboxes in the Bcc field, the value that is calculated by
    /// using the last mailbox is used.
    var netShowUrl: String? {
        return getProperty(name: .lidNetShowUrl)
    }
    
    /// [MS-OXOCAL] 2.2.1.56 Deprecated Properties
    /// The properties defined in sections 2.2.1.56.1 through 2.2.1.56.9 are deprecated. If nonzero or nonNULL, clients SHOULD set their value to zero or an empty string (as appropriate).<18> If the
    /// PidLidConferencingCheck property (section 2.2.1.56.2) is set to FALSE, all the properties in this
    /// section are ignored. These properties are to be set only on Calendar objects and meeting-related
    /// objects.
    /// [MS-OXOCAL] 2.2.1.56.9 PidLidOnlinePassword Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidOnlinePassword property ([MS-OXPROPS] section 2.194) specifies the password for a
    /// meeting on which the PidLidConferencingType property (section 2.2.1.56.3) has the value
    /// 0x00000002. If set, this string is a maximum of 255 characters, not including the terminating null
    /// character.
    var onlinePassword: String? {
        return getProperty(name: .lidOnlinePassword)
    }
    
    /// [MS-OXOCAL] 2.2.2.3 PidLidFExceptionalAttendees Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidFExceptionalAttendees property ([MS-OXPROPS] section 2.131)
    /// indicates that it is a Recurring Calendar object with one or more exceptions and that at least one of
    /// the Exception Embedded Message objects has at least one RecipientRow structure, as specified
    /// in [MS-OXCDATA] section 2.8.3. A value of FALSE or the absence of this property indicates that either
    /// the Calendar object has no exceptions or none of the Exception Embedded Message objects has
    /// RecipientRow structures.
    /// Note that an Appointment object cannot have attendees but can have an Attachment object that
    /// is an Exception object, and an Exception object can be turned into a meeting that has attendees.
    /// Therefore, this property can be used to indicate that an exception to an appointment has attendees,
    /// even though the appointment (series) does not.
    /// This value SHOULD NOT be set for any Calendar object other than that of the organizer's.
    var fExceptionalAttendees: Bool? {
        return getProperty(name: .lidFExceptionalAttendees)
    }
    
    /// [MS-OXOCAL] 2.2.2.4 PidLidClientIntent Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidClientIntent property ([MS-OXPROPS] section 2.59) indicates what actions a user has
    /// taken on a Meeting object.
    var clientIntent: ClientIntent? {
        guard let rawValue: UInt32 = getProperty(name: .lidClientIntent) else {
            return nil
        }
        
        return ClientIntent(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.4.1 PidLidAppointmentSequenceTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidAppointmentSequenceTime property ([MS-OXPROPS] section 2.26) on the
    /// organizer's Meeting object indicates the date and time at which the
    /// PidLidAppointmentSequence property (section 2.2.1.1) was last modified. The value is specified in
    /// UTC.
    var appointmentSequenceTime: Date? {
        return getProperty(name: .lidAppointmentSequenceTime)
    }
    
    /// [MS-OXOCAL] 2.2.4.2 PidLidAppointmentLastSequence Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidAppointmentLastSequence property ([MS-OXPROPS] section 2.15) indicates
    /// to the organizer the last sequence number that was sent to any attendee. For details about when
    /// and how a client increments the sequence number, see section 3.1.5.4. This property has no meaning
    /// for an attendee.
    var appointmentLastSequence: Date? {
        return getProperty(name: .lidAppointmentLastSequence)
    }
    
    /// [MS-OXOCAL] 2.2.4.3 PidLidAppointmentReplyTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidAppointmentReplyTime property ([MS-OXPROPS] section 2.24) on the
    /// attendee's Meeting object specifies the date and time at which the attendee responded to a received
    /// Meeting Request object or Meeting Update object. The value is specified in UTC.
    /// [MS-XWDCAL] 2.2.2.1 PidLidAppointmentReplyTime
    /// DAV property names: urn:schemas:calendar:replytime,
    /// http://schemas.microsoft.com/mapi/apptreplytime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentReplyTime property ([MS-OXOCAL] section 2.2.4.3) gets or sets the date
    /// and time when an attendee replied to a meeting request. The user can use this value to determine
    /// which response is the most recent when an attendee sends more than one response to a meeting
    /// request.
    /// This property corresponds to X-MICROSOFT-CDO-REPLYTIME, as specified in [MS-OXCICAL]
    /// section 2.1.3.1.1.20.37.
    /// For more details about the PidLidAppointmentReplyTime property, see [MS-OXPROPS] section
    /// 2.24.
    /// [MS-XWDCAL] 2.2.7.8 PidLidAppointmentReplyTime
    /// DAV property names: http://schemas.microsoft.com/mapi/apptreplytime,
    /// urn:schemas:calendar:replytime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentReplyTime property ([MS-OXOCAL] section 2.2.4.3) gets or sets the date
    /// and time at which the attendee responded to a received Meeting Request object or Meeting
    /// Update object.
    /// For more details about the PidLidAppointmentReplyTime property, see [MS-OXPROPS] section
    /// 2.24.
    var appointmentReplyTime: Date? {
        return getProperty(name: .lidAppointmentReplyTime)
    }
    
    /// [MS-OXOCAL] 2.2.4.4 PidLidFInvited Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidFInvited property ([MS-OXPROPS] section 2.136) indicates whether invitations have been
    /// sent for the meeting that this Meeting object represents. A value of FALSE or the absence of this
    /// property indicates that a Meeting Request object has never been sent. A value of TRUE indicates
    /// that a Meeting Request object has been sent. After this value is set to TRUE on a Meeting object, it
    /// MUST NOT be changed.
    /// [MS-OXOCAL] 2.2.10.2.7 PidLidFInvited Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidFInvited property ([MS-OXPROPS] section 2.136) for an Exception
    /// Embedded Message object takes the same meaning as specified in section 2.2.4.4. If a meeting
    /// request has been sent for an exception but not for the recurring series, the value of this property
    /// on the Recurring Calendar object will still be FALSE, but the value on the Exception Embedded
    /// Message object will be TRUE.
    /// [MS-XWDCAL] 2.2.7.24 PidLidFInvited
    /// DAV property name: http://schemas.microsoft.com/mapi/finvited
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidFInvited property ([MS-OXOCAL] section 2.2.4.4) gets or sets a calculated value that
    /// indicates whether invitations have been sent for the meeting that this Meeting object represents.
    /// True if invitations have been sent; otherwise, false.
    /// For more details about the PidLidFInvited property, see [MS-OXPROPS] section 2.135.
    var fInvited: Bool? {
        return getProperty(name: .lidFInvited)
    }
    
    /// [MS-OXOCAL] 2.2.4.5 PidLidAppointmentReplyName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidAppointmentReplyName property ([MS-OXPROPS] section 2.23) on the attendee's
    /// Meeting object specifies the user who last replied to the meeting request or meeting update.
    /// This property is set only for a delegator when a delegate responded. The value is equal to the
    /// PidTagMailboxOwnerName property ([MS-OXCSTOR] section 2.2.2.1) for the delegate's message
    /// store. This property has no meaning for the organizer.
    /// [MS-XWDCAL] 2.2.7.7 PidLidAppointmentReplyName
    /// DAV property name: http://schemas.microsoft.com/mapi/apptreplyname
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentReplyName property ([MS-OXOCAL] section 2.2.4.5) gets or sets the name
    /// of the user who last replied to the Meeting Request object or Meeting Update object.
    /// For more details about the PidLidAppointmentReplyName property, see [MS-OXPROPS] section
    /// 2.23.
    var appointmentReplyName: String? {
        return getProperty(name: .lidAppointmentReplyName)
    }
    
    /// [MS-OXOCAL] 2.2.4.6 PidLidAppointmentProposalNumber Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentProposalNumber property ([MS-OXPROPS] section 2.18) specifies the
    /// number of attendees who have sent counter proposals that have not been accepted or rejected by
    /// the organizer.
    var appointmentProposalNumber: UInt32? {
        return getProperty(name: .lidAppointmentProposalNumber)
    }
    
    /// [MS-OXOCAL] 2.2.4.7 PidLidAppointmentCounterProposal Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// When set to TRUE (0x00000001), the PidLidAppointmentCounterProposal property ([MSOXPROPS] section 2.10) indicates to the organizer that there are counter proposals that have not
    /// been accepted or rejected (by the organizer). This property has no meaning for an attendee.
    var appointmentCounterProposal: Bool? {
        return getProperty(name: .lidAppointmentCounterProposal)
    }
    
    /// [MS-OXOCAL] 2.2.4.8 PidLidAutoFillLocation Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidAutoFillLocation property ([MS-OXPROPS] section 2.39) on the
    /// organizer's Meeting object indicates that the value of the PidLidLocation property (section
    /// 2.2.1.4) is set to the PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) from the
    /// RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, that represents a Resource
    /// object.
    /// A value of FALSE or the absence of this property indicates that the value of the PidLidLocation
    /// property is not automatically set.
    /// When set, the PidLidLocation property SHOULD be set to the first sendable resource that is added to
    /// the meeting, or if none of the resources are sendable, the value SHOULD be set to the first
    /// unsendable resource added to the meeting.
    var autoFillLocation: Bool? {
        return getProperty(name: .lidAutoFillLocation)
    }
    
    /// [MS-OXOCAL] 2.2.4.9 PidLidOriginalStoreEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidOriginalStoreEntryId property ([MS-OXPROPS] section 2.197) specifies the EntryID of
    /// the delegator's message store. This property SHOULD be set on Meeting objects that have been
    /// created or updated by a delegate.
    /// The format for the PidLidOriginalStoreEntryId property is the same as that for the
    /// PidTagStoreEntryId property ([MS-OXCMSG] section 2.2.1.44).
    var originalStoreEntryId: Data? {
        return getProperty(name: .lidOriginalStoreEntryId)
    }
    
    /// [MS-OXOCAL] 2.2.4.10 RecipientRow Properties
    /// A Meeting object has one RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, for
    /// each sendable attendee.
    /// In addition, a RecipientRow structure can exist for the organizer of the Meeting object.
    /// Unsendable attendees do not have a corresponding RecipientRow structure but SHOULD have a
    /// RecipientRow structure in the PidLidAppointmentUnsendableRecipients property (section
    /// 2.2.1.25).
    /// The Appointment and Meeting Object Protocol specifies properties that can be set in the
    /// RecipientProperties field of RecipientRow structures, as specified in [MS-OXCDATA] section
    /// 2.8.3.2. These properties are listed in the sections 2.2.4.10.1 through 2.2.4.10.7.
    /// [MS-OXOCAL] 2.2.4.10.1 PidTagRecipientFlags Property
    /// The PidTagRecipientFlags property ([MS-OXPROPS] section 2.901) specifies a bit field that
    /// describes the recipient (2) status. This property is not required. The following individual flags can be
    /// set.
    var recipientFlags: RecipientFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagRecipientFlags) else {
            return nil
        }
        
        return RecipientFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.4.10 RecipientRow Properties
    /// A Meeting object has one RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, for
    /// each sendable attendee.
    /// In addition, a RecipientRow structure can exist for the organizer of the Meeting object.
    /// Unsendable attendees do not have a corresponding RecipientRow structure but SHOULD have a
    /// RecipientRow structure in the PidLidAppointmentUnsendableRecipients property (section
    /// 2.2.1.25).
    /// The Appointment and Meeting Object Protocol specifies properties that can be set in the
    /// RecipientProperties field of RecipientRow structures, as specified in [MS-OXCDATA] section
    /// 2.8.3.2. These properties are listed in the sections 2.2.4.10.1 through 2.2.4.10.7.
    /// [MS-OXOCAL] 2.2.4.10.2 PidTagRecipientTrackStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagRecipientTrackStatus property ([MS-OXPROPS] section 2.907) indicates the
    /// response status that is returned by the attendee. If this value is not set, it is assumed to be
    /// "respNone" (0x00000000). If set, it MUST be one of the following, as specified in section 2.2.1.11:
    ///  respNone
    ///  respAccepted (0x00000003)
    ///  respDeclined (0x00000004)
    ///  respTentative (0x00000002)
    var recipientTrackStatus: ResponseStatus? {
        guard let rawValue: UInt32 = getProperty(id: .tagRecipientTrackStatus) else {
            return nil
        }
        
        return ResponseStatus(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.4.10 RecipientRow Properties
    /// A Meeting object has one RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, for
    /// each sendable attendee.
    /// In addition, a RecipientRow structure can exist for the organizer of the Meeting object.
    /// Unsendable attendees do not have a corresponding RecipientRow structure but SHOULD have a
    /// RecipientRow structure in the PidLidAppointmentUnsendableRecipients property (section
    /// 2.2.1.25).
    /// The Appointment and Meeting Object Protocol specifies properties that can be set in the
    /// RecipientProperties field of RecipientRow structures, as specified in [MS-OXCDATA] section
    /// 2.8.3.2. These properties are listed in the sections 2.2.4.10.1 through 2.2.4.10.7.
    /// [MS-OXOCAL] 2.2.4.10.3 PidTagRecipientTrackStatusTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRecipientTrackStatusTime property ([MS-OXPROPS] section 2.908) indicates the date
    /// and time at which the attendee responded. The value is specified in UTC.
    var recipientTrackStatusTime: Date? {
        return getProperty(id: .tagRecipientTrackStatusTime)
    }
    
    /// [MS-OXOCAL] 2.2.4.10 RecipientRow Properties
    /// A Meeting object has one RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, for
    /// each sendable attendee.
    /// In addition, a RecipientRow structure can exist for the organizer of the Meeting object.
    /// Unsendable attendees do not have a corresponding RecipientRow structure but SHOULD have a
    /// RecipientRow structure in the PidLidAppointmentUnsendableRecipients property (section
    /// 2.2.1.25).
    /// The Appointment and Meeting Object Protocol specifies properties that can be set in the
    /// RecipientProperties field of RecipientRow structures, as specified in [MS-OXCDATA] section
    /// 2.8.3.2. These properties are listed in the sections 2.2.4.10.1 through 2.2.4.10.7.
    /// [MS-OXOCAL] 2.2.4.10.4 PidTagRecipientProposed Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidTagRecipientProposed property ([MS-OXPROPS] section 2.903)
    /// indicates that the attendee proposed a new date and/or time. A value of FALSE or the absence of this
    /// property means either that the attendee did not yet respond or that the most recent response from
    /// the attendee did not propose a new date or time. This value cannot be TRUE for attendees in a
    /// recurring series.
    var recipientProposed: Bool? {
        return getProperty(id: .tagRecipientProposed)
    }
    
    /// [MS-OXOCAL] 2.2.4.10 RecipientRow Properties
    /// A Meeting object has one RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, for
    /// each sendable attendee.
    /// In addition, a RecipientRow structure can exist for the organizer of the Meeting object.
    /// Unsendable attendees do not have a corresponding RecipientRow structure but SHOULD have a
    /// RecipientRow structure in the PidLidAppointmentUnsendableRecipients property (section
    /// 2.2.1.25).
    /// The Appointment and Meeting Object Protocol specifies properties that can be set in the
    /// RecipientProperties field of RecipientRow structures, as specified in [MS-OXCDATA] section
    /// 2.8.3.2. These properties are listed in the sections 2.2.4.10.1 through 2.2.4.10.7.
    /// [MS-OXOCAL] 2.2.4.10.5 PidTagRecipientProposedStartTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// When the value of the PidTagRecipientProposed property (section 2.2.4.10.4) is set to TRUE, the
    /// value of the PidTagRecipientProposedStartTime property ([MS-OXPROPS] section 2.905) indicates
    /// the value requested by the attendee to set as the value of the PidLidAppointmentStartWhole
    /// property (section 2.2.1.5) for the single-instance Meeting object or Exception object.
    var recipientProposedStartTime: Date? {
        return getProperty(id: .tagRecipientProposedStartTime)
    }
    
    /// [MS-OXOCAL] 2.2.4.10 RecipientRow Properties
    /// A Meeting object has one RecipientRow structure, as specified in [MS-OXCDATA] section 2.8.3, for
    /// each sendable attendee.
    /// In addition, a RecipientRow structure can exist for the organizer of the Meeting object.
    /// Unsendable attendees do not have a corresponding RecipientRow structure but SHOULD have a
    /// RecipientRow structure in the PidLidAppointmentUnsendableRecipients property (section
    /// 2.2.1.25).
    /// The Appointment and Meeting Object Protocol specifies properties that can be set in the
    /// RecipientProperties field of RecipientRow structures, as specified in [MS-OXCDATA] section
    /// 2.8.3.2. These properties are listed in the sections 2.2.4.10.1 through 2.2.4.10.7.
    /// [MS-OXOCAL] 2.2.4.10.6 PidTagRecipientProposedEndTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// When the value of the PidTagRecipientProposed property (section 2.2.4.10.4) is set to TRUE, the
    /// value of the PidTagRecipientProposedEndTime property ([MS-OXPROPS] section 2.904) indicates
    /// the value requested by the attendee to set as the value of the PidLidAppointmentEndWhole
    /// property (section 2.2.1.6) for the single-instance Meeting object or Exception object.
    var recipientProposedEndTime: Date? {
        return getProperty(id: .tagRecipientProposedEndTime)
    }
    
    /// [MS-OXOCAL] 2.2.5.2 PidLidAttendeeCriticalChange Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidAttendeeCriticalChange property ([MS-OXPROPS] section 2.38) specifies the
    /// date and time at which the meeting-related object was sent. The value is specified in UTC.<25>
    /// [MS-XWDCAL] 2.2.7.16 PidLidAttendeeCriticalChange
    /// DAV property name: http://schemas.microsoft.com/mapi/attendee_critical_change
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAttendeeCriticalChange property ([MS-OXOCAL] section 2.2.5.2) gets or sets the
    /// calculated date and time at which the meeting-related object was sent.
    /// For more details about the PidLidAttendeeCriticalChange property, see [MS-OXPROPS] section
    /// 2.37.
    var attendeeCriticalChange: Date? {
        return getProperty(name: .lidAttendeeCriticalChange)
    }
    
    /// [MS-OXOCAL] 2.2.5.3 PidLidWhere Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The value of the PidLidWhere property ([MS-OXPROPS] section 2.354) SHOULD be the same as the
    /// value of the PidLidLocation property (section 2.2.1.4) from the associated Meeting object.<26>
    /// [MS-XWDCAL] 2.2.7.72 PidLidWhere
    /// DAV property name: http://schemas.microsoft.com/mapi/where
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidWhere property ([MS-OXOCAL] section 2.2.5.3) gets or sets a calculated value that
    /// SHOULD be the same as the value of the PidLidLocation property ([MS-OXOCAL] section 2.2.1.4)
    /// from the associated Meeting object.
    /// For more details about the PidLidWhere property, see [MS-OXPROPS] section 2.353.
    var `where`: String? {
        return getProperty(name: .lidWhere)
    }
    
    /// [MS-OXOCAL] 2.2.5.4 PidLidServerProcessed Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidServerProcessed property ([MS-OXPROPS] section 2.233) indicates
    /// that the Meeting Request object or Meeting Update object has been processed.
    var serverProcessed: Bool? {
        return getProperty(name: .lidServerProcessed)
    }

    /// [MS-OXOCAL] 2.2.5.5 PidLidServerProcessingActions Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidServerProcessingActions property ([MS-OXPROPS] section 2.234) indicates what
    /// processing actions have been taken on the Meeting Request object or Meeting Update object.
    /// The following flags can be set.
    var serverProcessingActions: ServerProcessingActions? {
        guard let rawValue: UInt32 = getProperty(name: .lidServerProcessingActions) else {
            return nil
        }
        
        return ServerProcessingActions(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.5.6 PidLidTimeZone Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidTimeZone property ([MS-OXPROPS] section 2.341) specifies information
    /// about the time zone of a recurring meeting. This property is read only when the
    /// PidLidAppointmentRecur property (section 2.2.1.44) is not set, but the value of the
    /// PidLidIsRecurring property (section 2.2.1.13) is set to TRUE and the value of the
    /// PidLidIsException property (section 2.2.1.35) is set to FALSE. The lower two bytes specify an index
    /// into a table that contains time zone information. From the upper two bytes, only the highest bit is
    /// read. If that bit is set, the time zone referenced will not observe daylight saving time; otherwise, the
    /// daylight saving time dates listed in the following table will be used.
    /// Index
    /// Standard offset from UTC+12 (international date line) in minutes
    /// Standard date {wMonth, wDayOfWeek, wDay, wHour}
    /// Daylight date {wMonth, wDayOfWeek, wDay, wHour}
    /// 0 0 N/A N/A
    /// 1 12*60 {10, 0, 5, 2} {3, 0, 5, 1}
    /// 2 11*60 {9, 0, 5, 2} {3, 0, 5, 1}
    /// 3 11*60 {10, 0, 5, 3} {3, 0, 5, 2}
    /// 4 11*60 {10, 0, 5, 3} {3, 0, 5, 2}
    /// 5 10*60 {9, 0, 5, 1} {3, 0, 5, 0}
    /// 6 11*60 {9, 0, 5, 1} {3, 0, 5, 0}
    /// 7 10*60 {10, 0, 5, 4} {3, 0, 5, 3}
    /// 8 15*60 {2, 0, 2, 2} {10, 0, 3, 2}
    /// 9 16*60 {11, 0, 1, 2} {3, 0, 2, 2}
    /// 10 17*60 {11, 0, 1, 2} {3, 0, 2, 2}
    /// 11 18*60 {11, 0, 1, 2} {3, 0, 2, 2}
    /// 12 19*60 {11, 0, 1, 2} {3, 0, 2, 2}
    /// 13 20*60 {11, 0, 1, 2} {3, 0, 2, 2}
    /// 14 21*60 {11, 0, 1, 2} {3, 0, 2, 2}
    /// 15 22*60 N/A N/A
    /// 16 23*60 N/A N/A
    /// 17 0*60 {4, 0, 1, 3} {9, 0, 5, 2}
    /// 18 2*60 {3, 0, 5, 3} {10, 0, 5, 2}
    /// 19 (2*60)+30 {3, 0, 5, 3} {10, 0, 5, 2}
    /// 20 3*60 N/A N/A
    /// 21 4*60 N/A N/A
    /// 22 5*60 N/A N/A
    /// 23 (6*60)+30 N/A N/A
    /// 24 8*60 N/A N/A
    /// 25 (8*60)+30 {9, 2, 4, 2} {3, 0, 1, 2}
    /// 26 9*60 N/A N/A
    /// 27 10*60 {9, 0, 3, 2} {3, 5, 5, 2}
    /// 28 (15*60)+30 {11, 0, 1, 0} {3, 0, 2, 0}
    /// 29 13*60 {10, 0, 5, 1} {3, 0, 5, 0}
    /// 30 14*60 {10, 0, 5, 1} {3, 0, 5, 0}
    /// 31 12*60 N/A N/A
    /// 32 15*60 N/A N/A
    /// 33 16*60 N/A N/A
    /// 34 17*60 N/A N/A
    /// 35 17*60 N/A N/A
    /// 36 18*60 N/A N/A
    /// 37 18*60 {10, 0, 5, 2} {4, 0, 1, 2}
    /// 38 19*60 N/A N/A
    /// 39 24*60 N/A N/A
    /// 40 0*60 N/A N/A
    /// 41 1*60 N/A N/A
    /// 42 2*60 {3, 0, 5, 2} {10, 0, 1, 2}
    /// 43 2*60 N/A N/A
    /// 44 (2*60)+30 N/A N/A
    /// 45 4*60 {9, 0, 2, 2} {4, 0, 2, 2}
    /// 46 6*60 N/A N/A
    /// 47 7*60 N/A N/A
    /// 48 (7*60)+30 N/A N/A
    /// 49 10*60 {9, 4, 5, 2} {5, 5, 1, 2}
    /// 50 10*60 N/A N/A
    /// 51 9*60 {10, 0, 5, 1} {3, 0, 5, 0}
    /// 52 2*60 {3, 0, 5, 2} {8, 0, 5, 2}
    /// 53 2*60 {4, 0, 1, 3} {10, 0, 5, 2}
    /// 54 (2*60)+30 {4, 0, 1, 3} {10, 0, 5, 2}
    /// 55 2*60 {4, 0, 1, 3} {10, 0, 1, 2}
    /// 56 16*60 {3, 6, 2, 23} {10, 6, 2, 23}
    /// 57 4*60 {3, 0, 5, 3} {10, 0, 5, 2}
    /// 58 19*60 {10, 0, 5, 2} {4, 0, 1, 2}
    /// 59 20*60 {10, 0, 5, 2} {4, 0, 1, 2}
    /// The Standard date and Daylight date columns specify a date in the following format: {wMonth,
    /// wDayOfWeek, wDay, wHour}
    /// The wMonth values are interpreted as shown in the following table.
    /// Value Meaning
    /// 1 January
    /// 2 February
    /// 3 March
    /// 4 April
    /// 5 May
    /// 6 June
    /// 7 July
    /// 8 August
    /// 9 September
    /// 10 October
    /// 11 November
    /// 12 December
    /// The wDayOfWeek values are interpreted as shown in the following table.
    /// Value Meaning
    /// 0 Sunday
    /// 1 Monday
    /// 2 Tuesday
    /// 3 Wednesday
    /// 4 Thursday
    /// 5 Friday
    /// 6 Saturday
    /// wDay: Indicates the occurrence of the day of the week within the month (1 to 5, where 5 indicates
    /// the final occurrence during the month if that day of the week does not occur 5 times).
    /// wHour: Indicates the hour at which the transition will occur in local time. The member ranges in
    /// value from 0 (zero) (12:00 A.M.) to 23 (11:00 P.M.).
    /// If daylight saving time is observed, during the daylight time period, an additional -60 offset is added
    /// to the standard offset.
    /// [MS-XWDCAL] 2.2.7.68 PidLidTimeZone
    /// DAV property name: http://schemas.microsoft.com/mapi/time_zone
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidTimeZone property ([MS-OXOCAL] section 2.2.5.6) gets or sets information about the
    /// time zone of a recurring meeting.
    /// For more details about the PidLidTimeZone property, see [MS-OXPROPS] section 2.340.
    var timeZone: UInt32? {
        return getProperty(name: .lidTimeZone)
    }
    
    /// [MS-OXOCAL] 2.2.5.7 PidTagProcessed Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidTagProcessed property ([MS-OXPROPS] section 2.872) indicates whether a
    /// client has processed a meeting-related object. The PidTagProcessed property is left unset until
    /// processing is completed, and then it is set to TRUE (0x01).
    /// [MS-OXOTASK] 2.2.3.1 PidTagProcessed Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagProcessed property ([MS-OXPROPS] section 2.866) indicates whether a client has already
    /// processed a received a task communication. This property is left unset until processing has
    /// completed and then is set to nonzero (TRUE).
    var processed: Bool? {
        return getProperty(id: .tagProcessed)
    }

    /// [MS-OXOCAL] 2.2.6.2 PidLidChangeHighlight Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidChangeHighlight property ([MS-OXPROPS] section 2.52) specifies a bit field that indicates
    /// how the Meeting object has changed.<27> This property is not required. The individual flags that
    /// can be set are as follows.
    var changeHighlight: ChangeHighlight? {
        guard let rawValue: UInt32 = getProperty(name: .lidChangeHighlight) else {
            return nil
        }
        
        return ChangeHighlight(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.6.3 PidLidForwardInstance Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidForwardInstance property ([MS-OXPROPS] section 2.139) indicates
    /// that the Meeting Request object represents an exception to a recurring series, and it was
    /// forwarded (even when forwarded by the organizer) rather than being an invitation sent by the
    /// organizer. A value of FALSE for this property indicates that the Meeting Request object is not a
    /// forwarded instance. This property is not required, read, or written to.<28>
    var forwardInstance: Bool? {
        return getProperty(name: .lidForwardInstance)
    }
    
    /// [MS-OXOCAL] 2.2.6.4 PidLidIntendedBusyStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidIntendedBusyStatus property ([MS-OXPROPS] section 2.152) specifies the value of the
    /// PidLidBusyStatus property (section 2.2.1.2) on the Meeting object in the organizer's calendar at
    /// the time the Meeting Request object or Meeting Update object was sent. The allowable values of
    /// this property are the same as those for the PidLidBusyStatus property.
    /// [MS-OXOCAL] 2.2.8.3 PidLidIntendedBusyStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The value of the PidLidIntendedBusyStatus property (section 2.2.6.4) MUST be set to "olFree"
    /// (0x00000000).
    /// [MS-XWDCAL] 2.2.7.28 PidLidIntendedBusyStatus
    /// DAV property name: http://schemas.microsoft.com/mapi/intendedbusystatus
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidIntendedBusyStatus property ([MS-OXOCAL] section 2.2.6.4) gets or sets the calculated
    /// value of the PidLidBusyStatus property ([MS-OXOCAL] section 2.2.8.5) on the Meeting object in
    /// the organizer's calendar at the time the Meeting Request object or Meeting Update object was
    /// sent. The allowable values of this property are the same as those for the PidLidBusyStatus property.
    /// For more details about the PidLidIntendedBusyStatus property, see [MS-OXPROPS] section 2.151.
    var intendedBusyStatus: BusyStatus? {
        guard let rawValue: UInt32 = getProperty(name: .lidIntendedBusyStatus) else {
            return nil
        }
        
        return BusyStatus(rawValue: rawValue)
    }

    /// [MS-OXOCAL] 2.2.6.5 PidLidMeetingType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidMeetingType property ([MS-OXPROPS] section 2.171) indicates the type of Meeting
    /// Request object or Meeting Update object. The value of this property MUST be set to one of those
    /// listed in the following table.
    /// [MS-OXOCAL] 2.2.8.6 PidLidMeetingType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidMeetingType property (section 2.2.6.5) indicates the type of Meeting Cancellation
    /// object. The value of this property MUST be set to one listed in the following table.
    /// Request type Value Description
    /// mtgEmpty 0x00000000 Unspecified.
    /// mtgDelegatorCopy 0x00100000 This is set on the delegator's copy when a delegate will handle
    /// meeting-related objects. For more details, see section 3.1.4.7.2.1.
    var meetingType: MeetingType? {
        guard let rawValue: UInt32 = getProperty(name: .lidMeetingType) else {
            return nil
        }
        
        return MeetingType(rawValue: rawValue)
    }
    
    /// [MS-OXOCAL] 2.2.6.6 PidLidAppointmentMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidAppointmentMessageClass property ([MS-OXPROPS] section 2.16) indicates the value of
    /// the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) of the Meeting object that is to
    /// be generated from the Meeting Request object. The value of the
    /// PidLidAppointmentMessageClass property MUST either be "IPM.Appointment" or be prefixed with
    /// "IPM.Appointment.". This property is not required.
    var appointmentMessageClass: String? {
        return getProperty(name: .lidAppointmentMessageClass)
    }

    /// [MS-OXOCAL] 2.2.6.7 PidLidOldLocation Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidLidOldLocation property ([MS-OXPROPS] section 2.190) indicates the original value of the
    /// PidLidLocation property (section 2.2.1.4) before a meeting update.<29> This property is not
    /// required.
    var oldLocation: String? {
        return getProperty(name: .lidOldLocation)
    }

    /// [MS-OXOCAL] 2.2.6.8 PidLidOldWhenStartWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidOldWhenStartWhole property ([MS-OXPROPS] section 2.193) indicates the original value
    /// of the PidLidAppointmentStartWhole property (section 2.2.1.5) before a meeting update.<30>
    /// This property is not required.
    var oldWhenStartWhole: String? {
        return getProperty(name: .lidOldWhenStartWhole)
    }

    /// [MS-OXOCAL] 2.2.6.9 PidLidOldWhenEndWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidOldWhenEndWhole property ([MS-OXPROPS] section 2.192) indicates the original value
    /// of the PidLidAppointmentEndWhole property (section 2.2.1.6) before a meeting update.<31>
    /// This property is not required.
    var oldWhenEndWhole: String? {
        return getProperty(name: .lidOldWhenEndWhole)
    }

    /// [MS-OXOCAL] 2.2.6.11 PidLidCalendarType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// When the Meeting Request object represents a recurring series or an exception, the
    /// PidLidCalendarType property ([MS-OXPROPS] section 2.49) is the value of the CalendarType field
    /// from the PidLidAppointmentRecur property (section 2.2.1.44). Otherwise, this property is not set
    /// and is assumed to be zero.
    /// [MS-XWDCAL] 2.2.7.18 PidLidCalendarType
    /// DAV property name: http://schemas.microsoft.com/mapi/calendar_type
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// When the Meeting Request object represents a recurring series or an exception, the
    /// PidLidCalendarType property ([MS-OXOCAL] section 2.2.6.11) gets or sets the value of the
    /// CalendarType field, as specified in [MS-OXOCAL] section 2.2.1.44.1, from the
    /// PidLidAppointmentRecur property ([MS-OXOCAL] section 2.2.1.44). If the value of the
    /// CalendarType field of the PidLidAppointmentRecur recurrence pattern is zero (0x0000), then
    /// the PidLidCalendarType property is computed as Gregorian (1).
    /// For more details about PidLidCalendarType, see [MS-OXPROPS] section 2.48.
    var calendarType: String? {
        return getProperty(name: .lidCalendarType)
    }
    
    /// [MS-OXOCAL] 2.2.7.3 PidLidAppointmentProposedStartWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentProposedStartWhole property ([MS-OXPROPS] section 2.21) specifies the
    /// proposed value for the PidLidAppointmentStartWhole property (section 2.2.1.5) for a counter
    /// proposal. This value is specified in UTC.
    var appointmentProposedStartWhole: Date? {
        return getProperty(name: .lidAppointmentProposedStartWhole)
    }
    
    /// [MS-OXOCAL] 2.2.7.4 PidLidAppointmentProposedEndWhole Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentProposedEndWhole property ([MS-OXPROPS] section 2.20) specifies the
    /// proposed value for the PidLidAppointmentEndWhole property (section 2.2.1.6) for a counter
    /// proposal. This value is specified in UTC.
    var appointmentProposedEndWhole: Date? {
        return getProperty(name: .lidAppointmentProposedEndWhole)
    }
    
    /// [MS-OXOCAL] 2.2.7.5 PidLidAppointmentProposedDuration Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidAppointmentProposedDuration property ([MS-OXPROPS] section 2.19) indicates the
    /// proposed value for the PidLidAppointmentDuration property (section 2.2.1.7) for a counter
    /// proposal. If set, it is equal to the number of minutes between the value of the
    /// PidLidAppointmentProposedStartWhole property (section 2.2.7.3) and the value of the
    /// PidLidAppointmentProposedEndWhole property (section 2.2.7.4).
    /// 2.2.7.6 PidLidAppointmentCounterProposal Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidAppointmentCounterProposal property ([MS-OXPROPS] section
    /// 2.10) indicates that the Meeting Response object is a counter proposal.
    var appointmentProposedDuration: UInt32? {
        return getProperty(name: .lidAppointmentProposedDuration)
    }
    
    /// [MS-OXOCAL] 2.2.7.7 PidLidIsSilent Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidIsSilent property ([MS-OXPROPS] section 2.158) indicates that the
    /// user did not include any text in the body of the Meeting Response object.
    /// [MS-XWDCAL] 2.2.7.31 PidLidIsSilent
    /// DAV property name: http://schemas.microsoft.com/mapi/is_silent
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidIsSilent property ([MS-OXOCAL] section 2.2.7.7) gets or sets a value that indicates
    /// whether the user included text in the body of the Meeting Response object. True if the user did not
    /// include any text in the body of the Meeting Response object; otherwise, false.
    /// For more details about the PidLidIsSilent property, see [MS-OXPROPS] section 2.157.
    var isSilent: Bool? {
        return getProperty(name: .lidIsSilent)
    }
    
    /// [MS-OXOCAL] 2.2.7.8 PidLidPromptSendUpdate Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidPromptSendUpdate property ([MS-OXPROPS] section 2.213)
    /// indicates that the Meeting Response object was out-of-date when it was received.
    /// [MS-OXOCAL] 2.2.9.4 PidLidPromptSendUpdate Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidPromptSendUpdate property (section 2.2.7.8) indicates that the
    /// Meeting Forward Notification object was out-of-date when it was received.
    var promptSendUpdate: Bool? {
        return getProperty(name: .lidPromptSendUpdate)
    }
    
    /// [MS-OXOCAL] 2.2.9.3 PidLidForwardNotificationRecipients Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidForwardNotificationRecipients property ([MS-OXPROPS] section 2.140) contains a list
    /// of RecipientRow structures, as specified in [MS-OXCDATA] section 2.8.3, that indicate the
    /// recipients (2) of a meeting forward. For the format of this property, see section 2.2.1.25.
    var forwardNotificationRecipients: Data? {
        return getProperty(name: .lidForwardNotificationRecipients)
    }
    
    /// [MS-OXOCAL] 2.2.10.2.5 PidLidExceptionReplaceTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidExceptionReplaceTime property ([MS-OXPROPS] section 2.118) specifies the date and
    /// time within the recurrence pattern that the exception will replace. The value is specified in UTC.
    /// This property allows the Exception Attachment object to be found for a particular instance.
    var exceptionReplaceTime: Date? {
        return getProperty(name: .lidExceptionReplaceTime)
    }
    
    /// [MS-OXOCAL] 2.2.10.2.6 PidLidFExceptionalBody Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidLidFExceptionalBody property ([MS-OXPROPS] section 2.132) indicates
    /// that the Exception Embedded Message object has a body that differs from the Recurring
    /// Calendar object. If the value of this property is TRUE, the Exception Embedded Message object
    /// MUST have a body. If the value of this property is FALSE, or if the property does not exist, a client or
    /// server obtains the body from the Recurring Calendar object.
    var fExceptionalBody: Bool? {
        return getProperty(name: .lidFExceptionalBody)
    }
    
    /// [MS-OXOCAL] 2.2.11.2 PidTagDefaultPostMessageClass Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// If the PidTagDefaultPostMessageClass property ([MS-OXPROPS] section 2.660) is set on a
    /// Calendar folder, the value MUST either contain "IPM.Appointment" or begin with "IPM.Appointment".
    var defaultPostMessageClass: String? {
        return getProperty(id: .tagDefaultPostMessageClass)
    }
    
    /// [MS-OXOCAL] 2.2.12.1 PidTagFreeBusyCountMonths Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFreeBusyCountMonths property ([MS-OXPROPS] section 2.704) is used to calculate the
    /// start and end dates of the range of free/busy status data to be published to the public folders, as
    /// specified in [MS-OXOPFFB]. The value of this property MUST be greater than or equal to 0x00000000
    /// and less than or equal to 0x00000024. This property is not required.
    var freeBusyCountMonths: UInt32? {
        return getProperty(id: .tagFreeBusyCountMonths)
    }
    
    /// [MS-OXOCAL] 2.2.12.2 PidTagScheduleInfoAutoAcceptAppointments Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// A value of TRUE for the PidTagScheduleInfoAutoAcceptAppointments property ([MS-OXPROPS]
    /// section 2.967) indicates that a client or server SHOULD automatically respond to all meeting
    /// requests for the attendee or Resource object. The response MUST be acceptance, unless an
    /// additional constraint specified by the PidTagScheduleInfoDisallowRecurringAppts (section
    /// 2.2.12.3) or PidTagScheduleInfoDisallowOverlappingAppts property (section 2.2.12.4) is met. A
    /// value of FALSE or the absence of this property indicates that a client or server does not automatically
    /// accept meeting requests. This property is not required.
    var scheduleInfoAutoAcceptAppointments: Bool? {
        return getProperty(id: .tagScheduleInfoAutoAcceptAppointments)
    }
    
    /// [MS-OXOCAL] 2.2.12.3 PidTagScheduleInfoDisallowRecurringAppts Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDisallowRecurringAppts property ([MS-OXPROPS] section 2.974) is only
    /// meaningful when the value of the PidTagScheduleInfoAutoAcceptAppointments property (section
    /// 2.2.12.2) is TRUE. A value of TRUE indicates that when automatically responding to meeting
    /// requests, a client or server declines Meeting Request objects that represent a recurring series. A
    /// value of FALSE or the absence of this property indicates that recurring meetings are accepted. This
    /// property is not required.
    var scheduleInfoDisallowRecurringAppts: Bool? {
        return getProperty(id: .tagScheduleInfoDisallowRecurringAppts)
    }
    
    /// [MS-OXOCAL] 2.2.12.4 PidTagScheduleInfoDisallowOverlappingAppts Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDisallowOverlappingAppts property ([MS-OXPROPS] section 2.973) is
    /// only meaningful when the value of the PidTagScheduleInfoAutoAcceptAppointments property
    /// (section 2.2.12.2) is TRUE. A value of TRUE indicates that when automatically responding to meeting
    /// requests, a client or server declines instances that overlap with previously scheduled events. A value
    /// of FALSE or the absence of this property indicates that overlapping instances are accepted. This
    /// property is not required.
    var scheduleInfoDisallowOverlappingAppts: Bool? {
        return getProperty(id: .tagScheduleInfoDisallowOverlappingAppts)
    }
    
    /// [MS-OXOCAL] 2.2.12.5 PidTagScheduleInfoAppointmentTombstone Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoAppointmentTombstone property ([MS-OXPROPS] section 2.966) in a delegator's Delegate Information object contains a list of tombstones.
    /// This property is not required. If this property does not exist when a meeting is declined by the delegator or the delegate, it MUST be created.
    /// This property has the following structure, where the fields are stored in little-endian byte order.
    var scheduleInfoAppointmentTombstone: ScheduleInfoAppointmentTombstone? {
        guard let data: Data = getProperty(id: .tagScheduleInfoAppointmentTombstone) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? ScheduleInfoAppointmentTombstone(dataStream: &dataStream)
    }
}
