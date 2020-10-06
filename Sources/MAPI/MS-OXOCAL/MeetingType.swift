//
//  MeetingType.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.6.5 PidLidMeetingType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidMeetingType property ([MS-OXPROPS] section 2.171) indicates the type of Meeting Request object or Meeting Update object.
/// The value of this property MUST be set to one of those listed in the following table.
public enum MeetingType: UInt32 {
    /// Unspecified.
    case empty = 0x00000000
    
    /// The meeting request is the initial request.
    case request = 0x00000001
    
    /// The property is set to this value if one of the following applies:
    ///  Attendees were added.
    ///  The meeting was cancelled and the organizer is uncancelling it.
    ///  If PidLidChangeHighlight property (section 2.2.6.2) has BIT_CH_START, BIT_CH_END, or BIT_CH_RECUR set
    case full = 0x00010000
    
    /// An informational update was made to the meeting and it is not one of the conditions listed in mtgFull.
    case info = 0x00020000
    
    /// A newer Meeting Request object or Meeting Update object was received after this one. For more details, see section 3.1.5.2.
    case outOfDate = 0x00080000
    
    /// Set on the delegator's copy when a delegate will handle meetingrelated objects. For more details, see section 3.1.4.7.2.1.
    case delegatorCopy = 0x00100000
}
