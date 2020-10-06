//
//  MessageNativeBody.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.56.2 PidTagNativeBody Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagNativeBody property ([MS-OXPROPS] section 2.805) indicates the best available format
/// for storing the message body<6>. The value of this property is limited to one of the property values
/// shown in the following table
public enum MessageNativeBody: UInt32 {
    case undefined = 0x00000000
    case plainText = 0x00000001
    case rtf = 0x00000002
    case html = 0x00000003
    case clearSigned = 0x00000004
}
