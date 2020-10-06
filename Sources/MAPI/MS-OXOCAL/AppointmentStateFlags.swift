//
//  AppointmentStateFlags.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.10 PidLidAppointmentStateFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidAppointmentStateFlags property ([MS-OXPROPS] section 2.30) is a bit field that specifies the appointment state of the object.
/// This property is not required. The individual flags that can be set are as follows.
public struct AppointmentStateFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// M - asfMeeting (1 bit): This flag indicates that the object is a Meeting object or a meetingrelated object.
    public static let meeting = AppointmentStateFlags(rawValue: 0x00000001)
    
    /// R - asfReceived (1 bit): This flag indicates that the represented object was received from someone else.
    public static let received = AppointmentStateFlags(rawValue: 0x00000002)
    
    /// C - asfCanceled (1 bit): This flag indicates that the Meeting object that is represented by the object has been canceled.
    public static let canceled = AppointmentStateFlags(rawValue: 0x00000004)

    public static let all: AppointmentStateFlags = [.meeting, .received, .canceled]
}
