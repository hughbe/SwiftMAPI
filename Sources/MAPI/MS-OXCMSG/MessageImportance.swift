//
//  MessageImportance.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.11 PidTagImportance Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagImportance property ([MS-OXPROPS] section 2.738) indicates the level of importance
/// assigned by the end user to the Message object. This property MUST be set to one of the following
/// values.
public enum MessageImportance: UInt32 {
    case low = 0x00000000
    case normal = 0x00000001
    case high = 0x00000002
}
