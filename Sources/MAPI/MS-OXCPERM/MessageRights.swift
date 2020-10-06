//
//  MessageRights.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCPERM] 2.2.7 PidTagMemberRights Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagMemberRights property ([MS-OXPROPS] section 2.778) specifies the folder permissions that are granted to the specified user.
/// The flags that are used to specify permissions are listed in the following table. The client and server MUST NOT set any other flags.
public struct MessageRights: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// If this flag is set, the server MUST allow the specified user's client to read any Message object in the folder.
    /// If this flag is not set, the server MUST NOT allow the user's client to read Message objects that are owned by other users.
    static let readAny = MessageRights(rawValue: 0x00000001)
    
    /// If this flag is set, the server MUST allow the specified user's client to create new Message objects in the folder.
    /// If this flag is not set, the server MUST NOT allow the user's client to create new Message objects in the folder.
    public static let create = MessageRights(rawValue: 0x00000002)
    
    /// If this flag is set, the server MUST allow the specified user's client to modify a Message object that was created by that user in the folder.
    /// If this flag is not set, the server MUST NOT allow the user's client to modify Message objects that were created by that user.
    /// If the client sets the EditAny flag, the client MUST set this flag as well.
    public static let editOwned = MessageRights(rawValue: 0x00000008)
    
    /// If this flag is set, the server MUST allow the specified user's client to delete any Message object that was created by that user in the folder.
    /// If this flag is not set, the server MUST NOT allow the user's client to delete Message objects that were created by that user.
    /// If the client sets the DeleteAny flag, the client MUST set this flag as well.
    public static let deleteOwned = MessageRights(rawValue: 0x00000010)
    
    /// If this flag is set, the server MUST allow the specified user's client to modify any Message object in the folder.
    /// If this flag is not set, the server MUST NOT allow the user's client to modify Message objects that are owned by
    /// other users.
    public static let editAny = MessageRights(rawValue: 0x00000020)
    
    /// If this flag is set, the server MUST allow the specified user's client to delete any Message object in the folder.
    /// If this flag is not set, the server MUST NOT allow the user's client to delete Message objects that are owned by
    /// other users.
    public static let deleteAny = MessageRights(rawValue: 0x00000040)
    
    /// If this flag is set, the server MUST allow the specified user's client to create
    /// new folders within the folder. If this flag is not set, the server MUST NOT
    /// allow the user's client to create new folders within the folder.
    public static let createSubFolder = MessageRights(rawValue: 0x00000080)
    
    /// If this flag is set, the server SHOULD<3> allow the specified user's client to
    /// modify properties, including the folder permissions, that are set on the
    /// folder itself. If this flag is not set, the server SHOULD NOT<4> allow the
    /// specified user's client to make those modifications.
    public static let folderOwner = MessageRights(rawValue: 0x00000100)
    
    /// This flag has no meaning to the server regarding folder permissions. The
    /// client uses this flag when displaying permissions. If neither this flag nor the
    /// FolderOwner flag is set, the specified user's client does not display the
    /// permissions list for the folder. Instead, the specified user's client displays
    /// the folder permissions specified in the PidTagRights property ([MSOXCFOLD] section 2.2.2.2.2.8), which contains the folder permissions only
    /// for that user.
    public static let folderContact = MessageRights(rawValue: 0x00000200)
    
    /// If this flag is set, the server MUST allow the specified user's client to
    /// retrieve the folder's permissions list, as specified in section 3.1.4.1, to see
    /// the folder in the folder hierarchy table, or to open the folder.
    /// If the client sets the ReadAny flag or the FolderOwner flag, the client
    /// MUST set this flag as well.
    public static let folderVisible = MessageRights(rawValue: 0x00000400)
    
    /// If this flag is set, the server MUST allow the specified user's client to
    /// retrieve brief information about the appointments on the calendar through
    /// the Availability Web Service Protocol, as specified in [MS-OXWAVLS]. If this
    /// flag is not set, the server MUST NOT allow the specified user's client to
    /// retrieve information through the Availability Web Service Protocol.<5>
    /// If the client sets the FreeBusyDetailed flag, it MUST set this flag as well.
    public static let freeBusySimple = MessageRights(rawValue: 0x00000800)
    
    /// If this flag is set, the server MUST allow the specified user's client to
    /// retrieve detailed information about the appointments on the calendar
    /// through the Availability Web Service Protocol, as specified in [MSOXWAVLS]. If this flag is not set, the server MUST NOT allow the specified
    /// user's client to see these details.
    public static let freeBusyDetailed = MessageRights(rawValue: 0x00001000)

    public static let all: MessageRights = [.readAny, .create, .editOwned, .deleteOwned, .editAny, .deleteAny, .createSubFolder, .folderOwner, .folderContact, .folderVisible, .freeBusySimple, .freeBusyDetailed]
}
