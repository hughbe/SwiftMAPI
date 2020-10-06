//
//  RecipientType.swift
//
//
//  Created by Hugh Bellamy on 21/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

/// [MS-OXOMSG] 2.2.3.1 PidTagRecipientType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagRecipientType property ([MS-OXPROPS] section 2.903) represents the type of a recipient (2) on the message.
/// This property is set on each recipient (2). Valid values for this property are as follows.
public enum RecipientType: UInt32 {
    case originator = 0x00000000
    case primaryRecipient = 0x00000001
    case ccRecipient = 0x00000002
    case bccRecipient = 0x00000003
}
