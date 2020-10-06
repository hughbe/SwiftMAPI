//
//  AttachFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.2.18 PidTagAttachFlags Property
/// Type: PtypInteger32, as a bit field ([MS-OXCDATA] section 2.11.1)
/// The PidTagAttachFlags property ([MS-OXPROPS] section 2.594) indicates which body formats might reference this attachment when
/// rendering data. This property contains a bitwise OR of zero or more of the following flags. If this property is absent or its value is
/// 0x00000000, the attachment is available to be rendered in any format.
public struct AttachFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The Attachment object is not available to be rendered in HTML.
    public static let invisibleInHtml = AttachFlags(rawValue: 0x00000001)

    /// The Attachment object is not available to be rendered in RTF.
    public static let invisibleInRtf = AttachFlags(rawValue: 0x00000002)
    
    /// The Attachment object is referenced and rendered within the HTML body of the associated Message object. More details are specified in
    /// the PidTagBodyHtml property (section 2.2.1.56.3).
    public static let renderedInBody = AttachFlags(rawValue: 0x00000004)

    public static let all: AttachFlags = [.invisibleInHtml, .invisibleInRtf, .renderedInBody]
}
