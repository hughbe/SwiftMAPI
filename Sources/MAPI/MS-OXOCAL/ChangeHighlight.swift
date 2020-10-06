//
//  ChangeHighlight.swift
//
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.2.4 PidLidClientIntent Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidClientIntent property ([MS-OXPROPS] section 2.59) indicates what actions a user has taken on a Meeting object.
public struct ChangeHighlight: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// A - BIT_CH_START (1 bit): The PidLidAppointmentStartWhole property (section 2.2.1.5) has changed.
    public static let startChanged = ChangeHighlight(rawValue: 0x00000001)

    /// B - BIT_CH_END (1 bit): The PidLidAppointmentEndWhole property (section 2.2.1.6) has changed.
    public static let endChanged = ChangeHighlight(rawValue: 0x00000002)

    /// C - BIT_CH_RECUR (1 bit): The recurrence pattern has changed. For details about recurrence patterns, see the section 2.2.1.44.
    public static let recurrencePatternChanged = ChangeHighlight(rawValue: 0x00000004)

    /// D - BIT_CH_LOCATION (1 bit): The PidLidLocation property (section 2.2.1.4) has changed.
    public static let locationChanged = ChangeHighlight(rawValue: 0x00000008)

    /// E - BIT_CH_SUBJECT (1 bit): The PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10) has changed.
    public static let subjectChanged = ChangeHighlight(rawValue: 0x00000010)

    /// F - BIT_CH_REQATT (1 bit): One or more required attendees were added.
    public static let requiredAttendeesAdded = ChangeHighlight(rawValue: 0x00000020)

    /// G - BIT_CH_OPTATT (1 bit): One or more optional attendees were added.
    public static let optionalAttendeesAdded = ChangeHighlight(rawValue: 0x00000040)

    /// H - BIT_CH_BODY (1 bit): The body was modified.
    public static let bodyModified = ChangeHighlight(rawValue: 0x00000080)

    /// J - BIT_CH_RESPONSE (1 bit): Either the PidTagResponseRequested property ([MS-OXOMSG] section 2.2.1.46)
    /// or the PidTagReplyRequested property ([MS-OXOMSG] section 2.2.1.45) has changed.
    public static let responseChanged = ChangeHighlight(rawValue: 0x00000200)

    /// K - BIT_CH_ALLOWPROPOSE (1 bit): The PidLidAppointmentNotAllowPropose property (section 2.2.1.26) has changed.
    public static let allowProposeChanged = ChangeHighlight(rawValue: 0x00000400)
    
    public static let all: ChangeHighlight = [.startChanged, .endChanged, .recurrencePatternChanged, .locationChanged, .subjectChanged, .requiredAttendeesAdded, .optionalAttendeesAdded, .bodyModified, .responseChanged, .allowProposeChanged]
}
