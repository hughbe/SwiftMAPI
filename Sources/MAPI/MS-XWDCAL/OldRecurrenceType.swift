//
//  OldRecurrenceType.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-XWDCAL] 2.2.7.44 PidLidOldRecurrenceType
/// DAV property name: http://schemas.microsoft.com/mapi/recur_type
/// Data type: PtypInteger16 ([MS-OXCDATA] section 2.11.1.6)
/// The PidLidOldRecurrenceType property ([MS-OXPROPS] section 2.190) gets or sets the recurrence pattern for the appointment or meeting.
/// The following table lists the valid values.
public enum OldRecurrenceType: UInt16 {
    /// The appointment occurs only once. Not set
    
    /// The appointment recurs daily.
    case daily = 64
    
    /// The appointment recurs weekly.
    case weekly = 48

    /// The appointment recurs monthly.
    case monthly = 12
    
    /// The appointment recurs every nth month.
    case everyNthMonth = 56
    
    /// The appointment recurs yearly.
    case yearly = 7
    
    /// The appointment recurs every nth year.
    case everyNthYear = 51
}
