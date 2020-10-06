//
//  OutlookMessageEditorFormat.swift
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
public enum MessageEditorFormat: UInt32 {
    /// The format for the editor to use is unknown.
    case dontKnow = 0x00000000
    
    /// The optimal editing format is plain text.
    case plainText = 0x00000001
    
    /// The optimal editing format is HTML.
    case html = 0x00000002
    
    /// The optimal editing format is RTF.
    case rtf = 0x00000003
}
