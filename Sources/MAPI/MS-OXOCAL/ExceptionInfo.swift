//
//  ExceptionInfo.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream
import Foundation

/// [MS-OXOCAL] 2.2.1.44.2 ExceptionInfo Structure
public struct ExceptionInfo {
    public let startDateTime: Date
    public let endDateTime: Date
    public let originalStartTime: Date
    public let overrideFlags: OverrideFlags
    public let subjectLength: UInt16?
    public let subjectLength2: UInt16?
    public let subject: String?
    public let meetingType: AppointmentStateFlags?
    public let reminderDelta: UInt32?
    public let reminderSet: UInt32?
    public let locationLength: UInt16?
    public let locationLength2: UInt16?
    public let location: String?
    public let busyStatus: BusyStatus?
    public let attachment: UInt32?
    public let subType: UInt32?
    public let appointmentColor: UInt32?
    
    public init(dataStream: inout DataStream) throws {
        /// StartDateTime (4 bytes): The start time of the exception in local time in minutes since midnight, January 1, 1601.
        self.startDateTime = Date(minutesSince1601: try dataStream.read(endianess: .littleEndian))
        
        /// EndDateTime (4 bytes): The end time of the exception in local time in minutes since midnight, January 1, 1601.
        self.endDateTime = Date(minutesSince1601: try dataStream.read(endianess: .littleEndian))
        
        /// OriginalStartTime (4 bytes): The original starting time of the exception in local time in minutes since midnight, January 1, 1601.
        self.originalStartTime = Date(minutesSince1601: try dataStream.read(endianess: .littleEndian))
        
        /// OverrideFlags (2 bytes): A bit field that specifies what data in the ExceptionInfo structure has a value different
        /// from the recurring series. The valid flags for this field are summarized in the following table.
        let overrideFlagsRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        self.overrideFlags = OverrideFlags(rawValue: overrideFlagsRaw)
        
        /// SubjectLength* (2 bytes): The value of this field is equal to the number of bytes of the Subject
        /// field plus 1. *This field is present only if the ARO_SUBJECT flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.subject) {
            self.subjectLength = try dataStream.read(endianess: .littleEndian)
        } else {
            self.subjectLength = nil
        }
        
        /// SubjectLength2* (2 bytes): The number of bytes of the Subject field. *This field is present only
        /// when the ARO_SUBJECT flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.subject) {
            self.subjectLength2 = try dataStream.read(endianess: .littleEndian)
        } else {
            self.subjectLength2 = nil
        }
        
        /// Subject* (variable): A non-null-terminated, non-Unicode string that is the value of the
        /// PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) in the Exception
        /// Embedded Message object. *This field is present only when the ARO_SUBJECT flag is set in the
        /// OverrideFlags field.
        if self.overrideFlags.contains(.subject) {
            self.subject = try dataStream.readString(count: Int(self.subjectLength!) - 1, encoding: .ascii)!
        } else {
            self.subject = nil
        }
        
        /// MeetingType* (4 bytes): The value of the PidLidAppointmentStateFlags property (section
        /// 2.2.1.10) in the Exception Embedded Message object. *This field is present only when the
        /// ARO_MEETINGTYPE flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.meetingType) {
            let meetingTypeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
            self.meetingType = AppointmentStateFlags(rawValue: meetingTypeRaw)
        } else {
            self.meetingType = nil
        }
        
        /// ReminderDelta* (4 bytes): The value for the PidLidReminderDelta property ([MS-OXORMDR]
        /// section 2.2.1.3) in the Exception Embedded Message object. *This field is present only when the
        /// ARO_REMINDERDELTA flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.reminderDelta) {
            self.reminderDelta = try dataStream.read(endianess: .littleEndian)
        } else {
            self.reminderDelta = nil
        }

        /// ReminderSet* (4 bytes): The value for the PidLidReminderSet property ([MS-OXORMDR] section
        /// 2.2.1.1) in the Exception Embedded Message object. *This field is present only when the
        /// ARO_REMINDER flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.reminder) {
            self.reminderSet = try dataStream.read(endianess: .littleEndian)
        } else {
            self.reminderSet = nil
        }

        /// LocationLength* (2 bytes): The number of bytes of the Location field plus 1. *This field is present
        /// only when the ARO_LOCATION flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.location) {
            self.locationLength = try dataStream.read(endianess: .littleEndian)
        } else {
            self.locationLength = nil
        }

        /// LocationLength2* (2 bytes): The number of bytes of the Location field. *This field is present only
        /// when the ARO_LOCATION flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.location) {
            self.locationLength2 = try dataStream.read(endianess: .littleEndian)
        } else {
            self.locationLength2 = nil
        }

        /// Location* (variable): A non-Unicode string that is the value of the PidLidLocation property
        /// (section 2.2.1.4) in the Exception Embedded Message object. *This field is present only when the
        /// ARO_LOCATION flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.location) {
            self.location = try dataStream.readString(count: Int(self.locationLength!) - 1, encoding: .ascii)!
        } else {
            self.location = nil
        }

        /// BusyStatus* (4 bytes): The value for the PidLidBusyStatus property (section 2.2.1.2) in the
        /// Exception Embedded Message object. For possible values, see section 2.2.1.2. *This field is
        /// present only when the ARO_BUSYSTATUS flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.busyStatus) {
            let busyStatusRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
            self.busyStatus = BusyStatus(rawValue: busyStatusRaw)
        } else {
            self.busyStatus = nil
        }
        
        /// Attachment* (4 bytes): The value of this field specifies whether the Exception Embedded Message
        /// object contains attachments. The value will be 0x00000001 if attachments are present, and
        /// 0x00000000 otherwise. *This field is present only when the ARO_ATTACHMENTS flag is set in
        /// the OverrideFlags field.
        if self.overrideFlags.contains(.attachment) {
            self.attachment = try dataStream.read(endianess: .littleEndian)
        } else {
            self.attachment = nil
        }

        /// SubType* (4 bytes): The value for the PidLidAppointmentSubType property (section 2.2.1.9) in
        /// the Exception Embedded Message object. For possible values, see section 2.2.1.9. *This field is
        /// present only when the ARO_SUBTYPE flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.subType) {
            self.subType = try dataStream.read(endianess: .littleEndian)
        } else {
            self.subType = nil
        }

        /// AppointmentColor (4 bytes): The value for the PidLidAppointmentColor property (section
        /// 2.2.1.50) in the Exception Embedded Message object. For possible values, see section 2.2.1.50.
        /// *This field is present only when the ARO_APPTCOLOR flag is set in the OverrideFlags field.
        if self.overrideFlags.contains(.apptColor) {
            self.appointmentColor = try dataStream.read(endianess: .littleEndian)
        } else {
            self.appointmentColor = nil
        }
    }

    public struct OverrideFlags: OptionSet {
        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// ARO_SUBJECT 0x0001 Indicates that the Subject, SubjectLength, and SubjectLength2 fields are present.
        public static let subject = OverrideFlags(rawValue: 0x0001)
        
        /// ARO_MEETINGTYPE 0x0002 Indicates that the MeetingType field is present.
        public static let meetingType = OverrideFlags(rawValue: 0x0002)
        
        /// ARO_REMINDERDELTA 0x0004 Indicates that the ReminderDelta field is present.
        public static let reminderDelta = OverrideFlags(rawValue: 0x0004)
        
        /// ARO_REMINDER 0x0008 Indicates that the ReminderSet field is present.
        public static let reminder = OverrideFlags(rawValue: 0x0008)
        
        /// ARO_LOCATION 0x0010 Indicates that the Location, LocationLength, and LocationLength2 fields are present.
        public static let location = OverrideFlags(rawValue: 0x0010)
        
        /// ARO_BUSYSTATUS 0x0020 Indicates that the BusyStatus field is present.
        public static let busyStatus = OverrideFlags(rawValue: 0x0020)
        
        /// ARO_ATTACHMENT 0x0040 Indicates that the attachment field is present.
        public static let attachment = OverrideFlags(rawValue: 0x0040)
        
        /// ARO_SUBTYPE 0x0080 Indicates that the SubType field is present.
        public static let subType = OverrideFlags(rawValue: 0x0080)
        
        /// ARO_APPTCOLOR 0x0100 Indicates that the AppointmentColor field is present.
        public static let apptColor = OverrideFlags(rawValue: 0x0100)
        
        /// ARO_EXCEPTIONAL_BODY 0x0200 Indicates that the Exception Embedded Message object has the
        /// PidTagRtfCompressed property ([MS-OXCMSG] section 2.2.1.56.4) set on it.
        public static let exceptionalBody = OverrideFlags(rawValue: 0x0200)

        public static let all: OverrideFlags = [.subject, .meetingType, .reminderDelta, .reminder, .location, .busyStatus, .attachment, .subType, .apptColor, .exceptionalBody]
    }
}
