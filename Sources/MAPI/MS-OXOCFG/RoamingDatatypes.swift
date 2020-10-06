//
//  RoamingDatatypes.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOCFG] 2.2.2.1 PidTagRoamingDatatypes Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagRoamingDatatypes property ([MS-OXPROPS] section 2.930) contains a bitmask that
/// indicates which stream properties exist on the message. The types of the streams, and thus the flags,
/// are not mutually exclusive.
/// The bitmask is a bitwise OR of the following bits. Other bits MUST NOT be set and MUST be ignored if
/// set.
public struct RoamingDatatypes: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The FAI message contains an XML stream, which is stored in the PidTagRoamingXmlStream property (section 2.2.2.3).
    public static let containsXmlStream = RoamingDatatypes(rawValue: 0x00000002)

    /// The FAI message contains a dictionary stream, which is stored in the PidTagRoamingDictionary property (section 2.2.2.2).
    /// If the FAI message does not contain a dictionary stream, the application MUST treat the dictionary as having no entries.
    public static let containsDictionaryStream = RoamingDatatypes(rawValue: 0x00000004)

    public static let all: RoamingDatatypes = [.containsXmlStream, .containsDictionaryStream]
}
