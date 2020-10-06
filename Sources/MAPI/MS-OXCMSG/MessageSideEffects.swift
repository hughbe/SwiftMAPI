//
//  MessageSideEffects.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCMSG] 2.2.1.16 PidLidSideEffects Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidSideEffects property ([MS-OXPROPS] section 2.299) controls how a Message object is handled by the client in relation
/// to certain user interface actions by the user, such as deleting a message. This property is set to a bitwise OR of zero or more of
/// the following flags.
public struct MessageSideEffects: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The client opens the Message object when deleting.
    public static let openToDelete = MessageSideEffects(rawValue: 0x00000001)
    
    /// The client opens the Message object when deleting.
    public static let noFrame = MessageSideEffects(rawValue: 0x00000008)
    
    /// The client moves the Message object to the Inbox folder when moving or copying to a Folder object with the PidTagContainerClass
    /// property ([MS-OXOCAL] section 2.2.11.1) set to "IPF.Note". For more details about the PidTagContainerClass property, see
    /// [MS-OXOSFLD] section 2.2.8.
    public static let coerceToInbox = MessageSideEffects(rawValue: 0x00000010)
    
    /// The client opens the Message object when copying to another folder.
    public static let openToCopy = MessageSideEffects(rawValue: 0x00000020)
    
    /// The client opens the Message object when moving to another folder.
    public static let openToMove = MessageSideEffects(rawValue: 0x00000040)
    
    /// The client opens the Message object when displaying context-sensitive
    /// commands, such as a context menu, to the end user.
    public static let openForContextMenu = MessageSideEffects(rawValue: 0x00000100)
    
    /// The client cannot undo a delete operation; this flag MUST NOT be set unless the seOpenToDelete flag is set.
    public static let cannotUndoDelete = MessageSideEffects(rawValue: 0x00000400)
    
    /// The client cannot undo a copy operation; this flag MUST NOT be set unless the seOpenToCopy flag is set.
    public static let cannotUndoCopy = MessageSideEffects(rawValue: 0x00000800)
    
    /// The client cannot undo a move operation; this flag MUST NOT be set unless the seOpenToMove flag is set.
    public static let cannotUndoMove = MessageSideEffects(rawValue: 0x00001000)
    
    /// The Message object contains end-user script.
    public static let hasScript = MessageSideEffects(rawValue: 0x00002000)
    
    /// The client opens the Message object to permanently delete it.
    public static let openToPermanentlyDelete = MessageSideEffects(rawValue: 0x00004000)

    public static let all: MessageSideEffects = [.openToDelete, .noFrame, .coerceToInbox, .openToCopy, .openToMove, .openForContextMenu, .cannotUndoDelete, .cannotUndoCopy, .cannotUndoMove, .hasScript, .openToPermanentlyDelete]
}
