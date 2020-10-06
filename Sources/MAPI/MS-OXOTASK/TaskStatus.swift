//
//  TaskStatus.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOTASK] 2.2.2.2.2 PidLidTaskStatus Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskStatus property ([MS-OXPROPS] section 2.335) specifies the status of the user's progress on the task.
/// The value is one of the following.
public enum TaskStatus: UInt32 {
    /// The user has not started work on the Task object. If the property is set to this value, the value of the PidLidPercentComplete
    /// property (section 2.2.2.2.3) MUST be 0.0.
    case notStarted = 0x00000000

    /// The user's work on this Task object is in progress. If the property is set to this value, the value of the PidLidPercentComplete
    /// property MUST be greater than 0.0 and less than 1.0.
    case inProgress = 0x00000001

    /// The user's work on this Task object is complete. If the property is set to this value, the value of the PidLidPercentComplete
    /// property MUST be 1.0, the value of the PidLidTaskDateCompleted property (section 2.2.2.2.9) MUST be the current date, and the
    /// value of the PidLidTaskComplete property (section 2.2.2.2.20) MUST be 0x01.
    case complete = 0x00000002
    
    /// The user is waiting on somebody else.
    case waitingOnSomeoneElse = 0x00000003
    
    /// The user has deferred work on the Task object.
    case userDeferredWork = 0x00000004
}
