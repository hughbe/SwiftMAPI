//
//  RecurrenceType.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.45 PidLidRecurrenceType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidRecurrenceType property ([MS-OXPROPS] section 2.216) specifies the recurrence type of the recurring series by using one of
/// the values listed in the following table.
/// The use of the PidLidRecurrenceType property is optional.
public enum RecurrenceType: UInt32 {
    /// A single-instance appointment
    case none = 0x00000000
    
    /// A daily recurrence pattern
    case daily = 0x00000001
    
    /// A weekly recurrence pattern
    case weekly = 0x00000002
    
    /// A monthly recurrence pattern
    case monthly = 0x00000003
    
    /// A yearly recurrence pattern
    case yearly = 0x00000004
}
