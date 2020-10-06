//
//  ResponseStatus.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.11 PidLidResponseStatus Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidResponseStatus property ([MS-OXPROPS] section 2.232) specifies the response status of an attendee.
/// This property MUST be set to one of the values listed in the following table.
public enum ResponseStatus: UInt32 {
    /// No response is required for this object. This is the case for Appointment objects and Meeting Response objects.
    case none = 0x00000000
    
    /// This Meeting object belongs to the organizer.
    case organized = 0x00000001
    
    /// This value on the attendee's Meeting object indicates that the attendee has tentatively accepted the Meeting Request object.
    case tentative = 0x00000002
    
    /// This value on the attendee's Meeting object indicates that the attendee has accepted the Meeting Request object.
    case accepted = 0x00000003
    
    /// This value on the attendee's Meeting object indicates that the attendee has declined the Meeting Request object.
    case declined = 0x00000004
    
    /// This value on the attendee's Meeting object indicates that the attendee has not yet responded.
    /// This value is on the Meeting Request object, Meeting Update object, and Meeting Cancellation object.
    case notResponded = 0x00000005
}
