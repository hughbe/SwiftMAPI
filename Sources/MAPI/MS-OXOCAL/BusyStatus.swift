//
//  BusyStatus.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.2 PidLidBusyStatus Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidBusyStatus property ([MS-OXPROPS] section 2.48) specifies the availability of a user for the event described by the object.
/// This property MUST be one of the values specified in the following table.
public enum BusyStatus: UInt32 {
    /// The user is available.
    case free = 0x00000000
    
    /// The user has a tentative event scheduled.
    case tentative = 0x00000001
    
    /// The user is busy.
    case busy = 0x00000002
    
    /// The user is Out of Office (OOF).
    case outOfOffice = 0x00000003
    
    /// The user is working from a location other than the office.
    case workingElsewhere = 0x00000004
}
