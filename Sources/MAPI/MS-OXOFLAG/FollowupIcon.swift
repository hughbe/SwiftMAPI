//
//  FollowupIcon.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOFLAG] 2.2.1.2 PidTagFollowupIcon Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagFollowupIcon property ([MS-OXPROPS] section 2.697) specifies the color of the flag that is set on the Message object.
/// The flag will appear with the specified color in the UI. This property SHOULD NOT<2> exist on a Task object. When acting on other
/// Message objects, this property is set to one of the following values. If this property is not present on a flagged object, the flag has no color.
/// This property can be set to any of these values for a color flag, but it MUST be set to 0x00000006 for a time flag and a recipient flag.
public enum FollowupIcon: UInt32 {
    /// Purple flag
    case purple = 0x00000001
    
    /// Orange flag
    case orange = 0x00000002
    
    /// Green flag
    case green = 0x00000003
    
    /// Yellow flag
    case yellow = 0x00000004
    
    /// Blue flag
    case blue = 0x00000005
    
    /// Red flag
    case red = 0x00000006
}
