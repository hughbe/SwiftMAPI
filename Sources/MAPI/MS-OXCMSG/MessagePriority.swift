//
//  MessagePriority.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.12 PidTagPriority Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagPriority property ([MS-OXPROPS] section 2.871) indicates the client's request for the
/// priority at which the message is to be sent by the messaging system. This property is set to one of the
/// following values.
public enum MessagePriority: UInt32 {
    case urgent = 0x00000001
    case normal = 0x00000000
    case notUrgent = 0xFFFFFFFF
}
