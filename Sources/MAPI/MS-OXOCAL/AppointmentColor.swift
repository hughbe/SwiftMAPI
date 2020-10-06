//
//  AppointmentColor.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.1.50 PidLidAppointmentColor Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidAppointmentColor property ([MS-OXPROPS] section 2.9) specifies the color to be used when displaying a Calendar object.
/// The client SHOULD set this property for backward compatibility with older clients. The valid values for this property are listed in
/// the following table.
public enum AppointmentColor: UInt32 {
    case none = 0x00000000
    case red = 0x00000001
    case blue = 0x00000002
    case green = 0x00000003
    case grey = 0x00000004
    case orange = 0x00000005
    case cyan = 0x00000006
    case olive = 0x00000007
    case purple = 0x00000008
    case teal = 0x00000009
    case yellow = 0x0000000A
}
