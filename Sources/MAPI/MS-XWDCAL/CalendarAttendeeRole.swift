//
//  CalendarAttendeeRole.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-XWDCAL] 2.2.2.7 PidNameCalendarAttendeeRole
/// DAV property name: urn:schemas:calendar:attendeerole
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
/// The PidNameCalendarAttendeeRole property ([MS-OXPROPS] section 2.374) gets or sets the role of the attendee. The following table
/// lists valid values. This property is not validated or enforced by the server. It is the responsibility of the client to keep this property synchronized.
public enum CalendarAttendeeRole: UInt32 {
    /// Required
    case required = 0

    /// Optional
    case optional = 1
    
    /// Nonparticipant, but copied for reference
    case nonparticipant = 2
    
    /// Chair
    case chair = 3
}
