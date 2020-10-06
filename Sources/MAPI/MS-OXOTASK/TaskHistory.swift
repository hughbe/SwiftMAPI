//
//  TaskHistory.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOTASK] 2.2.2.2.18 PidLidTaskHistory Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskHistory property ([MS-OXPROPS] section 2.320) indicates the type of change that was last made to the Task object.
/// When the value of this property is set, the PidLidTaskLastUpdate property (section 2.2.2.2.10) MUST also be set to the current time.
/// The value is one of the following (listed in order of decreasing priority).
public enum TaskHistory: UInt32 {
    /// The PidLidTaskDueDate property (section 2.2.2.2.5) changed.
    case dueDateChanged = 0x00000004
    
    /// Another property was changed.
    case anotherPropertyChanged = 0x00000003
    
    /// The task assignee accepted this Task object.
    case assigneeAcceptedTask = 0x00000001
    
    /// The task assignee rejected this Task object.
    case assigneeRejectedTask = 0x00000002
    
    /// The Task object has been assigned to a task assignee.
    case assignedToAssignee = 0x00000005
    
    /// No changes were made.
    case noChanges = 0x00000000
}
