//
//  DisplayTypeEx.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXOABK] 2.2.3.12 PidTagDisplayTypeEx
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagDisplayTypeEx property ([MS-OXPROPS] section 2.674) contains a value that indicates
/// how to display an Address Book object in a table or as a recipient on a message. Messaging clients
/// use this to display an icon, make the object bold, or apply some other display element to make it easy
/// for a user who is viewing the object to distinguish its type. This property contains more detailed
/// information about the object's display information than does the PidTagDisplayType property
/// (section 2.2.3.11). In addition to the display information contained in the PidTagDisplayType
/// property, this property distinguishes among additional object types. When the object comes from a
/// remote server, the PidTagDisplayType property also includes information about the type of object
/// on that remote server, as well as the type on the local server.
/// The PidTagDisplayTypeEx property also includes information that indicates whether it is possible to
/// share information from the user's own mailbox to the entity represented by an Address Book object.
public struct DisplayTypeEx: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// r (1 bit): 1 indicates that the value in dtRemote is the remote display type. The numeral 0 (zero)
    /// means that dtRemote is undefined. This represents the high order bit.
    public static let remote = DisplayTypeEx(rawValue: 0x00000001)

    /// s (1 bit): 1 indicates that the mailbox server supports sharing to the entity that an Address Book
    /// object represents. The numeral 0 (zero) means that it does not support such sharing.
    public static let serverSupportsSharing = DisplayTypeEx(rawValue: 0x00000002)
    
    /// reserved (14 bits): Undefined. This value MUST contain all zeros and MUST be ignored by clients.
    
    /// dtRemote (1 byte): The display type of an Address Book object in the remote forest. This is
    /// undefined if r is 0 (zero). If r is 1, it contains one of the values listed in the following table.
    public static let remoteForest = DisplayTypeEx(rawValue: 0x00008000)
    
    /// dtLocal (1 byte): The display type of an Address Book object in the messaging user's local forest. It
    /// contains one of the values listed in the following table.
    public static let local = DisplayTypeEx(rawValue: 0x00010000)
    
    public static let all: DisplayTypeEx = [.remote, .serverSupportsSharing, .remoteForest, .local]
}
