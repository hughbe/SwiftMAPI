//
//  MessageSensitivity.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.13 PidTagSensitivity Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagSensitivity property ([MS-OXPROPS] section 2.1010) indicates the sender's assessment
/// of the sensitivity of the Message object. The value of this property is one of the following.
public enum MessageSensitivity: UInt32 {
    case normal = 0x00000000
    case personal = 0x00000001
    case `private` = 0x00000002
    case confidential = 0x00000003
}
