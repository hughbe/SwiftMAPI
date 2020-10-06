//
//  MessageStorage+TaskProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXOTASK] 2.2 Message Syntax
/// A Task object and a task communication can be created and modified by clients and servers.
/// Except where noted, this section defines constraints under which both clients and servers operate.
/// Clients operate on a Task object and a task communication by using the Message and Attachment
/// Object Protocol, as specified in [MS-OXCMSG]. How a server operates on a Task object and a task
/// communication is implementation-dependent, but the results of any such operations MUST be exposed
/// to clients in a manner that is consistent with the Task-Related Objects Protocol.
/// Unless otherwise specified in sections 2.2.1 through 2.2.3, a Task object and a task communication
/// MUST adhere to all property constraints specified in [MS-OXPROPS] and [MS-OXCMSG].
/// [MS-OXOTASK] 2.2.1 Folder Properties
/// The property in section 2.2.1.1 is set on the Folder object that represents the Tasks folder. Task
/// objects are stored in the Tasks folder.
/// [MS-OXOTASK] 2.2.2 Task Object Properties
/// Section 2.2.2.1 and section 2.2.2.2 specify requirements for properties of a Task object.
/// [MS-OXOTASK] 2.2.2.2 Task Object Specific Properties
/// [MS-OXOTASK] 2.2.3 Task Communications Properties
/// The property requirements specified in sections 2.2.3.1 through 2.2.3.3.2 are specific to task
/// requests, task acceptances, task rejections, and task updates (collectively, task
/// communications).
public extension MessageStorage {
    /// [MS-OXOTASK] 2.2.1.1 PidTagOrdinalMost Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOrdinalMost property ([MS-OXPROPS] section 2.815) contains a positive number whose
    /// negative is less than or equal to the value of the PidLidTaskOrdinal property (section 2.2.2.2.26) of
    /// all Task objects in the folder. This property MUST be updated to maintain this condition whenever
    /// the PidLidTaskOrdinal property of any Task object in the folder changes in a way that would violate
    /// the condition.
    /// This property provides an efficient way to identify Task objects as being in the same folder.
    var ordinalMost: UInt32? {
        return getProperty(id: .tagOrdinalMost)
    }

    /// [MS-OXOTASK] 2.2.2.2.1 PidLidTaskMode Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskMode property ([MS-OXPROPS] section 2.324) on a Task object has no meaning and
    /// is set to zero. For details about the PidLidTaskMode property on a task communication, see
    /// section 2.2.3.2.
    /// [MS-OXOTASK] 2.2.3.2 PidLidTaskMode Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskMode property ([MS-OXPROPS] section 2.324) specifies the assignment status of the
    /// Task object that is embedded in the task communication. The following table specifies the valid
    /// values for this property.
    var taskMode: TaskMode? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskMode) else {
            return nil
        }
        
        return TaskMode(rawValue: rawValue)
    }
    
    /// [MS-OXOTASK] 2.2.2.2 PidLidTaskStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskStatus property ([MS-OXPROPS] section 2.335) specifies the status of the user's
    /// progress on the task. The value is one of the following.
    /// [MS-OXOFLAG] 2.2.2 Properties Shared with the Task-Related Object Protocol
    /// The following properties are shared by this protocol and the Task-Related Object Protocol, which is
    /// specified in [MS-OXOTASK]:
    ///  PidLidTaskStatus ([MS-OXOTASK] section 2.2.2.2.2)
    /// [MS-OXOFLAG] 2.2.2.1 PidLidTaskStatus Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskStatus property ([MS-OXOTASK] section 2.2.2.2.2) is set on a Message object as
    /// follows for flags:<10>
    ///  For a time flag and a recipient flag: 0x00000000
    ///  For a complete flag: 0x00000002
    ///  For other flags: the PidLidTaskStatus property is not present.
    /// The server does not set this property.
    var taskStatus: TaskStatus? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskStatus) else {
                return nil
        }
        
        return TaskStatus(rawValue: rawValue)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.3 PidLidPercentComplete Property
    /// Type: PtypFloating64 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPercentComplete property ([MS-OXPROPS] section 2.202) indicates the progress the
    /// user has made on a task. The value MUST be a number greater than or equal to 0.0 and less than or
    /// equal to 1.0, where 1.0 indicates that work is completed and 0.0 indicates that work has not begun.
    /// [MS-OXOFLAG] 2.2.2.3 PidLidPercentComplete Property
    /// Type: PtypFloating64 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPercentComplete property ([MS-OXPROPS] section 2.202) is set on a Message object
    /// as follows for flags:<12>
    ///  For a time flag and a recipient flag: 0.0
    ///  For a complete flag: 1.0
    ///  For other flags: the PidLidPercentComplete property is not present.
    /// The server does not set this property.
    var percentComplete: Double? {
        return getProperty(name: .lidPercentComplete)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.4 PidLidTaskStartDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskStartDate property ([MS-OXPROPS] section 2.333) specifies the date on which the
    /// user expects work on the task to begin. The date is in the user's local time zone. The task has no start
    /// date if this property is unset or is set to 0x5AE980E0 (1,525,252,320). If the task has a start date,
    /// the value MUST have a time component of 12:00 midnight, and the PidLidTaskDueDate property
    /// (section 2.2.2.2.5) and the PidLidCommonStart property (section 2.2.2.1.3) MUST also be set.
    /// [MS-OXOFLAG] 2.2.2 Properties Shared with the Task-Related Object Protocol
    /// The following properties are shared by this protocol and the Task-Related Object Protocol, which is
    /// specified in [MS-OXOTASK]:
    ///  PidLidTaskStartDate ([MS-OXOTASK] section 2.2.2.2.4)
    var taskStartDate: Date? {
        return getProperty(name: .lidTaskStartDate)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.5 PidLidTaskDueDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskDueDate property ([MS-OXPROPS] section 2.314) specifies the date by which the
    /// user expects work on the task to be complete. The date is in the user's local time zone. The task has
    /// no due date if this property is unset or is set to 0x5AE980E0 (1,525,252,320). However, a due date is
    /// optional only if no start date is indicated in the PidLidTaskStartDate property (section 2.2.2.2.4). If
    /// the task has a due date, the value MUST have a time component of 12:00 midnight, and the
    /// PidLidCommonEnd property (section 2.2.2.1.4) MUST also be set. If the PidLidTaskStartDate
    /// property has a start date, then the value of this property MUST be greater than or equal to the value
    /// of the PidLidTaskStartDate property.
    /// [MS-OXOFLAG] 2.2.2 Properties Shared with the Task-Related Object Protocol
    /// The following properties are shared by this protocol and the Task-Related Object Protocol, which is
    /// specified in [MS-OXOTASK]:
    ///  PidLidTaskDueDate ([MS-OXOTASK] section 2.2.2.2.5)
    /// [MS-OXORMDR] 2.2.2.3 Properties Shared with the Task-Related Objects Protocol
    /// This protocol shares the following properties with the Task-Related Objects Protocol:
    ///  PidLidTaskDueDate ([MS-OXOTASK] section 2.2.2.2.5)
    /// Unless noted in section 2.2.2.3.1, the semantics and accepted values are identical to those specified in
    /// [MS-OXOTASK].
    /// [MS-OXORMDR] 2.2.2.3.1 PidLidTaskDueDate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskDueDate property ([MS-OXOTASK] section 2.2.2.2.5) SHOULD<3> be set when the
    /// client creates a reminder on an object that is neither a Task object nor a Calendar object.
    /// Setting the PidLidTaskDueDate property allows for a more intuitive "due in" time when the reminder
    /// signals. The "due in" time is the time remaining until a Message object is due.
    var taskDueDate: Date? {
        return getProperty(name: .lidTaskDueDate)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.6 PidLidTaskResetReminder Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskResetReminder property ([MS-OXPROPS] section 2.331) indicates whether future
    /// recurring tasks need reminders, even though the value of the PidLidReminderSet property ([MSOXORMDR] section 2.2.1.1) is zero (FALSE). The PidLidTaskResetReminder property is set to
    /// nonzero (TRUE) when the task's reminder is dismissed, and is set to zero (FALSE) otherwise. If this
    /// property is left unset, the value zero (FALSE) is assumed.
    /// As specified in [MS-OXORMDR], the PidLidReminderSet property indicates whether a reminder is set
    /// on the Task object. However, the PidLidReminderSet property indicates only the presence of a
    /// reminder on a single Task object. It cannot be used alone to determine whether a future recurring
    /// task needs a reminder.
    /// This is best understood by example. Suppose that the user wants reminders for a series of recurring
    /// tasks. The client creates a Task object and sets the PidLidReminderSet property to nonzero (TRUE).
    /// At the appropriate time, the client presents the user with a reminder. When the user dismisses the
    /// reminder, the client sets the PidLidReminderSet property to zero (FALSE) and sets the
    /// PidLidTaskResetReminder property to nonzero (TRUE). Later, the user completes the task, and the
    /// client creates a new recurring task. As stated, the user wanted the new recurring task to have a
    /// reminder, but the last known value of the PidLidReminderSet property was zero (FALSE). The client
    /// uses the nonzero (TRUE) value of the PidLidTaskResetReminder property to determine that the
    /// user had set and dismissed a reminder on a previous recurring task. If the value of the
    /// PidLidTaskResetReminder property had been zero (FALSE), the client would determine that the
    /// user had never set a reminder on the task at all. The client sets a new reminder, as specified in [MSOXORMDR], if the value of either PidLidReminderSet or PidLidTaskResetReminder is nonzero
    /// (TRUE).
    /// [MS-OXORMDR] 2.2.2.3 Properties Shared with the Task-Related Objects Protocol
    /// This protocol shares the following properties with the Task-Related Objects Protocol:
    ///  PidLidTaskResetReminder ([MS-OXOTASK] section 2.2.2.2.6)
    /// Unless noted in section 2.2.2.3.1, the semantics and accepted values are identical to those specified in
    /// [MS-OXOTASK].
    var taskResetReminder: Bool? {
        return getProperty(name: .lidTaskResetReminder)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.7 PidLidTaskAccepted Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskAccepted property ([MS-OXPROPS] section 2.306) indicates whether a task
    /// assignee has replied to a task request for this Task object. The client sets this property to zero
    /// (FALSE) for a new Task object and to nonzero (TRUE) when a Task object is either accepted or
    /// rejected. If left unset, a value of zero (FALSE) is assumed.
    var taskAccepted: Bool? {
        return getProperty(name: .lidTaskAccepted)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.8 PidLidTaskDeadOccurrence Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskDeadOccurrence property ([MS-OXPROPS] section 2.313) indicates whether a new
    /// recurring task remains to be generated. The client sets this property to zero (FALSE) on a new Task
    /// object. The client sets this property to nonzero (TRUE) when it generates the last recurring task.
    var taskDeadOccurence: Bool? {
        return getProperty(name: .lidTaskDeadOccurrence)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.9 PidLidTaskDateCompleted Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskDateCompleted property ([MS-OXPROPS] section 2.312) specifies the date when the
    /// user completed work on the task. This property can be left unset; if set, this property MUST have a
    /// time component of 12:00 midnight in the local time zone, converted to UTC.
    /// [MS-OXOFLAG] 2.2.2 Properties Shared with the Task-Related Object Protocol
    /// The following properties are shared by this protocol and the Task-Related Object Protocol, which is
    /// specified in [MS-OXOTASK]:
    ///  PidLidTaskDateCompleted ([MS-OXOTASK] section 2.2.2.2.9)
    var taskDateCompleted: Date? {
        return getProperty(name: .lidTaskDateCompleted)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.10 PidLidTaskLastUpdate Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskLastUpdate property ([MS-OXPROPS] section 2.322) specifies the date and time of
    /// the most recent change made to the Task object. The most recent change is specified by the
    /// PidLidTaskHistory property (section 2.2.2.2.18). The value is in UTC.
    var taskLastUpdate: Date? {
        return getProperty(name: .lidTaskLastUpdate)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.11 PidLidTaskActualEffort Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskActualEffort property ([MS-OXPROPS] section 2.307) specifies the number of
    /// minutes that the user actually spent working on a task. The value MUST be greater than or equal to
    /// zero and less than 0x5AE980DF (1,525,252,319), where 480 minutes equal one day and 2400
    /// minutes equal one week (8 hours in a work day and 5 work days in a work week).
    var taskActualEffort: UInt32? {
        return getProperty(name: .lidTaskActualEffort)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.12 PidLidTaskEstimatedEffort Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskEstimatedEffort property ([MS-OXPROPS] section 2.315) specifies the number of
    /// minutes that the user expects to work on a task. The value MUST be greater than or equal to zero and
    /// less than 0x5AE980DF (1,525,252,319), where 480 minutes equal one day and 2400 minutes equal
    /// one week (8 hours in a work day and 5 work days in a work week).
    var taskEstimatedEffort: UInt32? {
        return getProperty(name: .lidTaskEstimatedEffort)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.13 PidLidTaskVersion Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskVersion property ([MS-OXPROPS] section 2.338) indicates which copy is the latest
    /// update of a Task object. An update with a lower version than the Task object is ignored. When
    /// embedding a Task object in a task communication, the client sets the current version of the
    /// embedded Task object on the task communication as well.
    /// The initial value of this property is 1. The value is incremented only when the Task object is owned by
    /// the user. The Task object is owned by the user when the PidLidTaskState property (section
    /// 2.2.2.2.14) is set to 0x00000001, 0x00000002, or 0x00000004.
    var taskVersion: UInt32? {
        return getProperty(name: .lidTaskVersion)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.14 PidLidTaskState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskState property ([MS-OXPROPS] section 2.334) indicates the current assignment state
    /// of the Task object. The value is one of the following.
    var taskState: TaskState? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskState) else {
            return nil
        }
        
        return TaskState(rawValue: rawValue)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.15 PidLidTaskRecurrence Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskRecurrence property ([MS-OXPROPS] section 2.330) contains a RecurrencePattern
    /// structure, as specified in [MS-OXOCAL] section 2.2.1.44.1, that provides information about recurring
    /// tasks. Both the DeletedInstanceCount field and the ModifiedInstanceCount field of the
    /// RecurrencePattern structure MUST be set zero.
    /// [MS-OXORMDR] 2.2.2.3 Properties Shared with the Task-Related Objects Protocol
    /// This protocol shares the following properties with the Task-Related Objects Protocol:
    ///  PidLidTaskRecurrence ([MS-OXOTASK] section 2.2.2.2.15)
    /// Unless noted in section 2.2.2.3.1, the semantics and accepted values are identical to those specified in
    /// [MS-OXOTASK].
    var taskRecurrence: Data? {
        return getProperty(name: .lidTaskRecurrence)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.16 PidLidTaskAssigners Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskAssigners property ([MS-OXPROPS] section 2.309) contains a stack of entries, each
    /// representing a task assigner. The most recent task assigner (that is, the top of the stack) appears at
    /// the end.
    /// The format of this property is shown in the following table. Unless otherwise indicated, the types are
    /// specified in ([MS-OXCDATA] section 2.11.1.
    /// Size in
    /// bytes Type Name Description
    /// 4 PtypInteger32 cAssigners Number of task assigners.
    /// 4 PtypInteger32 cbAssigner Size of the task assigner data to
    /// follow, in bytes.
    /// Variable Address Book EntryID structure ([MSOXCDATA] section 2.2.5.2)
    /// EID A structure that represents the task
    /// assigner.
    /// Variable PtypString8 szDisplayName The task assigner's display name,
    /// using multibyte characters.
    /// Variable PtypString wzDisplayName The task assigner's display name,
    /// using Unicode characters.
    /// Next task assigner's data begins here.
    var taskAssigners: Data? {
        return getProperty(name: .lidTaskAssigners)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.17 PidLidTaskStatusOnComplete Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskStatusOnComplete property ([MS-OXPROPS] section 2.336) indicates whether the
    /// task assignee has been requested to send an e-mail status report, which is an e-mail message with
    /// "Task Completed" as the subject, when the task assignee completes the assigned task. The client sets
    /// this property to nonzero (TRUE) when the task assignee has been requested to send an e-mail status
    /// report; otherwise, this property is set to zero (FALSE).
    var taskStatusOnComplete: Bool? {
        return getProperty(name: .lidTaskStatusOnComplete)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.18 PidLidTaskHistory Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskHistory property ([MS-OXPROPS] section 2.320) indicates the type of change that
    /// was last made to the Task object. When the value of this property is set, the
    /// PidLidTaskLastUpdate property (section 2.2.2.2.10) MUST also be set to the current time.
    /// The value is one of the following (listed in order of decreasing priority).
    var taskHistory: TaskHistory? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskHistory) else {
            return nil
        }
        
        return TaskHistory(rawValue: rawValue)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.19 PidLidTaskUpdates Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskUpdates property ([MS-OXPROPS] section 2.337) indicates whether the task
    /// assignee has been requested to send a task update when the assigned Task object changes. The
    /// client sets this property to nonzero (TRUE) when the task assignee has been requested to send a task
    /// update; otherwise, this property is set to zero (FALSE).
    var taskUpdates: Bool? {
        return getProperty(name: .lidTaskUpdates)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.20 PidLidTaskComplete Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskComplete property ([MS-OXPROPS] section 2.310) indicates whether the task has
    /// been completed. The client sets this property to nonzero (TRUE) when the task has been completed;
    /// otherwise, this property is set to zero (FALSE).
    /// [MS-OXOFLAG] 2.2.2 Properties Shared with the Task-Related Object Protocol
    /// The following properties are shared by this protocol and the Task-Related Object Protocol, which is
    /// specified in [MS-OXOTASK]:
    ///  PidLidTaskComplete ([MS-OXOTASK] section 2.2.2.2.20)
    /// [MS-OXOFLAG] 2.2.2.2 PidLidTaskComplete Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskComplete property ([MS-OXOTASK] section 2.2.2.2.20) is set on a Message object
    /// as follows for flags:<11>
    ///  For a time flag and a recipient flag: 0x00 (FALSE)
    ///  For a complete flag: 0x01 (TRUE)
    ///  For other flags: the PidLidTaskComplete property is not present.
    /// The server does not set this property.
    var taskComplete: Bool? {
        return getProperty(name: .lidTaskComplete)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.21 PidLidTaskFCreator Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskFCreator property ([MS-OXPROPS] section 2.316) indicates that the Task object
    /// was originally created by the action of the current user or user agent instead of by the processing of a
    /// task request. The client sets this property to nonzero (TRUE) when the user creates the task and to
    /// zero (FALSE) when the task was assigned by another user. If this property is left unset, a value of
    /// nonzero (TRUE) is assumed.
    var taskFCreator: Bool? {
        return getProperty(name: .lidTaskFCreator)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.22 PidLidTaskOwner Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskOwner property ([MS-OXPROPS] section 2.328) specifies the name of the task
    /// owner.
    var taskOwner: String? {
        return getProperty(name: .lidTaskOwner)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.23 PidLidTaskMultipleRecipients Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskMultipleRecipients property ([MS-OXPROPS] section 2.325) specifies optimization
    /// hints about the recipients of a Task object.
    /// This property can be left unset; if set, it MUST be set to a bitwise OR of zero or more of the following
    /// flags. Any other settings MUST be ignored.
    var taskMultipleRecipients: TaskMultipleRecipients? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskMultipleRecipients) else {
            return nil
        }
        
        return TaskMultipleRecipients(rawValue: rawValue)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.24 PidLidTaskAssigner Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskAssigner property ([MS-OXPROPS] section 2.308) specifies the name of the user that
    /// last assigned the task. If the task has not been assigned, this property is left unset.
    /// Because this property is set by the client after the task assignee receives a task request, the
    /// property will not be set on the task assigner's copy of the Task object.
    /// When the client adds or removes a task assigner from the stack of task assigners listed in the
    /// PidLidTaskAssigners property (section 2.2.2.2.16), this property is set to the added or removed
    /// task assigner.
    var taskAssigner: String? {
        return getProperty(name: .lidTaskAssigner)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.25 PidLidTaskLastUser Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskLastUser property ([MS-OXPROPS] section 2.323) specifies the name of the most
    /// recent user to have been the task owner.
    /// Before a client sends a task request, it sets this property to the name of the task assigner.
    /// Before a client sends a task acceptance, it sets this property to the name of the task assignee.
    /// Before a client sends a task rejection, it sets this property to the name of the task assigner.
    var taskLastUser: String? {
        return getProperty(name: .lidTaskLastUser)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.26 PidLidTaskOrdinal Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskOrdinal property ([MS-OXPROPS] section 2.327) specifies a number that aids custom
    /// sorting of Task objects. This property can be left unset; if set, its value MUST be greater than
    /// 0x800186A0 (-2,147,383,648) and less than 0x7FFE7960 (2,147,383,648) and MUST be unique
    /// among Task objects in the same folder.
    /// Whenever the client sets this property to a number less than the negative of the current value of the
    /// PidTagOrdinalMost property (section 2.2.1.1) of the folder, the client MUST also update the
    /// PidTagOrdinalMost property on the folder.
    var taskOrdinal: UInt32? {
        return getProperty(name: .lidTaskOrdinal)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.27 PidLidTaskLastDelegate Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskLastDelegate property ([MS-OXPROPS] section 2.321) specifies the name of the
    /// mailbox's delegate who most recently assigned the task. This property contains an empty string if
    /// there is no delegate. For details about delegates, see [MS-OXODLGT].
    var taskLastDelegate: String? {
        return getProperty(name: .lidTaskLastDelegate)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.28 PidLidTaskFRecurring Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskFRecurring property ([MS-OXPROPS] section 2.318) indicates whether the task
    /// includes a recurrence pattern. If this property is unset or is set to zero (FALSE), the task does not
    /// include a recurrence pattern. If set to nonzero (TRUE), the PidLidTaskRecurrence (section
    /// 2.2.2.2.15) and PidLidTaskDeadOccurrence (section 2.2.2.2.8) properties MUST also be set.
    var taskFRecurring: Bool? {
        return getProperty(name: .lidTaskFRecurring)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.29 PidLidTaskOwnership Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskOwnership property ([MS-OXPROPS] section 2.329) indicates the role of the current
    /// user relative to the Task object. The value is one of the following.
    var taskOwnership: TaskOwnership? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskOwnership) else {
            return nil
        }
        
        return TaskOwnership(rawValue: rawValue)
    }
    
    /// [MS-OXOTASK] 2.2.2.2.30 PidLidTaskAcceptanceState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskAcceptanceState property ([MS-OXPROPS] section 2.305) indicates the acceptance
    /// state of the task. The value is one of the following.
    var taskAcceptanceState: TaskAcceptanceState? {
        guard let rawValue: UInt32 = getProperty(name: .lidTaskAcceptanceState) else {
            return nil
        }
        
        return TaskAcceptanceState(rawValue: rawValue)
    }

    /// [MS-OXOTASK] 2.2.2.2.31 PidLidTaskFFixOffline Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskFFixOffline property ([MS-OXPROPS] section 2.317) indicates whether the value of
    /// the PidLidTaskOwner property (section 2.2.2.2.22) is correct. The value zero (FALSE) indicates that
    /// the value of the PidLidTaskOwner property is correct. A nonzero value (TRUE) indicates that the
    /// client cannot determine an accurate value for the PidLidTaskOwner property.
    /// When the client sets this property to a nonzero (TRUE) value, the client can also set the
    /// PidLidTaskOwner property to a generic owner name, such as "Unknown". When the client changes
    /// the value of the PidLidTaskOwner property, the client updates the PidLidTaskFFixOffline property
    /// accordingly.
    var taskFFixOffline: Bool? {
        return getProperty(name: .lidTaskFFixOffline)
    }

    /// [MS-OXOTASK] 2.2.2.2.32 PidLidTaskGlobalId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskGlobalId property ([MS-OXPROPS] section 2.319) specifies a unique GUID for this
    /// task, used to locate an existing task upon receipt of a task response or task update. This property
    /// MUST be set for assigned tasks, but it can be left unset for unassigned tasks.
    var taskGlobalId: Data? {
        return getProperty(name: .lidTaskGlobalId)
    }
    
    /// [MS-OXORULE] 2.2.2.2.33 PidLidTaskCustomFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskCustomFlags property ([MS-OXPROPS] section 2.311) is not used. The client can set
    /// this property, but it has no impact on the Task-Related Objects Protocol and is ignored by the server.
    var taskCustomFlags: UInt32? {
        return getProperty(name: .lidTaskCustomFlags)
    }
    
    /// [MS-OXORULE] 2.2.2.2.34 PidLidTaskRole Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskRole property ([MS-OXPROPS] section 2.332) is not used. The client can set this
    /// property, but it has no impact on the Task-Related Objects Protocol and is ignored by the server.
    var taskRole: String? {
        return getProperty(name: .lidTaskRole)
    }
    
    /// [MS-OXORULE] 2.2.2.2.35 PidLidTaskNoCompute Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTaskNoCompute property ([MS-OXPROPS] section 2.326) is not used. The client can set
    /// this property, but it has no impact on the Task-Related Objects Protocol and is ignored by the server.
    var taskNoCompute: Bool? {
        return getProperty(name: .lidTaskNoCompute)
    }
    
    /// [MS-OXORULE] 2.2.2.2.36 PidLidTeamTask Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidTeamTask property ([MS-OXPROPS] section 2.339) is not used. The client can set this
    /// property, but it has no impact on the Task-Related Objects Protocol and is ignored by the server.
    var teamTask: Bool? {
        return getProperty(name: .lidTeamTask)
    }
}
