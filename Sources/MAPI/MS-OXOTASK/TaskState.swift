//
//  TaskState.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOTASK] 2.2.2.2.14 PidLidTaskState Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskState property ([MS-OXPROPS] section 2.334) indicates the current assignment state
/// of the Task object. The value is one of the following.
public enum TaskState: UInt32 {
    /// The Task object is not assigned.
    case notAssigned = 0x00000001
    
    /// The Task object is the task assignee's copy of an assigned Task object.
    case taskAssigneesCopyOfAssignedTask = 0x00000002
    
    /// The Task object is the task assigner's copy of an assigned Task object.
    case taskAssignersCopyOfAssignedTask = 0x00000003
    
    /// The Task object is the task assigner's copy of a rejected Task object.
    case taskAssignersCopyOfRejectedTask = 0x00000004
    
    /// This Task object was created to correspond to a Task object that was embedded in a task
    /// rejection but could not be found locally.
    case couldNotBeFoundLocally = 0x00000005
}
