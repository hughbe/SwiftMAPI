//
//  MessageAccess.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCPRPT] 2.2.1.1 PidTagAccess Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagAccess property ([MS-OXPROPS] section 2.499) indicates the operations available to the
/// client for the object. The value is a bitwise OR of zero or more values from the following table. This
/// property is read-only for the client.
public struct MessageAccess: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let modify = MessageAccess(rawValue: 0x00000001)
    public static let read = MessageAccess(rawValue: 0x00000002)
    public static let delete = MessageAccess(rawValue: 0x00000004)
    public static let createHierachyTable = MessageAccess(rawValue: 0x00000008)
    public static let createContentsTable = MessageAccess(rawValue: 0x00000010)
    public static let createAssociatedContentsTable = MessageAccess(rawValue: 0x00000020)

    public static let all: MessageAccess = [.modify, .read, .delete, .createHierachyTable, .createContentsTable, .createAssociatedContentsTable]
}
