//
//  NamedProperty+KnownProperties.swift
//  
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import Foundation

public extension NamedProperty {
    /// [MS-OXPROPS] 2.1 PidLidAddressBookProviderArrayType
    /// Canonical name: PidLidAddressBookProviderArrayType
    /// Description: Specifies the state of the electronic addresses of the contact and represents a set of bit
    /// flags.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008029
    /// Data type: PtypInteger32, 0x0003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.12
    /// Alternate names: dispidABPArrayType
    static let lidAddressBookProviderArrayType = NamedProperty(set: .address,
                                                                             lid: 0x00008029)
    
    /// [MS-OXPROPS] 2.2 PidLidAddressBookProviderEmailList
    /// Canonical name: PidLidAddressBookProviderEmailList
    /// Description: Specifies which electronic address properties are set on the Contact object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008028
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.11
    /// Alternate names: dispidABPEmailList
    static let lidAddressBookProviderEmailList = NamedProperty(set: .address,
                                                                             lid: 0x00008028)
    
    /// [MS-OXPROPS] 2.3 PidLidAddressCountryCode
    /// Canonical name: PidLidAddressCountryCode
    /// Description: Specifies the country code portion of the mailing address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080DD
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.6
    /// Alternate names: dispidAddressCountryCode
    static let lidAddressCountryCode = NamedProperty(set: .address,
                                                                   lid: 0x000080DD)

    /// [MS-OXPROPS] 2.4 PidLidAgingDontAgeMe
    /// Canonical name: PidLidAgingDontAgeMe
    /// Description: Specifies whether to automatically archive the message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000850E
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-OXCMSG] section 2.2.1.33
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCNTC], [MS-OXODOC], [MS-OXOJRNL], [MSOXONOTE], [MS-OXOPOST], [MS-OXORMMS], [MS-OXOTASK], [MS-OXTNEF]
    /// Alternate names: dispidAgingDontAgeMe
    static let lidAgingDontAgeMe = NamedProperty(set: .common,
                                                               lid: 0x0000850E)

    /// [MS-OXPROPS] 2.5 PidLidAllAttendeesString
    /// Canonical name: PidLidAllAttendeesString
    /// Description: Specifies a list of all the attendees except for the organizer, including resources and
    /// unsendable attendees.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008238
    /// WebDAV: http://schemas.microsoft.com/mapi/allattendeesstring
    /// Data type: PtypString, 0x001F
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.16
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidAllAttendeesString
    static let lidAllAttendeesString = NamedProperty(set: .appointment,
                                                                   lid: 0x0000850E)
    
    /// [MS-OXPROPS] 2.6 PidLidAllowExternalCheck
    /// Canonical name: PidLidAllowExternalCheck
    /// Description: This property is set to TRUE.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008246
    /// Data type: PtypBoolean, 0x000B
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.5
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidAllowExternCheck
    static let lidAllowExternalCheck = NamedProperty(set: .appointment,
                                                                   lid: 0x00008246)

    /// [MS-OXPROPS] 2.7 PidLidAnniversaryEventEntryId
    /// Canonical name: PidLidAnniversaryEventEntryId
    /// Description: Specifies the EntryID of the Appointment object that represents an anniversary of
    /// the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000804E
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.5.6
    /// Alternate names: dispidAnniversaryEventEID
    static let lidAnniversaryEventEntryId = NamedProperty(set: .address,
                                                                        lid: 0x0000804E)
    
    /// [MS-OXPROPS] 2.8 PidLidAppointmentAuxiliaryFlags
    /// Canonical name: PidLidAppointmentAuxiliaryFlags
    /// Description: Specifies a bit field that describes the auxiliary state of the object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008207
    /// Data type: PtypInteger32, 0x0003
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.3
    /// Alternate names: dispidApptAuxFlags
    static let lidAppointmentAuxiliaryFlags = NamedProperty(set: .appointment,
                                                                          lid: 0x00008207)
    
    /// [MS-OXPROPS] 2.9 PidLidAppointmentColor
    /// Canonical name: PidLidAppointmentColor
    /// Description: Specifies the color to be used when displaying the Calendar object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008214
    /// Data type: PtypInteger32, 0x0003
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.50
    /// Alternate names: dispidApptColor
    static let lidAppointmentColor = NamedProperty(set: .appointment,
                                                                 lid: 0x00008214)
    
    /// [MS-OXPROPS] 2.10 PidLidAppointmentCounterProposal
    /// Canonical name: PidLidAppointmentCounterProposal
    /// Description: Indicates whether a Meeting Response object is a counter proposal.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008257
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.7
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptCounterProposal
    static let lidAppointmentCounterProposal = NamedProperty(set: .appointment,
                                                                           lid: 0x00008257)
    
    /// [MS-OXPROPS] 2.11 PidLidAppointmentDuration
    /// Canonical name: PidLidAppointmentDuration
    /// Description: Specifies the length of the event, in minutes.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008213
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/apptduration
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.7
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidApptDuration
    static let lidAppointmentDuration = NamedProperty(set: .appointment,
                                                                    lid: 0x00008213)
    
    /// [MS-OXPROPS] 2.12 PidLidAppointmentEndDate
    /// Canonical name: PidLidAppointmentEndDate
    /// Description: Indicates the date that the appointment ends.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008211
    /// WebDAV: http://schemas.microsoft.com/mapi/apptenddate
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.3
    /// Alternate names: dispidApptEndDate
    static let lidAppointmentEndDate = NamedProperty(set: .appointment,
                                                                   lid: 0x00008211)
    
    /// [MS-OXPROPS] 2.13 PidLidAppointmentEndTime
    /// Canonical name: PidLidAppointmentEndTime
    /// Description: Indicates the time that the appointment ends.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008210
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/apptendtime
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.4
    /// Alternate names: dispidApptEndTime
    static let lidAppointmentEndTime = NamedProperty(set: .appointment,
                                                                   lid: 0x00008210)

    /// [MS-OXPROPS] 2.14 PidLidAppointmentEndWhole
    /// Canonical name: PidLidAppointmentEndWhole
    /// Description: Specifies the end date and time for the event.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000820E
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/apptendwhole
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.6
    /// Consuming references: [MS-OXCICAL], [MS-OXOPFFB], [MS-XWDCAL]
    /// Alternate names: dispidApptEndWhole
    static let lidAppointmentEndWhole = NamedProperty(set: .appointment,
                                                                    lid: 0x0000820E)
    
    /// [MS-OXPROPS] 2.15 PidLidAppointmentLastSequence
    /// Canonical name: PidLidAppointmentLastSequence
    /// Description: Indicates to the organizer the last sequence number that was sent to any attendee.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008203
    /// Data type: PtypInteger32, 0x0003
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.2
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptLastSequence
    static let lidAppointmentLastSequence = NamedProperty(set: .appointment,
                                                                        lid: 0x00008203)
    
    /// [MS-OXPROPS] 2.16 PidLidAppointmentMessageClass
    /// Canonical name: PidLidAppointmentMessageClass
    /// Description: Indicates the message class of the Meeting object to be generated from the Meeting
    /// Request object.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000024
    /// Data type: PtypString, 0x001F
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.6
    /// Alternate names: dispidApptMessageClass
    static let lidAppointmentMessageClass = NamedProperty(set: .meeting,
                                                                        lid: 0x00000024)

    /// [MS-OXPROPS] 2.17 PidLidAppointmentNotAllowPropose
    /// Canonical name: PidLidAppointmentNotAllowPropose
    /// Description: Indicates whether attendees are not allowed to propose a new date and/or time for the
    /// meeting.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000825A
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.26
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptNotAllowPropose
    static let lidAppointmentNotAllowPropose = NamedProperty(set: .appointment,
                                                                           lid: 0x0000825A)
    
    /// [MS-OXPROPS] 2.18 PidLidAppointmentProposalNumber
    /// Canonical name: PidLidAppointmentProposalNumber
    /// Description: Specifies the number of attendees who have sent counter proposals that have not
    /// been accepted or rejected by the organizer.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008259
    /// Data type: PtypInteger32, 0x0003
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.6
    /// Alternate names: dispidApptProposalNum
    static let lidAppointmentProposalNumber = NamedProperty(set: .appointment,
                                                                          lid: 0x00008259)
    
    /// [MS-OXPROPS] 2.19 PidLidAppointmentProposedDuration
    /// Canonical name: PidLidAppointmentProposedDuration
    /// Description: Indicates the proposed value for the PidLidAppointmentDuration property (section
    /// 2.11) for a counter proposal.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008256
    /// Data type: PtypInteger32, 0x0003
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.7.5
    /// Alternate names: dispidApptProposedDuration
    static let lidAppointmentProposedDuration = NamedProperty(set: .appointment,
                                                                            lid: 0x00008256)
    
    /// [MS-OXPROPS] 2.20 PidLidAppointmentProposedEndWhole
    /// Canonical name: PidLidAppointmentProposedEndWhole
    /// Description: Specifies the proposed value for the PidLidAppointmentEndWhole property (section
    /// 2.14) for a counter proposal.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008251
    /// Data type: PtypTime, 0x0040
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.7.4
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptProposedEndWhole
    static let lidAppointmentProposedEndWhole = NamedProperty(set: .appointment,
                                                                            lid: 0x00008251)
    
    /// [MS-OXPROPS] 2.21 PidLidAppointmentProposedStartWhole
    /// Canonical name: PidLidAppointmentProposedStartWhole
    /// Description: Specifies the proposed value for the PidLidAppointmentStartWhole property (section
    /// 2.29) for a counter proposal.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008250
    /// Data type: PtypTime, 0x0040
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.7.3
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptProposedStartWhole
    static let lidAppointmentProposedStartWhole = NamedProperty(set: .appointment,
                                                                              lid: 0x00008250)
    
    /// [MS-OXPROPS] 2.22 PidLidAppointmentRecur
    /// Canonical name: PidLidAppointmentRecur
    /// Description: Specifies the dates and times when a recurring series occurs.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008216
    /// Data type: PtypBinary, 0x0102
    /// WebDAV: http://schemas.microsoft.com/mapi/apptrecur
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.44
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR], [MS-XWDCAL]
    /// Alternate names: dispidApptRecur
    static let lidAppointmentRecur = NamedProperty(set: .appointment,
                                                                 lid: 0x00008216)
    
    /// [MS-OXPROPS] 2.23 PidLidAppointmentReplyName
    /// Canonical name: PidLidAppointmentReplyName
    /// Description: Specifies the user who last replied to the meeting request or meeting update.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008230
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/apptreplyname
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.5
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidApptReplyName, http://schemas.microsoft.com/mapi/apptreplyname
    static let lidAppointmentReplyName = NamedProperty(set: .appointment,
                                                                     lid: 0x00008230)
    
    /// [MS-OXPROPS] 2.24 PidLidAppointmentReplyTime
    /// Canonical name: PidLidAppointmentReplyTime
    /// Description: Specifies the date and time at which the attendee responded to a received meeting
    /// request or Meeting Update object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008220
    /// Data type: PtypTime, 0x0040
    /// WebDAV: urn:schemas:calendar:replytime, http://schemas.microsoft.com/mapi/apptreplytime
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.3
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidApptReplyTime
    static let lidAppointmentReplyTime = NamedProperty(set: .appointment,
                                                                     lid: 0x00008220)

    /// [MS-OXPROPS] 2.25 PidLidAppointmentSequence
    /// Canonical name: PidLidAppointmentSequence
    /// Description: Specifies the sequence number of a Meeting object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008201
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/apptsequence
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.1
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidApptSequence
    static let lidAppointmentSequence = NamedProperty(set: .appointment,
                                                                    lid: 0x00008201)
    
    /// [MS-OXPROPS] 2.26 PidLidAppointmentSequenceTime
    /// Canonical name: PidLidAppointmentSequenceTime
    /// Description: Indicates the date and time at which the PidLidAppointmentSequence property
    /// (section 2.25) was last modified.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008202
    /// Data type: PtypTime, 0x0040
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.1
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptSeqTime
    static let lidAppointmentSequenceTime = NamedProperty(set: .appointment,
                                                                        lid: 0x00008202)
    
    /// [MS-OXPROPS] 2.27 PidLidAppointmentStartDate
    /// Canonical name: PidLidAppointmentStartDate
    /// Description: Identifies the date that the appointment starts.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008212
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/apptstartdate
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.10
    /// Alternate names: dispidApptStartDate
    static let lidAppointmentStartDate = NamedProperty(set: .appointment,
                                                                     lid: 0x00008212)
    
    /// [MS-OXPROPS] 2.28 PidLidAppointmentStartTime
    /// Canonical name: PidLidAppointmentStartTime
    /// Description: Identifies the time that the appointment starts.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000820F
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/apptstarttime
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.11
    /// Alternate names: dispidApptStartTime
    static let lidAppointmentStartTime = NamedProperty(set: .appointment,
                                                                     lid: 0x0000820F)

    /// [MS-OXPROPS] 2.29 PidLidAppointmentStartWhole
    /// Canonical name: PidLidAppointmentStartWhole
    /// Description: Specifies the start date and time of the appointment.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000820D
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/apptstartwhole
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.5
    /// Consuming references: [MS-OXCICAL], [MS-OXOPFFB], [MS-XWDCAL]
    /// Alternate names: dispidApptStartWhole
    static let lidAppointmentStartWhole = NamedProperty(set: .appointment,
                                                                      lid: 0x0000820D)
    
    /// [MS-OXPROPS] 2.30 PidLidAppointmentStateFlags
    /// Canonical name: PidLidAppointmentStateFlags
    /// Description: Specifies a bit field that describes the state of the object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008217
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/apptstateflags
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.10
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR], [MS-OXWAVLS], [MS-XWDCAL]
    /// Alternate names: dispidApptStateFlags
    static let lidAppointmentStateFlags = NamedProperty(set: .appointment,
                                                                      lid: 0x00008217)
    
    /// [MS-OXPROPS] 2.31 PidLidAppointmentSubType
    /// Canonical name: PidLidAppointmentSubType
    /// Description: Specifies whether the event is an all-day event.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008215
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: urn:schemas:calendar:alldayevent, http://schemas.microsoft.com/mapi/apptsubtype
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.9
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidApptSubType
    static let lidAppointmentSubType = NamedProperty(set: .appointment,
                                                                   lid: 0x00008215)
    
    /// [MS-OXPROPS] 2.32 PidLidAppointmentTimeZoneDefinitionEndDisplay
    /// Canonical name: PidLidAppointmentTimeZoneDefinitionEndDisplay
    /// Description: Specifies time zone information that indicates the time zone of the
    /// PidLidAppointmentEndWhole property (section 2.14).
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000825F
    /// Data type: PtypBinary, 0x0102
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.43
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptTZDefEndDisplay
    static let lidAppointmentTimeZoneDefinitionEndDisplay = NamedProperty(set: .appointment,
                                                                                        lid: 0x0000825F)
    
    /// [MS-OXPROPS] 2.33 PidLidAppointmentTimeZoneDefinitionRecur
    /// Canonical name: PidLidAppointmentTimeZoneDefinitionRecur
    /// Description: Specifies time zone information that describes how to convert the meeting date and
    /// time on a recurring series to and from UTC.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008260
    /// Data type: PtypBinary, 0x0102
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.41
    /// Consuming references: [MS-OXCICAL], [MS-OXOCFG]
    /// Alternate names: dispidApptTZDefRecur
    static let lidAppointmentTimeZoneDefinitionRecur = NamedProperty(set: .appointment,
                                                                                   lid: 0x00008260)
    
    /// [MS-OXPROPS] 2.34 PidLidAppointmentTimeZoneDefinitionStartDisplay
    /// Canonical name: PidLidAppointmentTimeZoneDefinitionStartDisplay
    /// Description: Specifies time zone information that indicates the time zone of the
    /// PidLidAppointmentStartWhole property (section 2.29).
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000825E
    /// Data type: PtypBinary, 0x0102
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.42
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidApptTZDefStartDisplay
    /// 2.35 PidLidAppointmentUnsendableRecipient
    static let lidAppointmentTimeZoneDefinitionStartDisplay = NamedProperty(set: .appointment,
                                                                                          lid: 0x0000825E)

    /// [MS-OXPROPS] 2.35 PidLidAppointmentUnsendableRecipients
    /// Canonical name: PidLidAppointmentUnsendableRecipients
    /// Description: Contains a list of unsendable attendees.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000825D
    /// Data type: PtypBinary, 0x0102
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.25
    /// Alternate names: dispidApptUnsendableRecips
    static let lidAppointmentUnsendableRecipients = NamedProperty(set: .appointment,
                                                                                lid: 0x0000825D)
    
    /// [MS-OXPROPS] 2.36 PidLidAppointmentUpdateTime
    /// Canonical name: PidLidAppointmentUpdateTime
    /// Description: Indicates the time at which the appointment was last updated.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008226
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/apptupdatetime
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.15
    /// Alternate names: dispidApptUpdateTime
    static let lidAppointmentUpdateTime = NamedProperty(set: .appointment,
                                                                      lid: 0x00008226)

    /// [MS-OXPROPS] 2.37 PidLidAttendeeCriticalChange
    /// Canonical name: PidLidAttendeeCriticalChange
    /// Description: Specifies the date and time at which the meeting-related object was sent.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000001
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/attendee_critical_change
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.5.2
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: LID_ATTENDEE_CRITICAL_CHANGE
    static let lidAttendeeCriticalChange = NamedProperty(set: .meeting,
                                                                       lid: 0x00000001)
    
    /// [MS-OXPROPS] 2.38 PidLidAutoFillLocation
    /// Canonical name: PidLidAutoFillLocation
    /// Description: Indicates whether the value of the PidLidLocation property (section 2.159) is set to
    /// the PidTagDisplayName property (section 2.676).
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000823A
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.8
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidAutoFillLocation
    static let lidAutoFillLocation = NamedProperty(set: .appointment,
                                                                 lid: 0x0000823A)
    
    /// [MS-OXPROPS] 2.39 PidLidAutoLog
    /// Canonical name: PidLidAutoLog
    /// Description: Specifies to the application whether to create a Journal object for each action
    /// associated with this Contact object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008025
    /// Data type: PtypBoolean, 0x000B
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.19
    /// Alternate names: dispidAutoLog
    static let lidAutoLog = NamedProperty(set: .address,
                                                        lid: 0x00008025)

    /// [MS-OXPROPS] 2.40 PidLidAutoProcessState
    /// Canonical name: PidLidAutoProcessState
    /// Description: Specifies the options used in the automatic processing of email messages.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000851A
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.73
    /// Alternate names: dispidSniffState
    static let lidAutoProcessState = NamedProperty(set: .common,
                                                               lid: 0x0000851A)

    /// [MS-OXPROPS] 2.41 PidLidAutoStartCheck
    /// Canonical name: PidLidAutoStartCheck
    /// Description: Specifies whether to automatically start the conferencing application when a reminder
    /// for the start of a meeting is executed.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008244
    /// Data type: PtypBoolean, 0x000B
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.1
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidAutoStartCheck
    static let lidAutoStartCheck = NamedProperty(set: .appointment,
                                                               lid: 0x00008244)
    
    /// [MS-OXPROPS] 2.42 PidLidBilling
    /// Canonical name: PidLidBilling
    /// Description: Specifies billing information for the contact.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008535
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:billinginformation
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.24
    /// Alternate names: dispidBilling
    static let lidBilling = NamedProperty(set: .common,
                                                        lid: 0x00008535)
    
    /// [MS-OXPROPS] 2.43 PidLidBirthdayEventEntryId
    /// Canonical name: PidLidBirthdayEventEntryId
    /// Description: Specifies the EntryID of an optional Appointment object that represents the birthday
    /// of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000804D
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.5.3
    /// Alternate names: dispidBirthdayEventEID
    static let lidBirthdayEventEntryId = NamedProperty(set: .address,
                                                                     lid: 0x0000804D)

    /// [MS-OXPROPS] 2.44 PidLidBirthdayLocal
    /// Canonical name: PidLidBirthdayLocal
    /// Description: Specifies the birthday of a contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080DE
    /// Data type: PtypTime, 0x0040
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.5.2
    /// Alternate names: dispidApptBirthdayLocal
    static let lidBirthdayLocal = NamedProperty(set: .address,
                                                              lid: 0x000080DE)
    
    /// [MS-OXPROPS] 2.45 PidLidBusinessCardCardPicture
    /// Canonical name: PidLidBusinessCardCardPicture
    /// Description: Contains the image to be used on a business card.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008041
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.7.2
    /// Alternate names: dispidBCCardPicture
    static let lidBusinessCardCardPicture = NamedProperty(set: .address,
                                                                        lid: 0x00008041)

    /// [MS-OXPROPS] 2.46 PidLidBusinessCardDisplayDefinition
    /// Canonical name: PidLidBusinessCardDisplayDefinition
    /// Description: Contains user customization details for displaying a contact as a business card.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008040
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.7.1
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidBCDisplayDefinition
    static let lidBusinessCardDisplayDefinition = NamedProperty(set: .address,
                                                                              lid: 0x00008040)

    /// [MS-OXPROPS] 2.47 PidLidBusyStatus
    /// Canonical name: PidLidBusyStatus
    /// Description: Specifies the availability of a user for the event described by the object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008205
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/busystatus
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.2
    /// Consuming references: [MS-OXCICAL], [MS-OXOPFFB], [MS-XWDCAL]
    /// Alternate names: dispidBusyStatus
    static let lidBusyStatus = NamedProperty(set: .appointment,
                                                           lid: 0x00008205)

    /// [MS-OXPROPS] 2.48 PidLidCalendarType
    /// Canonical name: PidLidCalendarType
    /// Description: Contains the value of the CalendarType field from the PidLidAppointmentRecur
    /// property (section 2.22).
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000001C
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/calendar_type
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.11
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: LID_CALENDAR_TYPE
    static let lidCalendarType = NamedProperty(set: .meeting,
                                                             lid: 0x0000001C)
    
    /// [MS-OXPROPS] 2.49 PidLidCategories
    /// Canonical name: PidLidCategories
    /// Description: Contains the array of text labels assigned to this Message object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00009000
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Common
    /// Defining reference: [MS-OXCMSG] section 2.2.1.22
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidCategories
    static let lidCategories = NamedProperty(set: .publicStrings,
                                                           lid: 0x00009000)

    /// [MS-OXPROPS] 2.50 PidLidCcAttendeesString
    /// Canonical name: PidLidCcAttendeesString
    /// Description: Contains a list of all the sendable attendees who are also optional attendees.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000823C
    /// Data type: PtypString, 0x001F
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.18
    /// Alternate names: dispidCCAttendeesString
    static let lidCcAttendeesString = NamedProperty(set: .appointment,
                                                                  lid: 0x0000823C)

    /// [MS-OXPROPS] 2.51 PidLidChangeHighlight
    /// Canonical name: PidLidChangeHighlight
    /// Description: Specifies a bit field that indicates how the Meeting object has changed.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008204
    /// Data type: PtypInteger32, 0x0003
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.2
    /// Consuming reference: [MS-OXORMDR]
    /// Alternate names: dispidChangeHighlight
    static let lidChangeHighlight = NamedProperty(set: .common,
                                                               lid: 0x00008204)
    
    /// [MS-OXPROPS] 2.52 PidLidClassification
    /// Canonical name: PidLidClassification
    /// has been assigned.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085B6
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.23
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: dispidClassification
    static let lidClassification = NamedProperty(set: .common,
                                                               lid: 0x000085B6)
    
    /// [MS-OXPROPS] 2.53 PidLidClassificationDescription
    /// Canonical name: PidLidClassificationDescription
    /// Description: Contains a human-readable summary of each of the classification categories included in
    /// the PidLidClassification property (section 2.53).
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085B7
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.24
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: dispidClassDesc
    static let lidClassificationDescription = NamedProperty(set: .common,
                                                                          lid: 0x000085B7)
    
    /// [MS-OXPROPS] 2.54 PidLidClassificationGuid
    /// Canonical name: PidLidClassificationGuid
    /// Description: Contains the GUID that identifies the list of email classification categories used by a
    /// Message object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085B8
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMAIL] section 2.5.1
    /// Alternate names: dispidClassGuid
    static let lidClassificationGuid = NamedProperty(set: .common,
                                                                   lid: 0x000085B8)
    
    /// [MS-OXPROPS] 2.55 PidLidClassificationKeep
    /// Canonical name: PidLidClassificationKeep
    /// Description: Indicates whether the message uses any classification categories.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085BA
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMAIL] section 2.5.2
    /// Alternate names: dispidClassKeep
    static let lidClassificationKeep = NamedProperty(set: .common,
                                                                   lid: 0x000085BA)

    /// [MS-OXPROPS] 2.56 PidLidClassified
    /// Canonical name: PidLidClassified
    /// Description: Indicates whether the contents of this message are regarded as classified information.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085B5
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.25
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: dispidClassified
    static let lidClassified = NamedProperty(set: .common,
                                                           lid: 0x000085B5)
    
    /// [MS-OXPROPS] 2.57 PidLidCleanGlobalObjectId
    /// Canonical name: PidLidCleanGlobalObjectId
    /// Description: Contains the value of the PidLidGlobalObjectId property (section 2.142) for an object
    /// that represents an Exception object to a recurring series, where the Year, Month, and Day fields
    /// are all zero.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000023
    /// Data type: PtypBinary, 0x0102
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.28
    /// Consuming references: [MS-OXCICAL]
    /// Alternate names: dispidCleanGlobalObjId
    static let lidCleanGlobalObjectId = NamedProperty(set: .meeting,
                                                                    lid: 0x00000023)

    /// [MS-OXPROPS] 2.58 PidLidClientIntent
    /// Canonical name: PidLidClientIntent
    /// Description: Indicates what actions the user has taken on this Meeting object.
    /// Property set: PSETID_CalendarAssistant {11000E07-B51B-40D6-AF21-CAA85EDAB1D0}
    /// Property long ID (LID): 0x00000015
    /// Data type: PtypInteger32, 0x0003
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.2.4
    /// Alternate names: dispidClientIntent
    static let lidClientIntent = NamedProperty(set: .calendarAssistant,
                                                             lid: 0x00000015)
    /// [MS-OXPROPS] 2.59 PidLidClipEnd
    /// Canonical name: PidLidClipEnd
    /// Description: Specifies the end date and time of the event in UTC.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008236
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.15
    /// Alternate names: dispidClipEnd
    static let lidClipEnd = NamedProperty(set: .appointment,
                                                        lid: 0x00008236)

    /// [MS-OXPROPS] 2.60 PidLidClipStart
    /// Canonical name: PidLidClipStart
    /// Description: Specifies the start date and time of the event in UTC.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008235
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.14
    /// Alternate names: dispidClipStart
    static let lidClipStart = NamedProperty(set: .appointment,
                                                          lid: 0x00008235)

    /// [MS-OXPROPS] 2.61 PidLidCollaborateDoc
    /// Canonical name: PidLidCollaborateDoc
    /// Description: Specifies the document to be launched when the user joins the meeting.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008247
    /// Data type: PtypString, 0x001F
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.7
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidCollaborateDoc
    static let lidCollaborateDoc = NamedProperty(set: .appointment,
                                                               lid: 0x00008247)
    
    /// [MS-OXPROPS] 2.62 PidLidCommonEnd
    /// Canonical name: PidLidCommonEnd
    /// Description: Indicates the end time for the Message object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008517
    /// Data type: PtypTime, 0x0040
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.19
    /// Consuming references: [MS-OXCFXICS], [MS-OXOFLAG], [MS-OXOJRNL], [MS-OXOTASK], [MSOXOCAL]
    /// Alternate names: dispidCommonEnd
    static let lidCommonEnd = NamedProperty(set: .common,
                                                          lid: 0x00008517)

    /// [MS-OXPROPS] 2.63 PidLidCommonStart
    /// Canonical name: PidLidCommonStart
    /// Description: Indicates the start time for the Message object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008516
    /// Data type: PtypTime, 0x0040
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.18
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MS-OXOFLAG], [MSOXOJRNL], [MS-OXOTASK]
    /// Alternate names: dispidCommonStart
    static let lidCommonStart = NamedProperty(set: .common,
                                                            lid: 0x00008516)

    /// [MS-OXPROPS] 2.64 PidLidCompanies
    /// Canonical name: PidLidCompanies
    /// Description: Contains a list of company names, each of which is associated with a contact that is
    /// specified in the PidLidContacts property ([MS-OXCMSG] section 2.2.1.57.2).
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008539
    /// Data type: PtypMultipleString, 0x101F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOJRNL] section 2.2.2.4
    /// Alternate names: dispidCompanies, http://schemas.microsoft.com/exchange/companies
    static let lidCompanies = NamedProperty(set: .common,
                                                          lid: 0x00008539)

    /// [MS-OXPROPS] 2.65 PidLidConferencingCheck
    /// Canonical name: PidLidConferencingCheck
    /// Description:
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008240
    /// Data type: PtypBoolean, 0x000B
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.2
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidConfCheck
    static let lidConferencingCheck = NamedProperty(set: .appointment,
                                                                  lid: 0x00008240)

    /// [MS-OXPROPS] 2.66 PidLidConferencingType
    /// Canonical name: PidLidConferencingType
    /// Description: Specifies the type of the meeting.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008241
    /// Data type: PtypInteger32, 0x0003
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.3
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidConfType
    static let lidConferencingType = NamedProperty(set: .appointment,
                                                                 lid: 0x00008241)

    /// [MS-OXPROPS] 2.67 PidLidContactCharacterSet
    /// Canonical name: PidLidContactCharacterSet
    /// Description: Specifies the character set used for a Contact object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008023
    /// Data type: PtypInteger32, 0x0003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.18
    /// Alternate names: dispidContactCharSet
    static let lidContactCharacterSet = NamedProperty(set: .address,
                                                                    lid: 0x00008023)

    /// [MS-OXPROPS] 2.68 PidLidContactItemData
    /// Canonical name: PidLidContactItemData
    /// Description: Specifies the visible fields in the application's user interface that are used to help display
    /// the contact information.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008007
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.22
    /// Alternate names: dispidContactItemData
    static let lidContactItemData = NamedProperty(set: .address,
                                                                lid: 0x00008007)

    /// [MS-OXPROPS] 2.69 PidLidContactLinkedGlobalAddressListEntryId
    /// Canonical name: PidLidContactLinkedGlobalAddressListEntryId
    /// Description: Specifies the EntryID of the GAL contact to which the duplicate contact is linked.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080E2
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.1
    /// Alternate names: dispidContactLinkedGALEntryID
    static let lidContactLinkedGlobalAddressListEntryId = NamedProperty(set: .address,
                                                                                      lid: 0x000080E2)
    
    /// [MS-OXPROPS] 2.70 PidLidContactLinkEntry
    /// Canonical name: PidLidContactLinkEntry
    /// Description: Contains the elements of the PidLidContacts property (section 2.77).
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008585
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.57.1
    /// Consuming references: [MS-OXOCNTC], [MS-OXOJRNL]
    /// Alternate names: dispidContactLinkEntry
    static let lidContactLinkEntry = NamedProperty(set: .common,
                                                                 lid: 0x00008585)

    /// [MS-OXPROPS] 2.71 PidLidContactLinkGlobalAddressListLinkId
    /// Canonical name: PidLidContactLinkGlobalAddressListLinkId
    /// Description: Specifies the GUID of the GAL contact to which the duplicate contact is linked.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080E8
    /// Data type: PtypGuid, 0x0048
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.2
    /// Alternate names: dispidContactLinkGALLinkID
    static let lidContactLinkGlobalAddressListLinkId = NamedProperty(set: .address,
                                                                                   lid: 0x000080E8)

    /// [MS-OXPROPS] 2.72 PidLidContactLinkGlobalAddressListLinkState
    /// Canonical name: PidLidContactLinkGlobalAddressListLinkState
    /// Description: Specifies the state of the linking between the GAL contact and the duplicate contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080E6
    /// Data type: PtypInteger32, 0x0003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.3
    /// Alternate names: dispidContactLinkGALLinkState
    static let lidContactLinkGlobalAddressListLinkState = NamedProperty(set: .address,
                                                                                      lid: 0x000080E6)
    
    /// [MS-OXPROPS] 2.73 PidLidContactLinkLinkRejectHistory
    /// Canonical name: PidLidContactLinkLinkRejectHistory
    /// Description: Contains a list of GAL contacts that were previously rejected for linking with the
    /// duplicate contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080E5
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.4
    /// Alternate names: dispidContactLinkLinkRejectHistory
    static let lidContactLinkLinkRejectHistory = NamedProperty(set: .address,
                                                                             lid: 0x000080E5)
    
    /// [MS-OXPROPS] 2.74 PidLidContactLinkName
    /// Canonical name: PidLidContactLinkName
    /// Description:
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008586
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.57.3
    /// Consuming references: [MS-OXOCNTC], [MS-OXOJRNL]
    /// Alternate names: dispidContactLinkName
    static let lidContactLinkName = NamedProperty(set: .common,
                                                                 lid: 0x00008586)
    
    /// [MS-OXPROPS] 2.75 PidLidContactLinkSearchKey
    /// Canonical name: PidLidContactLinkSearchKey
    /// Description: Contains the list of SearchKeys for a Contact object linked to by the Message object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008584
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.57.4
    /// Consuming references: [MS-OXOCNTC], [MS-OXOJRNL]
    /// Alternate names: dispidContactLinkSearchKey
    static let lidContactLinkSearchKey = NamedProperty(set: .common,
                                                                     lid: 0x00008584)

    /// [MS-OXPROPS] 2.76 PidLidContactLinkSMTPAddressCache
    /// Canonical name: PidLidContactLinkSMTPAddressCache
    /// Description: Contains a list of the SMTP addresses that are used by the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080E3
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.5
    /// Alternate names: dispidContactLinkSMTPAddressCache
    static let lidContactLinkSMTPAddressCache = NamedProperty(set: .address,
                                                                            lid: 0x000080E3)
    
    /// [MS-OXPROPS] 2.77 PidLidContacts
    /// Canonical name: PidLidContacts
    /// Description: Contains the PidTagDisplayName property (section 2.676) of each Address Book
    /// EntryID referenced in the value of the PidLidContactLinkEntry property (section 2.70).
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000853A
    /// Data type: PtypMultipleString, 0x101F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.57.2
    /// Consuming references: [MS-OXCICAL], [MS-OXOCAL], [MS-OXOJRNL]
    /// Alternate names: dispidContacts
    static let lidContacts = NamedProperty(set: .common,
                                                         lid: 0x0000853A)

    /// [MS-OXPROPS] 2.78 PidLidContactUserField1
    /// Canonical name: PidLidContactUserField1
    /// Description: Contains text used to add custom text to a business card representation of a Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000804F
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/extensionattribute1
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.7.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: dispidContactUserField1
    static let lidContactUserField1 = NamedProperty(set: .address,
                                                                  lid: 0x0000804F)

    /// [MS-OXPROPS] 2.79 PidLidContactUserField2
    /// Canonical name: PidLidContactUserField2
    /// Description: Contains text used to add custom text to a business card representation of a Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008050
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/extensionattribute2
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.7.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: dispidContactUserField2
    static let lidContactUserField2 = NamedProperty(set: .address,
                                                                  lid: 0x00008050)
    
    /// [MS-OXPROPS] 2.80 PidLidContactUserField3
    /// Canonical name: PidLidContactUserField3
    /// Description: Contains text used to add custom text to a business card representation of a Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008051
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/extensionattribute3
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.7.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: dispidContactUserField3
    static let lidContactUserField3 = NamedProperty(set: .address,
                                                                  lid: 0x00008051)
    
    /// [MS-OXPROPS] 2.81 PidLidContactUserField4
    /// Canonical name: PidLidContactUserField4
    /// Description: Contains text used to add custom text to a business card representation of a Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008052
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/extensionattribute4
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.7.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: dispidContactUserField4
    static let lidContactUserField4 = NamedProperty(set: .address,
                                                                  lid: 0x00008052)
    
    /// [MS-OXPROPS] 2.82 PidLidConversationActionLastAppliedTime
    /// Canonical name: PidLidConversationActionLastAppliedTime
    /// Description: Contains the time, in UTC, that an Email object was last received in the
    /// conversation, or the last time that the user modified the conversation action, whichever occurs
    /// later.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085CA
    /// Data type: PtypTime, 0x0040
    /// Area: Conversation Actions
    /// Defining reference: [MS-OXOCFG] section 2.2.8.1
    /// Alternate names: dispidConvActionLastAppliedTime
    static let lidConversationActionLastAppliedTime = NamedProperty(set: .common,
                                                                                  lid: 0x000085CA)

    /// [MS-OXPROPS] 2.83 PidLidConversationActionMaxDeliveryTime
    /// Canonical name: PidLidConversationActionMaxDeliveryTime
    /// Description: Contains the maximum value of the PidTagMessageDeliveryTime property (section
    /// 2.789) of all of the Email objects modified in response to the last time that the user changed a
    /// conversation action on the client.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085C8
    /// Data type: PtypTime, 0x0040
    /// Area: Conversation Actions
    /// Defining reference: [MS-OXOCFG] section 2.2.8.2
    /// Alternate names: dispidConvActionMaxDeliveryTime
    static let lidConversationActionMaxDeliveryTime = NamedProperty(set: .common,
                                                                                  lid: 0x000085C8)
    
    /// [MS-OXPROPS] 2.84 PidLidConversationActionMoveFolderEid
    /// Canonical name: PidLidConversationActionMoveFolderEid
    /// Description: Contains the EntryID for the destination folder.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085C6
    /// Data type: PtypBinary, 0x0102
    /// Area: Conversation Actions
    /// Defining reference: [MS-OXOCFG] section 2.2.8.3
    /// Alternate names: dispidConvActionMoveFolderEid
    static let lidConversationActionMoveFolderEid = NamedProperty(set: .common,
                                                                                lid: 0x000085C6)
    
    /// [MS-OXPROPS] 2.85 PidLidConversationActionMoveStoreEid
    /// Canonical name: PidLidConversationActionMoveStoreEid
    /// Description: Contains the EntryID for a move to a folder in a different message store.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085C7
    /// Data type: PtypBinary, 0x0102
    /// Area: Conversation Actions
    /// Defining reference: [MS-OXOCFG] section 2.2.8.4
    /// Alternate names: dispidConvActionMoveStoreEid
    static let lidConversationActionMoveStoreEid = NamedProperty(set: .common,
                                                                               lid: 0x000085C7)
    
    /// [MS-OXPROPS] 2.86 PidLidConversationActionVersion
    /// Canonical name: PidLidConversationActionVersion
    /// Description: Contains the version of the conversation action FAI message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085CB
    /// Data type: PtypInteger32, 0x0003
    /// Area: Conversation Actions
    /// Defining reference: [MS-OXOCFG] section 2.2.8.5
    /// Alternate names: dispidConvActionVersion
    static let lidConversationActionVersion = NamedProperty(set: .common,
                                                                          lid: 0x000085CB)
    
    /// [MS-OXPROPS] 2.87 PidLidConversationProcessed
    /// Canonical name: PidLidConversationProcessed
    /// Description: Specifies a sequential number to be used in the processing of a conversation action.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085C9
    /// Data type: PtypInteger32, 0x0003
    /// Area: Conversation Actions
    /// Defining reference: [MS-OXOCFG] section 2.2.8.6
    /// Alternate names: dispidConvExLegacyProcessedRand
    static let lidConversationProcessed = NamedProperty(set: .common,
                                                                      lid: 0x000085C9)
    
    /// [MS-OXPROPS] 2.88 PidLidCurrentVersion
    /// Canonical name: PidLidCurrentVersion
    /// Description: Specifies the build number of the client application that sent the message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008552
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.34
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXTNEF], [MS-OXOTASK], [MSOXONOTE], [MS-OXOCNTC], [MS-OXOPOST], [MS-OXORMMS], [MS-OXOJRNL]
    static let lidCurrentVersion = NamedProperty(set: .common,
                                                               lid: 0x00008552)
    
    /// [MS-OXPROPS] 2.89 PidLidCurrentVersionName
    /// Canonical name: PidLidCurrentVersionName
    /// Description: Specifies the name of the client application that sent the message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008554
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.35
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXTNEF], [MS-OXOTASK], [MSOXONOTE], [MS-OXOCNTC], [MS-OXOPOST], [MS-OXORMMS], [MS-OXOJRNL]
    /// Alternate names: dispidCurrentVersionName
    static let lidCurrentVersionName = NamedProperty(set: .common,
                                                                   lid: 0x00008554)
    
    /// [MS-OXPROPS] 2.90 PidLidDayInterval
    /// Canonical name: PidLidDayInterval
    /// Description: Identifies the day interval for the recurrence pattern.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000011
    /// Data type: PtypInteger16, 0x0002
    /// WebDAV: http://schemas.microsoft.com/mapi/day_interval
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.19
    /// Consuming references: [MS-OXOCAL]
    /// Alternate names: LID_DAY_INTERVAL
    static let lidDayInterval = NamedProperty(set: .meeting,
                                                            lid: 0x00000011)
    
    /// [MS-OXPROPS] 2.91 PidLidDayOfMonth
    /// Canonical name: PidLidDayOfMonth
    /// Description: Identifies the day of the month for the appointment or meeting.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00001000
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/dayofmonth
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.20
    static let lidDayOfMonth = NamedProperty(set: .common,
                                                           lid: 0x00001000)
    
    /// [MS-OXPROPS] 2.92 PidLidDelegateMail
    /// Canonical name: PidLidDelegateMail
    /// Description: Indicates whether a delegate responded to the meeting request.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000009
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/delegate_mail
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.21
    /// Alternate names: LID_DELEGATE_MAIL
    static let lidDelegateMail = NamedProperty(set: .meeting,
                                                             lid: 0x00000009)

    /// [MS-OXPROPS] 2.93 PidLidDepartment
    /// Canonical name: PidLidDepartment
    /// Description: This property is ignored by the server and is set to an empty string by the client.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008010
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.6.4
    /// Alternate names: dispidDepartment
    static let lidDepartment = NamedProperty(set: .address,
                                                           lid: 0x00008010)

    /// [MS-OXPROPS] 2.94 PidLidDirectory
    /// Canonical name: PidLidDirectory
    /// Description: Specifies the directory server to be used.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008242
    /// Data type: PtypString, 0x001F
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.4
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidDirectory
    static let lidDirectory = NamedProperty(set: .appointment,
                                                          lid: 0x00008242)

    /// [MS-OXPROPS] 2.95 PidLidDistributionListChecksum
    /// Canonical name: PidLidDistributionListChecksum
    /// Description: Specifies the 32-bit cyclic redundancy check (CRC) polynomial checksum, as
    /// specified in [ISO/IEC8802-3], calculated on the value of the PidLidDistributionListMembers
    /// property (section 2.96).
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000804C
    /// Data type: PtypInteger32, 0x0003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.2.2.3
    /// Alternate names: dispidDLChecksum
    static let lidDistributionListChecksum = NamedProperty(set: .address,
                                                                         lid: 0x0000804C)

    /// [MS-OXPROPS] 2.96 PidLidDistributionListMembers
    /// Canonical name: PidLidDistributionListMembers
    /// Description: Specifies the list of EntryIDs of the objects corresponding to the members of the
    /// personal distribution list.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008055
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.2.2.1
    /// Alternate names: dispidDLMembers
    static let lidDistributionListMembers = NamedProperty(set: .address,
                                                                        lid: 0x00008055)
    
    /// [MS-OXPROPS] 2.97 PidLidDistributionListName
    /// Canonical name: PidLidDistributionListName
    /// Description: Specifies the name of the personal distribution list.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008053
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.2.1.2
    /// Alternate names: dispidDLName
    static let lidDistributionListName = NamedProperty(set: .address,
                                                                     lid: 0x00008053)
    
    /// [MS-OXPROPS] 2.98 PidLidDistributionListOneOffMembers
    /// Canonical name: PidLidDistributionListOneOffMembers
    /// Description: Specifies the list of one-off EntryIDs corresponding to the members of the personal
    /// distribution list.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008054
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.2.2.2
    /// Alternate names: dispidDLOneOffMembers
    static let lidDistributionListOneOffMembers = NamedProperty(set: .address,
                                                                              lid: 0x00008054)
    
    /// [MS-OXPROPS] 2.99 PidLidDistributionListStream
    /// Canonical name: PidLidDistributionListStream
    /// Description: Specifies the list of EntryIDs and one-off EntryIDs corresponding to the members of
    /// the personal distribution list.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008064
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.2.2.4
    /// Alternate names: dispidDLStream
    static let lidDistributionListStream = NamedProperty(set: .address,
                                                                       lid: 0x00008064)

    /// [MS-OXPROPS] 2.100 PidLidEmail1AddressType
    /// Canonical name: PidLidEmail1AddressType
    /// Description: Specifies the address type of an electronic address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008082
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.2
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail1AddrType
    static let lidEmail1AddressType = NamedProperty(set: .address,
                                                                  lid: 0x00008082)

    /// [MS-OXPROPS] 2.101 PidLidEmail1DisplayName
    /// Canonical name: PidLidEmail1DisplayName
    /// Description: Specifies the user-readable display name for the email address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008080
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.1
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail1DisplayName
    static let lidEmail1DisplayName = NamedProperty(set: .address,
                                                                  lid: 0x00008080)

    /// [MS-OXPROPS] 2.102 PidLidEmail1EmailAddress
    /// Canonical name: PidLidEmail1EmailAddress
    /// Description: Specifies the email address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008083
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.3
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail1EmailAddress
    static let lidEmail1EmailAddress = NamedProperty(set: .address,
                                                                   lid: 0x00008083)

    /// [MS-OXPROPS] 2.103 PidLidEmail1OriginalDisplayName
    /// Canonical name: PidLidEmail1OriginalDisplayName
    /// Description: Specifies the SMTP email address that corresponds to the email address for the Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008084
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.4
    /// Alternate names: dispidEmail1OriginalDisplayName, Email1OriginalDisplayName,
    /// EXSCHEMA_MAPI_EMAIL1ORIGINALDISPLAYNAME
    static let lidEmail1OriginalDisplayName = NamedProperty(set: .address,
                                                                          lid: 0x00008084)
    
    /// [MS-OXPROPS] 2.104 PidLidEmail1OriginalEntryId
    /// Canonical name: PidLidEmail1OriginalEntryId
    /// Description: Specifies the EntryID of the object corresponding to this electronic address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008085
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.5
    /// Alternate names: dispidEmail1OriginalEntryID
    static let lidEmail1OriginalEntryId = NamedProperty(set: .address,
                                                                      lid: 0x00008085)
    
    /// [MS-OXPROPS] 2.105 PidLidEmail2AddressType
    /// Canonical name: PidLidEmail2AddressType
    /// Description: Specifies the address type of the electronic address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008092
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.2
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail2AddrType
    static let lidEmail2AddressType = NamedProperty(set: .address,
                                                                  lid: 0x00008092)
    
    /// [MS-OXPROPS] 2.106 PidLidEmail2DisplayName
    /// Canonical name: PidLidEmail2DisplayName
    /// Description: Specifies the user-readable display name for the email address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008090
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.1
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail2DisplayName
    static let lidEmail2DisplayName = NamedProperty(set: .address,
                                               lid: 0x00008090)
    
    /// [MS-OXPROPS] 2.107 PidLidEmail2EmailAddress
    /// Canonical name: PidLidEmail2EmailAddress
    /// Description: Specifies the email address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008093
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.3
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail2EmailAddress
    static let lidEmail2EmailAddress = NamedProperty(set: .address,
                                                                   lid: 0x00008093)
    
    /// [MS-OXPROPS] 2.108 PidLidEmail2OriginalDisplayName
    /// Canonical name: PidLidEmail2OriginalDisplayName
    /// Description: Specifies the SMTP email address that corresponds to the email address for the Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008094
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.4
    /// Alternate names: dispidEmail2OriginalDisplayName
    static let lidEmail2OriginalDisplayName = NamedProperty(set: .address,
                                                                          lid: 0x00008094)
    
    /// [MS-OXPROPS] 2.109 PidLidEmail2OriginalEntryId
    /// Canonical name: PidLidEmail2OriginalEntryId
    /// Description: Specifies the EntryID of the object that corresponds to this electronic address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008095
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.5
    /// Alternate names: dispidEmail2OriginalEntryID
    static let lidEmail2OriginalEntryId = NamedProperty(set: .address,
                                                                      lid: 0x00008095)
    
    /// [MS-OXPROPS] 2.110 PidLidEmail3AddressType
    /// Canonical name: PidLidEmail3AddressType
    /// Description: Specifies the address type of the electronic address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080A2
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.2
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail3AddrType
    static let lidEmail3AddressType = NamedProperty(set: .address,
                                                                  lid: 0x000080A2)
    
    /// [MS-OXPROPS] 2.111 PidLidEmail3DisplayName
    /// Canonical name: PidLidEmail3DisplayName
    /// Description: Specifies the user-readable display name for the email address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080A0
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.1
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail3DisplayName
    static let lidEmail3DisplayName = NamedProperty(set: .address,
                                                                  lid: 0x000080A0)
    
    /// [MS-OXPROPS] 2.112 PidLidEmail3EmailAddress
    /// Canonical name: PidLidEmail3EmailAddress
    /// Description: Specifies the email address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080A3
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.3
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidEmail3EmailAddress
    static let lidEmail3EmailAddress = NamedProperty(set: .address,
                                                                   lid: 0x000080A3)
    
    /// [MS-OXPROPS] 2.113 PidLidEmail3OriginalDisplayName
    /// Canonical name: PidLidEmail3OriginalDisplayName
    /// Description: Specifies the SMTP email address that corresponds to the email address for the Contact
    /// object.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080A4
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.4
    /// Alternate names: dispidEmail3OriginalDisplayName
    static let lidEmail3OriginalDisplayName = NamedProperty(set: .address,
                                                                          lid: 0x000080A4)
    
    /// [MS-OXPROPS] 2.114 PidLidEmail3OriginalEntryId
    /// Canonical name: PidLidEmail3OriginalEntryId
    /// Description: Specifies the EntryID of the object that corresponds to this electronic address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080A5
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.5
    /// Alternate names: dispidEmail3OriginalEntryID
    static let lidEmail3OriginalEntryId = NamedProperty(set: .address,
                                                                      lid: 0x000080A5)
    
    /// [MS-OXPROPS] 2.115 PidLidEndRecurrenceDate
    /// Canonical name: PidLidEndRecurrenceDate
    /// Description: Identifies the end date of the recurrence range.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000000F
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/end_recur_date
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.22
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: LID_END_RECUR_DATE
    static let lidEndRecurrenceDate = NamedProperty(set: .meeting,
                                                                  lid: 0x0000000F)
    
    /// [MS-OXPROPS] 2.116 PidLidEndRecurrenceTime
    /// Canonical name: PidLidEndRecurrenceTime
    /// Description: Identifies the end time of the recurrence range.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000010
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/end_recur_time
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.23
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: LID_END_RECUR_TIME
    static let lidEndRecurrenceTime = NamedProperty(set: .meeting,
                                                                  lid: 0x00000010)

    /// [MS-OXPROPS] 2.117 PidLidExceptionReplaceTime
    /// Canonical name: PidLidExceptionReplaceTime
    /// Description: Specifies the date and time, in UTC, within a recurrence pattern that an exception will
    /// replace.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008228
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.10.2.5
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidExceptionReplaceTime
    static let lidExceptionReplaceTime = NamedProperty(set: .appointment,
                                                                     lid: 0x00008228)

    /// [MS-OXPROPS] 2.118 PidLidFax1AddressType
    /// Canonical name: PidLidFax1AddressType
    /// Description: Contains the string value "FAX".
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080B2
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.7
    /// Alternate names: dispidFax1AddrType
    static let lidFax1AddressType = NamedProperty(set: .address,
                                                                lid: 0x000080B2)
    
    /// [MS-OXPROPS] 2.119 PidLidFax1EmailAddress
    /// Canonical name: PidLidFax1EmailAddress
    /// Description: Contains a user-readable display name, followed by the "@" character, followed by a
    /// fax number.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080B3
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.8
    /// Alternate names: dispidFax1EmailAddress
    static let lidFax1EmailAddress = NamedProperty(set: .address,
                                                                 lid: 0x000080B3)
    
    /// [MS-OXPROPS] 2.120 PidLidFax1OriginalDisplayName
    /// Canonical name: PidLidFax1OriginalDisplayName
    /// Description: Contains the same value as the PidTagNormalizedSubject property (section 2.812).
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080B4
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.9
    /// Alternate names: dispidFax1OriginalDisplayName
    static let lidFax1OriginalDisplayName = NamedProperty(set: .address,
                                                                        lid: 0x000080B4)
    
    /// [MS-OXPROPS] 2.121 PidLidFax1OriginalEntryId
    /// Canonical name: PidLidFax1OriginalEntryId
    /// Description: Specifies a one-off EntryID that corresponds to this fax address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080B5
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.10
    /// Alternate names: dispidFax1OriginalEntryID
    static let lidFax1OriginalEntryId = NamedProperty(set: .address,
                                                                    lid: 0x000080B5)
    
    /// [MS-OXPROPS] 2.122 PidLidFax2AddressType
    /// Canonical name: PidLidFax2AddressType
    /// Description: Contains the string value "FAX".
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080C2
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.7
    /// Alternate names: dispidFax2AddrType
    static let lidFax2AddressType = NamedProperty(set: .address,
                                                                lid: 0x000080C2)
    
    /// [MS-OXPROPS] 2.123 PidLidFax2EmailAddress
    /// Canonical name: PidLidFax2EmailAddress
    /// Description: Contains a user-readable display name, followed by the "@" character, followed by a
    /// fax number.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080C3
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.8
    /// Alternate names: dispidFax2EmailAddress
    static let lidFax2EmailAddress = NamedProperty(set: .address,
                                                                 lid: 0x000080C3)
    
    /// [MS-OXPROPS] 2.124 PidLidFax2OriginalDisplayName
    /// Canonical name: PidLidFax2OriginalDisplayName
    /// Description: Contains the same value as the PidTagNormalizedSubject property (section 2.812).
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080C4
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.9
    /// Alternate names: dispidFax2OriginalDisplayName
    static let lidFax2OriginalDisplayName = NamedProperty(set: .address,
                                                                        lid: 0x000080C4)
    
    /// [MS-OXPROPS] 2.125 PidLidFax2OriginalEntryId
    /// Canonical name: PidLidFax2OriginalEntryId
    /// Description: Specifies a one-off EntryID corresponding to this fax address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080C5
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.10
    /// Alternate names: dispidFax2OriginalEntryID
    static let lidFax2OriginalEntryId = NamedProperty(set: .address,
                                                                    lid: 0x000080C5)
    
    /// [MS-OXPROPS] 2.126 PidLidFax3AddressType
    /// Canonical name: PidLidFax3AddressType
    /// Description: Contains the string value "FAX".
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080D2
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.7
    /// Alternate names: dispidFax3AddrType
    static let lidFax3AddressType = NamedProperty(set: .address,
                                                                lid: 0x000080D2)
    
    /// [MS-OXPROPS] 2.127 PidLidFax3EmailAddress
    /// Canonical name: PidLidFax3EmailAddress
    /// Description: Contains a user-readable display name, followed by the "@" character, followed by a
    /// fax number.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080D3
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.8
    /// Alternate names: dispidFax3EmailAddress
    static let lidFax3EmailAddress = NamedProperty(set: .address,
                                                                 lid: 0x000080D3)
    
    /// [MS-OXPROPS] 2.128 PidLidFax3OriginalDisplayName
    /// Canonical name: PidLidFax3OriginalDisplayName
    /// Description: Contains the same value as the PidTagNormalizedSubject property (section 2.812).
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080D4
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.9
    /// Alternate names: dispidFax3OriginalDisplayName
    static let lidFax3OriginalDisplayName = NamedProperty(set: .address,
                                                                        lid: 0x000080D4)
    
    /// [MS-OXPROPS] 2.129 PidLidFax3OriginalEntryId
    /// Canonical name: PidLidFax3OriginalEntryId
    /// Description: Specifies a one-off EntryID that corresponds to this fax address.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080D5
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.10
    /// Alternate names: dispidFax3OriginalEntryID
    static let lidFax3OriginalEntryId = NamedProperty(set: .address,
                                                                    lid: 0x000080D5)
    
    /// [MS-OXPROPS] 2.130 PidLidFExceptionalAttendees
    /// Canonical name: PidLidFExceptionalAttendees
    /// Description: Indicates that the object is a Recurring Calendar object with one or more exceptions,
    /// and that at least one of the Exception Embedded Message objects has at least one RecipientRow
    /// structure, as described in [MS-OXCDATA] section 2.8.3.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000822B
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.2.3
    /// Consuming reference: [MS-OXORMDR]
    /// Alternate names: dispidFExceptionalAttendees
    static let lidFExceptionalAttendees = NamedProperty(set: .appointment,
                                                                      lid: 0x0000822B)

    /// [MS-OXPROPS] 2.131 PidLidFExceptionalBody
    /// Canonical name: PidLidFExceptionalBody
    /// Description: Indicates that the Exception Embedded Message object has a body that differs from
    /// the Recurring Calendar object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008206
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.10.2.6
    /// Alternate names: dispidFExceptionalBody
    static let lidFExceptionalBody = NamedProperty(set: .appointment,
                                                                 lid: 0x00008206)

    /// [MS-OXPROPS] 2.132 PidLidFileUnder
    /// Canonical name: PidLidFileUnder
    /// Description: Specifies the name under which to file a contact when displaying a list of contacts.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008005
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.11
    /// Alternate names: dispidFileUnder
    static let lidFileUnder = NamedProperty(set: .address,
                                                          lid: 0x00008005)
    
    /// [MS-OXPROPS] 2.133 PidLidFileUnderId
    /// Canonical name: PidLidFileUnderId
    /// Description: Specifies how to generate and recompute the value of the PidLidFileUnder property
    /// (section 2.132) when other contact name properties change.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008006
    /// Data type: PtypInteger32, 0x0003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.12
    /// Alternate names: dispidFileUnderId
    static let lidFileUnderId = NamedProperty(set: .address,
                                                            lid: 0x00008006)

    /// [MS-OXPROPS] 2.134 PidLidFileUnderList
    /// Canonical name: PidLidFileUnderList
    /// Description: Specifies a list of possible values for the PidLidFileUnderId property (section 2.133).
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008026
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.13
    /// Alternate names: dispidFileUnderList
    static let lidFileUnderList = NamedProperty(set: .address,
                                                              lid: 0x00008026)

    /// [MS-OXPROPS] 2.135 PidLidFInvited
    /// Canonical name: PidLidFInvited
    /// Description: Indicates whether invitations have been sent for the meeting that this Meeting object
    /// represents.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008229
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/finvited
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.4
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidFInvited
    static let lidFInvited = NamedProperty(set: .appointment,
                                                         lid: 0x00008229)
    
    /// [MS-OXPROPS] 2.136 PidLidFlagRequest
    /// Canonical name: PidLidFlagRequest
    /// Description: Contains user-specifiable text to be associated with the flag.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008530
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:httpmail:messageflag, http://schemas.microsoft.com/mapi/request
    /// Area: Flagging
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.9
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-XWDCAL], [MS-OXORMDR]
    /// Alternate names: dispidRequest
    static let lidFlagRequest = NamedProperty(set: .common,
                                                            lid: 0x00008530)
    
    /// [MS-OXPROPS] 2.137 PidLidFlagString
    /// Canonical name: PidLidFlagString
    /// Description: Contains an index identifying one of a set of pre-defined text strings to be associated
    /// with the flag.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085C0
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.10
    /// Alternate names: dispidFlagStringEnum
    static let lidFlagString = NamedProperty(set: .common,
                                                            lid: 0x000085C0)

    /// [MS-OXPROPS] 2.138 PidLidForwardInstance
    /// Canonical name: PidLidForwardInstance
    /// Description: Indicates whether the Meeting Request object represents an exception to a
    /// recurring series, and whether it was forwarded (even when forwarded by the organizer) rather
    /// than being an invitation sent by the organizer.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000820A
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.3
    /// Alternate names: dispidFwrdInstance
    static let lidForwardInstance = NamedProperty(set: .appointment,
                                                                lid: 0x0000820A)
    
    /// [MS-OXPROPS] 2.139 PidLidForwardNotificationRecipients
    /// Canonical name: PidLidForwardNotificationRecipients
    /// Description: Contains a list of RecipientRow structures, as described in [MS-OXCDATA] section
    /// 2.8.3, that indicate the recipients of a meeting forward.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008261
    /// Data type: PtypBinary, 0x0102
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.9.3
    /// Alternate names: dispidForwardNotificationRecipients
    static let lidForwardNotificationRecipients = NamedProperty(set: .appointment,
                                                                              lid: 0x00008261)
    
    /// [MS-OXPROPS] 2.140 PidLidFOthersAppointment
    /// Canonical name: PidLidFOthersAppointment
    /// Description: Indicates whether the Calendar folder from which the meeting was opened is another
    /// user's calendar.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000822F
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.26
    /// Alternate names: dispidFOthersAppt, http://schemas.microsoft.com/mapi/fothersappt
    static let lidFOthersAppointment = NamedProperty(set: .appointment,
                                                                   lid: 0x0000822F)
    
    /// [MS-OXPROPS] 2.141 PidLidFreeBusyLocation
    /// Canonical name: PidLidFreeBusyLocation
    /// Description: Specifies a URL path from which a client can retrieve free/busy status information for
    /// the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080D8
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:calendar:fburl
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.10
    /// Consuming references: [MS-OXVCARD], [MS-XWDCAL]
    /// Alternate names: dispidFreeBusyLocation
    static let lidFreeBusyLocation = NamedProperty(set: .address,
                                                                 lid: 0x000080D8)

    /// [MS-OXPROPS] 2.142 PidLidGlobalObjectId
    /// Canonical name: PidLidGlobalObjectId
    /// Description: Contains an ID for an object that represents an exception to a recurring series.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000003
    /// Data type: PtypBinary, 0x0102
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.27
    /// Consuming references: [MS-OXCICAL], [MS-OXWAVLS]
    /// Alternate names: LID_GLOBAL_OBJID
    static let lidGlobalObjectId = NamedProperty(set: .meeting,
                                                               lid: 0x00000003)
    
    /// [MS-OXPROPS] 2.143 PidLidHasPicture
    /// Canonical name: PidLidHasPicture
    /// Description: Specifies whether the attachment has a picture.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008015
    /// Data type: PtypBoolean, 0x000B
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.8.1
    /// Alternate names: dispidHasPicture
    static let lidHasPicture = NamedProperty(set: .address,
                                                           lid: 0x00008015)
    
    /// [MS-OXPROPS] 2.144 PidLidHomeAddress
    /// Canonical name: PidLidHomeAddress
    /// Description: Specifies the complete address of the home address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000801A
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:homepostaladdress
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.8
    /// Alternate names: dispidHomeAddress
    static let lidHomeAddress = NamedProperty(set: .address,
                                                            lid: 0x0000801A)
    
    /// [MS-OXPROPS] 2.145 PidLidHomeAddressCountryCode
    /// Canonical name: PidLidHomeAddressCountryCode
    /// Description: Specifies the country code portion of the home address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080DA
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.6
    /// Alternate names: dispidHomeAddressCountryCode
    static let lidHomeAddressCountryCode = NamedProperty(set: .address,
                                                                       lid: 0x000080DA)
    
    /// [MS-OXPROPS] 2.146 PidLidHtml
    /// Canonical name: PidLidHtml
    /// Description: Specifies the business webpage URL of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000802B
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.12
    /// Alternate names: dispidHTML
    static let lidHtml = NamedProperty(set: .address,
                                                     lid: 0x0000802B)
    
    /// [MS-OXPROPS] 2.147 PidLidICalendarDayOfWeekMask
    /// Canonical name: PidLidICalendarDayOfWeekMask
    /// Description: Identifies the day of the week for the appointment or meeting.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00001001
    /// Data type: PtypInteger32, 0x0003
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.27
    /// Alternate names: http://schemas.microsoft.com/mapi/dayofweekmask
    static let lidICalendarDayOfWeekMask = NamedProperty(set: .common,
                                                                       lid: 0x00001001)
    
    /// [MS-OXPROPS] 2.148 PidLidInboundICalStream
    /// Canonical name: PidLidInboundICalStream
    /// Description: Contains the contents of the iCalendar MIME part of the original MIME message.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000827A
    /// Data type: PtypBinary, 0x0102
    /// Area: Calendar
    /// Defining reference: [MS-OXCICAL] section 2.1.3.4.1
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: InboundICalStream, dispidInboundICalStream
    static let lidInboundICalStream = NamedProperty(set: .appointment,
                                                                  lid: 0x0000827A)
    
    /// [MS-OXPROPS] 2.149 PidLidInfoPathFormName
    /// Canonical name: PidLidInfoPathFormName
    /// Description: Contains the name of the form associated with this message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085B1
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXCMSG] section 2.2.1.27
    /// Consuming reference: [MS-OXCMAIL]
    static let lidInfoPathFormName = NamedProperty(set: .common,
                                                                 lid: 0x000085B1)
    
    /// [MS-OXPROPS] 2.150 PidLidInstantMessagingAddress
    /// Canonical name: PidLidInstantMessagingAddress
    /// Description: Specifies the instant messaging address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008062
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.6
    /// Consuming reference: [MS-OXVCARD]
    /// Alternate names: dispidInstMsg
    static let lidInstantMessagingAddress = NamedProperty(set: .address,
                                                                        lid: 0x00008062)

    /// [MS-OXPROPS] 2.151 PidLidIntendedBusyStatus
    /// Canonical name: PidLidIntendedBusyStatus
    /// Description: Contains the value of the PidLidBusyStatus property (section 2.47) on the Meeting
    /// object in the organizer's calendar at the time that the Meeting Request object or Meeting
    /// Update object was sent.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008224
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/intendedbusystatus
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.4
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidIntendedBusyStatus
    static let lidIntendedBusyStatus = NamedProperty(set: .appointment,
                                                                   lid: 0x00008224)

    /// [MS-OXPROPS] 2.152 PidLidInternetAccountName
    /// Canonical name: PidLidInternetAccountName
    /// Description: Specifies the user-visible email account name through which the email message is sent.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008580
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.62
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCAL]
    /// Alternate names: dispidInetAcctName
    static let lidInternetAccountName = NamedProperty(set: .common,
                                                                    lid: 0x00008580)
    
    /// [MS-OXPROPS] 2.153 PidLidInternetAccountStamp
    /// Canonical name: PidLidInternetAccountStamp
    /// Description: Specifies the email account ID through which the email message is sent.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008581
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.63
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCAL]
    /// Alternate names: dispidInetAcctStamp
    static let lidInternetAccountStamp = NamedProperty(set: .common,
                                                                     lid: 0x00008581)

    /// [MS-OXPROPS] 2.154 PidLidIsContactLinked
    /// Canonical name: PidLidIsContactLinked
    /// Description: Specifies whether the contact is linked to other contacts.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080E0
    /// Data type: PtypBoolean, 0x000B
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.6
    /// Alternate names: dispidIsContactLinked
    static let lidIsContactLinked = NamedProperty(set: .address,
                                                                lid: 0x000080E0)

    /// [MS-OXPROPS] 2.155 PidLidIsException
    /// Canonical name: PidLidIsException
    /// Description: Indicates whether the object represents an exception (including an orphan instance).
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000000A
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/is_exception
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.35
    /// Consuming references: [MS-OXWAVLS], [MS-XWDCAL]
    /// Alternate names: LID_IS_EXCEPTION
    static let lidIsException = NamedProperty(set: .meeting,
                                                            lid: 0x0000000A)

    /// [MS-OXPROPS] 2.156 PidLidIsRecurring
    /// Canonical name: PidLidIsRecurring
    /// Description: Specifies whether the object is associated with a recurring series.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000005
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/is_recurring
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.13
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: LID_IS_RECURRING
    static let lidIsRecurring = NamedProperty(set: .meeting,
                                                            lid: 0x00000005)

    /// [MS-OXPROPS] 2.157 PidLidIsSilent
    /// Canonical name: PidLidIsSilent
    /// Description: Indicates whether the user did not include any text in the body of the Meeting
    /// Response object.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000004
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/is_silent
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.7.7
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: LID_IS_SILENT
    static let lidIsSilent = NamedProperty(set: .meeting,
                                                         lid: 0x00000004)

    /// [MS-OXPROPS] 2.158 PidLidLinkedTaskItems
    /// Canonical name: PidLidLinkedTaskItems
    /// Description: Indicates whether the user did not include any text in the body of the Meeting
    /// Response object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000820C
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Tasks
    /// Defining reference: [MS-OXOCAL] section 2.2.1.47
    /// Alternate names: dispidLinkedTaskItems
    static let lidLinkedTaskItems = NamedProperty(set: .appointment,
                                                                lid: 0x0000820C)

    /// [MS-OXPROPS] 2.159 PidLidLocation
    /// Canonical name: PidLidLocation
    /// Description: Specifies the location of the event.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008208
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:calendar:location
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.4
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR], [MS-OXWAVLS], [MS-XWDCAL]
    /// Alternate names: dispidLocation
    static let lidLocation = NamedProperty(set: .appointment,
                                                         lid: 0x00008208)
    
    /// [MS-OXPROPS] 2.160 PidLidLogDocumentPosted
    /// Canonical name: PidLidLogDocumentPosted
    /// Description: Indicates whether the document was sent by email or posted to a server folder during
    /// journaling.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008711
    /// Data type: PtypBoolean, 0x000B
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.10
    /// Alternate names: dispidLogDocPosted
    static let lidLogDocumentPosted = NamedProperty(set: .log,
                                                                  lid: 0x00008711)
    
    /// [MS-OXPROPS] 2.161 PidLidLogDocumentPrinted
    /// Canonical name: PidLidLogDocumentPrinted
    /// Description: Indicates whether the document was printed during journaling.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000870E
    /// Data type: PtypBoolean, 0x000B
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.7
    /// Alternate names: dispidLogDocPrinted
    static let lidLogDocumentPrinted = NamedProperty(set: .log,
                                                                   lid: 0x0000870E)
    
    /// [MS-OXPROPS] 2.162 PidLidLogDocumentRouted
    /// Canonical name: PidLidLogDocumentRouted
    /// Description: Indicates whether the document was sent to a routing recipient during journaling.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008710
    /// Data type: PtypBoolean, 0x000B
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.9
    /// Alternate names: dispidLogDocRouted
    static let lidLogDocumentRouted = NamedProperty(set: .log,
                                                                  lid: 0x00008710)
    
    /// [MS-OXPROPS] 2.163 PidLidLogDocumentSaved
    /// Canonical name: PidLidLogDocumentSaved
    /// Description: Indicates whether the document was saved during journaling.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000870F
    /// Data type: PtypBoolean, 0x000B
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.8
    /// Alternate names: dispidLogDocSaved
    static let lidLogDocumentSaved = NamedProperty(set: .log,
                                                                 lid: 0x0000870F)

    /// [MS-OXPROPS] 2.164 PidLidLogDuration
    /// Canonical name: PidLidLogDuration
    /// Description: Contains the duration, in minutes, of the activity.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008707
    /// Data type: PtypInteger32, 0x0003
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.5
    /// Alternate names: dispidLogDuration
    static let lidLogDuration = NamedProperty(set: .log,
                                                            lid: 0x00008707)

    /// [MS-OXPROPS] 2.165 PidLidLogEnd
    /// Canonical name: PidLidLogEnd
    /// Description: Contains the time, in UTC, at which the activity ended.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008708
    /// Data type: PtypTime, 0x0040
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.4
    /// Alternate names: dispidLogEnd
    static let lidLogEnd = NamedProperty(set: .log,
                                                       lid: 0x00008708)

    /// [MS-OXPROPS] 2.166 PidLidLogFlags
    /// Canonical name: PidLidLogFlags
    /// Description: Contains metadata about the Journal object.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000870C
    /// Data type: PtypInteger32, 0x0003
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.6
    /// Alternate names: dispidLogFlags
    static let lidLogFlags = NamedProperty(set: .log,
                                                         lid: 0x0000870C)

    /// [MS-OXPROPS] 2.167 PidLidLogStart
    /// Canonical name: PidLidLogStart
    /// Description: Contains the time, in UTC, at which the activity began.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008706
    /// Data type: PtypTime, 0x0040
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.3
    /// Alternate names: dispidLogStart
    static let lidLogStart = NamedProperty(set: .log,
                                                         lid: 0x00008706)

    /// [MS-OXPROPS] 2.168 PidLidLogType
    /// Canonical name: PidLidLogType
    /// Description: Briefly describes the journal activity that is being recorded.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008700
    /// Data type: PtypString, 0x001F
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.1
    /// Alternate names: dispidLogType
    static let lidLogType = NamedProperty(set: .log,
                                                        lid: 0x00008700)
    
    /// [MS-OXPROPS] 2.169 PidLidLogTypeDesc
    /// Canonical name: PidLidLogTypeDesc
    /// Description: Contains an expanded description of the journal activity that is being recorded.
    /// Property set: PSETID_Log {0006200A-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008712
    /// Data type: PtypString, 0x001F
    /// Area: Journal
    /// Defining reference: [MS-OXOJRNL] section 2.2.1.2
    /// Alternate names: dispidLogTypeDesc
    static let lidLogTypeDesc = NamedProperty(set: .log,
                                                            lid: 0x00008712)
    
    /// [MS-OXPROPS] 2.170 PidLidMeetingType
    /// Canonical name: PidLidMeetingType
    /// Description: Indicates the type of Meeting Request object or Meeting Update object.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000026
    /// Data type: PtypInteger32, 0x0003
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.5
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidMeetingType
    static let lidMeetingType = NamedProperty(set: .meeting,
                                                            lid: 0x00000026)
    
    /// [MS-OXPROPS] 2.171 PidLidMeetingWorkspaceUrl
    /// Canonical name: PidLidMeetingWorkspaceUrl
    /// Description: Specifies the URL of the Meeting Workspace that is associated with a Calendar
    /// object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008209
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/meetingworkspaceurl
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.48
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidMWSURL
    static let lidMeetingWorkspaceUrl = NamedProperty(set: .appointment,
                                                                    lid: 0x00008209)
    
    /// [MS-OXPROPS] 2.172 PidLidMonthInterval
    /// Canonical name: PidLidMonthInterval
    /// Description: Indicates the monthly interval of the appointment or meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000013
    /// Data type: PtypInteger16, 0x0002
    /// WebDAV: http://schemas.microsoft.com/mapi/month_interval
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.33
    /// Alternate names: LID_MONTH_INTERVAL
    static let lidMonthInterval = NamedProperty(set: .meeting,
                                                              lid: 0x00000013)
    
    /// [MS-OXPROPS] 2.173 PidLidMonthOfYear
    /// Canonical name: PidLidMonthOfYear
    /// Description: Indicates the month of the year in which the appointment or meeting occurs.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00001006
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/monthofyear
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.34
    static let lidMonthOfYear = NamedProperty(set: .common,
                                                            lid: 0x00001006)
    
    /// [MS-OXPROPS] 2.174 PidLidMonthOfYearMask
    /// Canonical name: PidLidMonthOfYearMask
    /// Description: Indicates the calculated month of the year in which the appointment or meeting occurs.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000017
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/moy_mask
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.35
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: LID_MOY_MASK
    static let lidMonthOfYearMask = NamedProperty(set: .meeting,
                                                                lid: 0x00000017)

    /// [MS-OXPROPS] 2.175 PidLidNetShowUrl
    /// Canonical name: PidLidNetShowUrl
    /// Description: Specifies the URL to be launched when the user joins the meeting.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008248
    /// Data type: PtypString, 0x001F
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.8
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidNetShowURL
    static let lidNetShowUrl = NamedProperty(set: .appointment,
                                                           lid: 0x00008248)
    
    /// [MS-OXPROPS] 2.176 PidLidNoEndDateFlag
    /// Canonical name: PidLidNoEndDateFlag
    /// Description: Indicates whether the recurrence pattern has an end date.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000100B
    /// Data type: PtypBoolean, 0x000B
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.36
    /// Alternate names: http://schemas.microsoft.com/mapi/fnoenddate
    static let lidNoEndDateFlag = NamedProperty(set: .common,
                                                              lid: 0x0000100B)

    /// [MS-OXPROPS] 2.177 PidLidNonSendableBcc
    /// Canonical name: PidLidNonSendableBcc
    /// Description: Contains a list of all of the unsendable attendees who are also resources.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008538
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/nonsendablebcc
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.21
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidNonSendableBCC
    static let lidNonSendableBcc = NamedProperty(set: .common,
                                                               lid: 0x00008538)
    
    /// [MS-OXPROPS] 2.178 PidLidNonSendableCc
    /// Canonical name: PidLidNonSendableCc
    /// Description: Contains a list of all of the unsendable attendees who are also optional attendees.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008537
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/nonsendablecc
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.20
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidNonSendableCC
    static let lidNonSendableCc = NamedProperty(set: .common,
                                                               lid: 0x00008537)

    /// [MS-OXPROPS] 2.179 PidLidNonSendableTo
    /// Canonical name: PidLidNonSendableTo
    /// Description: Contains a list of all of the unsendable attendees who are also required attendees.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008536
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/nonsendableto
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.19
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidNonSendableTo
    static let lidNonSendableTo = NamedProperty(set: .common,
                                                              lid: 0x00008536)

    /// [MS-OXPROPS] 2.180 PidLidNonSendBccTrackStatus
    /// Canonical name: PidLidNonSendBccTrackStatus
    /// Description: Contains the value from the response table.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008545
    /// Data type: PtypMultipleInteger32, 0x1003
    /// WebDAV: http://schemas.microsoft.com/mapi/nonsendbcctrackstatus
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.24
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidNonSendBccTrackStatus
    static let lidNonSendBccTrackStatus = NamedProperty(set: .common,
                                                                      lid: 0x00008545)

    /// [MS-OXPROPS] 2.181 PidLidNonSendCcTrackStatus
    /// Canonical name: PidLidNonSendCcTrackStatus
    /// Description: Contains the value from the response table.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008544
    /// Data type: PtypMultipleInteger32, 0x1003
    /// WebDAV: http://schemas.microsoft.com/mapi/nonsendcctrackstatus
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.23
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidNonSendCcTrackStatus
    static let lidNonSendCcTrackStatus = NamedProperty(set: .common,
                                                                     lid: 0x00008544)

    /// [MS-OXPROPS] 2.182 PidLidNonSendToTrackStatus
    /// Canonical name: PidLidNonSendToTrackStatus
    /// Description: Contains the value from the response table.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008543
    /// Data type: PtypMultipleInteger32, 0x1003
    /// WebDAV: http://schemas.microsoft.com/mapi/nonsendtotrackstatus
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.22
    /// Consuming references: [MS-XWDCAL]
    /// Alternate names: dispidNonSendToTrackStatus
    static let lidNonSendToTrackStatus = NamedProperty(set: .common,
                                                                     lid: 0x00008543)
    
    /// [MS-OXPROPS] 2.183 PidLidNoteColor
    /// Canonical name: PidLidNoteColor
    /// Description: Specifies the suggested background color of the Note object.
    /// Property set: PSETID_Note {0006200E-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008B00
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sticky Notes
    /// Defining reference: [MS-OXONOTE] section 2.2.1.1
    /// Alternate names: dispidNoteColor
    static let lidNoteColor = NamedProperty(set: .note,
                                                          lid: 0x00008B00)

    /// [MS-OXPROPS] 2.184 PidLidNoteHeight
    /// Canonical name: PidLidNoteHeight
    /// Description: Specifies the height of the visible message window in pixels.
    /// Property set: PSETID_Note {0006200E-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008B03
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sticky Notes
    /// Defining reference: [MS-OXONOTE] section 2.2.1.3
    /// Alternate names: dispidNoteHeight
    static let lidNoteHeight = NamedProperty(set: .note,
                                                          lid: 0x00008B03)
    
    /// [MS-OXPROPS] 2.185 PidLidNoteWidth
    /// Canonical name: PidLidNoteWidth
    /// Description: Specifies the width of the visible message window in pixels.
    /// Property set: PSETID_Note {0006200E-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008B02
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sticky Notes
    /// Defining reference: [MS-OXONOTE] section 2.2.1.2
    /// Alternate names: dispidNoteWidth
    static let lidNoteWidth = NamedProperty(set: .note,
                                                          lid: 0x00008B02)

    /// [MS-OXPROPS] 2.186 PidLidNoteX
    /// Canonical name: PidLidNoteX
    /// Description: Specifies the distance, in pixels, from the left edge of the screen that a user interface
    /// displays a Note object.
    /// Property set: PSETID_Note {0006200E-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008B04
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sticky Notes
    /// Defining reference: [MS-OXONOTE] section 2.2.1.4
    /// Alternate names: dispidNoteX
    static let lidNoteX = NamedProperty(set: .note,
                                                      lid: 0x00008B04)

    /// [MS-OXPROPS] 2.187 PidLidNoteY
    /// Canonical name: PidLidNoteY
    /// Description: Specifies the distance, in pixels, from the top edge of the screen that a user interface
    /// displays a Note object.
    /// Property set: PSETID_Note {0006200E-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008B05
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sticky Notes
    /// Defining reference: [MS-OXONOTE] section 2.2.1.5
    /// Alternate names: dispidNoteY
    static let lidNoteY = NamedProperty(set: .note,
                                                      lid: 0x00008B05)
    
    /// [MS-OXPROPS] 2.188 PidLidOccurrences
    /// Canonical name: PidLidOccurrences
    /// Description: Indicates the number of occurrences in the recurring appointment or meeting.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00001005
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/occurrences
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.43
    static let lidOccurrences = NamedProperty(set: .common,
                                                            lid: 0x00001005)

    /// [MS-OXPROPS] 2.189 PidLidOldLocation
    /// Canonical name: PidLidOldLocation
    /// Description: Indicates the original value of the PidLidLocation property (section 2.159) before a
    /// meeting update.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000028
    /// Data type: PtypString, 0x001F
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.7
    /// Alternate names: dispidOldLocation
    static let lidOldLocation = NamedProperty(set: .meeting,
                                                            lid: 0x00000028)
    
    /// [MS-OXPROPS] 2.190 PidLidOldRecurrenceType
    /// Canonical name: PidLidOldRecurrenceType
    /// Description: Indicates the recurrence pattern for the appointment or meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000018
    /// Data type: PtypInteger16, 0x0002
    /// WebDAV: http://schemas.microsoft.com/mapi/recur_type
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.44
    /// Alternate names: LID_RECUR_TYPE
    static let lidOldRecurrenceType = NamedProperty(set: .meeting,
                                                                  lid: 0x00000018)
    
    /// [MS-OXPROPS] 2.191 PidLidOldWhenEndWhole
    /// Canonical name: PidLidOldWhenEndWhole
    /// Description: Indicates the original value of the PidLidAppointmentEndWhole property (section
    /// 2.14) before a meeting update.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000002A
    /// Data type: PtypTime, 0x0040
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.9
    /// Alternate names: dispidOldWhenEndWhole
    static let lidOldWhenEndWhole = NamedProperty(set: .meeting,
                                                                lid: 0x0000002A)
    
    /// [MS-OXPROPS] 2.192 PidLidOldWhenStartWhole
    /// Canonical name: PidLidOldWhenStartWhole
    /// Description: Indicates the original value of the PidLidAppointmentStartWhole property (section
    /// 2.29) before a meeting update.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000029
    /// Data type: PtypTime, 0x0040
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.6.8
    /// Alternate names: dispidOldWhenStartWhole
    static let lidOldWhenStartWhole = NamedProperty(set: .meeting,
                                                                  lid: 0x00000029)

    /// [MS-OXPROPS] 2.193 PidLidOnlinePassword
    /// Canonical name: PidLidOnlinePassword
    /// Description: Specifies the password for a meeting on which the PidLidConferencingType property
    /// (section 2.66) has the value 0x00000002.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008249
    /// Data type: PtypString, 0x001F
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.9
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: dispidOnlinePassword
    static let lidOnlinePassword = NamedProperty(set: .appointment,
                                                               lid: 0x00008249)

    /// [MS-OXPROPS] 2.194 PidLidOptionalAttendees
    /// Canonical name: PidLidOptionalAttendees
    /// Description: Specifies optional attendees.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000007
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/optional_attendees
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.45
    /// Alternate names: LID_OPTIONAL_ATTENDEES
    static let lidOptionalAttendees = NamedProperty(set: .meeting,
                                                                  lid: 0x00000007)
    
    /// [MS-OXPROPS] 2.195 PidLidOrganizerAlias
    /// Canonical name: PidLidOrganizerAlias
    /// Description: Specifies the email address of the organizer.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008243
    /// Data type: PtypString, 0x001F
    /// Area: Conferencing
    /// Defining reference: [MS-OXOCAL] section 2.2.1.56.6
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: dispidOrgAlias
    static let lidOrganizerAlias = NamedProperty(set: .appointment,
                                                               lid: 0x00008243)

    /// [MS-OXPROPS] 2.196 PidLidOriginalStoreEntryId
    /// Canonical name: PidLidOriginalStoreEntryId
    /// Description: Specifies the EntryID of the delegator’s message store.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008237
    /// Data type: PtypBinary, 0x0102
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.4.9
    /// Alternate names: dispidOrigStoreEid, http://schemas.microsoft.com/mapi/origstoreeid
    static let lidOriginalStoreEntryId = NamedProperty(set: .appointment,
                                                                     lid: 0x00008237)

    /// [MS-OXPROPS] 2.197 PidLidOtherAddress
    /// Canonical name: PidLidOtherAddress
    /// Description: Specifies the complete address of the other address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000801C
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:otherpostaladdress
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.8
    /// Alternate names: dispidOtherAddress
    static let lidOtherAddress = NamedProperty(set: .address,
                                                             lid: 0x0000801C)
    
    /// [MS-OXPROPS] 2.198 PidLidOtherAddressCountryCode
    /// Canonical name: PidLidOtherAddressCountryCode
    /// Description: Specifies the country code portion of the other address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080DC
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.6
    /// Alternate names: dispidOtherAddressCountryCode
    static let lidOtherAddressCountryCode = NamedProperty(set: .address,
                                                                        lid: 0x000080DC)

    /// [MS-OXPROPS] 2.199 PidLidOwnerCriticalChange
    /// Canonical name: PidLidOwnerCriticalChange
    /// Description: Specifies the date and time at which a Meeting Request object was sent by the
    /// organizer.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000001A
    /// Data type: PtypTime, 0x0040
    /// WebDAV: urn:schemas:calendar:dtstamp,
    /// http://schemas.microsoft.com/mapi/owner_critical_change
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.34
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: LID_OWNER_CRITICAL_CHANGE
    static let lidOwnerCriticalChange = NamedProperty(set: .meeting,
                                                                    lid: 0x0000001A)
    
    /// [MS-OXPROPS] 2.200 PidLidOwnerName
    /// Canonical name: PidLidOwnerName
    /// Description: Indicates the name of the owner of the mailbox.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000822E
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/ownername
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.47
    /// Alternate names: dispidOwnerName
    static let lidOwnerName = NamedProperty(set: .appointment,
                                                          lid: 0x0000822E)

    /// [MS-OXPROPS] 2.201 PidLidPendingStateForSiteMailboxDocument
    /// Canonical name: PidLidPendingStateForSiteMailboxDocument
    /// Description: Specifies the synchronization state of the Document object that is in the Document
    /// Libraries folder of the site mailbox.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085E0
    /// Data type: PtypInteger32, 0x0003
    /// Area: Site Mailbox
    /// Defining reference: [MS-OXODOC] section 2.2.1.34
    /// Alternate names: dispidPendingStateforTMDocument
    static let lidPendingStateForSiteMailboxDocument = NamedProperty(set: .common,
                                                                                   lid: 0x000085E0)
    /// [MS-OXPROPS] 2.202 PidLidPercentComplete
    /// Canonical name: PidLidPercentComplete
    /// Description: Indicates whether a time-flagged Message object is complete.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008102
    /// Data type: PtypFloating64, 0x0005
    /// Area: Tasks
    /// Defining reference: [MS-OXOFLAG] section 2.2.2.3
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXCMAIL], [MS-OXOTASK]
    /// Alternate names: dispidPercentComplete
    static let lidPercentComplete = NamedProperty(set: .task,
                                                                lid: 0x00008102)

    /// [MS-OXPROPS] 2.203 PidLidPostalAddressId
    /// Canonical name: PidLidPostalAddressId
    /// Description: Specifies which physical address is the mailing address for this contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008022
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: urn:schemas:contacts:mailingaddressid
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.9
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: dispidPostalAddressId
    static let lidPostalAddressId = NamedProperty(set: .address,
                                                                lid: 0x00008022)
    
    /// [MS-OXPROPS] 2.204 PidLidPostRssChannel
    /// Canonical name: PidLidPostRssChannel
    /// Description: Contains the contents of the title field from the XML of the Atom feed or RSS channel.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008904
    /// Data type: PtypString, 0x001F
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.5
    /// Alternate names: dispidPostRssChannel
    static let lidPostRssChannel = NamedProperty(set: .postRss,
                                                               lid: 0x00008904)
    
    /// [MS-OXPROPS] 2.205 PidLidPostRssChannelLink
    /// Canonical name: PidLidPostRssChannelLink
    /// Description: Contains the URL of the RSS or Atom feed from which the XML file came.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008900
    /// Data type: PtypString, 0x001F
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.1
    /// Alternate names: dispidPostRssChannelLink
    static let lidPostRssChannelLink = NamedProperty(set: .postRss,
                                                                   lid: 0x00008900)
    
    /// [MS-OXPROPS] 2.206 PidLidPostRssItemGuid
    /// Canonical name: PidLidPostRssItemGuid
    /// Description: Contains a unique identifier for the RSS object.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008903
    /// Data type: PtypString, 0x001F
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.4
    /// Alternate names: dispidPostRssItemGuid
    static let lidPostRssItemGuid = NamedProperty(set: .postRss,
                                                                lid: 0x00008903)
    
    /// [MS-OXPROPS] 2.207 PidLidPostRssItemHash
    /// Canonical name: PidLidPostRssItemHash
    /// Description: Contains a hash of the feed XML computed by using an implementation-dependent
    /// algorithm.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008902
    /// Data type: PtypInteger32, 0x0003
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.3
    /// Alternate names: dispidPostRssItemHash
    static let lidPostRssItemHash = NamedProperty(set: .postRss,
                                                                lid: 0x00008902)
    
    /// [MS-OXPROPS] 2.208 PidLidPostRssItemLink
    /// Canonical name: PidLidPostRssItemLink
    /// Description: Contains the URL of the link from an RSS or Atom item.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008901
    /// Data type: PtypString, 0x001F
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.2
    /// Alternate names: dispidPostRssItemLink
    static let lidPostRssItemLink = NamedProperty(set: .postRss,
                                                                lid: 0x00008901)
    
    /// [MS-OXPROPS] 2.209 PidLidPostRssItemXml
    /// Canonical name: PidLidPostRssItemXml
    /// Description: Contains the item element and all of its sub-elements from an RSS feed, or the entry
    /// element and all of its sub-elements from an Atom feed.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008905
    /// Data type: PtypString, 0x001F
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.6
    /// Alternate names: dispidPostRssItemXml
    static let lidPostRssItemXml = NamedProperty(set: .postRss,
                                                               lid: 0x00008905)
    
    /// [MS-OXPROPS] 2.210 PidLidPostRssSubscription
    /// Canonical name: PidLidPostRssSubscription
    /// Description: Contains the user's preferred name for the RSS or Atom subscription.
    /// Property set: PSETID_PostRss {00062041-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008906
    /// Data type: PtypString, 0x001F
    /// Area: RSS
    /// Defining reference: [MS-OXORSS] section 2.2.1.7
    /// Alternate names: dispidPostRssSubscription
    static let lidPostRssSubscription = NamedProperty(set: .postRss,
                                                                    lid: 0x00008906)

    /// [MS-OXPROPS] 2.211 PidLidPrivate
    /// Canonical name: PidLidPrivate
    /// Description: Indicates whether the end user wishes for this Message object to be hidden from other
    /// users who have access to the Message object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008506
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.15
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCAL], [MS-OXOCNTC], [MS-OXODOC], [MSOXTNEF], [MS-OXONOTE], [MS-OXORMMS], [MS-OXOJRNL], [MS-OXOPOST], [MS-OXOTASK]
    /// Alternate names: dispidPrivate
    static let lidPrivate = NamedProperty(set: .common,
                                                        lid: 0x00008506)

    /// [MS-OXPROPS] 2.212 PidLidPromptSendUpdate
    /// Canonical name: PidLidPromptSendUpdate
    /// Description: Indicates that the Meeting Response object was out-of-date when it was received.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008045
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meeting Response
    /// Defining reference: [MS-OXOCAL] section 2.2.7.8
    /// Alternate names: dispidPromptSendUpdate
    static let lidPromptSendUpdate = NamedProperty(set: .common,
                                                                 lid: 0x00008045)

    /// [MS-OXPROPS] 2.213 PidLidRecurrenceDuration
    /// Canonical name: PidLidRecurrenceDuration
    /// Description: Identifies the length, in minutes, of the appointment or meeting.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000100D
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/recurduration
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.7.48
    static let lidRecurrenceDuration = NamedProperty(set: .common,
                                                                   lid: 0x0000100D)
    
    /// [MS-OXPROPS] 2.214 PidLidRecurrencePattern
    /// Canonical name: PidLidRecurrencePattern
    /// Description: Specifies a description of the recurrence pattern of the Calendar object.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008232
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/recurpattern
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.46
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidRecurPattern
    static let lidRecurrencePattern = NamedProperty(set: .appointment,
                                                                  lid: 0x00008232)

    /// [MS-OXPROPS] 2.215 PidLidRecurrenceType
    /// Canonical name: PidLidRecurrenceType
    /// Description: Specifies the recurrence type of the recurring series.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008231
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/recurtype
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.45
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidRecurType
    static let lidRecurrenceType = NamedProperty(set: .appointment,
                                                               lid: 0x00008231)

    /// [MS-OXPROPS] 2.216 PidLidRecurring
    /// Canonical name: PidLidRecurring
    /// Description: Specifies whether the object represents a recurring series.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008223
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/recurring
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.12
    /// Consuming references: [MS-OXCDATA], [MS-OXOSFLD], [MS-OXWAVLS], [MS-XWDCAL]
    /// Alternate names: dispidRecurring
    static let lidRecurring = NamedProperty(set: .appointment,
                                                          lid: 0x00008223)

    /// [MS-OXPROPS] 2.217 PidLidReferenceEntryId
    /// Canonical name: PidLidReferenceEntryId
    /// Description: Specifies the value of the EntryID of the Contact object unless the Contact object is a
    /// copy of an earlier original.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085BD
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.1
    /// Alternate names: dispidReferenceEID
    static let lidReferenceEntryId = NamedProperty(set: .common,
                                                                 lid: 0x000085BD)

    /// [MS-OXPROPS] 2.218 PidLidReminderDelta
    /// Canonical name: PidLidReminderDelta
    /// Description: Specifies the interval, in minutes, between the time at which the reminder first
    /// becomes overdue and the start time of the Calendar object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008501
    /// Data type: PtypInteger32, 0x0003
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.3
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MS-OXODOC], [MSOXOFLAG], [MS-OXTNEF], [MS-XWDCAL], [MS-OXONOTE], [MS-OXORMMS], [MS-OXOJRNL], [MSOXOPOST]
    /// Alternate names: dispidReminderDelta, http://schemas.microsoft.com/mapi/reminderdelta
    static let lidReminderDelta = NamedProperty(set: .common,
                                                              lid: 0x00008501)

    /// [MS-OXPROPS] 2.219 PidLidReminderFileParameter
    /// Canonical name: PidLidReminderFileParameter
    /// Description: Specifies the filename of the sound that a client is to play when the reminder for that
    /// object becomes overdue.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000851F
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/reminderfileparam
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.7
    /// Consuming reference: [MS-XWDCAL], [MS-OXOCAL]
    /// Alternate names: dispidReminderFileParam
    static let lidReminderFileParameter = NamedProperty(set: .common,
                                                                      lid: 0x0000851F)

    /// [MS-OXPROPS] 2.220 PidLidReminderOverride
    /// Canonical name: PidLidReminderOverride
    /// Description: Specifies whether the client is to respect the current values of the
    /// PidLidReminderPlaySound property (section 2.221) and the PidLidReminderFileParameter
    /// property (section 2.219), or use the default values for those properties.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000851C
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/reminderoverride
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.5
    /// Consuming reference: [MS-XWDCAL], [MS-OXOCAL]
    /// Alternate names: dispidReminderOverride
    static let lidReminderOverride = NamedProperty(set: .common,
                                                                 lid: 0x0000851C)
    
    /// [MS-OXPROPS] 2.221 PidLidReminderPlaySound
    /// Canonical name: PidLidReminderPlaySound
    /// Description: Specifies whether the client is to play a sound when the reminder becomes overdue.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000851E
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/reminderplaysound
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.6
    /// Consuming reference: [MS-XWDCAL], [MS-OXOCAL]
    /// Alternate names: dispidReminderPlaySound
    static let lidReminderPlaySound = NamedProperty(set: .common,
                                                                  lid: 0x0000851E)

    /// [MS-OXPROPS] 2.222 PidLidReminderSet
    /// Canonical name: PidLidReminderSet
    /// Description: Specifies whether a reminder is set on the object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008503
    /// Data type: PtypBoolean, 0x000B
    /// WebDAV: http://schemas.microsoft.com/mapi/reminderset
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.1
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MSOXOCFG], [MS-OXODOC], [MS-OXOFLAG], [MS-OXOSFLD], [MS-OXOTASK], [MS-OXTNEF], [MSOXWAVLS], [MS-XWDCAL], [MS-OXOCNTC], [MS-OXONOTE], [MS-OXORMMS], [MS-OXOPOST]
    /// Alternate names: dispidReminderSet
    static let lidReminderSet = NamedProperty(set: .common,
                                                            lid: 0x00008503)

    /// [MS-OXPROPS] 2.223 PidLidReminderSignalTime
    /// Canonical name: PidLidReminderSignalTime
    /// Description: Specifies the point in time when a reminder transitions from pending to overdue.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008560
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/remindernexttime
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.2
    /// Consuming references: [MS-OXCICAL], [MS-OXOCAL], [MS-OXOFLAG], [MS-XWDCAL], [MSOXODOC]
    /// Alternate names: dispidReminderNextTime
    static let lidReminderSignalTime = NamedProperty(set: .common,
                                                                   lid: 0x00008560)
    
    /// [MS-OXPROPS] 2.224 PidLidReminderTime
    /// Canonical name: PidLidReminderTime
    /// Description: Specifies the initial signal time for objects that are not Calendar objects.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008502
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/remindertime
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.4
    /// Consuming references: [MS-OXCICAL], [MS-OXOCAL], [MS-OXOFLAG], [MS-XWDCAL]
    /// Alternate names: dispidReminderTime
    static let lidReminderTime = NamedProperty(set: .common,
                                                             lid: 0x00008502)

    /// [MS-OXPROPS] 2.225 PidLidReminderTimeDate
    /// Canonical name: PidLidReminderTimeDate
    /// Description: Indicates the time and date of the reminder for the appointment or meeting.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008505
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/remindertimedate
    /// Area: Reminders
    /// Defining reference: [MS-XWDCAL] section 2.2.7.59
    /// Alternate names: dispidReminderTimeDate
    static let lidReminderTimeDate = NamedProperty(set: .common,
                                                                 lid: 0x00008505)

    /// [MS-OXPROPS] 2.226 PidLidReminderTimeTime
    /// Canonical name: PidLidReminderTimeTime
    /// Description: Indicates the time of the reminder for the appointment or meeting.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008504
    /// Data type: PtypTime, 0x0040
    /// WebDAV: http://schemas.microsoft.com/mapi/remindertimetime
    /// Area: Reminders
    /// Defining reference: [MS-XWDCAL] section 2.2.7.60
    /// Consuming references: [MS-OXONOTE], [MS-OXOJRNL], [MS-OXOPOST]
    /// Alternate names: dispidReminderTimeTime
    static let lidReminderTimeTime = NamedProperty(set: .common,
                                                                 lid: 0x00008504)

    /// [MS-OXPROPS] 2.227 PidLidReminderType
    /// Canonical name: PidLidReminderType
    /// Description: This property is not set and, if set, is ignored.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000851D
    /// Data type: PtypInteger32, 0x0003
    /// Area: Reminders
    /// Defining reference: [MS-OXORMDR] section 2.2.1.9
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: dispidReminderType, http://schemas.microsoft.com/mapi/remindertype
    static let lidReminderType = NamedProperty(set: .common,
                                                             lid: 0x0000851D)

    /// [MS-OXPROPS] 2.228 PidLidRemoteStatus
    /// Canonical name: PidLidRemoteStatus
    /// Description: Indicates the remote status of the calendar item.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008511
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/remotestatus
    /// Area: Run-time configuration
    /// Defining reference: [MS-XWDCAL] section 2.2.7.62
    /// Alternate names: dispidRemoteStatus
    static let lidRemoteStatus = NamedProperty(set: .common,
                                                             lid: 0x00008511)
    
    /// [MS-OXPROPS] 2.229 PidLidRequiredAttendees
    /// Canonical name: PidLidRequiredAttendees
    /// Description: Identifies required attendees for the appointment or meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000006
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/required_attendees
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.63
    /// Consuming references: [MS-OXOCAL]
    /// Alternate names: LID_REQUIRED_ATTENDEES
    static let lidRequiredAttendees = NamedProperty(set: .meeting,
                                                                  lid: 0x00000006)
    
    /// [MS-OXPROPS] 2.230 PidLidResourceAttendees
    /// Canonical name: PidLidResourceAttendees
    /// Description: Identifies resource attendees for the appointment or meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000008
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/resource_attendees
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.64
    /// Consuming references: [MS-OXOCAL]
    /// Alternate names: LID_RESOURCE_ATTENDEES
    static let lidResourceAttendees = NamedProperty(set: .meeting,
                                                                  lid: 0x00000008)

    /// [MS-OXPROPS] 2.231 PidLidResponseStatus
    /// Canonical name: PidLidResponseStatus
    /// Description: Specifies the response status of an attendee.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008218
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: urn:schemas:calendar:attendeestatus, http://schemas.microsoft.com/mapi/responsestatus
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.11
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidResponseStatus
    static let lidResponseStatus = NamedProperty(set: .appointment,
                                                              lid: 0x00008218)

    /// [MS-OXPROPS] 2.232 PidLidServerProcessed
    /// Canonical name: PidLidServerProcessed
    /// Description: Indicates whether the Meeting Request object or Meeting Update object has been
    /// processed.
    /// Property set: PSETID_CalendarAssistant {11000E07-B51B-40D6-AF21-CAA85EDAB1D0}
    /// Property long ID (LID): 0x000085CC
    /// Data type: PtypBoolean, 0x000B
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.5.4
    /// Alternate names: dispidExchangeProcessed
    static let lidServerProcessed = NamedProperty(set: .calendarAssistant,
                                                                lid: 0x000085CC)

    /// [MS-OXPROPS] 2.233 PidLidServerProcessingActions
    /// Canonical name: PidLidServerProcessingActions
    /// Description: Indicates what processing actions have been taken on this Meeting Request object
    /// or Meeting Update object.
    /// Property set: PSETID_CalendarAssistant {11000E07-B51B-40D6-AF21-CAA85EDAB1D0}
    /// Property long ID (LID): 0x000085CD
    /// Data type: PtypInteger32, 0x0003
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.5.5
    /// Alternate names: dispidExchangeProcessingAction
    static let lidServerProcessingActions = NamedProperty(set: .calendarAssistant,
                                                                        lid: 0x000085CD)

    /// [MS-OXPROPS] 2.234 PidLidSharingAnonymity
    /// Canonical name: PidLidSharingAnonymity
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A19
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingAnonymity
    static let lidSharingAnonymity = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A19)
    
    /// [MS-OXPROPS] 2.235 PidLidSharingBindingEntryId
    /// Canonical name: PidLidSharingBindingEntryId
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A2D
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingBindingEid
    static let lidSharingBindingEntryId = NamedProperty(set: .sharing,
                                                                      lid: 0x00008A2D)
    
    /// [MS-OXPROPS] 2.236 PidLidSharingBrowseUrl
    /// Canonical name: PidLidSharingBrowseUrl
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A51
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingBrowseUrl
    static let lidSharingBrowseUrl = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A51)

    /// [MS-OXPROPS] 2.237 PidLidSharingCapabilities
    /// Canonical name: PidLidSharingCapabilities
    /// Description: Indicates that the Message object relates to a special folder.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A17
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.1
    /// Alternate names: dispidSharingCaps
    static let lidSharingCapabilities = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A17)

    /// [MS-OXPROPS] 2.238 PidLidSharingConfigurationUrl
    /// Canonical name: PidLidSharingConfigurationUrl
    /// Description: Contains a zero-length string.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A24
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.3
    /// Alternate names: dispidSharingConfigUrl
    static let lidSharingConfigurationUrl = NamedProperty(set: .sharing,
                                                                        lid: 0x00008A24)

    /// [MS-OXPROPS] 2.239 PidLidSharingDataRangeEnd
    /// Canonical name: PidLidSharingDataRangeEnd
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A45
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingDataRangeEnd
    static let lidSharingDataRangeEnd = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A45)
    
    /// [MS-OXPROPS] 2.240 PidLidSharingDataRangeStart
    /// Canonical name: PidLidSharingDataRangeStart
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A44
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingDataRangeStart
    static let lidSharingDataRangeStart = NamedProperty(set: .sharing,
                                                                      lid: 0x00008A44)
    
    /// [MS-OXPROPS] 2.241 PidLidSharingDetail
    /// Canonical name: PidLidSharingDetail
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A2B
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingDetail
    static let lidSharingDetail = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A2B)
    
    /// [MS-OXPROPS] 2.242 PidLidSharingExtensionXml
    /// Canonical name: PidLidSharingExtensionXml
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A21
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingExtXml
    static let lidSharingExtensionXml = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A21)

    /// [MS-OXPROPS] 2.243 PidLidSharingFilter
    /// Canonical name: PidLidSharingFilter
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A13
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingFilter
    static let lidSharingFilter = NamedProperty(set: .sharing,
                                                              lid: 0x00008A13)
    
    /// [MS-OXPROPS] 2.244 PidLidSharingFlags
    /// Canonical name: PidLidSharingFlags
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A0A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingFlags
    static let lidSharingFlags = NamedProperty(set: .sharing,
                                                             lid: 0x00008A0A)
    
    /// [MS-OXPROPS] 2.245 PidLidSharingFlavor
    /// Canonical name: PidLidSharingFlavor
    /// Description: Indicates the type of Sharing Message object.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A18
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.5
    /// Alternate names: dispidSharingFlavor
    static let lidSharingFlavor = NamedProperty(set: .sharing,
                                                              lid: 0x00008A18)
    
    /// [MS-OXPROPS] 2.246 PidLidSharingFolderEntryId
    /// Canonical name: PidLidSharingFolderEntryId
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A15
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingFolderEid
    static let lidSharingFolderEntryId = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A15)
    
    /// [MS-OXPROPS] 2.247 PidLidSharingIndexEntryId
    /// Canonical name: PidLidSharingIndexEntryId
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A2E
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingIndexEid
    static let lidSharingIndexEntryId = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A2E)

    /// [MS-OXPROPS] 2.248 PidLidSharingInitiatorEntryId
    /// Canonical name: PidLidSharingInitiatorEntryId
    /// Description: Contains the value of the PidTagEntryId property (section 2.683) for the Address
    /// Book object of the currently logged-on user.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A09
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.7
    /// Alternate names: dispidSharingInitiatorEid
    static let lidSharingInitiatorEntryId = NamedProperty(set: .sharing,
                                                                        lid: 0x00008A09)
    
    /// [MS-OXPROPS] 2.249 PidLidSharingInitiatorName
    /// Canonical name: PidLidSharingInitiatorName
    /// Description: Contains the value of the PidTagDisplayName property (section 2.676) from the
    /// Address Book object identified by the PidLidSharingInitiatorEntryId property (section 2.248).
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A07
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.8
    /// Alternate names: dispidSharingInitiatorName
    static let lidSharingInitiatorName = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A07)
    
    /// [MS-OXPROPS] 2.250 PidLidSharingInitiatorSmtp
    /// Canonical name: PidLidSharingInitiatorSmtp
    /// Description: Contains the value of the PidTagSmtpAddress property (section 2.1020) from the
    /// Address Book object identified by the PidLidSharingInitiatorEntryId property (section 2.248).
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A08
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.9
    /// Alternate names: dispidSharingInitiatorSmtp
    static let lidSharingInitiatorSmtp = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A08)
    
    /// [MS-OXPROPS] 2.251 PidLidSharingInstanceGuid
    /// Canonical name: PidLidSharingInstanceGuid
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A1C
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingInstanceGuid
    static let lidSharingInstanceGuid = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A1C)
    
    /// [MS-OXPROPS] 2.252 PidLidSharingLastAutoSyncTime
    /// Canonical name: PidLidSharingLastAutoSyncTime
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A55
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLastAutoSync
    static let lidSharingLastAutoSyncTime = NamedProperty(set: .sharing,
                                                                        lid: 0x00008A55)
    
    /// [MS-OXPROPS] 2.253 PidLidSharingLastSyncTime
    /// Canonical name: PidLidSharingLastSyncTime
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A1F
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLastSync
    static let lidSharingLastSyncTime = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A1F)
    
    /// [MS-OXPROPS] 2.254 PidLidSharingLocalComment
    /// Canonical name: PidLidSharingLocalComment
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A4D
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLocalComment
    static let lidSharingLocalComment = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A4D)
    
    /// [MS-OXPROPS] 2.255 PidLidSharingLocalLastModificationTime
    /// Canonical name: PidLidSharingLocalLastModificationTime
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A23
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLocalLastMod
    static let lidSharingLocalLastModificationTime = NamedProperty(set: .sharing,
                                                                                 lid: 0x00008A23)
    
    /// [MS-OXPROPS] 2.256 PidLidSharingLocalName
    /// Canonical name: PidLidSharingLocalName
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A0F
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLocalName
    static let lidSharingLocalName = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A0F)
    
    /// [MS-OXPROPS] 2.257 PidLidSharingLocalPath
    /// Canonical name: PidLidSharingLocalPath
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A0E
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLocalPath
    static let lidSharingLocalPath = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A0E)
    
    /// [MS-OXPROPS] 2.258 PidLidSharingLocalStoreUid
    /// Canonical name: PidLidSharingLocalStoreUid
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A49
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLocalStoreUid
    static let lidSharingLocalStoreUid = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A49)
    
    /// [MS-OXPROPS] 2.259 PidLidSharingLocalType
    /// Canonical name: PidLidSharingLocalType
    /// Description: Contains the value of the PidTagContainerClass property (section 2.642) of the folder
    /// being shared.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A14
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.10
    /// Alternate names: dispidSharingLocalType
    static let lidSharingLocalType = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A14)

    /// [MS-OXPROPS] 2.260 PidLidSharingLocalUid
    /// Canonical name: PidLidSharingLocalUid
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A10
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingLocalUid
    static let lidSharingLocalUid = NamedProperty(set: .sharing,
                                                                lid: 0x00008A10)
    
    /// [MS-OXPROPS] 2.261 PidLidSharingOriginalMessageEntryId
    /// Canonical name: PidLidSharingOriginalMessageEntryId
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A29
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingOriginalMessageEid
    static let lidSharingOriginalMessageEntryId = NamedProperty(set: .sharing,
                                                                              lid: 0x00008A29)
    
    /// [MS-OXPROPS] 2.262 PidLidSharingParentBindingEntryId
    /// Canonical name: PidLidSharingParentBindingEntryId
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A5C
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingParentBindingEid
    static let lidSharingParentBindingEntryId = NamedProperty(set: .sharing,
                                                                            lid: 0x00008A5C)
    
    /// [MS-OXPROPS] 2.263 PidLidSharingParticipants
    /// Canonical name: PidLidSharingParticipants
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A1E
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingParticipants
    static let lidSharingParticipants = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A1E)
    
    /// [MS-OXPROPS] 2.264 PidLidSharingPermissions
    /// Canonical name: PidLidSharingPermissions
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A1B
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingPermissions
    static let lidSharingPermissions = NamedProperty(set: .sharing,
                                                                   lid: 0x00008A1B)
    
    /// [MS-OXPROPS] 2.265 PidLidSharingProviderExtension
    /// Canonical name: PidLidSharingProviderExtension
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A0B
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingProviderExtension
    static let lidSharingProviderExtension = NamedProperty(set: .sharing,
                                                                         lid: 0x00008A0B)

    /// [MS-OXPROPS] 2.266 PidLidSharingProviderGuid
    /// Canonical name: PidLidSharingProviderGuid
    /// Description: Contains the value "%xAE.F0.06.00.00.00.00.00.C0.00.00.00.00.00.00.46".
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A01
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.12
    /// Alternate names: dispidSharingProviderGuid
    static let lidSharingProviderGuid = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A01)
    
    /// [MS-OXPROPS] 2.267 PidLidSharingProviderName
    /// Canonical name: PidLidSharingProviderName
    /// Description: Contains a user-displayable name of the sharing provider identified by the
    /// PidLidSharingProviderGuid property (section 2.266).
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A02
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.14
    /// Alternate names: dispidSharingProviderName
    static let lidSharingProviderName = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A02)
    
    /// [MS-OXPROPS] 2.268 PidLidSharingProviderUrl
    /// Canonical name: PidLidSharingProviderUrl
    /// Description: Contains a URL related to the sharing provider identified by the
    /// PidLidSharingProviderGuid property (section 2.266).
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A03
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.16
    /// Alternate names: dispidSharingProviderUrl
    static let lidSharingProviderUrl = NamedProperty(set: .sharing,
                                                                   lid: 0x00008A03)
    
    /// [MS-OXPROPS] 2.269 PidLidSharingRangeEnd
    /// Canonical name: PidLidSharingRangeEnd
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A47
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    static let lidSharingRangeEnd = NamedProperty(set: .sharing,
                                                                lid: 0x00000008)

    /// [MS-OXPROPS] 2.270 PidLidSharingRangeStart
    /// Canonical name: PidLidSharingRangeStart
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A46
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRangeStart
    static let lidSharingRangeStart = NamedProperty(set: .sharing,
                                                                  lid: 0x00008A46)

    /// [MS-OXPROPS] 2.271 PidLidSharingReciprocation
    /// Canonical name: PidLidSharingReciprocation
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A1A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingReciprocation
    static let lidSharingReciprocation = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A1A)

    /// [MS-OXPROPS] 2.272 PidLidSharingRemoteByteSize
    /// Canonical name: PidLidSharingRemoteByteSize
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A4B
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Consuming reference: [MS-OXSHARE]
    /// Alternate names: dispidSharingRemoteByteSize
    static let lidSharingRemoteByteSize = NamedProperty(set: .sharing,
                                                                      lid: 0x00008A4B)

    /// [MS-OXPROPS] 2.273 PidLidSharingRemoteComment
    /// Canonical name: PidLidSharingRemoteComment
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A2F
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemoteComment
    static let lidSharingRemoteComment = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A2F)

    /// [MS-OXPROPS] 2.274 PidLidSharingRemoteCrc
    /// Canonical name: PidLidSharingRemoteCrc
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A4C
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemoteCrc
    static let lidSharingRemoteCrc = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A4C)

    /// [MS-OXPROPS] 2.275 PidLidSharingRemoteLastModificationTime
    /// Canonical name: PidLidSharingRemoteLastModificationTime
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A22
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemoteLastMod
    static let lidSharingRemoteLastModificationTime = NamedProperty(set: .sharing,
                                                                                  lid: 0x00008A22)
    
    /// [MS-OXPROPS] 2.276 PidLidSharingRemoteMessageCount
    /// Canonical name: PidLidSharingRemoteMessageCount
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A4F
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemoteMsgCount
    static let lidSharingRemoteMessageCount = NamedProperty(set: .sharing,
                                                                          lid: 0x00008A4F)
    
    /// [MS-OXPROPS] 2.277 PidLidSharingRemoteName
    /// Canonical name: PidLidSharingRemoteName
    /// Description: Contains the value of the PidTagDisplayName property (section 2.676) on the folder
    /// being shared.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A05
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.1
    /// Alternate names: dispidSharingRemoteName
    static let lidSharingRemoteName = NamedProperty(set: .sharing,
                                                                  lid: 0x00008A05)
    
    /// [MS-OXPROPS] 2.278 PidLidSharingRemotePass
    /// Canonical name: PidLidSharingRemotePass
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A0D
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemotePass
    static let lidSharingRemotePass = NamedProperty(set: .sharing,
                                                                lid: 0x00008A0D)
    
    /// [MS-OXPROPS] 2.279 PidLidSharingRemotePath
    /// Canonical name: PidLidSharingRemotePath
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A04
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemotePath
    static let lidSharingRemotePath = NamedProperty(set: .sharing,
                                                                  lid: 0x00008A04)

    /// [MS-OXPROPS] 2.280 PidLidSharingRemoteStoreUid
    /// Canonical name: PidLidSharingRemoteStoreUid
    /// Description: Contains a hexadecimal string representation of the value of the PidTagStoreEntryId
    /// property (section 2.1028) on the folder being shared.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A48
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.3
    /// Alternate names: dispidSharingRemoteStoreUid
    static let lidSharingRemoteStoreUid = NamedProperty(set: .sharing,
                                                                      lid: 0x00008A48)
    
    /// [MS-OXPROPS] 2.281 PidLidSharingRemoteType
    /// Canonical name: PidLidSharingRemoteType
    /// Description: Contains the same value as the PidLidSharingLocalType property (section 2.259).
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A1D
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.5
    /// Alternate names: dispidSharingRemoteType
    static let lidSharingRemoteType = NamedProperty(set: .sharing,
                                                                  lid: 0x00008A1D)
    
    /// [MS-OXPROPS] 2.282 PidLidSharingRemoteUid
    /// Canonical name: PidLidSharingRemoteUid
    /// Description: Contains the EntryID of the folder being shared.
    /// Property set: PSTID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A06
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.7
    /// Alternate names: dispidSharingRemoteUid
    static let lidSharingRemoteUid = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A06)

    /// [MS-OXPROPS] 2.283 PidLidSharingRemoteUser
    /// Canonical name: PidLidSharingRemoteUser
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A0C
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemoteUser
    static let lidSharingRemoteUser = NamedProperty(set: .sharing,
                                                                  lid: 0x00008A0C)
    
    /// [MS-OXPROPS] 2.284 PidLidSharingRemoteVersion
    /// Canonical name: PidLidSharingRemoteVersion
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A5B
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRemoteVersion
    static let lidSharingRemoteVersion = NamedProperty(set: .sharing,
                                                                     lid: 0x00008A5B)

    /// [MS-OXPROPS] 2.285 PidLidSharingResponseTime
    /// Canonical name: PidLidSharingResponseTime
    /// Description: Contains the time at which the recipient of the sharing request sent a sharing
    /// response.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A28
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.4.1
    /// Alternate names: dispidSharingResponseTime
    static let lidSharingResponseTime = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A28)
    
    /// [MS-OXPROPS] 2.286 PidLidSharingResponseType
    /// Canonical name: PidLidSharingResponseType
    /// Description: Contains the type of response with which the recipient of the sharing request
    /// responded.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A27
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.4.2
    /// Alternate names: dispidSharingResponseType
    static let lidSharingResponseType = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A27)
    
    /// [MS-OXPROPS] 2.287 PidLidSharingRoamLog
    /// Canonical name: PidLidSharingRoamLog
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A4E
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingRoamLog
    static let lidSharingRoamLog = NamedProperty(set: .sharing,
                                                               lid: 0x00008A4E)
    
    /// [MS-OXPROPS] 2.288 PidLidSharingStart
    /// Canonical name: PidLidSharingStart
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A25
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingStart
    static let lidSharingStart = NamedProperty(set: .sharing,
                                                             lid: 0x00008A25)
    
    /// [MS-OXPROPS] 2.289 PidLidSharingStatus
    /// Canonical name: PidLidSharingStatus
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A00
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingStatus
    static let lidSharingStatus = NamedProperty(set: .sharing,
                                                              lid: 0x00008A00)
    
    /// [MS-OXPROPS] 2.290 PidLidSharingStop
    /// Canonical name: PidLidSharingStop
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A26
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingStop
    static let lidSharingStop = NamedProperty(set: .sharing,
                                                            lid: 0x00008A26)
    
    /// [MS-OXPROPS] 2.291 PidLidSharingSyncFlags
    /// Canonical name: PidLidSharingSyncFlags
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A60
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingSyncFlags
    static let lidSharingSyncFlags = NamedProperty(set: .sharing,
                                                                 lid: 0x00008A60)
    
    /// [MS-OXPROPS] 2.292 PidLidSharingSyncInterval
    /// Canonical name: PidLidSharingSyncInterval
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A2A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingSyncInterval
    static let lidSharingSyncInterval = NamedProperty(set: .sharing,
                                                                    lid: 0x00008A2A)
    
    /// [MS-OXPROPS] 2.293 PidLidSharingTimeToLive
    /// Canonical name: PidLidSharingTimeToLive
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A2C
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingTimeToLive
    static let lidSharingTimeToLive = NamedProperty(set: .sharing,
                                                                  lid: 0x00008A2C)
    
    /// [MS-OXPROPS] 2.294 PidLidSharingTimeToLiveAuto
    /// Canonical name: PidLidSharingTimeToLiveAuto
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A56
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingTimeToLiveAuto
    static let lidSharingTimeToLiveAuto = NamedProperty(set: .sharing,
                                                                      lid: 0x00008A56)
    
    /// [MS-OXPROPS] 2.295 PidLidSharingWorkingHoursDays
    /// Canonical name: PidLidSharingWorkingHoursDays
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A42
    /// Data type: PtypInteger32, 0x0003
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingWorkingHoursDays
    static let lidSharingWorkingHoursDays = NamedProperty(set: .sharing,
                                                                        lid: 0x00008A42)
    
    /// [MS-OXPROPS] 2.296 PidLidSharingWorkingHoursEnd
    /// Canonical name: PidLidSharingWorkingHoursEnd
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A41
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingWorkingHoursEnd
    static let lidSharingWorkingHoursEnd = NamedProperty(set: .sharing,
                                                                       lid: 0x00008A41)
    
    /// [MS-OXPROPS] 2.297 PidLidSharingWorkingHoursStart
    /// Canonical name: PidLidSharingWorkingHoursStart
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A40
    /// Data type: PtypTime, 0x0040
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingWorkingHoursStart
    static let lidSharingWorkingHoursStart = NamedProperty(set: .sharing,
                                                                         lid: 0x00008A40)
    
    /// [MS-OXPROPS] 2.298 PidLidSharingWorkingHoursTimeZone
    /// Canonical name: PidLidSharingWorkingHoursTimeZone
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PSETID_Sharing {00062040-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008A43
    /// Data type: PtypBinary, 0x0102
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    /// Alternate names: dispidSharingWorkingHoursTZ
    static let lidSharingWorkingHoursTimeZone = NamedProperty(set: .sharing,
                                                                            lid: 0x00008A43)
    
    /// [MS-OXPROPS] 2.299 PidLidSideEffects
    /// Canonical name: PidLidSideEffects
    /// Description: Specifies how a Message object is handled by the client in relation to certain user
    /// interface actions by the user, such as deleting a message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008510
    /// Data type: PtypInteger32, 0x0003
    /// Area: Run-time configuration
    /// Defining reference: [MS-OXCMSG] section 2.2.1.16
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCAL], [MS-OXORSS], [MS-OXTNEF],
    /// [MS-OXOCNTC], [MS-OXONOTE], [MS-OXORMMS], [MS-OXOJRNL], [MS-OXOPOST], [MS-OXOTASK]
    /// Alternate names: dispidSideEffects
    static let lidSideEffects = NamedProperty(set: .common,
                                                            lid: 0x00008510)

    /// [MS-OXPROPS] 2.300 PidLidSingleBodyICal
    /// Canonical name: PidLidSingleBodyICal
    /// Description: Indicates that the original MIME message contained a single MIME part.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000827B
    /// Data type: PtypBoolean, 0x000B
    /// Area: Calendar
    /// Defining reference: [MS-OXCICAL] section 2.1.3.4.2
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: IsSingleBodyICal, dispidIsSingleBodyICal
    static let lidSingleBodyICal = NamedProperty(set: .appointment,
                                                               lid: 0x0000827B)
    
    /// [MS-OXPROPS] 2.301 PidLidSmartNoAttach
    /// Canonical name: PidLidSmartNoAttach
    /// Description: Indicates whether the Message object has no end-user visible attachments.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008514
    /// Data type: PtypBoolean, 0x000B
    /// http://schemas.microsoft.com/exchange/keywords-utf8
    /// Area: Run-time configuration
    /// Defining reference: [MS-OXCMSG] section 2.2.1.14
    /// Alternate names: dispidSmartNoAttach
    static let lidSmartNoAttach = NamedProperty(set: .common,
                                                            lid: 0x00008514)

    /// [MS-OXPROPS] 2.302 PidLidSpamOriginalFolder
    /// Canonical name: PidLidSpamOriginalFolder
    /// Description: Specifies which folder a message was in before it was filtered into the Junk Email folder.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000859C
    /// Data type: PtypBinary, 0x0102
    /// Area: Spam
    /// Defining reference: [MS-OXCSPAM] section 2.2.1.1
    /// Alternate names: dispidSpamOriginalFolder
    static let lidSpamOriginalFolder = NamedProperty(set: .common,
                                                                   lid: 0x0000859C)

    /// [MS-OXPROPS] 2.303 PidLidStartRecurrenceDate
    /// Canonical name: PidLidStartRecurrenceDate
    /// Description: Identifies the start date of the recurrence pattern.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000000D
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/start_recur_date
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.66
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: LID_START_RECUR_DATE
    static let lidStartRecurrenceDate = NamedProperty(set: .meeting,
                                                                   lid: 0x0000000D)

    /// [MS-OXPROPS] 2.304 PidLidStartRecurrenceTime
    /// Canonical name: PidLidStartRecurrenceTime
    /// Description: Identifies the start time of the recurrence pattern.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000000E
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/start_recur_time
    /// Area: Meetings
    static let lidStartRecurrenceTime = NamedProperty(set: .meeting,
                                                                   lid: 0x0000000E)
    
    /// [MS-OXPROPS] 2.305 PidLidTaskAcceptanceState
    /// Canonical name: PidLidTaskAcceptanceState
    /// Description: Indicates the acceptance state of the task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000812A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.30
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST]
    /// Alternate names: dispidTaskDelegValue
    static let lidTaskAcceptanceState = NamedProperty(set: .task,
                                                                    lid: 0x0000812A)

    /// [MS-OXPROPS] 2.306 PidLidTaskAccepted
    /// Canonical name: PidLidTaskAccepted
    /// Description: Indicates whether a task assignee has replied to a task request for this Task object.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008108
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.7
    /// Consuming reference: [MS-OXOSFLD]
    /// Alternate names: dispidTaskAccepted
    static let lidTaskAccepted = NamedProperty(set: .task,
                                                             lid: 0x00008108)
    
    /// [MS-OXPROPS] 2.307 PidLidTaskActualEffort
    /// Canonical name: PidLidTaskActualEffort
    /// Description: Indicates the number of minutes that the user actually spent working on a task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008110
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.11
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskActualEffort
    static let lidTaskActualEffort = NamedProperty(set: .task,
                                                                 lid: 0x00008110)

    /// [MS-OXPROPS] 2.308 PidLidTaskAssigner
    /// Canonical name: PidLidTaskAssigner
    /// Description: Specifies the name of the user that last assigned the task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008121
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.24
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskDelegator
    static let lidTaskAssigner = NamedProperty(set: .task,
                                                             lid: 0x00008121)

    /// [MS-OXPROPS] 2.309 PidLidTaskAssigners
    /// Canonical name: PidLidTaskAssigners
    /// Description: Contains a stack of entries, each of which represents a task assigner.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008117
    /// Data type: PtypBinary, 0x0102
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.16
    /// Alternate names: dispidTaskMyDelegators
    static let lidTaskAssigners = NamedProperty(set: .task,
                                                              lid: 0x00008117)
    
    /// [MS-OXPROPS] 2.310 PidLidTaskComplete
    /// Canonical name: PidLidTaskComplete
    /// Description: Indicates that the task is complete.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000811C
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.20
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXODOC], [MS-OXOFLAG], [MSOXOCNTC], [MS-OXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskComplete
    static let lidTaskComplete = NamedProperty(set: .task,
                                                             lid: 0x0000811C)

    /// [MS-OXPROPS] 2.311 PidLidTaskCustomFlags
    /// Canonical name: PidLidTaskCustomFlags
    /// Description: The client can set this property, but it has no impact on the Task-Related Objects
    /// Protocol and is ignored by the server.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008139
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.33
    /// Alternate names: dispidTaskCustomFlags
    static let lidTaskCustomFlags = NamedProperty(set: .task,
                                                                lid: 0x00008139)

    /// [MS-OXPROPS] 2.312 PidLidTaskDateCompleted
    /// Canonical name: PidLidTaskDateCompleted
    /// Description: Specifies the date when the user completed work on the task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000810F
    /// Data type: PtypTime, 0x0040
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.9
    /// Consuming references: [MS-OXCMAIL], [MS-OXOFLAG]
    /// Alternate names: dispidTaskDateCompleted
    static let lidTaskDateCompleted = NamedProperty(set: .task,
                                                                  lid: 0x0000810F)

    /// [MS-OXPROPS] 2.313 PidLidTaskDeadOccurrence
    /// Canonical name: PidLidTaskDeadOccurrence
    /// Description: Indicates whether new occurrences remain to be generated.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008109
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.8
    /// Alternate names: dispidTaskDeadOccur
    static let lidTaskDeadOccurrence = NamedProperty(set: .task,
                                                                   lid: 0x00008109)

    /// [MS-OXPROPS] 2.314 PidLidTaskDueDate
    /// Canonical name: PidLidTaskDueDate
    /// Description: Specifies the date by which the user expects work on the task to be complete.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008105
    /// Data type: PtypTime, 0x0040
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.5
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOFLAG], [MS-OXORMDR]
    /// Alternate names: dispidTaskDueDate
    static let lidTaskDueDate = NamedProperty(set: .task,
                                                            lid: 0x00008105)

    /// [MS-OXPROPS] 2.315 PidLidTaskEstimatedEffort
    /// Canonical name: PidLidTaskEstimatedEffort
    /// Description: Indicates the number of minutes that the user expects to work on a task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008111
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.12
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST]
    /// Alternate names: dispidTaskEstimatedEffort
    static let lidTaskEstimatedEffort = NamedProperty(set: .task,
                                                                    lid: 0x00008111)

    /// [MS-OXPROPS] 2.316 PidLidTaskFCreator
    /// Canonical name: PidLidTaskFCreator
    /// Description: Indicates that the Task object was originally created by the action of the current user
    /// or user agent instead of by the processing of a task request.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000811E
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.21
    /// Alternate names: dispidTaskFCreator
    static let lidTaskFCreator = NamedProperty(set: .task,
                                                             lid: 0x0000811E)

    /// [MS-OXPROPS] 2.317 PidLidTaskFFixOffline
    /// Canonical name: PidLidTaskFFixOffline
    /// Description: Indicates the accuracy of the PidLidTaskOwner property (section 2.328).
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000812C
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.31
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskFFixOffline
    static let lidTaskFFixOffline = NamedProperty(set: .task,
                                                                lid: 0x0000812C)

    /// [MS-OXPROPS] 2.318 PidLidTaskFRecurring
    /// Canonical name: PidLidTaskFRecurring
    /// Description: Indicates whether the task includes a recurrence pattern.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008126
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.28
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskFRecur
    static let lidTaskFRecurring = NamedProperty(set: .task,
                                                               lid: 0x00008126)

    /// [MS-OXPROPS] 2.319 PidLidTaskGlobalId
    /// Canonical name: PidLidTaskGlobalId
    /// Description: Contains a unique GUID for this task, which is used to locate an existing task upon
    /// receipt of a task response or task update.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008519
    /// Data type: PtypBinary, 0x0102
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.32
    /// Alternate names: dispidTaskGlobalObjId
    static let lidTaskGlobalId = NamedProperty(set: .common,
                                                             lid: 0x00008519)

    /// [MS-OXPROPS] 2.320 PidLidTaskHistory
    /// Canonical name: PidLidTaskHistory
    /// Description: Indicates the type of change that was last made to the Task object.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000811A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.18
    /// Alternate names: dispidTaskHistory
    static let lidTaskHistory = NamedProperty(set: .task,
                                                            lid: 0x0000811A)

    /// [MS-OXPROPS] 2.321 PidLidTaskLastDelegate
    /// Canonical name: PidLidTaskLastDelegate
    /// Description: Contains the name of the user who most recently assigned the task, or the user to
    /// whom it was most recently assigned.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008125
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.27
    /// Alternate names: dispidTaskLastDelegate
    static let lidTaskLastDelegate = NamedProperty(set: .task,
                                                                 lid: 0x00008125)

    /// [MS-OXPROPS] 2.322 PidLidTaskLastUpdate
    /// Canonical name: PidLidTaskLastUpdate
    /// Description: Contains the date and time of the most recent change made to the Task object.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008115
    /// Data type: PtypTime, 0x0040
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.10
    /// Alternate names: dispidTaskLastUpdate
    static let lidTaskLastUpdate = NamedProperty(set: .task,
                                                               lid: 0x00008115)

    /// [MS-OXPROPS] 2.323 PidLidTaskLastUser
    /// Canonical name: PidLidTaskLastUser
    /// Description: Contains the name of the most recent user to have been the owner of the task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008122
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.25
    /// Alternate names: dispidTaskLastUser
    static let lidTaskLastUser = NamedProperty(set: .task,
                                                             lid: 0x00008122)

    /// [MS-OXPROPS] 2.324 PidLidTaskMode
    /// Canonical name: PidLidTaskMode
    /// Description: Specifies the assignment status of the embedded Task object.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008518
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.3.2
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXTNEF] , [MS-OXOCNTC], [MSOXOJRNL], [MS-OXOPOST], [MS-OXONOTE], [MS-OXORMMS]
    /// Alternate names: dispidTaskMode
    static let lidTaskMode = NamedProperty(set: .common,
                                                         lid: 0x00008518)

    /// [MS-OXPROPS] 2.325 PidLidTaskMultipleRecipients
    /// Canonical name: PidLidTaskMultipleRecipients
    /// Description: Provides optimization hints about the recipients of a Task object.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008120
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.23
    /// Alternate names: dispidTaskMultRecips
    static let lidTaskMultipleRecipients = NamedProperty(set: .task,
                                                                       lid: 0x00008120)

    /// [MS-OXPROPS] 2.326 PidLidTaskNoCompute
    /// Canonical name: PidLidTaskNoCompute
    /// Description: Not used. The client can set this property, but it has no impact on the Task-Related
    /// Objects Protocol and is ignored by the server.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008124
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.35
    /// Consuming reference: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskNoCompute
    static let lidTaskNoCompute = NamedProperty(set: .task,
                                                              lid: 0x00008124)
    
    /// [MS-OXPROPS] 2.327 PidLidTaskOrdinal
    /// Canonical name: PidLidTaskOrdinal
    /// Description: Provides an aid to custom sorting of Task objects.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008123
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.26
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskOrdinal
    static let lidTaskOrdinal = NamedProperty(set: .task,
                                                            lid: 0x00008123)

    /// [MS-OXPROPS] 2.328 PidLidTaskOwner
    /// Canonical name: PidLidTaskOwner
    /// Description: Contains the name of the owner of the task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000811F
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.22
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskOwner
    static let lidTaskOwner = NamedProperty(set: .task,
                                                          lid: 0x0000811F)

    /// [MS-OXPROPS] 2.329 PidLidTaskOwnership
    /// Canonical name: PidLidTaskOwnership
    /// Description: Indicates the role of the current user relative to the Task object.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008129
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.29
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskOwnership
    static let lidTaskOwnership = NamedProperty(set: .task,
                                                              lid: 0x00008129)
        
    /// [MS-OXPROPS] 2.330 PidLidTaskRecurrence
    /// Canonical name: PidLidTaskRecurrence
    /// Description: Contains a RecurrencePattern structure that provides information about recurring
    /// tasks.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008116
    /// Data type: PtypBinary, 0x0102
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.15
    /// Consuming references: [MS-OXORMDR]
    /// Alternate names: dispidTaskRecur
    static let lidTaskRecurrence = NamedProperty(set: .task,
                                                               lid: 0x00008116)

    /// [MS-OXPROPS] 2.331 PidLidTaskResetReminder
    /// Canonical name: PidLidTaskResetReminder
    /// Description: Indicates whether future instances of recurring tasks need reminders, even though
    /// the value of the PidLidReminderSet property (section 2.222) is 0x00.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008107
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.6
    /// Consuming references: [MS-OXORMDR]
    /// Alternate names: dispidTaskResetReminder
    static let lidTaskResetReminder = NamedProperty(set: .task,
                                                                  lid: 0x00008107)

    /// [MS-OXPROPS] 2.332 PidLidTaskRole
    /// Canonical name: PidLidTaskRole
    /// Description: Not used. The client can set this property, but it has no impact on the Task-Related
    /// Objects Protocol and is ignored by the server.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008127
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.34
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOTASK], [MS-OXOCNTC], [MSOXOJRNL], [MS-OXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskRole
    static let lidTaskRole = NamedProperty(set: .task,
                                                         lid: 0x00008127)

    /// [MS-OXPROPS] 2.333 PidLidTaskStartDate
    /// Canonical name: PidLidTaskStartDate
    /// Description: Specifies the date on which the user expects work on the task to begin.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008104
    /// Data type: PtypTime, 0x0040
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.4
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOFLAG], [MS-OXORMDR]
    /// Alternate names: dispidTaskStartDate
    static let lidTaskStartDate = NamedProperty(set: .task,
                                                              lid: 0x00008104)

    /// [MS-OXPROPS] 2.334 PidLidTaskState
    /// Canonical name: PidLidTaskState
    /// Description: Indicates the current assignment state of the Task object.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008113
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.14
    /// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOSFLD], [MS-OXOCNTC], [MSOXOJRNL], [MS-OXOPOST], [MS-OXONOTE]
    /// Alternate names: dispidTaskState
    static let lidTaskState = NamedProperty(set: .task,
                                                          lid: 0x00008113)

    /// [MS-OXPROPS] 2.335 PidLidTaskStatus
    /// Canonical name: PidLidTaskStatus
    /// Description: Specifies the status of a task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008101
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.2
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXODOC], [MS-OXOFLAG], [MSOXOSFLD], [MS-OXOCNTC], [MS-OXOJRNL], [MS-OXOPOST]
    /// Alternate names: dispidTaskStatus
    static let lidTaskStatus = NamedProperty(set: .task,
                                                           lid: 0x00008101)

    /// [MS-OXPROPS] 2.336 PidLidTaskStatusOnComplete
    /// Canonical name: PidLidTaskStatusOnComplete
    /// Description: Indicates whether the task assignee has been requested to send an email message
    /// update upon completion of the assigned task.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008119
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.17
    /// Alternate names: dispidTaskSOC
    static let lidTaskStatusOnComplete = NamedProperty(set: .task,
                                                                     lid: 0x00008119)

    /// [MS-OXPROPS] 2.337 PidLidTaskUpdates
    /// Canonical name: PidLidTaskUpdates
    /// Description: Indicates whether the task assignee has been requested to send a task update when the
    /// assigned Task object changes.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000811B
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.19
    /// Alternate names: dispidTaskUpdates
    static let lidTaskUpdates = NamedProperty(set: .task,
                                                            lid: 0x0000811B)
    
    //// [MS-OXPROPS] 2.338 PidLidTaskVersion
    //// Canonical name: PidLidTaskVersion
    //// Description: Indicates which copy is the latest update of a Task object.
    //// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    //// Property long ID (LID): 0x00008112
    //// Data type: PtypInteger32, 0x0003
    //// Area: Tasks
    //// Defining reference: [MS-OXOTASK] section 2.2.2.2.13
    //// Consuming references: [MS-OXCFXICS], [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MSOXOPOST], [MS-OXONOTE]
    //// Alternate names: dispidTaskVersion
    static let lidTaskVersion = NamedProperty(set: .task,
                                                            lid: 0x00008112)

    /// [MS-OXPROPS] 2.339 PidLidTeamTask
    /// Canonical name: PidLidTeamTask
    /// Description: This property is set by the client but is ignored by the server.
    /// Property set: PSETID_Task {00062003-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008103
    /// Data type: PtypBoolean, 0x000B
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.2.2.36
    /// Consuming References: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXODOC]
    /// Alternate names: dispidTeamTask
    static let lidTeamTask = NamedProperty(set: .task,
                                                         lid: 0x00008103)

    /// [MS-OXPROPS] 2.340 PidLidTimeZone
    /// Canonical name: PidLidTimeZone
    /// Description: Specifies information about the time zone of a recurring meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x0000000C
    /// Data type: PtypInteger32, 0x0003
    /// WebDAV: http://schemas.microsoft.com/mapi/time_zone
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.5.6
    /// Consuming reference: [MS-XWDCAL]
    static let lidTimeZone = NamedProperty(set: .meeting,
                                                         lid: 0x0000000C)

    /// [MS-OXPROPS] 2.341 PidLidTimeZoneDescription
    /// Canonical name: PidLidTimeZoneDescription
    /// Description: Specifies a human-readable description of the time zone that is represented by the data
    /// in the PidLidTimeZoneStruct property (section 2.342).
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008234
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/timezonedesc
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.40
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidTimeZoneDesc
    static let lidTimeZoneDescription = NamedProperty(set: .appointment,
                                                                    lid: 0x00008234)

    /// [MS-OXPROPS] 2.342 PidLidTimeZoneStruct
    /// Canonical name: PidLidTimeZoneStruct
    /// Description: Specifies time zone information for a recurring meeting.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008233
    /// Data type: PtypBinary, 0x0102
    /// WebDAV: http://schemas.microsoft.com/mapi/timezonestruct
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.1.39
    /// Consuming references: [MS-OXCICAL], [MS-XWDCAL]
    /// Alternate names: dispidTimeZoneStruct
    static let lidTimeZoneStruct = NamedProperty(set: .appointment,
                                                               lid: 0x00008233)

    /// [MS-OXPROPS] 2.343 PidLidToAttendeesString
    /// Canonical name: PidLidToAttendeesString
    /// Description: Contains a list of all of the sendable attendees who are also required attendees.
    /// Property set: PSETID_Appointment {00062002-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000823B
    /// Data type: PtypString, 0x001F
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.17
    /// Alternate names: dispidToAttendeesString
    static let lidToAttendeesString = NamedProperty(set: .appointment,
                                                                  lid: 0x0000823B)
    
    /// [MS-OXPROPS] 2.344 PidLidToDoOrdinalDate
    /// Canonical name: PidLidToDoOrdinalDate
    /// Description: Contains the current time, in UTC, which is used to determine the sort order of objects
    /// in a consolidated to-do list.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085A0
    /// Data type: PtypTime, 0x0040
    /// Area: Tasks
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.13
    /// Consuming reference: [MS-OXCFXICS]
    /// Alternate names: dispidToDoOrdinalDate
    static let lidToDoOrdinalDate = NamedProperty(set: .common,
                                                                lid: 0x000085A0)
    
    /// [MS-OXPROPS] 2.345 PidLidToDoSubOrdinal
    /// Canonical name: PidLidToDoSubOrdinal
    /// Description: Contains the numerals 0 through 9 that are used to break a tie when the
    /// PidLidToDoOrdinalDate property (section 2.344) is used to perform a sort of objects.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085A1
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.14
    /// Consuming reference: [MS-OXCFXICS]
    /// Alternate names: dispidToDoSubOrdinal
    static let lidToDoSubOrdinal = NamedProperty(set: .common,
                                                               lid: 0x000085A1)
    
    /// [MS-OXPROPS] 2.346 PidLidToDoTitle
    /// Canonical name: PidLidToDoTitle
    /// Description: Contains user-specifiable text to identify this Message object in a consolidated to-do
    /// list.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085A4
    /// Data type: PtypString, 0x001F
    /// Area: Tasks
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.12
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL]
    /// Alternate names: dispidToDoTitle
    static let lidToDoTitle = NamedProperty(set: .common,
                                                                lid: 0x000085A4)

    /// [MS-OXPROPS] 2.347 PidLidUseTnef
    /// Canonical name: PidLidUseTnef
    /// Description: Specifies whether Transport Neutral Encapsulation Format (TNEF) is to be included
    /// on a message when the message is converted from TNEF to MIME or SMTP format.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008582
    /// Data type: PtypBoolean, 0x000B
    /// Area: Run-time configuration
    /// Defining reference: [MS-OXOMSG] section 2.2.1.66
    /// Consuming references: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: dispidUseTNEF
    static let lidUseTnef = NamedProperty(set: .common,
                                                                lid: 0x00008582)
    
    /// [MS-OXPROPS] 2.348 PidLidValidFlagStringProof
    /// Canonical name: PidLidValidFlagStringProof
    /// Description: Contains the value of the PidTagMessageDeliveryTime property (section 2.789)
    /// when modifying the PidLidFlagRequest property (section 2.136).
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000085BF
    /// Data type: PtypTime, 0x0040
    /// Area: Tasks
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.11
    /// Consuming references: [MS-OXODOC], [MS-OXOCNTC], [MS-OXOJRNL], [MS-OXOPOST], [MSOXONOTE], [MS-OXOTASK]
    /// Alternate names: dispidValidFlagStringProof
    static let lidValidFlagStringProof = NamedProperty(set: .common,
                                                                     lid: 0x000085BF)

    /// [MS-OXPROPS] 2.349 PidLidVerbResponse
    /// Canonical name: PidLidVerbResponse
    /// Description: Specifies the voting option that a respondent has selected.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008524
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.75
    /// Alternate names: dispidVerbResponse
    static let lidVerbResponse = NamedProperty(set: .common,
                                                             lid: 0x00008524)
    
    /// [MS-OXPROPS] 2.350 PidLidVerbStream
    /// Canonical name: PidLidVerbStream
    /// Description: Specifies what voting responses the user can make in response to the message.
    /// Property set: PSETID_Common {00062008-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008520
    /// Data type: PtypBinary, 0x0102
    /// Area: Run-time configuration
    /// Defining reference: [MS-OXOMSG] section 2.2.1.74
    /// Alternate names: dispidVerbStream
    static let lidVerbStream = NamedProperty(set: .common,
                                                           lid: 0x00008520)

    /// [MS-OXPROPS] 2.351 PidLidWeddingAnniversaryLocal
    /// Canonical name: PidLidWeddingAnniversaryLocal
    /// Description: Specifies the wedding anniversary of the contact, at midnight in the client's local time
    /// zone, and is saved without any time zone conversions.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080DF
    /// Data type: PtypTime, 0x0040
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.5.5
    /// Alternate names: dispidApptAnniversaryLocal
    static let lidWeddingAnniversaryLocal = NamedProperty(set: .address,
                                                                        lid: 0x000080DF)
    
    /// [MS-OXPROPS] 2.352 PidLidWeekInterval
    /// Canonical name: PidLidWeekInterval
    /// Description: Identifies the number of weeks that occur between each meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000012
    /// Data type: PtypInteger16, 0x0002
    /// WebDAV: http://schemas.microsoft.com/mapi/week_interval
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.71
    /// Consuming references: [MS-OXOCAL]
    /// Alternate names: LID_WEEK_INTERVAL
    static let lidWeekInterval = NamedProperty(set: .meeting,
                                                             lid: 0x00000012)
    
    /// [MS-OXPROPS] 2.353 PidLidWhere
    /// Canonical name: PidLidWhere
    /// Description: Contains the value of the PidLidLocation property (section 2.159) from the associated
    /// Meeting object.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000002
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/mapi/where
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.5.3
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: LID_WHERE
    static let lidWhere = NamedProperty(set: .meeting,
                                                      lid: 0x00000002)
    
    /// [MS-OXPROPS] 2.354 PidLidWorkAddress
    /// Canonical name: PidLidWorkAddress
    /// Description: Specifies the complete address of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000801B
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:workaddress
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.8
    /// Alternate names: dispidWorkAddress
    static let lidWorkAddress = NamedProperty(set: .address,
                                                            lid: 0x0000801B)
    
    /// [MS-OXPROPS] 2.355 PidLidWorkAddressCity
    /// Canonical name: PidLidWorkAddressCity
    /// Description: Specifies the city or locality portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008046
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:l
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.2
    /// Alternate names: dispidWorkAddressCity
    static let lidWorkAddressCity = NamedProperty(set: .address,
                                                                lid: 0x00008046)
    
    /// [MS-OXPROPS] 2.356 PidLidWorkAddressCountry
    /// Canonical name: PidLidWorkAddressCountry
    /// Description: Specifies the country or region portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008049
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:co
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.5
    /// Alternate names: dispidWorkAddressCountry
    static let lidWorkAddressCountry = NamedProperty(set: .address,
                                                                   lid: 0x00008049)
    
    /// [MS-OXPROPS] 2.357 PidLidWorkAddressCountryCode
    /// Canonical name: PidLidWorkAddressCountryCode
    /// Description: Specifies the country code portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x000080DB
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.6
    /// Alternate names: dispidWorkAddressCountryCode
    static let lidWorkAddressCountryCode = NamedProperty(set: .address,
                                                                       lid: 0x000080DB)
    
    /// [MS-OXPROPS] 2.358 PidLidWorkAddressPostalCode
    /// Canonical name: PidLidWorkAddressPostalCode
    /// Description: Specifies the postal code (ZIP code) portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008048
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:postalcode
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.4
    /// Alternate names: dispidWorkAddressPostalCode
    static let lidWorkAddressPostalCode = NamedProperty(set: .address,
                                                                      lid: 0x00008048)
    
    /// [MS-OXPROPS] 2.359 PidLidWorkAddressPostOfficeBox
    /// Canonical name: PidLidWorkAddressPostOfficeBox
    /// Description: Specifies the post office box portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000804A
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:postofficebox
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.7
    /// Alternate names: dispidWorkAddressPostOfficeBox
    static let lidWorkAddressPostOfficeBox = NamedProperty(set: .address,
                                                                         lid: 0x0000804A)
    
    /// [MS-OXPROPS] 2.360 PidLidWorkAddressState
    /// Canonical name: PidLidWorkAddressState
    /// Description: Specifies the state or province portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008047
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:st
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.3
    /// Alternate names: dispidWorkAddressState
    static let lidWorkAddressState = NamedProperty(set: .address,
                                                                 lid: 0x00008047)
    
    /// [MS-OXPROPS] 2.361 PidLidWorkAddressStreet
    /// Canonical name: PidLidWorkAddressStreet
    /// Description: Specifies the street portion of the work address of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x00008045
    /// Data type: PtypString, 0x001F
    /// WebDAV: urn:schemas:contacts:street
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.1
    /// Alternate names: dispidWorkAddressStreet
    static let lidWorkAddressStreet = NamedProperty(set: .address,
                                                                  lid: 0x00008045)
    
    /// [MS-OXPROPS] 2.362 PidLidYearInterval
    /// Canonical name: PidLidYearInterval
    /// Description: Indicates the yearly interval of the appointment or meeting.
    /// Property set: PSETID_Meeting {6ED8DA90-450B-101B-98DA-00AA003F1305}
    /// Property long ID (LID): 0x00000014
    /// Data type: PtypInteger16, 0x0002
    /// WebDAV: http://schemas.microsoft.com/mapi/year_interval
    /// Area: Meetings
    /// Defining reference: [MS-XWDCAL] section 2.2.7.73
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: LID_YEAR_INTERVAL
    static let lidYearInterval = NamedProperty(set: .meeting,
                                                             lid: 0x00000014)
    
    /// [MS-OXPROPS] 2.363 PidLidYomiCompanyName
    /// Canonical name: PidLidYomiCompanyName
    /// Description: Specifies the phonetic pronunciation of the company name of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000802E
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/yomiorganization
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.6.8
    /// Alternate names: dispidYomiCompanyName
    static let lidYomiCompanyName = NamedProperty(set: .address,
                                                                lid: 0x0000802E)
    
    /// [MS-OXPROPS] 2.364 PidLidYomiFirstName
    /// Canonical name: PidLidYomiFirstName
    /// Description: Specifies the phonetic pronunciation of the given name of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000802C
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/yomifirstname
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.9
    /// Alternate names: dispidYomiFirstName
    static let lidYomiFirstName = NamedProperty(set: .address,
                                                              lid: 0x0000802C)
    
    /// [MS-OXPROPS] 2.365 PidLidYomiLastName
    /// Canonical name: PidLidYomiLastName
    /// Description: Specifies the phonetic pronunciation of the surname of the contact.
    /// Property set: PSETID_Address {00062004-0000-0000-C000-000000000046}
    /// Property long ID (LID): 0x0000802D
    /// Data type: PtypString, 0x001F
    /// WebDAV: http://schemas.microsoft.com/exchange/yomilastname
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.10
    /// Alternate names: dispidYomiLastName
    static let lidYomiLastName = NamedProperty(set: .address,
                                                             lid: 0x0000802D)

    /// [MS-OXPROPS] 2.366 PidNameAcceptLanguage
    /// Canonical name: PidNameAcceptLanguage
    /// Description: Contains the value of the MIME Accept-Language header.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: Accept-Language
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.42
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: AcceptLanguage
    static let nameAcceptLanguage = NamedProperty(set: .internetHeaders,
                                                                name: "Accept-Language")

    /// [MS-OXPROPS] 2.367 PidNameApplicationName
    /// Canonical name: PidNameApplicationName
    /// Description: Specifies the application used to open the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: AppName
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.9
    /// Alternate names: urn:schemas-microsoft-com:office:office#NameOfApplication
    static let nameApplicationName = NamedProperty(set: .publicStrings,
                                                                 name: "AppName")
    
    /// [MS-OXPROPS] 2.368 PidNameAttachmentMacContentType
    /// Canonical name: PidNameAttachmentMacContentType
    /// Description: Contains the Content-Type of the Mac attachment.
    /// Property set: PSETID_Attachment {96357F7F-59E1-47D0-99A7-46515C183B54}
    /// Property name: AttachmentMacContentType
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming reference: [MS-OXCMAIL]
    static let nameAttachmentMacContentType = NamedProperty(set: .attachment,
                                                                          name: "AttachmentMacContentType")
    
    /// [MS-OXPROPS] 2.369 PidNameAttachmentMacInfo
    /// Canonical name: PidNameAttachmentMacInfo
    /// Description: Contains the headers and resource fork data associated with the Mac attachment.
    /// Property set: PSETID_Attachment {96357F7F-59E1-47D0-99A7-46515C183B54}
    /// Property name: AttachmentMacInfo
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming reference: [MS-OXCMAIL]
    static let nameAttachmentMacInfo = NamedProperty(set: .attachment,
                                                                   name: "AttachmentMacInfo")
    ///
    /// [MS-OXPROPS] 2.370 PidNameAttachmentOriginalPermissionType
    /// Canonical name: PidNameAttachmentOriginalPermissionType
    /// Description: Contains the original permission type data associated with a web reference attachment.
    /// Property set: PSETID_Attachment {96357F7F-59E1-47D0-99A7-46515C183B54}
    /// Property name: AttachmentOriginalPermissionType
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2./27
    static let nameAttachmentOriginalPermissionType = NamedProperty(set: .attachment,
                                                                                  name: "AttachmentOriginalPermissionType")

    /// [MS-OXPROPS] 2.371 PidNameAttachmentPermissionType
    /// Canonical name: PidNameAttachmentPermissionType
    /// Description: Contains the permission type data associated with a web reference attachment.
    /// Property set: PSETID_Attachment {96357F7F-59E1-47D0-99A7-46515C183B54}
    /// Property name: AttachmentPermissionType
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2./28
    static let nameAttachmentPermissionType = NamedProperty(set: .attachment,
                                                                                  name: "AttachmentPermissionType")

    /// [MS-OXPROPS] 2.372 PidNameAttachmentProviderType
    /// Canonical name: PidNameAttachmentProviderType
    /// Description: Contains the provider type data associated with a web reference attachment.
    /// Property set: PSETID_Attachment {96357F7F-59E1-47D0-99A7-46515C183B54}
    /// Property name: AttachmentProviderType
    /// Data type: PtypeString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.26
    static let nameAttachmentProviderType = NamedProperty(set: .attachment,
                                                                        name: "AttachmentProviderType")

    /// [MS-OXPROPS] 2.373 PidNameAudioNotes
    /// Canonical name: PidNameAudioNotes
    /// Description: Contains textual annotations to a voice message after it has been delivered to the user's
    /// mailbox.
    /// Property set: PSETID_UnifiedMessaging {4442858E-A9E3-4E80-B900-317A210CC15B}
    /// Property name: UMAudioNotes
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.15
    /// Alternate names: UMAudioNotes
    static let nameAudioNotes = NamedProperty(set: .unifiedMessaging,
                                                            name: "UMAudioNotes")

    /// [MS-OXPROPS] 2.374 PidNameAuthor
    /// Canonical name: PidNameAuthor
    /// Description: Specifies the author of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Author
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.3
    /// Alternate names: urn:schemas-microsoft-com:office:office#Author
    static let nameAuthor = NamedProperty(set: .publicStrings,
                                                        name: "Author")
    
    /// [MS-OXPROPS] 2.375 PidNameAutomaticSpeechRecognitionData
    /// Canonical name: PidNameAutomaticSpeechRecognitionData
    /// Description: Contains an unprotected voice message.
    /// Property set: PSETID_UnifiedMessaging {4442858E-A9E3-4E80-B900-317A210CC15B}
    /// Property name: AsrData
    /// Data type: PtypBinary, 0x0102
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.13
    static let nameAutomaticSpeechRecognitionData = NamedProperty(set: .unifiedMessaging,
                                                                                name: "AsrData")

    /// [MS-OXPROPS] 2.376 PidNameBirthdayContactAttributionDisplayName
    /// Canonical name: PidNameBirthdayContactAttributionDisplayName
    /// Description: Indicates the name of the contact associated with the birthday event.
    /// Property set: PSETID_Address{00062004-0000-0000-C000-000000000046}
    /// Property name: BirthdayContactAttributionDisplayName
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.52
    static let nameBirthdayContactAttributionDisplayName = NamedProperty(set: .address,
                                                                                       name: "BirthdayContactAttributionDisplayName")
    
    /// [MS-OXPROPS] 2.377 PidNameBirthdayContactEntryId
    /// Canonical name: PidNameBirthdayContactEntryId
    /// Description: Indicate the EntryID of the contact associated with the birthday event.
    /// Property set: PSETID_Address{00062004-0000-0000-C000-000000000046}
    /// Property name: BirthdayContactEntryId
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.53
    static let nameBirthdayContactEntryId = NamedProperty(set: .address,
                                                                        name: "BirthdayContactEntryId")
    
    /// [MS-OXPROPS] 2.378 PidNameBirthdayContactPersonGuid
    /// Canonical name: PidNameBirthdayContactPersonGuid
    /// Description: Indicates the person ID's GUID of the contact associated with the birthday event.
    /// Property set: PSETID_Address{00062004-0000-0000-C000-000000000046}
    /// Property name: BirthdayContactPersonGuid
    /// Data type: PtypBinary, 0x0102
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.54
    static let nameBirthdayContactPersonGuid = NamedProperty(set: .address,
                                                                           name: "BirthdayContactPersonGuid")

    /// [MS-OXPROPS] 2.379 PidNameByteCount
    /// Canonical name: PidNameByteCount
    /// Description: Specifies the size, in bytes, of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: ByteCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.22
    /// Alternate names: urn:schemas-microsoft-com:office:office#Bytes
    static let nameByteCount = NamedProperty(set: .publicStrings,
                                                           name: "ByteCount")
    /// [MS-OXPROPS] 2.380 PidNameCalendarAttendeeRole
    /// Canonical name: PidNameCalendarAttendeeRole
    /// Description: Specifies the role of the attendee.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:attendeerole
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.7
    /// Alternate names: urn:schemas:calendar:attendeerole
    static let nameCalendarAttendeeRole = NamedProperty(set: .publicStrings,
                                                                      name: "urn:schemas:calendar:attendeerole")
    
    /// [MS-OXPROPS] 2.381 PidNameCalendarBusystatus
    /// Canonical name: PidNameCalendarBusystatus
    /// Description: Specifies whether the attendee is busy at the time of an appointment on their
    /// calendar.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:busystatus
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.8
    /// Alternate names: urn:schemas:calendar:busystatus
    static let nameCalendarBusystatus = NamedProperty(set: .publicStrings,
                                                                    name: "urn:schemas:calendar:busystatus")
    
    /// [MS-OXPROPS] 2.382 PidNameCalendarContact
    /// Canonical name: PidNameCalendarContact
    /// Description: Identifies the name of a contact who is an attendee of a meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:contact
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.9
    /// Alternate names: urn:schemas:calendar:contact
    static let nameCalendarContact = NamedProperty(set: .publicStrings,
                                                                 name: "urn:schemas:calendar:contact")
    
    /// [MS-OXPROPS] 2.383 PidNameCalendarContactUrl
    /// Canonical name: PidNameCalendarContactUrl
    /// Description: Identifies the URL where you can access contact information in HTML format.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:contacturl
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.10
    /// Alternate names: urn:schemas:calendar:contacturl
    static let nameCalendarContactUrl = NamedProperty(set: .publicStrings,
                                                                    name: "urn:schemas:calendar:contacturl")
    
    /// [MS-OXPROPS] 2.384 PidNameCalendarCreated
    /// Canonical name: PidNameCalendarCreated
    /// Description: Identifies the date and time, in UTC, when the organizer created the appointment or
    /// meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:created
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.11
    /// Alternate names: urn:schemas:calendar:created
    static let nameCalendarCreated = NamedProperty(set: .publicStrings,
                                                                 name: "urn:schemas:calendar:created")
    
    /// [MS-OXPROPS] 2.385 PidNameCalendarDescriptionUrl
    /// Canonical name: PidNameCalendarDescriptionUrl
    /// Description: Specifies the URL of a resource that contains a description of an appointment or
    /// meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:descriptionurl
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.12
    /// Alternate names: urn:schemas:calendar:descriptionurl
    static let nameCalendarDescriptionUrl = NamedProperty(set: .publicStrings,
                                                                        name: "urn:schemas:calendar:descriptionurl")
    
    /// [MS-OXPROPS] 2.386 PidNameCalendarDuration
    /// Canonical name: PidNameCalendarDuration
    /// Description: Identifies the duration, in seconds, of an appointment or meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:duration
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.13
    /// Alternate names: urn:schemas:calendar:duration
    static let nameCalendarDuration = NamedProperty(set: .publicStrings,
                                                                  name: "urn:schemas:calendar:duration")
    
    /// [MS-OXPROPS] 2.387 PidNameCalendarExceptionDate
    /// Canonical name: PidNameCalendarExceptionDate
    /// Description: Identifies a list of dates that are exceptions to a recurring appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:exdate
    /// Data type: PtypMultipleTime, 0x1040
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.14
    /// Alternate names: urn:schemas:calendar:exdate
    static let nameCalendarExceptionDate = NamedProperty(set: .publicStrings,
                                                                       name: "urn:schemas:calendar:exdate")
    
    /// [MS-OXPROPS] 2.388 PidNameCalendarExceptionRule
    /// Canonical name: PidNameCalendarExceptionRule
    /// Description: Specifies an exception rule for a recurring appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:exrule
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.15
    /// Alternate names: urn:schemas:calendar:exrule
    static let nameCalendarExceptionRule = NamedProperty(set: .publicStrings,
                                                                       name: "urn:schemas:calendar:exrule")
    
    /// [MS-OXPROPS] 2.389 PidNameCalendarGeoLatitude
    /// Canonical name: PidNameCalendarGeoLatitude
    /// Description: Specifies the geographical latitude of the location of an appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:geolatitude
    /// Data type: PtypFloating64, 0x0005
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.16
    /// Alternate names: urn:schemas:calendar:geolatitude
    static let nameCalendarGeoLatitude = NamedProperty(set: .publicStrings,
                                                                     name: "urn:schemas:calendar:geolatitude")

    /// [MS-OXPROPS] 2.390 PidNameCalendarGeoLongitude
    /// Canonical name: PidNameCalendarGeoLongitude
    /// Description: Specifies the geographical longitude of the location of an appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:geolongitude
    /// Data type: PtypFloating64, 0x0005
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.17
    /// Alternate names: urn:schemas:calendar:geolongitude
    static let nameCalendarGeoLongitude = NamedProperty(set: .publicStrings,
                                                                      name: "urn:schemas:calendar:geolongitude")

    /// [MS-OXPROPS] 2.391 PidNameCalendarInstanceType
    /// Canonical name: PidNameCalendarInstanceType
    /// Description: Specifies the type of an appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:instancetype
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.18
    /// Alternate names: urn:schemas:calendar:instancetype
    static let nameCalendarInstanceType = NamedProperty(set: .publicStrings,
                                                                      name: "urn:schemas:calendar:instancetype")

    /// [MS-OXPROPS] 2.392 PidNameCalendarIsOrganizer
    /// Canonical name: PidNameCalendarIsOrganizer
    /// Description: Specifies whether an attendee is the organizer of an appointment or meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:isorganizer
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.19
    /// Alternate names: urn:schemas:calendar:isorganizer
    static let nameCalendarIsOrganizer = NamedProperty(set: .publicStrings,
                                                                     name: "urn:schemas:calendar:isorganizer")

    /// [MS-OXPROPS] 2.393 PidNameCalendarLastModified
    /// Canonical name: PidNameCalendarLastModified
    /// Description: Specifies the date and time, in UTC, when an appointment was last modified.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:lastmodified
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.20
    /// Alternate names: urn:schemas:calendar:lastmodified
    static let nameCalendarLastModified = NamedProperty(set: .publicStrings,
                                                                      name: "urn:schemas:calendar:lastmodified")

    /// [MS-OXPROPS] 2.394 PidNameCalendarLocationUrl
    /// Canonical name: PidNameCalendarLocationUrl
    /// Description: Specifies a URL with location information in HTML format.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:locationurl
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.21
    /// Alternate names: urn:schemas:calendar:locationurl
    static let nameCalendarLocationUrl = NamedProperty(set: .publicStrings,
                                                                     name: "urn:schemas:calendar:locationurl")

    /// [MS-OXPROPS] 2.395 PidNameCalendarMeetingStatus
    /// Canonical name: PidNameCalendarMeetingStatus
    /// Description: Specifies the status of an appointment or meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:meetingstatus
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.22
    /// Alternate names: urn:schemas:calendar:meetingstatus
    static let nameCalendarMeetingStatus = NamedProperty(set: .publicStrings,
                                                                       name: "urn:schemas:calendar:meetingstatus")

    /// [MS-OXPROPS] 2.396 PidNameCalendarMethod
    /// Canonical name: PidNameCalendarMethod
    /// Description: Specifies the iCalendar method that is associated with an Appointment object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:method
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.23
    /// Alternate names: urn:schemas:calendar:method
    static let nameCalendarMethod = NamedProperty(set: .publicStrings,
                                                                name: "urn:schemas:calendar:method")

    /// [MS-OXPROPS] 2.397 PidNameCalendarProductId
    /// Canonical name: PidNameCalendarProductId
    /// Description: Identifies the product that created the iCalendar-formatted stream.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:prodid
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.24
    /// Alternate names: urn:schemas:calendar:prodid
    static let nameCalendarProductId = NamedProperty(set: .publicStrings,
                                                                   name: "urn:schemas:calendar:prodid")

    /// [MS-OXPROPS] 2.398 PidNameCalendarRecurrenceIdRange
    /// Canonical name: PidNameCalendarRecurrenceIdRange
    /// Description: Specifies which instances of a recurring appointment are being referred to.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:recurrenceidrange
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.25
    /// Alternate names: urn:schemas:calendar:recurrenceidrange
    static let nameCalendarRecurrenceIdRange = NamedProperty(set: .publicStrings,
                                                                       name: "urn:schemas:calendar:recurrenceidrange")

    /// [MS-OXPROPS] 2.399 PidNameCalendarReminderOffset
    /// Canonical name: PidNameCalendarReminderOffset
    /// Description: Identifies the number of seconds before an appointment starts that a reminder is to be
    /// displayed.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:reminderoffset
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.26
    /// Alternate names: urn:schemas:calendar:reminderoffset
    static let nameCalendarReminderOffset = NamedProperty(set: .publicStrings,
                                                                        name: "urn:schemas:calendar:reminderoffset")

    /// [MS-OXPROPS] 2.400 PidNameCalendarResources
    /// Canonical name: PidNameCalendarResources
    /// Description: Identifies a list of resources, such as rooms and video equipment, that are available for
    /// an appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:resources
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.27
    /// Alternate names: urn:schemas:calendar:resources
    static let nameCalendarResources = NamedProperty(set: .publicStrings,
                                                                name: "urn:schemas:calendar:resources")

    /// [MS-OXPROPS] 2.401 PidNameCalendarRsvp
    /// Canonical name: PidNameCalendarRsvp
    /// Description: Specifies whether the organizer of an appointment or meeting requested a response.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:rsvp
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.28
    /// Alternate names: urn:schemas:calendar:rsvp
    static let nameCalendarRsvp = NamedProperty(set: .publicStrings,
                                                              name: "urn:schemas:calendar:rsvp")

    /// [MS-OXPROPS] 2.402 PidNameCalendarSequence
    /// Canonical name: PidNameCalendarSequence
    /// Description: Specifies the sequence number of a version of an appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:sequence
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.29
    /// Alternate names: urn:schemas:calendar:sequence
    static let nameCalendarSequence = NamedProperty(set: .publicStrings,
                                                                  name: "urn:schemas:calendar:sequence")

    /// [MS-OXPROPS] 2.403 PidNameCalendarTimeZone
    /// Canonical name: PidNameCalendarTimeZone
    /// Description: Specifies the time zone of an appointment or meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:timezone
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.30
    /// Alternate names: urn:schemas:calendar:timezone
    static let nameCalendarTimeZone = NamedProperty(set: .publicStrings,
                                                                  name: "urn:schemas:calendar:timezone")

    /// [MS-OXPROPS] 2.404 PidNameCalendarTimeZoneId
    /// Canonical name: PidNameCalendarTimeZoneId
    /// Description: Specifies the time zone identifier of an appointment or meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:timezoneid
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.31
    /// Alternate names: urn:schemas:calendar:timezoneid
    static let nameCalendarTimeZoneId = NamedProperty(set: .publicStrings,
                                                                    name: "urn:schemas:calendar:timezoneid")

    /// [MS-OXPROPS] 2.405 PidNameCalendarTransparent
    /// Canonical name: PidNameCalendarTransparent
    /// Description: Specifies whether an appointment or meeting is visible to busy time searches.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:transparent
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.32
    /// Alternate names: urn:schemas:calendar:transparent
    static let nameCalendarTransparent = NamedProperty(set: .publicStrings,
                                                                     name: "urn:schemas:calendar:transparent")

    /// [MS-OXPROPS] 2.406 PidNameCalendarUid
    /// Canonical name: PidNameCalendarUid
    /// Description: Specifies the unique identifier of an appointment or meeting.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:uid
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.33
    /// Alternate names: urn:schemas:calendar:uid
    static let nameCalendarUid = NamedProperty(set: .publicStrings,
                                                             name: "urn:schemas:calendar:uid")

    /// [MS-OXPROPS] 2.407 PidNameCalendarVersion
    /// Canonical name: PidNameCalendarVersion
    /// Description: Identifies the version of the iCalendar specification, as specified in [MS-OXCICAL]
    /// section 2.1.3.1.1.3, that is required to correctly interpret an iCalendar object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:version
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.34
    /// Alternate names: urn:schemas:calendar:version
    static let nameCalendarVersion = NamedProperty(set: .publicStrings,
                                                                 name: "urn:schemas:calendar:version")

    /// [MS-OXPROPS] 2.408 PidNameCategory
    /// Canonical name: PidNameCategory
    /// Description: Specifies the category of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Category
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.18
    /// Alternate names: urn:schemas-microsoft-com:office:office#Category
    static let nameCategory = NamedProperty(set: .publicStrings,
                                                          name: "Category")

    /// [MS-OXPROPS] 2.409 PidNameCharacterCount
    /// Canonical name: PidNameCharacterCount
    /// Description: Specifies the character count of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: CharCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.16
    /// Alternate names: urn:schemas-microsoft-com:office:office#Characters
    static let nameCharacterCount = NamedProperty(set: .publicStrings,
                                                                name: "CharCount")

    /// [MS-OXPROPS] 2.410 PidNameComments
    /// Canonical name: PidNameComments
    /// Description: Specifies the comments of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Comments
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.5
    /// Alternate names: urn:schemas-microsoft-com:office:office#Comments
    static let nameComments = NamedProperty(set: .common,
                                                          name: "Comments")

    /// [MS-OXPROPS] 2.411 PidNameCompany
    /// Canonical name: PidNameCompany
    /// Description: Specifies the company for which the file was created.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Company
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.21
    /// Alternate names: urn:schemas-microsoft-com:office:office#Company
    static let nameCompany = NamedProperty(set: .common,
                                                         name: "Company")
    
    /// [MS-OXPROPS] 2.412 PidNameContentBase
    /// Canonical name: PidNameContentBase
    /// Description: Specifies the value of the MIME Content-Base header, which defines the base URI for
    /// resolving relative URLs contained within the message body.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: Content-Base
    /// Data type: PtypString, 0x001FArea: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.41
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: BodyContentBase
    static let nameContentBase = NamedProperty(set: .internetHeaders,
                                                             name: "Content-Base")
    /// [MS-OXPROPS] 2.413 PidNameContentClass
    /// Canonical name: PidNameContentClass
    /// Description: Contains a string that identifies the type of content of a Message object.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: Content-Class
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.48
    /// Consuming references: [MS-OXBBODY], [MS-OXCMAIL], [MS-OXORMMS], [MS-OXOSMMS], [MSOXOUM], [MS-OXSHARE], [MS-XWDCAL]
    /// Alternate names: DAV:contentclass, urn:schemas:mailheader:content-class
    static let nameContentClass = NamedProperty(set: .internetHeaders,
                                                              name: "Content-Class")
    
    /// [MS-OXPROPS] 2.414 PidNameContentType
    /// Canonical name: PidNameContentType
    /// Description: Specifies the type of the body part content.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: Content-Type
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.50
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: urn:schemas:mailheader:content-type
    static let nameContentType = NamedProperty(set: .internetHeaders,
                                                             name: "Content-Type")
    
    /// [MS-OXPROPS] 2.415 PidNameCreateDateTimeReadOnly
    /// Canonical name: PidNameCreateDateTimeReadOnly
    /// Description: Specifies the time, in UTC, that the file was first created.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: CreateDtmRo
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.12
    /// Alternate names: urn:schemas-microsoft-com:office:office#Created
    static let nameCreateDateTimeReadOnly = NamedProperty(set: .publicStrings,
                                                                        name: "CreateDtmRo")
    
    /// [MS-OXPROPS] 2.416 PidNameCrossReference
    /// Canonical name: PidNameCrossReference
    /// Description: Contains the name of the host (with domains omitted) and a white-space-separated list
    /// of colon-separated pairs of newsgroup names and message numbers.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: Xref
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXCMAIL] section 2.5.3
    /// Alternate names: urn:schemas:mailheader:xref
    static let nameCrossReference = NamedProperty(set: .internetHeaders,
                                                                name: "Xref")
    
    /// [MS-OXPROPS] 2.417 PidNameDavId
    /// Canonical name: PidNameDavId
    /// Description: Specifies a unique ID for the calendar item.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DAV:id
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.1.2
    /// Alternate names: DAV:id
    static let nameDavId = NamedProperty(set: .publicStrings,
                                                       name: "DAV:id")
    
    /// [MS-OXPROPS] 2.418 PidNameDavIsCollection
    /// Canonical name: PidNameDavIsCollection
    /// Description: Indicates whether a Calendar object is a collection.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DAV:iscollection
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.1.3
    /// Alternate names: DAV:iscollection
    static let nameDavIsCollection = NamedProperty(set: .publicStrings,
                                                                 name: "DAV:iscollection")
    
    /// [MS-OXPROPS] 2.419 PidNameDavIsStructuredDocument
    /// Canonical name: PidNameDavIsStructuredDocument
    /// Description: Indicates whether a Calendar object is a structured document.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DAV:isstructureddocument
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.1.4
    /// Alternate names: DAV:isstructureddocument
    static let nameDavIsStructuredDocument = NamedProperty(set: .publicStrings,
                                                                         name: "DAV:isstructureddocument")
    
    /// [MS-OXPROPS] 2.420 PidNameDavParentName
    /// Canonical name: PidNameDavParentName
    /// Description: Specifies the name of the Folder object that contains the Calendar object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DAV:parentname
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.1.5
    /// Alternate names: DAV:parentname
    static let nameDavParentName = NamedProperty(set: .publicStrings,
                                                               name: "DAV:parentname")

    /// [MS-OXPROPS] 2.421 PidNameDavUid
    /// Canonical name: PidNameDavUid
    /// Description: Specifies the unique identifier for an item.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DAV:uid
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.1.6
    /// Alternate names: DAV:uid
    static let nameDavUid = NamedProperty(set: .publicStrings,
                                                        name: "DAV:uid")
    
    /// [MS-OXPROPS] 2.422 PidNameDocumentParts
    /// Canonical name: PidNameDocumentParts
    /// Description: Specifies the title of each part of the document.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DocParts
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.29
    /// Alternate names: urn:schemas-microsoft-com:office:office#PartTitles
    static let nameDocumentParts = NamedProperty(set: .publicStrings,
                                                               name: "DocParts")
    
    /// [MS-OXPROPS] 2.423 PidNameEditTime
    /// Canonical name: PidNameEditTime
    /// Description: Specifies the time that the file was last edited.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: EditTime
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.10
    /// Alternate names: urn:schemas-microsoft-com:office:office#TotalTime
    static let nameEditTime = NamedProperty(set: .publicStrings,
                                                          name: "EditTime")

    /// [MS-OXPROPS] 2.424 PidNameExchangeIntendedBusyStatus
    /// Canonical name: PidNameExchangeIntendedBusyStatus
    /// Description: Specifies the intended free/busy status of a meeting in a Meeting request.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/intendedbusystatus
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.8.1
    /// Alternate names: http://schemas.microsoft.com/exchange/intendedbusystatus
    static let nameExchangeIntendedBusyStatus = NamedProperty(set: .publicStrings,
                                                                            name: "http://schemas.microsoft.com/exchange/intendedbusystatus")

    /// [MS-OXPROPS] 2.425 PidNameExchangeJunkEmailMoveStamp
    /// Canonical name: PidNameExchangeJunkEmailMoveStamp
    /// Description: Indicates that the message is not to be processed by a spam filter.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/junkemailmovestamp
    /// Data type: PtypInteger32, 0x0003
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXCSPAM] section 2.2.1.2
    /// Consuming reference: [MS-OXORSS]
    /// Alternate names: http://schemas.microsoft.com/exchange/junkemailmovestamp
    static let nameExchangeJunkEmailMoveStamp = NamedProperty(set: .publicStrings,
                                                                            name: "http://schemas.microsoft.com/exchange/junkemailmovestamp")

    /// [MS-OXPROPS] 2.426 PidNameExchangeModifyExceptionStructure
    /// Canonical name: PidNameExchangeModifyExceptionStructure
    /// Description: Specifies a structure that modifies an exception to the recurrence.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/modifyexceptionstruct
    /// Data type: PtypBinary, 0x0102
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.8.2
    /// Alternate names: http://schemas.microsoft.com/exchange/modifyexceptionstruct
    static let nameExchangeModifyExceptionStructure = NamedProperty(set: .publicStrings,
                                                                                  name: "http://schemas.microsoft.com/exchange/modifyexceptionstruct")

    /// [MS-OXPROPS] 2.427 PidNameExchangeNoModifyExceptions
    /// Canonical name: PidNameExchangeNoModifyExceptions
    /// Description: Indicates whether exceptions to a recurring appointment can be modified.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/nomodifyexceptions
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.8.3
    /// Alternate names: http://schemas.microsoft.com/exchange/nomodifyexceptions
    static let nameExchangeNoModifyExceptions = NamedProperty(set: .publicStrings,
                                                                            name: "http://schemas.microsoft.com/exchange/nomodifyexceptions")

    /// [MS-OXPROPS] 2.428 PidNameExchangePatternEnd
    /// Canonical name: PidNameExchangePatternEnd
    /// Description: Identifies the maximum time when an instance of a recurring appointment ends.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/patternend
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.8.4
    /// Alternate names: http://schemas.microsoft.com/exchange/patternend
    static let nameExchangePatternEnd = NamedProperty(set: .publicStrings,
                                                                    name: "http://schemas.microsoft.com/exchange/patternend")

    /// [MS-OXPROPS] 2.429 PidNameExchangePatternStart
    /// Canonical name: PidNameExchangePatternStart
    /// Description: Identifies the absolute minimum time when an instance of a recurring appointment
    /// starts.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/patternstart
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.8.5
    /// Alternate names: http://schemas.microsoft.com/exchange/patternstart
    static let nameExchangePatternStart = NamedProperty(set: .publicStrings,
                                                                      name: "http://schemas.microsoft.com/exchange/patternstart")

    /// [MS-OXPROPS] 2.430 PidNameExchangeReminderInterval
    /// Canonical name: PidNameExchangeReminderInterval
    /// Description: Identifies the time, in seconds, between reminders.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/exchange/reminderinterval
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.8.6
    /// Consuming reference: [MS-XWDCAL]
    /// Alternate names: http://schemas.microsoft.com/exchange/reminderinterval
    static let nameExchangeReminderInterval = NamedProperty(set: .publicStrings,
                                                                          name: "http://schemas.microsoft.com/exchange/reminderinterval")

    /// [MS-OXPROPS] 2.431 PidNameExchDatabaseSchema
    /// Canonical name: PidNameExchDatabaseSchema
    /// Description: Specifies an array of URLs that identifies other folders within the same message store
    /// that contain schema definition items.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas-microsoft-com:exch-data:baseschema
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.5.1
    /// Alternate names: urn:schemas-microsoft-com:exch-data:baseschema
    static let nameExchDatabaseSchema = NamedProperty(set: .publicStrings,
                                                                    name: "urn:schemas-microsoft-com:exch-data:baseschema")

    /// [MS-OXPROPS] 2.432 PidNameExchDataExpectedContentClass
    /// Canonical name: PidNameExchDataExpectedContentClass
    /// Description: Specifies an array of names that indicates the expected content classes of items within
    /// a folder.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas-microsoft-com:exch-data:expected-content-class
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.5.2
    /// Alternate names: urn:schemas-microsoft-com:exch-data:expected-content-class
    static let nameExchDataExpectedContentClass = NamedProperty(set: .publicStrings,
                                                                              name: "urn:schemas-microsoft-com:exch-data:expected-content-class")

    /// [MS-OXPROPS] 2.433 PidNameExchDataSchemaCollectionReference
    /// Canonical name: PidNameExchDataSchemaCollectionReference
    /// Description: Specifies an array of names that indicates the expected content classes of items within a
    /// folder.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas-microsoft-com:exch-data:schema-collection-ref
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.5.3
    /// Alternate names: urn:schemas-microsoft-com:exch-data:schema-collection-ref
    static let nameExchDataSchemaCollectionReference = NamedProperty(set: .publicStrings,
                                                                                   name: "urn:schemas-microsoft-com:exch-data:schema-collection-ref")

    /// [MS-OXCEXT] 2.434 PidNameExtractedAddresses
    /// Canonical name: PidNameExtractedAddresses
    /// Description: Contains an XML document with a single AddressSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedAddresses
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.1
    /// Alternate names: dispidXmlExtractedAddresses
    static let nameExtractedAddresses = NamedProperty(set: .xmlExtractedEntities,
                                                                    name: "XmlExtractedAddresses")

    /// [MS-OXCEXT] 2.435 PidNameExtractedContacts
    /// Canonical name: PidNameExtractedContacts
    /// Description: Contains an XML document with a single ContactSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedContacts
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.2
    /// Alternate names: dispidXmlExtractedContacts
    static let nameExtractedContacts = NamedProperty(set: .xmlExtractedEntities,
                                                                   name: "XmlExtractedContacts")

    /// [MS-OXCEXT] 2.436 PidNameExtractedEmails
    /// Canonical name: PidNameExtractedEmails
    /// Description: Contains an XML document with a single EmailSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedEmails
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.3
    /// Alternate names: dispidXmlExtractedEmails
    static let nameExtractedEmails = NamedProperty(set: .xmlExtractedEntities,
                                                                 name: "XmlExtractedEmails")

    /// [MS-OXCEXT] 2.437 PidNameExtractedMeetings
    /// Canonical name: PidNameExtractedMeetings
    /// Description: Contains an XML document with a single MeetingSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedMeetings
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.4
    /// Alternate names: dispidXmlExtractedMeetings
    static let nameExtractedMeetings = NamedProperty(set: .xmlExtractedEntities,
                                                                   name: "XmlExtractedMeetings")

    /// [MS-OXCEXT] 2.438 PidNameExtractedPhones
    /// Canonical name: PidNameExtractedPhones
    /// Description: Contains an XML document with a single PhoneSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedPhones
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.5
    /// Alternate names: dispidXmlExtractedPhones
    static let nameExtractedPhones = NamedProperty(set: .xmlExtractedEntities,
                                                                 name: "XmlExtractedPhones")

    /// [MS-OXCEXT] 2.439 PidNameExtractedTasks
    /// Canonical name: PidNameExtractedTasks
    /// Description: Contains an XML document with a single TaskSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedTasks
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.6
    /// Alternate names: dispidXmlExtractedTasks
    static let nameExtractedTasks = NamedProperty(set: .xmlExtractedEntities,
                                                                name: "XmlExtractedTasks")

    /// [MS-OXCEXT] 2.440 PidNameExtractedUrls
    /// Canonical name: PidNameExtractedUrls
    /// Description: Contains an XML document with a single UrlSet element.
    /// Property set: PSETID_XmlExtractedEntities {23239608-685D-4732-9C55-4C95CB4E8E33}
    /// Property name: XmlExtractedUrls
    /// Data type: PtypString, 0x001F
    /// Area: Extracted Entities
    /// Defining reference: [MS-OXCEXT] section 2.2.2.7
    /// Alternate names: dispidXmlExtractedUrls
    static let nameExtractedUrls = NamedProperty(set: .xmlExtractedEntities,
                                                               name: "XmlExtractedUrls")
    
    /// [MS-OXPROPS] 2.441 PidNameFrom
    /// Canonical name: PidNameFrom
    /// Description: Specifies the SMTP email alias of the organizer of an appointment or meeting.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: From
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-XWDCAL] section 2.2.2.35
    /// Alternate names: urn:schemas:calendar:organizer
    static let nameFrom = NamedProperty(set: .internetHeaders,
                                                      name: "From")
    
    /// [MS-OXPROPS] 2.442 PidNameHeadingPairs
    /// Canonical name: PidNameHeadingPairs
    /// Description: Specifies which group of headings are indented in the document.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: HeadingPairs
    /// Data type: PtypBinary, 0x0102
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.30
    /// Alternate names: urn:schemas-microsoft-com:office:office#HeadingPairs
    static let nameHeadingPairs = NamedProperty(set: .publicStrings,
                                                              name: "HeadingPairs")
    
    /// [MS-OXPROPS] 2.443 PidNameHiddenCount
    /// Canonical name: PidNameHiddenCount
    /// Description: Specifies the hidden value of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: HiddenCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.27
    /// Alternate names: urn:schemas-microsoft-com:office:office#HiddenSlides
    static let nameHiddenCount = NamedProperty(set: .publicStrings,
                                                             name: "HiddenCount")

    /// [MS-OXPROPS] 2.444 PidNameHttpmailCalendar
    /// Canonical name: PidNameHttpmailCalendar
    /// Description: Specifies the URL for the Calendar folder for a particular user.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:httpmail:calendar
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.3.1
    /// Alternate names: urn:schemas:httpmail:calendar
    static let nameHttpmailCalendar = NamedProperty(set: .publicStrings,
                                                                  name: "urn:schemas:httpmail:calendar")
    
    /// [MS-OXPROPS] 2.445 PidNameHttpmailHtmlDescription
    /// Canonical name: PidNameHttpmailHtmlDescription
    /// Description: Specifies the HTML content of the message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:httpmail:htmldescription
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.3.2
    /// Alternate names: urn:schemas:httpmail:htmldescription
    static let nameHttpmailHtmlDescription = NamedProperty(set: .publicStrings,
                                                                         name: "urn:schemas:httpmail:htmldescription")
    
    /// [MS-OXPROPS] 2.446 PidNameHttpmailSendMessage
    /// Canonical name: PidNameHttpmailSendMessage
    /// Description: Specifies the email submission URI to which outgoing email is submitted.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:httpmail:sendmsg
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.3.3
    /// Alternate names: urn:schemas:httpmail:sendmsg
    static let nameHttpmailSendMessage = NamedProperty(set: .publicStrings,
                                                                     name: "urn:schemas:httpmail:sendmsg")
    
    /// [MS-OXPROPS] 2.447 PidNameICalendarRecurrenceDate
    /// Canonical name: PidNameICalendarRecurrenceDate
    /// Description: Identifies an array of instances of a recurring appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:rdate
    /// Data type: PtypMultipleTime, 0x1040
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.36
    /// Alternate names: urn:schemas:calendar:rdate
    static let nameICalendarRecurrenceDate = NamedProperty(set: .publicStrings,
                                                                         name: "urn:schemas:calendar:rdate")
    
    /// [MS-OXPROPS] 2.448 PidNameICalendarRecurrenceRule
    /// Canonical name: PidNameICalendarRecurrenceRule
    /// Description: Specifies the rule for the pattern that defines a recurring appointment.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:rrule
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Common
    /// Defining reference: [MS-XWDCAL] section 2.2.2.37
    /// Alternate names: urn:schemas:calendar:rrule
    static let nameICalendarRecurrenceRule = NamedProperty(set: .publicStrings,
                                                                         name: "urn:schemas:calendar:rrule")
    
    /// [MS-OXPROPS] 2.449 PidNameInternetSubject
    /// Canonical name: PidNameInternetSubject
    /// Description: Specifies the subject of the message.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: Subject
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-XWDCAL] section 2.2.4.1
    /// Alternate names: urn:schemas:mailheader:subject
    static let nameInternetSubject = NamedProperty(set: .internetHeaders,
                                                                 name: "Subject")
    
    /// [MS-OXPROPS] 2.450 PidNameIsBirthdayContactWritable
    /// Canonical name: PidNameIsBirthdayContactWritable
    /// Description: Indicates whether the contact associated with the birthday event is writable.
    /// Property set: PSETID_Address{00062004-0000-0000-C000-000000000046}
    /// Property name: IsBirthdayContactWritable
    /// Data type: PtypBoolean, 0x000B
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.1.55
    static let nameIsBirthdayContactWritable = NamedProperty(set: .address,
                                                                           name: "IsBirthdayContactWritable")
    
    /// [MS-OXPROPS] 2.451 PidNameKeywords
    /// Canonical name: PidNameKeywords
    /// Description: Contains keywords or categories for the Message object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Keywords
    /// Data type: PtypMultipleString, 0x101F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.17
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOCAL], [MSOXOCFG], [MS-OXODOC], [MS-OXONOTE],[MS-XWDCAL]
    /// Alternate names: urn:schemas-microsoft-com:office:office#Keywords,
    /// http://schemas.microsoft.com/exchange/keywords-utf8
    static let nameKeywords = NamedProperty(set: .publicStrings,
                                                          name: "Keywords")

    /// [MS-OXPROPS] 2.452 PidNameLastAuthor
    /// Canonical name: PidNameLastAuthor
    /// Description: Specifies the most recent author of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: LastAuthor
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.7
    /// Alternate names: urn:schemas-microsoft-com:office:office#LastAuthor
    static let nameLastAuthor = NamedProperty(set: .publicStrings,
                                                            name: "LastAuthor")

    /// [MS-OXPROPS] 2.453 PidNameLastPrinted
    /// Canonical name: PidNameLastPrinted
    /// Description: Specifies the time, in UTC, that the file was last printed.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: LastPrinted
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.11
    /// Alternate names: urn:schemas-microsoft-com:office:office#LastPrinted
    static let nameLastPrinted = NamedProperty(set: .publicStrings,
                                                             name: "LastPrinted")

    /// [MS-OXPROPS] 2.454 PidNameLastSaveDateTime
    /// Canonical name: PidNameLastSaveDateTime
    /// Description: Specifies the time, in UTC, that the file was last saved.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: LastSaveDtm
    /// Data type: PtypTime, 0x0040
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.13
    /// Alternate names: urn:schemas-microsoft-com:office:office#LastSaved
    static let nameLastSaveDateTime = NamedProperty(set: .publicStrings,
                                                                  name: "LastSaveDtm")

    /// [MS-OXPROPS] 2.455 PidNameLineCount
    /// Canonical name: PidNameLineCount
    /// Description: Specifies the number of lines in the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: LineCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.23
    /// Alternate names: urn:schemas-microsoft-com:office:office#Lines
    static let nameLineCount = NamedProperty(set: .publicStrings,
                                                           name: "LineCount")

    /// [MS-OXPROPS] 2.456 PidNameLinksDirty
    /// Canonical name: PidNameLinksDirty
    /// Description: Indicates whether the links in the document are up-to-date.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: LinksDirty
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.31
    /// Alternate names: urn:schemas-microsoft-com:office:office#LinksUpToDate
    static let nameLinksDirty = NamedProperty(set: .publicStrings,
                                                            name: "LinksDirty")

    /// [MS-OXPROPS] 2.457 PidNameLocationUrl
    /// Canonical name: PidNameLocationUrl
    /// Description:
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: urn:schemas:calendar:locationurl
    /// Data type: PtypString, 0x001F
    /// Area: Calendar
    /// Defining reference:
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: urn:schemas:calendar:locationurl, LocationUrl
    static let nameLocationUrl = NamedProperty(set: .publicStrings,
                                                             name: "urn:schemas:calendar:locationurl")

    /// [MS-OXPROPS] 2.458 PidNameManager
    /// Canonical name: PidNameManager
    /// Description: Specifies the manager of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Manager
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.20
    /// Alternate names: urn:schemas-microsoft-com:office:office#Manager
    static let nameManager = NamedProperty(set: .publicStrings,
                                                         name: "Manager")

    /// [MS-OXPROPS] 2.459 PidNameMeetingDoNotForward
    /// Canonical name: PidNameMeetingDoNotForward
    /// Description: Specifies whether to allow the meeting to be forwarded.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DoNotForward
    /// Data type: PtypBoolean, 0x000B
    /// Area: Meetings
    /// Defining reference: [MS-OXOCAL] section 2.2.1.51
    static let nameMeetingDoNotForward = NamedProperty(set: .publicStrings,
                                                                     name: "DoNotForward")
    
    /// [MS-OXPROPS] 2.460 PidNameMSIPLabels
    /// Canonical name: PidNameMSIPLabels
    /// Description: Contains the string that specifies the CLP label information.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: msip_labels
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.59
    static let nameMSIPLabels = NamedProperty(set: .internetHeaders,
                                                            name: "msip_labels")

    /// [MS-OXPROPS] 2.461 PidNameMultimediaClipCount
    /// Canonical name: PidNameMultimediaClipCount
    /// Description: Specifies the number of multimedia clips in the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: MMClipCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.28
    /// Alternate names: urn:schemas-microsoft-com:office:office#MultimediaClips
    static let nameMultimediaClipCount = NamedProperty(set: .publicStrings,
                                                                name: "MMClipCount")

    /// [MS-OXPROPS] 2.462 PidNameNoteCount
    /// Canonical name: PidNameNoteCount
    /// Description: Specifies the number of notes in the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: NoteCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.26
    /// Alternate names: urn:schemas-microsoft-com:office:office#Notes
    static let nameNoteCount = NamedProperty(set: .publicStrings,
                                                                name: "NoteCount")
    
    /// [MS-OXPROPS] 2.463 PidNameOMSAccountGuid
    /// Canonical name: PidNameOMSAccountGuid
    /// Description: Contains the GUID of the SMS account used to deliver the message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: OMSAccountGuid
    /// Data type: PtypString, 0x001F
    /// Area: SMS
    /// Defining reference: [MS-OXOSMMS] section 2.2.1.1
    static let nameOMSAccountGuid = NamedProperty(set: .publicStrings,
                                                                name: "OMSAccountGuid")
    
    /// [MS-OXPROPS] 2.464 PidNameOMSMobileModel
    /// Canonical name: PidNameOMSMobileModel
    /// Description: Indicates the model of the mobile device used to send the SMS or MMS message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: OMSMobileModel
    /// Data type: PtypString, 0x001F
    /// Area: SMS
    /// Defining reference: [MS-OXOSMMS] section 2.2.1.6
    static let nameOMSMobileModel = NamedProperty(set: .publicStrings,
                                                                name: "OMSMobileModel")
    
    /// [MS-OXPROPS] 2.465 PidNameOMSScheduleTime
    /// Canonical name: PidNameOMSScheduleTime
    /// Description: Contains the time, in UTC, at which the client requested that the service provider send
    /// the SMS or MMS message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: OMSScheduleTime
    /// Data type: PtypTime, 0x0040
    /// Area: SMS
    /// Defining reference: [MS-OXOSMMS] section 2.2.1.2
    static let nameOMSScheduleTime = NamedProperty(set: .publicStrings,
                                                                 name: "OMSScheduleTime")
    
    /// [MS-OXPROPS] 2.466 PidNameOMSServiceType
    /// Canonical name: PidNameOMSServiceType
    /// Description: Contains the type of service used to send an SMS or MMS message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: OMSServiceType
    /// Data type: PtypInteger32, 0x0003
    /// Area: SMS
    /// Defining reference: [MS-OXOSMMS] section 2.2.1.3
    static let nameOMSServiceType = NamedProperty(set: .publicStrings,
                                                                name: "OMSServiceType")
    
    /// [MS-OXPROPS] 2.467 PidNameOMSSourceType
    /// Canonical name: PidNameOMSSourceType
    /// Description: Contains the source of an SMS or MMS message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: OMSSourceType
    /// Data type: PtypInteger32, 0x0003
    /// Area: SMS
    /// Defining reference: [MS-OXOSMMS] section 2.2.1.4
    static let nameOMSSourceType = NamedProperty(set: .publicStrings,
                                                               name: "OMSSourceType")

    /// [MS-OXPROPS] 2.468 PidNamePageCount
    /// Canonical name: PidNamePageCount
    /// Description: Specifies the page count of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: PageCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.14
    /// Alternate names: urn:schemas-microsoft-com:office:office#Pages
    static let namePageCount = NamedProperty(set: .publicStrings,
                                                           name: "PageCount")

    /// [MS-OXPROPS] 2.469 PidNameParagraphCount
    /// Canonical name: PidNameParagraphCount
    /// Description: Specifies the number of paragraphs in the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: ParCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.24
    /// Alternate names: urn:schemas-microsoft-com:office:office#Paragraphs
    static let nameParagraphCount = NamedProperty(set: .publicStrings,
                                                                name: "ParCount")

    /// [MS-OXPROPS] 2.470 PidNamePhishingStamp
    /// Canonical name: PidNamePhishingStamp
    /// Description: Indicates whether a message is likely to be phishing.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: http://schemas.microsoft.com/outlook/phishingstamp
    /// Data type: PtypInteger32, 0x0003
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXPHISH] section 2.2.1.1
    static let namePhishingStamp = NamedProperty(set: .publicStrings,
                                                               name: "http://schemas.microsoft.com/outlook/phishingstamp")

    /// [MS-OXPROPS] 2.471 PidNamePresentationFormat
    /// Canonical name: PidNamePresentationFormat
    /// Description: Specifies the presentation format of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: PresFormat
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.19
    /// Alternate names: urn:schemas-microsoft-com:office:office#PresentationFormat
    static let namePresentationFormat = NamedProperty(set: .publicStrings,
                                                                    name: "PresFormat")
    
    /// [MS-OXPROPS] 2.472 PidNameQuarantineOriginalSender
    /// Canonical name: PidNameQuarantineOriginalSender
    /// Description: Specifies the original sender of a message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: quarantine-original-sender
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXCMAIL] section 2.5.4
    static let nameQuarantineOriginalSender = NamedProperty(set: .publicStrings,
                                                                          name: "quarantine-original-sender")
    
    /// [MS-OXPROPS] 2.473 PidNameRevisionNumber
    /// Canonical name: PidNameRevisionNumber
    /// Description: Specifies the revision number of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: RevNumber
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.8
    /// Alternate names: urn:schemas-microsoft-com:office:office#Revision
    static let nameRevisionNumber = NamedProperty(set: .publicStrings,
                                                                name: "RevNumber")
    
    /// [MS-OXPROPS] 2.474 PidNameRightsManagementLicense
    /// Canonical name: PidNameRightsManagementLicense
    /// Description: Specifies the value used to cache the Use License for the rights-managed email
    /// message.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: DRMLicense
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXORMMS] section 2.2.1.1
    static let nameRightsManagementLicense = NamedProperty(set: .publicStrings,
                                                                         name: "DRMLicense")

    /// [MS-OXPROPS] 2.475 PidNameScale
    /// Canonical name: PidNameScale
    /// Description: Indicates whether the image is to be scaled or cropped.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Scale
    /// Data type: PtypBoolean, 0x000B
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.32
    /// Alternate names: urn:schemas-microsoft-com:office:office#ScaleCrop
    static let nameScale = NamedProperty(set: .publicStrings,
                                                       name: "Scale")
    
    /// [MS-OXPROPS] 2.476 PidNameSecurity
    /// Canonical name: PidNameSecurity
    /// Description: Specifies the security level of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Security
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.17
    /// Alternate names: urn:schemas-microsoft-com:office:office#Security
    static let nameSecurity = NamedProperty(set: .publicStrings,
                                                          name: "Security")

    /// [MS-OXPROPS] 2.477 PidNameSlideCount
    /// Canonical name: PidNameSlideCount
    /// Description: Specifies the number of slides in the file attached to the Document object
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: SlideCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.25
    /// Alternate names: urn:schemas-microsoft-com:office:office#Slides
    static let nameSlideCount = NamedProperty(set: .publicStrings,
                                                            name: "SlideCount")
    
    /// [MS-OXPROPS] 2.478 PidNameSubject
    /// Canonical name: PidNameSubject
    /// Description: Specifies the subject of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Subject
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.2
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: urn:schemas-microsoft-com:office:office#Subject
    static let nameSubject = NamedProperty(set: .publicStrings,
                                                         name: "Subject")

    /// [MS-OXPROPS] 2.479 PidNameTemplate
    /// Canonical name: PidNameTemplate
    /// Description: Specifies the template of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Template
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.6
    /// Alternate names: urn:schemas-microsoft-com:office:office#Template
    static let nameTemplate = NamedProperty(set: .publicStrings,
                                                          name: "Template")

    /// [MS-OXPROPS] 2.480 PidNameThumbnail
    /// Canonical name: PidNameThumbnail
    /// Description: Specifies the data representing the thumbnail image of the document.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Thumbnail
    /// Data type: PtypBinary, 0x0102
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.33
    /// Alternate names: urn:schemas-microsoft-com:office:office#ThumbNail
    static let nameThumbnail = NamedProperty(set: .publicStrings,
                                                           name: "Thumbnail")

    /// [MS-OXPROPS] 2.481 PidNameTitle
    /// Canonical name: PidNameTitle
    /// Description: Specifies the title of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: Title
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.1
    /// Alternate names: urn:schemas-microsoft-com:office:office#Title
    static let nameTitle = NamedProperty(set: .publicStrings,
                                                       name: "Title")

    /// [MS-OXPROPS] 2.482 PidNameWordCount
    /// Canonical name: PidNameWordCount
    /// Description: Specifies the word count of the file attached to the Document object.
    /// Property set: PS_PUBLIC_STRINGS {00020329-0000-0000-C000-000000000046}
    /// Property name: WordCount
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXODOC] section 2.2.1.15
    /// Alternate names: urn:schemas-microsoft-com:office:office#Words
    static let nameWordCount = NamedProperty(set: .publicStrings,
                                                           name: "WordCount")

    /// [MS-OXPROPS] 2.483 PidNameXCallId
    /// Canonical name: PidNameXCallId
    /// Description: Contains a unique identifier associated with the phone call.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-CallID
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.12
    /// Consuming reference: [MS-OXCMAIL]
    static let nameXCallId = NamedProperty(set: .internetHeaders,
                                                         name: "X-CallID")

    /// [MS-OXPROPS] 2.484 PidNameXFaxNumberOfPages
    /// Canonical name: PidNameXFaxNumberOfPages
    /// Description: Specifies how many discrete pages are contained within an attachment representing a
    /// facsimile message.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-FaxNumberOfPages
    /// Data type: PtypInteger16, 0x0002
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.8
    /// Consuming reference: [MS-OXCMAIL]
    static let nameXFaxNumberOfPages = NamedProperty(set: .internetHeaders,
                                                                   name: "X-FaxNumberOfPages")

    /// [MS-OXPROPS] 2.485 PidNameXRequireProtectedPlayOnPhone
    /// Canonical name: PidNameXRequireProtectedPlayOnPhone
    /// Description: Indicates that the client only renders the message on a phone.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-RequireProtectedPlayOnPhone
    /// Data type: PtypBoolean, 0x000B
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.14
    static let nameXRequireProtectedPlayOnPhone = NamedProperty(set: .internetHeaders,
                                                                              name: "X-RequireProtectedPlayOnPhone")

    /// [MS-OXPROPS] 2.486 PidNameXSenderTelephoneNumber
    /// Canonical name: PidNameXSenderTelephoneNumber
    /// Description: Contains the telephone number of the caller associated with a voice mail message.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-CallingTelephoneNumber
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.2
    /// Consuming reference: [MS-OXCMAIL]
    static let nameXSenderTelephoneNumber = NamedProperty(set: .internetHeaders,
                                                                        name: "X-CallingTelephoneNumber")

    /// [MS-OXPROPS] 2.487 PidNameXSharingBrowseUrl
    /// Canonical name: PidNameXSharingBrowseUrl
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Browse-Url
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    static let nameXSharingBrowseUrl = NamedProperty(set: .internetHeaders,
                                                                   name: "X-Sharing-Browse-Url")
    
    /// [MS-OXPROPS] 2.488 PidNameXSharingCapabilities
    /// Canonical name: PidNameXSharingCapabilities
    /// Description: Contains a string representation of the value of the PidLidSharingCapabilities
    /// property (section 2.237).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Capabilities
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.2
    static let nameXSharingCapabilities = NamedProperty(set: .internetHeaders,
                                                                      name: "X-Sharing-Capabilities")

    /// [MS-OXPROPS] 2.489 PidNameXSharingConfigUrl
    /// Canonical name: PidNameXSharingConfigUrl
    /// Description: Contains the same value as the PidLidSharingConfigurationUrl property (section
    /// 2.238).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Config-Url
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.4
    static let nameXSharingConfigUrl = NamedProperty(set: .internetHeaders,
                                                                   name: "X-Sharing-Config-Url")

    /// [MS-OXPROPS] 2.490 PidNameXSharingExendedCaps
    /// Canonical name: PidNameXSharingExendedCaps
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Exended-Caps
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    static let nameXSharingExendedCaps = NamedProperty(set: .internetHeaders,
                                                                     name: "X-Sharing-Exended-Caps")

    /// [MS-OXPROPS] 2.491 PidNameXSharingFlavor
    /// Canonical name: PidNameXSharingFlavor
    /// Description: Contains a hexadecimal string representation of the value of the PidLidSharingFlavor
    /// property (section 2.245).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Flavor
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.6
    static let nameXSharingFlavor = NamedProperty(set: .internetHeaders,
                                                                name: "X-Sharing-Flavor")

    /// [MS-OXPROPS] 2.492 PidNameXSharingInstanceGuid
    /// Canonical name: PidNameXSharingInstanceGuid
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Instance-Guid
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    static let nameXSharingInstanceGuid = NamedProperty(set: .internetHeaders,
                                                                      name: "X-Sharing-Instance-Guid")

    /// [MS-OXPROPS] 2.493 PidNameXSharingLocalType
    /// Canonical name: PidNameXSharingLocalType
    /// Description: Contains the same value as the PidLidSharingLocalType property (section 2.259).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Local-Type
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.11
    static let nameXSharingLocalType = NamedProperty(set: .internetHeaders,
                                                                   name: "X-Sharing-Local-Type")

    /// [MS-OXPROPS] 2.494 PidNameXSharingProviderGuid
    /// Canonical name: PidNameXSharingProviderGuid
    /// Description: Contains the hexadecimal string representation of the value of the
    /// PidLidSharingProviderGuid property (section 2.266).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Provider-Guid
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.13
    static let nameXSharingProviderGuid = NamedProperty(set: .internetHeaders,
                                                                      name: "X-Sharing-Provider-Guid")

    /// [MS-OXPROPS] 2.495 PidNameXSharingProviderName
    /// Canonical name: PidNameXSharingProviderName
    /// Description: Contains the same value as the PidLidSharingProviderName property (section
    /// 2.267).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Provider-Name
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.15
    static let nameXSharingProviderName = NamedProperty(set: .internetHeaders,
                                                                      name: "X-Sharing-Provider-Name")

    /// [MS-OXPROPS] 2.496 PidNameXSharingProviderUrl
    /// Canonical name: PidNameXSharingProviderUrl
    /// Description: Contains the same value as the PidLidSharingProviderUrl property (section 2.268).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Provider-Url
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.2.17
    static let nameXSharingProviderUrl = NamedProperty(set: .internetHeaders,
                                                                     name: "X-Sharing-Provider-Url")

    /// [MS-OXPROPS] 2.497 PidNameXSharingRemoteName
    /// Canonical name: PidNameXSharingRemoteName
    /// Description: Contains the same value as the PidLidSharingRemoteName property (section 2.277).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Remote-Name
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.2
    static let nameXSharingRemoteName = NamedProperty(set: .internetHeaders,
                                                                    name: "X-Sharing-Remote-Name")

    /// [MS-OXPROPS] 2.498 PidNameXSharingRemotePath
    /// Canonical name: PidNameXSharingRemotePath
    /// Description: Contains a value that is ignored by the server no matter what value is generated by the
    /// client.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Remote-Path
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.6
    static let nameXSharingRemotePath = NamedProperty(set: .internetHeaders,
                                                                    name: "X-Sharing-Remote-Path")

    /// [MS-OXPROPS] 2.499 PidNameXSharingRemoteStoreUid
    /// Canonical name: PidNameXSharingRemoteStoreUid
    /// Description: Contains the same value as the PidLidSharingRemoteStoreUid property (section
    /// 2.282).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Remote-Store-Uid
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.4
    static let nameXSharingRemoteStoreUid = NamedProperty(set: .internetHeaders,
                                                                        name: "X-Sharing-Remote-Store-Uid")

    /// [MS-OXPROPS] 2.500 PidNameXSharingRemoteType
    /// Canonical name: PidNameXSharingRemoteType
    /// Description: Contains the same value as the PidLidSharingRemoteType property (section 2.281).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Remote-Type
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.6
    static let nameXSharingRemoteType = NamedProperty(set: .internetHeaders,
                                                                    name: "X-Sharing-Remote-Type")

    /// [MS-OXPROPS] 2.501 PidNameXSharingRemoteUid
    /// Canonical name: PidNameXSharingRemoteUid
    /// Description: Contains the same value as the PidLidSharingRemoteUid property (section 2.282).
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-Sharing-Remote-Uid
    /// Data type: PtypString, 0x001F
    /// Area: Sharing
    /// Defining reference: [MS-OXSHARE] section 2.2.3.8
    static let nameXSharingRemoteUid = NamedProperty(set: .internetHeaders,
                                                                   name: "X-Sharing-Remote-Uid")
    
    /// [MS-OXPROPS] 2.502 PidNameXVoiceMessageAttachmentOrder
    /// Canonical name: PidNameXVoiceMessageAttachmentOrder
    /// Description: Contains the list of names for the audio file attachments that are to be played as part of
    /// a message, in reverse order.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-AttachmentOrder
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.10
    /// Consuming reference: [MS-OXCMAIL]
    static let nameXVoiceMessageAttachmentOrder = NamedProperty(set: .internetHeaders,
                                                                              name: "X-AttachmentOrder")

    /// [MS-OXPROPS] 2.503 PidNameXVoiceMessageDuration
    /// Canonical name: PidNameXVoiceMessageDuration
    /// Description: Specifies the length of the attached audio message, in seconds.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-VoiceMessageDuration
    /// Data type: PtypInteger16, 0x0002
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.4
    /// Consuming reference: [MS-OXCMAIL]
    static let nameXVoiceMessageDuration = NamedProperty(set: .internetHeaders,
                                                                       name: "X-VoiceMessageDuration")

    /// [MS-OXPROPS] 2.504 PidNameXVoiceMessageSenderName
    /// Canonical name: PidNameXVoiceMessageSenderName
    /// Description: Contains the name of the caller who left the attached voice message, as provided by the
    /// voice network's caller ID system.
    /// Property set: PS_INTERNET_HEADERS {00020386-0000-0000-C000-000000000046}
    /// Property name: X-VoiceMessageSenderName
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.6
    /// Consuming reference: [MS-OXCMAIL]
    static let nameXVoiceMessageSenderName = NamedProperty(set: .internetHeaders,
                                                                         name: "X-VoiceMessageSenderName")
    
    static let inTransitMessageCorrelator = NamedProperty(set: .common,
                                                                        name: "InTransitMessageCorrelator")
}
