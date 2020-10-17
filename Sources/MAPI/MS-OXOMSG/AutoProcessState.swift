//
//  MessageAutoProcessState.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOMSG] 2.2.1.73 PidLidAutoProcessState Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidAutoProcessState property ([MS-OXPROPS] section 2.40) specifies the options used in
/// the processing of voting and tracking for e-mail messages. The property can be absent, in which case
/// the default value of 0x00000000 is used. If set, this property is set to one of the values in the
/// following table.
public enum AutoProcessState: UInt32 {
    /// The client will not process the voting and tracking for the message.
    case dontProcess = 0x00000000
    
    /// The client will process the voting and tracking when the message is received or opened.
    case processWhenReceivedOrOpened = 0x00000001
    
    /// The client will process the voting and tracking only when the message is opened.
    case processWhenOpened = 0x00000002
}
