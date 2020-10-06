//
//  MessageStorage+DAVExtensionsProperties.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

import Foundation

/// [MS-XWDCAL] 2.2 Message Syntax
/// By using the PROPFIND and PROPPATCH methods, as specified in [RFC2518], properties are
/// available for query and manipulation on Calendar objects. Namespaces such as DAV:,
/// http://schemas.microsoft.com/repl/, and urn:schemas:httpmail: all provide access to general
/// messaging properties used to transport Calendar object data and are utilized by other message types
/// as well, whereas the urn:schemas:calendar and http://schemas.microsoft.com/exchange namespaces
/// provide access to calendar-specific properties.
/// For each property in this section, the following information is provided:
///  DAV property name: The WebDAV names for the property
///  Data type: The data type of the property
///  A description of the property and a link to the property page in [MS-OXPROPS]
/// [MS-XWDCAL] 2.2.1 DAV: Namespace Properties
/// The DAV: namespace defines properties for general WebDAV data access.
/// [MS-XWDCAL] 2.2.2 urn:schemas:calendar: Namespace Properties
/// The urn:schemas:calendar: namespace defines properties specifically for Calendar object support.
/// Many of the properties in this namespace provide access to iCalendar properties specified in [MSOXCICAL]. [MS-OXCICAL] specifies how these properties can be imported and exported from the
/// calendar properties, as specified in [MS-OXOCAL].
/// [MS_XWDCAL] 2.2.3 urn:schemas:httpmail: Namespace Properties
/// The urn:schemas:httpmail: namespace defines properties for general WebDAV data access. Some
/// properties in this namespace provide access to the properties specified in [MS-OXCMAIL] and [MSOXCMSG].
/// [MS-XWDCAL] 2.2.4 urn:schemas:mailheader: Namespace Properties
/// The urn:schemas:mailheader: namespace defines one property that is used by Calendar objects.
/// [MS-XWDCAL] 2.2.5 urn:schemas-microsoft-com:exch-data: Namespace Properties
/// The urn:schemas-microsoft-com:exch-data: namespace defines three properties that are used by
/// Calendar objects.
/// [MS-XWDCAL] 2.2.6 urn:schemas-microsoft-com:office:office Namespace Properties
/// The urn:schemas-microsoft-com:office:office namespace defines one property that is used by
/// Calendar objects.
/// [MS-XWDCAL] 2.2.7 http://schemas.microsoft.com/mapi/ Namespace Properties
/// The http://schemas.microsoft.com/mapi/ namespace defines some properties specifically for Calendar
/// object support. Many of the Calendar object properties in this namespace provide access to calendar
/// and reminder properties specified in [MS-OXOCAL] and [MS-OXORMDR].
/// [MS-XWDCAL] 2.2.8 http://schemas.microsoft.com/exchange Namespace Properties
/// The http://schemas.microsoft.com/exchange/ namespace defines some properties specifically for
/// Calendar object support. Some of the Calendar object properties in this namespace provide access to
/// calendar properties specified in [MS-OXOCAL].
public extension MessageStorage {
    /// [MS-XWDCAL] 2.2.1.2 PidNameDavId
    /// DAV property name: DAV:id
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameDavId property ([MS-OXPROPS] section 2.411) gets the calculated unique ID for the
    /// calendar item.
    var davId: String? {
        return getProperty(name: .nameDavId)
    }
    
    /// [MS-XWDCAL] 2.2.1.3 PidNameDavIsCollection
    /// DAV property name: DAV:iscollection
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// he PidNameDavIsCollection property ([MS-OXPROPS] section 2.412) gets the calculated value
    /// that indicates whether the Calendar object is a collection, as specified in [RFC2518]. True if the
    /// Calendar object is a collection; otherwise, false.
    var davIsCollection: Bool? {
        return getProperty(name: .nameDavIsCollection)
    }
    
    /// [MS-XWDCAL] 2.2.1.4 PidNameDavIsStructuredDocument
    /// DAV property name: DAV:isstructureddocument
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameDavIsStructuredDocument property ([MS-OXPROPS] section 2.413) gets the
    /// calculated value that indicates whether a Calendar object is a structured document. True if the
    /// Calendar object is a structured document; otherwise, false.
    var davIsStructuredDocument: Bool? {
        return getProperty(name: .nameDavIsStructuredDocument)
    }
    
    /// [MS-XWDCAL] 2.2.1.5 PidNameDavParentName
    /// DAV property name: DAV:parentname
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameDavParentName property ([MS-OXPROPS] section 2.414) gets the calculated URL of
    /// the Folder object that contains the Calendar object.
    var davParentName: String? {
        return getProperty(name: .nameDavParentName)
    }
    
    /// [MS-XWDCAL] 2.2.1.6 PidNameDavUid
    /// DAV property name: DAV:uid
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameDavUid property ([MS-OXPROPS] section 2.415) gets the calculated unique identifier
    /// for the item.
    var davUid: String? {
        return getProperty(name: .nameDavUid)
    }
    
    /// [MS-XWDCAL] 2.2.1.8 PidTagAttributeReadOnly
    /// DAV property name: DAV:isreadonly
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagAttributeReadOnly property ([MS-OXPROPS] section 2.603) gets or sets a value that
    /// indicates whether an item can be modified or deleted. True if the item is read-only; otherwise, false.
    var attributeReadOnly: Bool? {
        return getProperty(id: .tagAttributeReadOnly)
    }
    
    /// [MS-XWDCAl] 2.2.2.2 PidLidAppointmentSubType
    /// DAV property names: urn:schemas:calendar:alldayevent,
    /// http://schemas.microsoft.com/mapi/apptsubtype
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentSubType property ([MS-OXOCAL] section 2.2.1.9) gets or sets a value that
    /// indicates whether the appointment or meeting is scheduled for an entire day. True if the appointment
    /// or meeting is an all-day event; otherwise, false. Setting this property does not affect the start time or
    /// the end time of the appointment or meeting.
    /// For more details about the PidLidAppointmentSubType property, see [MS-OXPROPS] section 2.31.
    var apppointmentSubType: Bool? {
        return getProperty(name: .lidAppointmentSubType)
    }
    
    /// [MS-XWDCAL] 2.2.2.7 PidNameCalendarAttendeeRole
    /// DAV property name: urn:schemas:calendar:attendeerole
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarAttendeeRole property ([MS-OXPROPS] section 2.374) gets or sets the role
    /// of the attendee. The following table lists valid values.
    /// This property is not validated or enforced by the server. It is the responsibility of the client to keep
    /// this property synchronized.
    var calendarAttendeeRole: CalendarAttendeeRole? {
        guard let rawValue: UInt32 = getProperty(name: .nameCalendarAttendeeRole) else {
            return nil
        }
        
        return CalendarAttendeeRole(rawValue: rawValue)
    }
    
    /// [MS-XWDCAL] 2.2.2.8 PidNameCalendarBusystatus
    /// DAV property name: urn:schemas:calendar:busystatus
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarBusystatus property ([MS-OXPROPS] section 2.375) gets or sets the
    /// calculated value that indicates whether the attendee is busy at the time of an appointment on their
    /// calendar. The following states are possible:
    ///  Out of Office (OOF)
    ///  Busy
    ///  Tentative
    ///  Free
    /// This property corresponds to the X-MICROSOFT-CDO-BUSYSTATUS property, as specified in [MSOXCICAL] section 2.1.3.1.1.20.31.
    var calendarBusystatus: String? {
        return getProperty(name: .nameCalendarBusystatus)
    }
    
    /// [MS-XWDCAL] 2.2.2.9 PidNameCalendarContact
    /// DAV property name: urn:schemas:calendar:contact
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarContact property ([MS-OXPROPS] section 2.376) gets or sets the name of a
    /// contact who is an attendee of a meeting.
    /// This property corresponds to the CONTACT property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.6.
    var calendarContact: String? {
        return getProperty(name: .nameCalendarContact)
    }
    
    /// [MS-XWDCAL] 2.2.2.10 PidNameCalendarContactUrl
    /// DAV property name: urn:schemas:calendar:contacturl
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarContactUrl property ([MS-OXPROPS] section 2.377) gets or sets the URL
    /// where contact information is accessible in HTML format.
    var calendarContactUrl: String? {
        return getProperty(name: .nameCalendarContactUrl)
    }
    
    /// [MS-XWDCAL] 2.2.2.11 PidNameCalendarCreated
    /// DAV property name: urn:schemas:calendar:created
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarCreated property ([MS-OXPROPS] section 2.378) gets or sets the calculated
    /// date and time that the organizer created the appointment or meeting.
    /// This property corresponds to the CREATED property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.7.
    var calendarCreated: Date? {
        return getProperty(name: .nameCalendarCreated)
    }
    
    /// 2.2.2.12 PidNameCalendarDescriptionUrl
    /// DAV property name: urn:schemas:calendar:descriptionurl
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarDescriptionUrl property ([MS-OXPROPS] section 2.379) gets or sets the URL
    /// of a resource that contains a description of an appointment or meeting. This property is further
    /// specified in [RFC2445] section 4.2.1 as the ALTREP DESCRIPTION property, which is a Uniform
    /// Resource Identifier (URI). URIs can contain only US-ASCII characters, as specified in [RFC20].
    /// The server SHOULD assume that URIs in this property contain only US-ASCII characters, and
    /// therefore the server does not perform character-encoding conversion.
    var calendarDescriptionUrl: String? {
        return getProperty(name: .nameCalendarDescriptionUrl)
    }
    
    /// [MS-XWDCAL] 2.2.2.13 PidNameCalendarDuration
    /// DAV property name: urn:schemas:calendar:duration
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarDuration property ([MS-OXPROPS] section 2.380) gets or sets the calculated
    /// duration, in seconds, of an appointment or meeting.
    /// This property corresponds to the DURATION property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.12.
    var calendarDuration: UInt32? {
        return getProperty(name: .nameCalendarDuration)
    }
    
    /// [MS-XWDCAL] 2.2.2.14 PidNameCalendarExceptionDate
    /// DAV property name: urn:schemas:calendar:exdate
    /// Data type: PtypMultipleTime ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCalendarExceptionDate property ([MS-OXPROPS] section 2.381) gets or sets the
    /// calculated list of original start times of instances of the recurring appointment that have been
    /// deleted.
    /// This property corresponds to the EXDATE property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.13.
    /// The PidNameCalendarExceptionDate property is combined with the following properties to specify
    /// the complete recurrence pattern:
    ///  The PidTagICalendarStartTime property (section 2.2.2.41)
    ///  The PidNameICalendarRecurrenceRule property (section 2.2.2.37)
    ///  The PidNameICalendarRecurrenceDate property (section 2.2.2.36)
    ///  The PidNameCalendarExceptionRule property (section 2.2.2.15)
    var calendarExceptionDate: [Date]? {
        return getProperty(name: .nameCalendarExceptionDate)
    }
    
    /// [MS-XWDCAL] 2.2.2.15 PidNameCalendarExceptionRule
    /// DAV property name: urn:schemas:calendar:exrule
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCalendarExceptionRule property ([MS-OXPROPS] section 2.382) gets or sets an
    /// exception rule for a recurring appointment. An exception rule is a repeating pattern of exceptions.
    /// This property corresponds to the EXRULE property, as specified in [RFC2445] section 4.8.5.2.
    /// The PidNameCalendarExceptionRule property is combined with the following properties to specify
    /// the complete recurrence pattern:
    ///  The PidTagICalendarStartTime property (section 2.2.2.41)
    ///  The PidNameICalendarRecurrenceRule property (section 2.2.2.37)
    ///  The PidNameICalendarRecurrenceDate property (section 2.2.2.36)
    ///  The PidNameCalendarExceptionDate property (section 2.2.2.14)
    var calendarExceptionRule: [String]? {
        return getProperty(name: .nameCalendarExceptionRule)
    }

    /// [MS-XWDCAL] 2.2.2.16 PidNameCalendarGeoLatitude
    /// DAV property name: urn:schemas:calendar:geolatitude
    /// Data type: PtypFloating64 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarGeoLatitude property ([MS-OXPROPS] section 2.383) gets or sets the
    /// geographical latitude of the location of an appointment. Positive values from 0 to 90 specify degrees of
    /// northern latitude. Negative values from 0 to -90 specify degrees of southern latitude.
    /// This property corresponds to the GEO latitude property, as specified in [RFC2445] section 4.8.1.6.
    var calendarGeoLatitude: Double? {
        return getProperty(name: .nameCalendarGeoLatitude)
    }
    
    /// [MS-XWDCAL] 2.2.2.17 PidNameCalendarGeoLongitude
    /// DAV property name: urn:schemas:calendar:geolongitude
    /// Data type: PtypFloating64 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarGeoLongitude property ([MS-OXPROPS] section 2.384) gets or sets the
    /// geographical longitude of the location of an appointment. Positive values from 0 to 180 specify
    /// degrees of eastern longitude. Negative values from 0 to -180 specify degrees of western longitude.
    /// This property corresponds to the GEO longitude property, as specified in [RFC2445] section 4.8.1.6.
    var calendarGeoLongitude: Double? {
        return getProperty(name: .nameCalendarGeoLongitude)
    }
    
    /// [MS-XWDCAL] 2.2.2.18 PidNameCalendarInstanceType
    /// DAV property name: urn:schemas:calendar:instancetype
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarInstanceType property ([MS-OXPROPS] section 2.385) gets or sets the
    /// calculated type of the appointment. The following types are possible:
    ///  Single appointment
    ///  Master recurring appointment
    ///  Instance of a recurring appointment
    ///  Exception to a recurring appointment
    /// This property cannot be directly imported and exported from a Calendar object property. This property
    /// is used to populate the PidLidMeetingType ([MS-OXOCAL] section 2.2.6.5) and
    /// PidLidAppointmentRecur ([MS-OXOCAL] section 2.2.1.44) properties.
    /// The following table lists the valid values for the PidNameCalendarInstanceType property.
    /// Clients SHOULD NOT change the value of this property.
    /// The server SHOULD automatically set this property when changes to the appointment are committed.
    /// For example, assume a recurring appointment that has the PidNameCalendarInstanceType
    /// property set to master ("1"). If all of the recurrence patterns and exceptions that are associated
    /// with this appointment or meeting are deleted and the appointment or meeting is saved, the server
    /// updates the instance type to single instance ("2"). If the original value of the
    /// PidNameCalendarInstanceType property is single instance ("2") or exception ("3"), the value does
    /// not change.
    var calendarInstanceType: CalendarInstanceType? {
        guard let rawValue: UInt32 = getProperty(name: .nameCalendarInstanceType) else {
            return nil
        }
        
        return CalendarInstanceType(rawValue: rawValue)
    }
    
    /// [MS-XWDCAL] 2.2.2.19 PidNameCalendarIsOrganizer
    /// DAV property name: urn:schemas:calendar:isorganizer
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarIsOrganizer property ([MS-OXPROPS] section 2.386) gets or sets a value
    /// that indicates whether an attendee is the organizer of an appointment or meeting. True if the
    /// attendee is the organizer of an appointment or meeting; otherwise, false.
    var calendarIsOrganizer: Bool? {
        return getProperty(name: .nameCalendarIsOrganizer)
    }
    
    /// [MS-XWDCAL] 2.2.2.20 PidNameCalendarLastModified
    /// DAV property name: urn:schemas:calendar:lastmodified
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarLastModified property ([MS-OXPROPS] section 2.387) gets or sets the date
    /// and time when an appointment was last modified.
    /// This property corresponds to the LAST-MODIFIED property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.14.
    /// This value SHOULD be stored in the appointment separate from PidTagLastModificationTime ([MSOXPROPS] section 2.755).
    var calendarLastModified: Date? {
        return getProperty(name: .nameCalendarLastModified)
    }
    
    /// [MS-XWDCAL] 2.2.2.21 PidNameCalendarLocationUrl
    /// DAV property name: urn:schemas:calendar:locationurl
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarLocationUrl property ([MS-OXPROPS] section 2.388) gets or sets the URL
    /// where the location information is accessible in HTML format.
    /// This property corresponds to the X-MS-OLK-MWSURL property, as specified in [MS-OXCICAL]
    /// section 2.1.3.1.1.20.55.
    var calendarLocationUrl: String? {
        return getProperty(name: .nameCalendarLocationUrl)
    }
    
    /// [MS-XWDCAL] 2.2.2.22 PidNameCalendarMeetingStatus
    /// DAV property name: urn:schemas:calendar:meetingstatus
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarMeetingStatus property ([MS-OXPROPS] section 2.389) gets or sets the
    /// calculated status of an appointment or meeting. The following states are possible.
    ///  Tentative
    ///  Confirmed
    ///  Cancelled
    /// This property corresponds to the STATUS property, as specified in [RFC2445] section 4.8.1.11.
    /// The following table lists the valid values of the meeting status property.
    /// Description Value
    /// Meeting cancelled CANCELLED
    /// Meeting confirmed CONFIRMED
    /// Meeting is tentative TENTATIVE
    var calendarMeetingStatus: String? {
        return getProperty(name: .nameCalendarMeetingStatus)
    }
    
    /// [MS-XWDCAL] 2.2.2.23 PidNameCalendarMethod
    /// DAV property name: urn:schemas:calendar:method
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarMethod property ([MS-OXPROPS] section 2.390) gets or sets the iCalendar
    /// method that is associated with an appointment object.
    /// This property corresponds to the METHOD property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.1.
    var calendarMethod: String? {
        return getProperty(name: .nameCalendarMethod)
    }
    
    /// [MS-XWDCAL] 2.2.2.24 PidNameCalendarProductId
    /// DAV property name: urn:schemas:calendar:prodid
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarProductId property ([MS-OXPROPS] section 2.391) gets or sets the product
    /// that created the iCalendar-formatted stream. The iCalendar format is specified in [MS-OXCICAL].
    /// This property corresponds to the PRODID property, as specified in [MS-OXCICAL] section 2.1.3.1.1.2.
    var calendarProductId: String? {
        return getProperty(name: .nameCalendarProductId)
    }
    
    /// [MS-XWDCAL] 2.2.2.25 PidNameCalendarRecurrenceIdRange
    /// DAV property name: urn:schemas:calendar:recurrenceidrange
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarRecurrenceIdRange property ([MS-OXPROPS] section 2.392) gets or sets a
    /// value that indicates which instances of a recurring appointment the
    /// PidNameCalendarRecurrenceIdRange property refers to. The PtypString value "ThisAndFuture"
    /// refers to the instance specified by the PidLidExceptionReplaceTime property ([MS-OXOCAL] section
    /// 2.2.10.2.5) and to all later instances of the recurring appointment. The PtypString value
    /// "ThisAndPrior" refers to the instance specified by the PidLidExceptionReplaceTime property and to
    /// all earlier instances of the recurring appointment. The default value is "None", which means that the
    /// PidLidExceptionReplaceTime property refers to a single instance.
    /// This property corresponds to the RANGE property, as specified in [RFC2445] section 4.2.13.
    var calendarRecurrenceIdRange: String? {
        return getProperty(name: .nameCalendarRecurrenceIdRange)
    }
    
    /// [MS-XWDCAL] 2.2.2.26 PidNameCalendarReminderOffset
    /// DAV property name: urn:schemas:calendar:reminderoffset
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarReminderOffset property ([MS-OXPROPS] section 2.393) gets or sets the
    /// number of seconds before an appointment starts that a reminder is to be displayed.
    /// For appointments that are received as iCalendar messages, this value SHOULD be taken from the first
    /// VALARM calendar component of the appointment. The VALARM component is specified in [MSOXCICAL] section 2.1.3.1.1.20.62.
    /// This property corresponds to the TRIGGER property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.62.1.
    var calendarReminderOffset: UInt32? {
        return getProperty(name: .nameCalendarReminderOffset)
    }

    /// [MS-XWDCAL] 2.2.2.27 PidNameCalendarResources
    /// DAV property name: urn:schemas:calendar:resources
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarResources property ([MS-OXPROPS] section 2.394) gets or sets a list of
    /// resources, such as rooms and video equipment, that are available for an appointment. This property is
    /// specified by mailto URIs and separated by commas.
    /// This property corresponds to the RESOURCES property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.21.
    var calendarResources: String? {
        return getProperty(name: .nameCalendarResources)
    }
    
    /// [MS-XWDCAL] 2.2.2.28 PidNameCalendarRsvp
    /// DAV property name: urn:schemas:calendar:rsvp
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarRsvp property ([MS-OXPROPS] section 2.395) gets or sets a value that
    /// specifies whether the organizer of an appointment or meeting requested a response. True if the
    /// organizer of the appointment or meeting requested a response; otherwise, false.
    var ccalendarRsvp: Bool? {
        return getProperty(name: .nameCalendarRsvp)
    }
    
    /// [MS-XWDCAL] 2.2.2.29 PidNameCalendarSequence
    /// DAV property name: urn:schemas:calendar:sequence
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarSequence property ([MS-OXPROPS] section 2.396) gets or sets a calculated
    /// value that specifies the sequence number of a version of an appointment.
    /// This property corresponds to the SEQUENCE property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.22.
    /// The server SHOULD increment the sequence number when one or more of the following properties is
    /// changed:
    ///  The PidTagICalendarStartTime property (section 2.2.2.41)
    ///  The PidTagICalendarEndTime property (section 2.2.2.39)
    ///  The PidNameCalendarDuration property ([MS-OXPROPS] section 2.380)
    ///  The PidNameICalendarRecurrenceDate property ([MS-OXPROPS] section 2.441)
    ///  The PidNameICalendarRecurrenceRule property ([MS-OXPROPS] section 2.442)
    ///  The PidNameCalendarExceptionDate property ([MS-OXPROPS] section 2.381)
    ///  The PidNameCalendarExceptionRule property ([MS-OXPROPS] section 2.382)
    /// Clients SHOULD NOT change this value.
    var calendarSequence: UInt32? {
        return getProperty(name: .nameCalendarSequence)
    }
    
    /// [MS-XWDCAL] 2.2.2.30 PidNameCalendarTimeZone
    /// DAV property name: urn:schemas:calendar:timezone
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarTimeZone property ([MS-OXPROPS] section 2.397) gets or sets the
    /// calculated time zone of an appointment or meeting. This property enables you to define time zones
    /// that are not defined by the PidNameCalendarTimeZoneId property ([MS-OXPROPS] section 2.398).
    /// If the PidNameCalendarTimeZone property is specified, the PidNameCalendarTimeZoneId
    /// property SHOULD be ignored.
    /// This property corresponds to the VTIMEZONE calendar component, as specified in [MS-OXCICAL]
    /// section 2.1.3.1.1.19.
    /// An example of this property is provided in section 4.3.2.
    var calendarTimeZone: String? {
        return getProperty(name: .nameCalendarTimeZone)
    }
    
    /// [MS-XWDCAL] 2.2.2.31 PidNameCalendarTimeZoneId
    /// DAV property name: urn:schemas:calendar:timezoneid
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarTimeZoneId property ([MS-OXPROPS] section 2.398) gets or sets the time
    /// zone identifier of an appointment or meeting.
    /// This property SHOULD be ignored if the PidNameCalendarTimeZone property ([MS-OXPROPS]
    /// section 2.397) is specified.
    /// The following table lists the valid values of the PidNameCalendarTimeZoneId property.
    var calendarTimeZoneId: CalendarTimeZoneId? {
        guard let rawValue: UInt32 = getProperty(name: .nameCalendarTimeZoneId) else {
            return nil
        }
        
        return CalendarTimeZoneId(rawValue: rawValue)
    }
    
    /// [MS-XWDCAL] 2.2.2.32 PidNameCalendarTransparent
    /// DAV property name: urn:schemas:calendar:transparent
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarTransparent property ([MS-OXPROPS] section 2.399) gets or sets a value
    /// that specifies whether an appointment or meeting is visible to busy time searches. Valid values are
    /// "opaque" (visible) and "transparent" (invisible).
    /// This property corresponds to the TRANSP property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.25.
    var calendarTransparent: String? {
        return getProperty(name: .nameCalendarTransparent)
    }
    
    /// [MS-XWDCAL] 2.2.2.33 PidNameCalendarUid
    /// DAV property name: urn:schemas:calendar:uid
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarUid property ([MS-OXPROPS] section 2.400) gets or sets the calculated
    /// unique identifier of the appointment or meeting.
    /// This property corresponds to the UID property, as specified in [MS-OXCICAL] section 2.1.3.1.1.20.26.
    var calendarUid: String? {
        return getProperty(name: .nameCalendarUid)
    }
    
    /// [MS-XWDCAL] 2.2.2.34 PidNameCalendarVersion
    /// DAV property name: urn:schemas:calendar:version
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameCalendarVersion property ([MS-OXPROPS] section 2.401) gets or sets the calculated
    /// version of the iCalendar specification that is required to correctly interpret an iCalendar object.
    /// This property corresponds to the VERSION property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.3.
    var calendarVersion: String? {
        return getProperty(name: .nameCalendarVersion)
    }
    
    /// [MS-XWDCAL] 2.2.2.35 PidNameFrom
    /// DAV property name: urn:schemas:calendar:organizer
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameFrom property ([MS-OXPROPS] section 2.435) gets or sets the Simple Mail Transfer
    /// Protocol (SMTP) e-mail alias of the organizer of an appointment or meeting. The organizer is the
    /// attendee with the PidNameCalendarIsOrganizer property ([MS-OXPROPS] section 2.386) set to
    /// "TRUE".
    /// This property corresponds to the ORGANIZER property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.16.
    var from: String? {
        return getProperty(name: .nameFrom)
    }
    
    /// [MS-XWDCAL] 2.2.2.36 PidNameICalendarRecurrenceDate
    /// DAV property name: urn:schemas:calendar:rdate
    /// Data type: PtypMultipleTime ([MS-OXCDATA] section 2.11.1)
    /// The PidNameICalendarRecurrenceDate property ([MS-OXPROPS] section 2.441) gets or sets an
    /// array of instances of a recurring appointment. The instances are stored as the dates and times of the
    /// appointment.
    /// This property corresponds to the RDATE property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.18.<1>
    /// The PidNameICalendarRecurrenceDate property is combined with the following properties to
    /// specify the complete recurrence pattern:
    ///  The PidTagICalendarStartTime property (section 2.2.2.41)
    ///  The PidNameICalendarRecurrenceRule property (section 2.2.2.37)
    ///  The PidNameCalendarExceptionDate property (section 2.2.2.14)
    ///  The PidNameCalendarExceptionRule property (section 2.2.2.15)
    var iCalendarRecurrenceDate: [Date]? {
        return getProperty(name: .nameICalendarRecurrenceDate)
    }
    
    /// [MS-XWDCAL] 2.2.2.37 PidNameICalendarRecurrenceRule
    /// DAV property name: urn:schemas:calendar:rrule
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameICalendarRecurrenceRule property ([MS-OXPROPS] section 2.442) gets or sets the
    /// rule for the pattern that defines a recurring appointment. The PidTagICalendarStartTime property
    /// (section 2.2.2.41) specifies the first instance of the appointment. The rule is based on the date and
    /// time of the first instance.
    /// This property corresponds to the RRULE property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.19.
    /// The PidNameICalendarRecurrenceRule property is combined with the following properties to
    /// specify the complete recurrence pattern:
    ///  The PidTagICalendarStartTime property (section 2.2.2.41)
    ///  The PidNameICalendarRecurrenceDate property (section 2.2.2.36)
    ///  The PidNameCalendarExceptionDate property (section 2.2.2.14)
    ///  The PidNameCalendarExceptionRule property (section 2.2.2.15)
    var iCalendarRecurrenceRule: [String]? {
        return getProperty(name: .nameICalendarRecurrenceRule)
    }
    
    /// [MS-XWDCAL] 2.2.2.38 PidTagCdoRecurrenceid
    /// DAV property name: urn:schemas:calendar:recurrenceid
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagCdoRecurrenceid property ([MS-OXPROPS] section 2.621) gets or sets the recurrence
    /// identifier that identifies a specific instance of a recurring appointment. This property SHOULD be used
    /// with the PidNameCalendarSequence property ([MS-OXPROPS] section 2.396) to uniquely identify
    /// the instance. The value of the recurrence identifier is the starting date and time of the specific
    /// instance.
    /// The PidNameCalendarRecurrenceIdRange property ([MS-OXPROPS] section 2.392) can modify the
    /// meaning of the PidTagCdoRecurrenceid property to refer to multiple instances of a recurring
    /// appointment.
    /// This property corresponds to the RECURRENCE-ID property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.20.
    var cdoRecurrenceid: Date? {
        return getProperty(id: .tagCdoRecurrenceid)
    }
    
    /// [MS-XWDCAL] 2.2.2.39 PidTagICalendarEndTime
    /// DAV property name: urn:schemas:calendar:dtend
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagICalendarEndTime property ([MS-OXPROPS] section 2.725) gets or sets the date and
    /// time when the appointment or meeting ends.
    /// This property corresponds to the DTEND property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.8.
    var iCalendarEndTime: Date? {
        return getProperty(id: .tagICalendarEndTime)
    }
    
    /// [MS-XWDCAL] 2.2.2.40 PidTagICalendarReminderNextTime
    /// DAV property name: urn:schemas:calendar:remindernexttime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagICalendarReminderNextTime property ([MS-OXPROPS] section 2.726) gets or sets the
    /// calculated date and time for the activation of the next reminder.
    var iCalendarReminderNextTime: Date? {
        return getProperty(id: .tagICalendarReminderNextTime)
    }
    
    /// [MS-XWDCAL] 2.2.2.41 PidTagICalendarStartTime
    /// DAV property name: urn:schemas:calendar:dtstart
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagICalendarStartTime property ([MS-OXPROPS] section 2.727) gets or sets the calculated
    /// date and time when the appointment or meeting starts.
    /// This property corresponds to the DTSTART property, as specified in [MS-OXCICAL] section
    /// 2.1.3.1.1.20.10.
    /// The PidTagICalendarStartTime property is combined with the following properties to specify the
    /// complete recurrence pattern:
    ///  The PidNameICalendarRecurrenceDate property (section 2.2.2.36)
    ///  The PidNameICalendarRecurrenceRule property (section 2.2.2.37)
    ///  The PidNameCalendarExceptionDate property (section 2.2.2.14)
    ///  The PidNameCalendarExceptionRule property (section 2.2.2.15)
    /// 2.2.2.42 PidTagLastModificationTime
    /// DAV property names: urn:schemas:calendar:lastmodifiedtime, DAV:getlastmodified
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagLastModificationTime property ([MS-OXCMSG] section 2.2.2.2) gets or sets the date
    /// and time when the appointment was last saved.
    /// This property can have a different value in the appointment of the organizer and in the copy of each
    /// attendee. The server SHOULD update this value when any method saves an appointment.
    /// For more details about the PidTagLastModificationTime property, see [MS-OXPROPS] section
    /// 2.755.
    var iCalendarStartTime: Date? {
        return getProperty(id: .tagICalendarStartTime)
    }
    
    /// [MS-XWDCAL] 2.2.3.1 PidNameHttpmailCalendar
    /// DAV property name: urn:schemas:httpmail:calendar
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameHttpmailCalendar property ([MS-OXPROPS] section 2.438) gets the calculated URL for
    /// the Calendar folder for a particular user. This property MUST be set by the server on a user's root
    /// mailbox folder to identify the URL to their Calendar folder.
    var httpmailCalendar: String? {
        return getProperty(name: .nameHttpmailCalendar)
    }
    
    /// [MS-XWDCAL] 2.2.3.2 PidNameHttpmailHtmlDescription
    /// DAV property name: urn:schemas:httpmail:htmldescription
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameHttpmailHtmlDescription property ([MS-OXPROPS] section 2.439) gets or sets the
    /// HTML content of the message.
    var httpmailHtmlDescription: String? {
        return getProperty(name: .nameHttpmailHtmlDescription)
    }
    
    /// [MS-XWDCAL] 2.2.3.3 PidNameHttpmailSendMessage
    /// DAV property name: urn:schemas:httpmail:sendmsg
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameHttpmailSendMessage property ([MS-OXPROPS] section 2.440) gets the calculated
    /// mail submission URI to which outgoing mail is submitted.
    var httpmailHtmlSendMessage: String? {
        return getProperty(name: .nameHttpmailSendMessage)
    }
    
    /// [MS-XWDCAL] 2.2.4.1 PidNameInternetSubject
    /// DAV property name: urn:schemas:mailheader:subject
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameInternetSubject property ([MS-OXPROPS] section 2.443) gets or sets the subject of
    /// the message. This property differs from the PidTagSubject property ([MS-OXPROPS] section 2.1023)
    /// only in that all characters encoded as specified in [RFC1522] are not decoded.
    var internetSubject: String? {
        return getProperty(name: .nameInternetSubject)
    }
    
    /// [MS-XWDCAL] 2.2.5.1 PidNameExchDatabaseSchema
    /// DAV property name: urn:schemas-microsoft-com:exch-data:baseschema
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameExchDatabaseSchema property ([MS-OXPROPS] section 2.425) gets or sets an array
    /// of URLs identifying other Folder objects within the same message store that contain schema
    /// definition items.
    /// The PidNameExchDatabaseSchema property SHOULD be used in conjunction with the
    /// PidNameExchDataSchemaCollectionReference property ([MS-OXPROPS] section 2.427) to define
    /// a Folder object's schema scope. Set this property on any Folder object containing schema definition
    /// items to identify subsequent Folder objects to search for schema items. Clients and servers SHOULD
    /// always check the current Folder object before proceeding to the Folder objects identified by the
    /// PidNameExchDatabaseSchema property.
    /// The order in which the URLs are listed in this property is significant. When searching for schema
    /// definition items, applications perform a breadth-first search for definition items within the Folder
    /// object's schema scope starting in the Folder objects identified by the schema-collection-ref
    /// property. Folder objects subsequently identified by the PidNameExchDatabaseSchema property of
    /// this schema collection Folder object are then searched in the order that they appear in the property.
    /// During the search, the first encountered definition item is always used, and other subsequent
    /// definition items are ignored. Each PidNameExchDatabaseSchema Folder object can then in turn
    /// define its own set of PidNameExchDatabaseSchema Folder objects. These Folder objects are
    /// searched in the order that they appear in the property.
    var exchDatabaseSchema: String? {
        return getProperty(name: .nameExchDatabaseSchema)
    }
    
    /// [MS-XWDCAL] 2.2.5.2 PidNameExchDataExpectedContentClass
    /// DAV property name: urn:schemas-microsoft-com:exch-data:expected-content-class
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameExchDataExpectedContentClass property ([MS-OXPROPS] section 2.426) gets or sets
    /// an array of names indicating the expected content classes of items within a Folder object.
    /// The PidNameExchDataExpectedContentClass property is an array (list) of content class names
    /// that are designated as expected for items in the Folder object. This property does not itself define
    /// these content classes and does not define in what Folder object or Folder objects the associated
    /// content class and property definition items are kept. Applications SHOULD search for these definitions
    /// within the Folder object's schema scope. Additionally, the
    /// PidNameExchDataExpectedContentClass property SHOULD NOT impose a restriction on what the
    /// value of an item's content class can be; it simply designates the list of names as expected for items
    /// within the Folder object.
    /// The PidNameExchDataExpectedContentClass, PidNameExchDataSchemaCollectionReference
    /// ([MS-OXPROPS] section 2.427), and PidNameExchDatabaseSchema ([MS-OXPROPS] section
    /// 2.425) properties SHOULD be used together to define a Folder object's schema. Folder objects can
    /// contain separate content class and property definitions specific to a particular application.
    var exchDataExpectedContentClass: String? {
        return getProperty(name: .nameExchDataExpectedContentClass)
    }
    
    /// [MS-XWDCAL] 2.2.5.3 PidNameExchDataSchemaCollectionReference
    /// DAV property name: urn:schemas-microsoft-com:exch-data:schema-collection-ref
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameExchDataSchemaCollectionReference property ([MS-OXPROPS] section 2.427) gets
    /// or sets an array of names indicating the expected content classes of items within a Folder object.
    /// Use this property to define the first Folder object within its schema scope. The value SHOULD be the
    /// URL of the first Folder object in which to search for schema content class and property definition
    /// items. If no value is set, the Folder object's schema scope SHOULD default to the
    /// non_ipm_subtree/Schema Folder object in that public message store or mailbox message store.
    var exchDataSchemaCollectionReference: String? {
        return getProperty(name: .nameExchDataSchemaCollectionReference)
    }
    
    /// [MS-XWDCAL] 2.2.7.3 PidLidAppointmentEndDate
    /// DAV property name: http://schemas.microsoft.com/mapi/apptenddate
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentEndDate property ([MS-OXPROPS] section 2.12) gets or sets the calculated
    /// appointment end date.
    var appointmentEndDate: Date? {
        return getProperty(name: .lidAppointmentEndDate)
    }
    
    /// [MS-XWDCAL] 2.2.7.4 PidLidAppointmentEndTime
    /// DAV property name: http://schemas.microsoft.com/mapi/apptendtime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentEndTime property ([MS-OXPROPS] section 2.13) gets or sets the calculated
    /// appointment end time.
    var appointmentEndTime: Date? {
        return getProperty(name: .lidAppointmentEndTime)
    }
    
    /// [MS-XWDCAL] 2.2.7.10 PidLidAppointmentStartDate
    /// DAV property name: http://schemas.microsoft.com/mapi/apptstartdate
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentStartDate property ([MS-OXPROPS] section 2.27) gets or sets the
    /// calculated date the appointment starts.
    /// For backward compatibility with older clients, this property SHOULD be set, and when set, it MUST be
    /// equal to the value of the PidLidAppointmentStartWhole property ([MS-OXOCAL] section 2.2.1.5).
    var appointmentStartDate: Date? {
        return getProperty(name: .lidAppointmentStartDate)
    }
    
    /// [MS-XWDCAL] 2.2.7.11 PidLidAppointmentStartTime
    /// DAV property name: http://schemas.microsoft.com/mapi/apptstarttime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentStartTime property ([MS-OXPROPS] section 2.28) gets or sets the time the
    /// appointment starts.
    var appointmentStartTime: Date? {
        return getProperty(name: .lidAppointmentStartTime)
    }
    
    /// [MS-XWDCAL] 2.2.7.15 PidLidAppointmentUpdateTime
    /// DAV property name: http://schemas.microsoft.com/mapi/apptupdatetime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidAppointmentUpdateTime property ([MS-OXPROPS] section 2.36) gets or sets the time at
    /// which the appointment was last updated.
    var appointmentUpdateTime: Date? {
        return getProperty(name: .lidAppointmentUpdateTime)
    }
    
    /// [MS-XWDCAL] 2.2.7.19 PidLidDayInterval
    /// DAV property name: http://schemas.microsoft.com/mapi/day_interval
    /// Data type: PtypInteger16 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidDayInterval property ([MS-OXPROPS] section 2.90) gets or sets the calculated day
    /// interval for the recurrence pattern.<2>
    var dayInterval: UInt16? {
        return getProperty(name: .lidDayInterval)
    }
    
    /// [MS-XWDCAL] 2.2.7.20 PidLidDayOfMonth
    /// DAV property name: http://schemas.microsoft.com/mapi/dayofmonth
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidDayOfMonth property ([MS-OXPROPS] section 2.91) gets or sets the day of the month for
    /// the appointment or meeting.
    var dayOfMonth: UInt32? {
        return getProperty(name: .lidDayOfMonth)
    }
    
    /// [MS-XWDCAL] 2.2.7.21 PidLidDelegateMail
    /// DAV property name: http://schemas.microsoft.com/mapi/delegate_mail
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidDelegateMail property ([MS-OXPROPS] section 2.92) gets or sets a value that indicates
    /// whether a delegate responded to the meeting request. True if the delegate responded to the
    /// request; otherwise, false.
    var delegateMail: Bool? {
        return getProperty(name: .lidDelegateMail)
    }
    
    /// [MS-XWDCAL] 2.2.7.22 PidLidEndRecurrenceDate
    /// DAV property name: http://schemas.microsoft.com/mapi/end_recur_date
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidEndRecurrenceDate property ([MS-OXPROPS] section 2.115) gets or sets the calculated
    /// end date of the recurrence range.
    var endRecurrenceDate: Date? {
        return getProperty(name: .lidEndRecurrenceDate)
    }
    
    /// [MS-XWDCAL] 2.2.7.23 PidLidEndRecurrenceTime
    /// DAV property name: http://schemas.microsoft.com/mapi/end_recur_time
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidEndRecurrenceTime property ([MS-OXPROPS] section 2.116) gets or sets the end time of
    /// the recurrence range.
    var endRecurrenceTime: Date? {
        return getProperty(name: .lidEndRecurrenceTime)
    }
    
    /// [MS-XWDCAL] 2.2.7.26 PidLidFOthersAppointment
    /// DAV property name: http://schemas.microsoft.com/mapi/fothersappt
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// var endRecurrenceTime: Bool
    /// The PidLidFOthersAppointment property ([MS-OXPROPS] section 2.140) gets or sets a value on the
    /// in-memory object that indicates whether the Calendar folder from which the meeting was opened is
    /// another user's calendar. True if the Calendar folder from which the meeting was opened is another
    /// user's calendar; otherwise, false.
    var fOthersAppointment: Bool? {
        return getProperty(name: .lidFOthersAppointment)
    }
    
    /// [MS-XWDCAL] 2.2.7.27 PidLidICalendarDayOfWeekMask
    /// DAV property name: http://schemas.microsoft.com/mapi/dayofweekmask
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidICalendarDayOfWeekMask property ([MS-OXPROPS] section 2.147) identifies the day of
    /// the week for the appointment or meeting.
    var iCalendarDayOfWeekMask: UInt32? {
        return getProperty(name: .lidICalendarDayOfWeekMask)
    }
    
    /// [MS-XWDCAL] 2.2.7.33 PidLidMonthInterval
    /// DAV property name: http://schemas.microsoft.com/mapi/month_interval
    /// Data type: PtypInteger16 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidMonthInterval property ([MS-OXPROPS] section 2.172) gets or sets a calculated value
    /// that indicates the monthly interval of the appointment or meeting.<3>
    var monthInterval: UInt16? {
        return getProperty(name: .lidMonthInterval)
    }
    
    /// [MS-XWDCAL] 2.2.7.34 PidLidMonthOfYear
    /// DAV property name: http://schemas.microsoft.com/mapi/monthofyear
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidMonthOfYear property ([MS-OXPROPS] section 2.173) gets or sets the month of the year
    /// that the appointment or meeting occurs.
    var monthOfYear: UInt32? {
        return getProperty(name: .lidMonthOfYear)
    }
    
    /// [MS-XWDCAL] 2.2.7.35 PidLidMonthOfYearMask
    /// DAV property name: http://schemas.microsoft.com/mapi/moy_mask
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidMonthOfYearMask property ([MS-OXPROPS] section 2.174) gets or sets the calculated
    /// month of the year that the appointment or meeting occurs.
    var monthOfYearMask: UInt32? {
        return getProperty(name: .lidMonthOfYearMask)
    }
    
    /// [MS-XWDCAL] 2.2.7.36 PidLidNoEndDateFlag
    /// DAV property name: http://schemas.microsoft.com/mapi/fnoenddate
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidNoEndDateFlag property ([MS-OXPROPS] section 2.176) gets or sets a value that
    /// indicates whether the recurrence pattern has an end date. True if there is no end date; otherwise,
    /// false. This property is not validated or enforced by the server. It is the responsibility of the client to
    /// keep this property synchronized and give it meaning.
    var noEndDateFlag: Bool? {
        return getProperty(name: .lidNoEndDateFlag)
    }
    
    /// [MS-XWDCAL] 2.2.7.43 PidLidOccurrences
    /// DAV property name: http://schemas.microsoft.com/mapi/occurrences
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOccurrences property ([MS-OXPROPS] section 2.188) gets or sets the number of
    /// occurrences in the recurring appointment or meeting.2.2.7.43 PidLidOccurrences
    /// DAV property name: http://schemas.microsoft.com/mapi/occurrences
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOccurrences property ([MS-OXPROPS] section 2.188) gets or sets the number of
    /// occurrences in the recurring appointment or meeting.
    var occurrences: UInt32? {
        return getProperty(name: .lidOccurrences)
    }
    
    /// [MS-XWDCAL] 2.2.7.44 PidLidOldRecurrenceType
    /// DAV property name: http://schemas.microsoft.com/mapi/recur_type
    /// Data type: PtypInteger16 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOldRecurrenceType property ([MS-OXPROPS] section 2.190) gets or sets the
    /// recurrence pattern for the appointment or meeting.
    /// The following table lists the valid values.
    var oldRecurrenceType: OldRecurrenceType? {
        guard let rawValue: UInt16 = getProperty(name: .lidOldRecurrenceType) else {
            return nil
        }
        
        return OldRecurrenceType(rawValue: rawValue)
    }
    
    /// [MS-XWDCAL] 2.2.7.45 PidLidOptionalAttendees
    /// DAV property name: http://schemas.microsoft.com/mapi/optional_attendees
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOptionalAttendees property is further specified in [MS-OXPROPS] section 2.194.<4>
    var optionalAttendees: String? {
        return getProperty(name: .lidOptionalAttendees)
    }
    
    /// [MS-XWDCAL] 2.2.7.47 PidLidOwnerName
    /// DAV property name: http://schemas.microsoft.com/mapi/ownername
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidOwnerName property ([MS-OXPROPS] section 2.200) gets or sets the name of the owner
    /// of the mailbox.
    var ownerName: String? {
        return getProperty(name: .lidOwnerName)
    }
    
    /// [MS-XWDCAL] 2.2.7.48 PidLidRecurrenceDuration
    /// DAV property name: http://schemas.microsoft.com/mapi/recurduration
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidRecurrenceDuration property ([MS-OXPROPS] section 2.213) gets or sets the length, in
    /// minutes, of the appointment or meeting.
    var recurrenceDuration: UInt32? {
        return getProperty(name: .lidRecurrenceDuration)
    }
    
    /// [MS-XWDCAL] 2.2.7.59 PidLidReminderTimeDate
    /// DAV property name: http://schemas.microsoft.com/mapi/remindertimedate
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderTimeDate property ([MS-OXPROPS] section 2.225) gets or sets the time and
    /// date of the reminder for the appointment or meeting.
    var reminderTimeDate: Date? {
        return getProperty(name: .lidReminderTimeDate)
    }
    
    /// [MS-XWDCAL] 2.2.7.60 PidLidReminderTimeTime
    /// DAV property name: http://schemas.microsoft.com/mapi/remindertimetime
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidReminderTimeTime property ([MS-OXPROPS] section 2.226) gets or sets a value that
    /// indicates the time of the reminder for the appointment or meeting.
    var reminderTimeTime: Date? {
        return getProperty(name: .lidReminderTimeTime)
    }
    
    /// [MS-XWDCAL] 2.2.7.62 PidLidRemoteStatus
    /// DAV property name: http://schemas.microsoft.com/mapi/remotestatus
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidRemoteStatus property ([MS-OXPROPS] section 2.228) gets or sets a value that indicates
    /// the remote status of the calendar item.
    /// The following table lists the valid values for this property
    var remoteStatus: RemoteStatus? {
        guard let rawValue: UInt32 = getProperty(name: .lidRemoteStatus) else {
            return nil
        }
        
        return RemoteStatus(rawValue: rawValue)
    }
    
    /// [MS-XWDCAL] 2.2.7.63 PidLidRequiredAttendees
    /// DAV property name: http://schemas.microsoft.com/mapi/required_attendees
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidRequiredAttendees property ([MS-OXPROPS] section 2.229) gets or sets the required
    /// attendees for the appointment or meeting.<5>
    var requiredAttendees: String? {
        return getProperty(name: .lidRequiredAttendees)
    }
    
    /// [MS-XWDCAL] 2.2.7.64 PidLidResourceAttendees
    /// DAV property name: http://schemas.microsoft.com/mapi/resource_attendees
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidResourceAttendees property ([MS-OXPROPS] section 2.230) gets or sets the resource
    /// attendees for the appointment or meeting.<6>
    var resourceAttendees: String? {
        return getProperty(name: .lidResourceAttendees)
    }
    
    /// [MS-XWDCAL] 2.2.7.66 PidLidStartRecurrenceDate
    /// DAV property name: http://schemas.microsoft.com/mapi/start_recur_date
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidStartRecurrenceDate property ([MS-OXPROPS] section 2.303) gets or sets the calculated
    /// the start date of the recurrence pattern.<7> The value of this property is interpreted as follows:
    ///  Bits 0-4 represent the day
    ///  Bits 5-8 represent the month
    ///  Bits 9-31 represent the year
    var startRecurrenceDate: UInt32? {
        return getProperty(name: .lidStartRecurrenceDate)
    }
    
    /// [MS-XWDCAL] 2.2.7.67 PidLidStartRecurrenceTime
    /// DAV property name: http://schemas.microsoft.com/mapi/start_recur_time
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidStartRecurrenceTime property ([MS-OXPROPS] section 2.304) gets or sets the calculated
    /// start time of the recurrence pattern.<8> The value of this property is interpreted as follows:
    ///  Bits 0-5 represent the seconds
    ///  Bits 6-11 represent the minutes
    ///  Bits 12-16 represent the hours
    var startRecurrenceTime: UInt32? {
        return getProperty(name: .lidStartRecurrenceTime)
    }
    
    /// [MS-XWDCAL] 2.2.7.71 PidLidWeekInterval
    /// DAV property name: http://schemas.microsoft.com/mapi/week_interval
    /// Data type: PtypInteger16 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidWeekInterval property ([MS-OXPROPS] section 2.352) gets or sets the calculated number
    /// of weeks that occur between each meeting.<9>
    var weekInterval: UInt32? {
        return getProperty(name: .lidWeekInterval)
    }
    
    /// [MS-XWDCAL] 2.2.7.73 PidLidYearInterval
    /// DAV property name: http://schemas.microsoft.com/mapi/year_interval
    /// Data type: PtypInteger16 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidLidYearInterval property ([MS-OXPROPS] section 2.362) gets or sets the calculated yearly
    /// interval of the appointment or meeting.<10>
    var yearInterval: UInt32? {
        return getProperty(name: .lidYearInterval)
    }
    
    /// [MS-XWDCAL] 2.2.8.1 PidNameExchangeIntendedBusyStatus
    /// DAV property name: http://schemas.microsoft.com/exchange/intendedbusystatus
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameExchangeIntendedBusyStatus property ([MS-OXPROPS] section 2.418) gets or sets
    /// the busy status of the user during an appointment or meeting.
    var exchangeIntendedBusyStatus: UInt32? {
        return getProperty(name: .nameExchangeIntendedBusyStatus)
    }
    
    /// [MS-XWDCAL] 2.2.8.2 PidNameExchangeModifyExceptionStructure
    /// DAV property name: http://schemas.microsoft.com/exchange/modifyexceptionstruct
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameExchangeModifyExceptionStructure property ([MS-OXPROPS] section 2.420) gets or
    /// sets a calculated structure that modifies an exception to the recurrence.
    var exchangeModifyExceptionStructure: Data? {
        return getProperty(name: .nameExchangeModifyExceptionStructure)
    }
   
    /// [MS-XWDCAL] 2.2.8.3 PidNameExchangeNoModifyExceptions
    /// DAV property name: http://schemas.microsoft.com/exchange/nomodifyexceptions
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameExchangeNoModifyExceptions property ([MS-OXPROPS] section 2.421) gets a
    /// calculated value that indicates whether there are exceptions for the recurring appointment. True if no
    /// exceptions exist; otherwise, false.
    var exchangeNoModifyExceptions: Bool? {
        return getProperty(name: .nameExchangeNoModifyExceptions)
    }
    
    /// [MS-XWDCAL] 2.2.8.4 PidNameExchangePatternEnd
    /// DAV property name: http://schemas.microsoft.com/exchange/patternend
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameExchangePatternEnd property ([MS-OXPROPS] section 2.422) gets or sets the
    /// maximum time when an instance of a recurring appointment ends. If there are no exceptions, this is
    /// the end time of the last instance.
    var exchangePatternEnd: Date? {
        return getProperty(name: .nameExchangePatternEnd)
    }
    
    /// [MS-XWDCAL] 2.2.8.5 PidNameExchangePatternStart
    /// DAV property name: http://schemas.microsoft.com/exchange/patternstart
    /// Data type: PtypTime ([MS-OXCDATA] section 2.11.1.6)
    /// The PidNameExchangePatternStart property ([MS-OXPROPS] section 2.423) gets or sets the
    /// calculated absolute minimum time when an instance of a recurring appointment starts. If there are
    /// no exceptions, this is the start time of the first instance.
    var exchangePatternStart: Date? {
        return getProperty(name: .nameExchangePatternStart)
    }
    
    ///[MS-XWDCAL] 2.2.8.6 PidNameExchangeReminderInterval
    ///DAV property name: http://schemas.microsoft.com/exchange/reminderinterval
    ///Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
    ///The PidNameExchangeReminderInterval property ([MS-OXPROPS] section 2.424) gets or sets the
    ///time, in seconds, between reminders.
    var exchangeReminderInterval: UInt32? {
        return getProperty(name: .nameExchangeReminderInterval)
    }
    
    ///[MS-XWDCAL] 2.2.8.8 PidTagExchangeNTSecurityDescriptor
    /// DAV property name: http://schemas.microsoft.com/exchange/ntsecuritydescriptor
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagExchangeNTSecurityDescriptor property ([MS-OXPROPS] section 2.678) gets or sets
    /// the calculated security descriptor for the item. The security descriptor SHOULD contain the item's
    /// primary owner and group and a discretionary access control list (DACL) granting and denying
    /// various rights to particular users and groups. Clients MUST NOT manipulate the security descriptor
    /// directly.
    var exchangeNTSecurityDescriptor: Data? {
        return getProperty(id: .tagExchangeNTSecurityDescriptor)
    }
    
    ///[MS-XWDCAL] 2.2.8.9 PidTagFlatUrlName
    /// DAV property name: http://schemas.microsoft.com/exchange/permanenturl
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1.6)
    /// The PidTagFlatUrlName property ([MS-OXPROPS] section 2.689) gets the unique identifier for an
    /// item across the message store. This value SHOULD NOT change as long as the item remains in the
    /// same Folder object. The PidTagFlatUrlName property contains the ID of the parent Folder object of
    /// the item, which changes when the item is moved to a different Folder object or deleted. Changing a
    /// property on an item SHOULD NOT change the PidTagFlatUrlName property and neither will adding
    /// more items to the Folder object with the same display name or message subject.
    var flatUrlName: String? {
        return getProperty(id: .tagFlatUrlName)
    }
}
