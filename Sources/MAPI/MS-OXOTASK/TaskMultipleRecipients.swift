//
//  TaskMultipleRecipients.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.2.2.23 PidLidTaskMultipleRecipients Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidTaskMultipleRecipients property ([MS-OXPROPS] section 2.325) specifies optimization hints about the recipients of a Task object.
/// This property can be left unset; if set, it MUST be set to a bitwise OR of zero or more of the following flags. Any other settings MUST be ignored.
public struct TaskMultipleRecipients: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The Task object has multiple primary recipients.
    public static let sent = TaskMultipleRecipients(rawValue: 0x00000001)

    /// Although the "Sent" flag was not set, the client detected that the Task object has multiple primary recipients.
    public static let received = TaskMultipleRecipients(rawValue: 0x00000002)

    public static let all: TaskMultipleRecipients = [.sent, .received]
}
