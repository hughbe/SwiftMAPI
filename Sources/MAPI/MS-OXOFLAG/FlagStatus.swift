//
//  FlagStatus.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOFLAG] 2.2.1.1 PidTagFlagStatus Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagFlagStatus property ([MS-OXPROPS] section 2.691) specifies the flag state of the Message object.
/// This property is present on the Message object only if the object has been flagged and is not present otherwise
/// It MUST NOT exist on a meeting-related object, and it SHOULD NOT<1> exist on a Task object. When acting on
/// other Message objects, this property is set to one of the following values.
public enum FlagStatus: UInt32 {
    /// The object is flagged as complete. This value is valid only for a complete flag.
    case complete = 0x00000001
    
    /// The object is flagged for follow-up. This value is valid for a basic flag, a color flag, a time flag, and a recipient flag.
    case flagged = 0x00000002
}
