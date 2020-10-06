//
//  TaskAcceptanceState.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOTASK] 2.2.2.2.30 PidLidTaskAcceptanceState Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskAcceptanceState property ([MS-OXPROPS] section 2.305) indicates the acceptance
/// state of the task. The value is one of the following.
public enum TaskAcceptanceState: UInt32 {
    /// The Task object is not assigned.
    case notAssigned = 0x00000000
    
    /// The Task object's acceptance status is unknown.
    case unknown = 0x00000001
    
    /// The task assignee has accepted the Task object. This value is set when the client processes a
    /// task acceptance.
    case assigneeAccepted = 0x00000002
    
    /// The task assignee has rejected the Task object. This value is set when the client processes a task
    /// rejection.
    case assigneeRejected = 0x00000003
}
