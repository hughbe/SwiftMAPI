//
//  ToDoItemFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOFLAG] 2.2.1.6 PidTagToDoItemFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagToDoItemFlags property ([MS-OXPROPS] section 2.1042) specifies the type of flag that
/// is set on a Message object.<6> The possible bit values are as follows. All bits not specified in the
/// table are reserved. They MUST be ignored but SHOULD be preserved if they are set.
public struct ToDoItemFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// A time flag or a complete flag is set.
    public static let timeFlagged = ToDoItemFlags(rawValue: 0x00000001)

    /// A recipient flag or a sender flag is set. This bit SHOULD be set only on a Draft Message object.
    public static let recipientFlagged = ToDoItemFlags(rawValue: 0x00000008)

    public static let all: ToDoItemFlags = [.timeFlagged, .recipientFlagged]
}
