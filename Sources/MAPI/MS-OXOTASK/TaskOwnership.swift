//
//  TaskOwnership.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOTASK] 2.2.2.2.29 PidLidTaskOwnership Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskOwnership property ([MS-OXPROPS] section 2.329) indicates the role of the current
/// user relative to the Task object. The value is one of the following.
public enum TaskOwnership: UInt32 {
    /// The Task object is not assigned.
    case notAssigned = 0x00000000
    
    /// The Task object is the task assigner's copy of the Task object.
    case assignersCopy = 0x00000001
    
    /// The Task object is the task assignee's copy of the Task object.
    case asssigneesCopy = 0x00000002
}
