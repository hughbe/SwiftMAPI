//
//  TaskMode.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOTASK] 2.2.3.2 PidLidTaskMode Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskMode property ([MS-OXPROPS] section 2.324) specifies the assignment status of the Task object that is
/// embedded in the task communication. The following table specifies the valid values for this property.
public enum TaskMode: UInt32 {
    /// The Task object is not assigned.
    case notAssigned = 0x00000000
    
    /// The Task object is embedded in a task request.
    case embeddedInTaskRequest = 0x00000001
    
    /// The Task object has been accepted by the task assignee.
    case acceptedByAssignee = 0x00000002
    
    /// The Task object was rejected by the task assignee.
    case rejectedByAssignee = 0x00000003
    
    /// The Task object is embedded in a task update.
    case embeddedInTaskUpdate = 0x00000004
    
    /// The Task object was assigned to the task assigner (self-delegation).
    case assignedToTaskAssigner = 0x00000005
}
