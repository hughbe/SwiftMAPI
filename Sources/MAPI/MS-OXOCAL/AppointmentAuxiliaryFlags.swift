//
//  AppointmentAuxiliaryFlags.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.3 PidLidAppointmentAuxiliaryFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidAppointmentAuxiliaryFlags property ([MS-OXPROPS] section 2.8) specifies a bit field that describes the auxiliary state
/// of the object. This property is not required. The individual flags that can be set are specified in the following diagram.
public struct AppointmentAuxiliaryFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// A - auxApptFlagCopied (1 bit): This flag indicates that the Calendar object was copied from another Calendar folder.
    public static let copied = AppointmentAuxiliaryFlags(rawValue: 0x00000001)

    /// B - auxApptFlagForceMtgResponse (1 bit): This flag on a Meeting Request object indicates that the client or server can
    /// require that a Meeting Response object be sent to the organizer when a response is chosen.
    public static let forceMtfResponse = AppointmentAuxiliaryFlags(rawValue: 0x00000002)

    /// C - auxApptFlagForwarded (1 bit): This flag on a Meeting Request object indicates that it was forwarded by the organizer
    /// or another recipient (2), rather than sent directly from the organizer.
    public static let forwarded = AppointmentAuxiliaryFlags(rawValue: 0x00000004)

    /// F - auxApptFlagRepairUpdateMessage (1 bit): This flag is set when the meeting request is a Repair Update Message
    /// sent from a server-side calendar repair system.
    public static let repairUpdateMessage = AppointmentAuxiliaryFlags(rawValue: 0x00000020)
    
    public static let all: AppointmentAuxiliaryFlags = [.copied, .forceMtfResponse, .forwarded, .repairUpdateMessage]
}
