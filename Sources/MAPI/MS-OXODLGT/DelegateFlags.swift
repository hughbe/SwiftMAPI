//
//  DelegateFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXODLGT] 2.2.2.2.6 PidTagDelegateFlags Property
/// Data type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagDelegateFlags property ([MS-OXPROPS] section 2.661) indicates whether delegates can view Message objects that are
/// marked as private, meaning the PidTagSensitivity property ([MSOXCMSG] section 2.2.1.13) has a value of 0x00000002. Each entry
/// of this property MUST be set to one of the following values.
/// This property MUST be set on the Delegate Information object.
public struct DelegateFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The delegate SHOULD NOT be allowed to view the Message object that is marked as private.
    public static let hidePrivate = DelegateFlags([])

    /// The delegate SHOULD be allowed to view the Message object that is marked as private.
    public static let showPrivate = DelegateFlags(rawValue: 0x00000001)

    public static let all: DelegateFlags = [.hidePrivate, .showPrivate]
}
