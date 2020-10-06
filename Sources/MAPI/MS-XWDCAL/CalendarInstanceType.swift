//
//  CalendarInstanceType.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-XWDCAL] 2.2.2.18 PidNameCalendarInstanceType
/// DAV property name: urn:schemas:calendar:instancetype
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
/// The PidNameCalendarInstanceType property ([MS-OXPROPS] section 2.385) gets or sets the
/// calculated type of the appointment. The following types are possible:
///  Single appointment
///  Master recurring appointment
///  Instance of a recurring appointment
///  Exception to a recurring appointment
/// This property cannot be directly imported and exported from a Calendar object property. This property s used to populate the PidLidMeetingType
/// ([MS-OXOCAL] section 2.2.6.5) and PidLidAppointmentRecur ([MS-OXOCAL] section 2.2.1.44) properties.
/// The following table lists the valid values for the PidNameCalendarInstanceType property.
/// Clients SHOULD NOT change the value of this property.
/// The server SHOULD automatically set this property when changes to the appointment are committed. For example, assume a recurring
/// appointment that has the PidNameCalendarInstanceType property set to master ("1"). If all of the recurrence patterns and exceptions
/// that are associated with this appointment or meeting are deleted and the appointment or meeting is saved, the server updates the
/// instance type to single instance ("2"). If the original value of the PidNameCalendarInstanceType property is single instance ("2") or
/// exception ("3"), the value does not change.
public enum CalendarInstanceType: UInt32 {
    /// A single appointment or meeting.
    case singleInstance = 0
    
    /// A recurring series. This is the master appointment for the series, which identifies all the appointments
    /// in the series.
    case masterOfRecurring = 1
    
    /// A single instance of a recurring meeting or appointment.
    case singleInstanceOfRecurring = 3
    
    /// An exception to a recurring series or appointment.
    case exceptionToRecurring = 4
}
