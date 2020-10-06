//
//  OutlookMessageRecipientFlags.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.4.10.1 PidTagRecipientFlags Property
/// The PidTagRecipientFlags property ([MS-OXPROPS] section 2.901) specifies a bit field that describes the recipient (2) status.
/// This property is not required. The following individual flags can be set.
public struct RecipientFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// A - recipSendable (1 bit): The recipient (2) is a sendable attendee. This flag is used only in the
    /// PidLidAppointmentUnsendableRecipients property (section 2.2.1.25).
    public static let sendable = RecipientFlags(rawValue: 0x00000001)
    
    /// B - recipOrganizer (1 bit): The RecipientRow structure ([MS-OXCDATA] section 2.8.3) on which this flag is set represents the
    /// meeting organizer.
    public static let organizer = RecipientFlags(rawValue: 0x00000002)
    
    /// D - recipExceptionalResponse (1 bit): This flag indicates that the attendee gave a response for the exception, as specified in
    /// section 2.2.1.44.2, on which the associated RecipientRow structure resides. This flag is used only in a RecipientRow structure
    /// of an Exception Embedded Message object of the organizer's Meeting object.
    public static let exceptionalResponse = RecipientFlags(rawValue: 0x00000008)
    
    /// E - recipExceptionalDeleted (1 bit): This flag indicates that although the RecipientRow structure exists, it is treated as if the
    /// corresponding recipient (2) does not exist. This flag is used only in a RecipientRow structure of an Exception Embedded
    /// Message object of the organizer's Meeting object.
    public static let exceptionalDeleted = RecipientFlags(rawValue: 0x00000010)
    
    /// H - recipOriginal (1 bit): This flag indicates that the recipient (2) is an original attendee. This flag is used only in the
    /// PidLidAppointmentUnsendableRecipients property (section 2.2.1.25).
    public static let original = RecipientFlags(rawValue: 0x00000080)

    public static let all: RecipientFlags = [.sendable, .organizer, .exceptionalResponse, .exceptionalDeleted, .original]
}
