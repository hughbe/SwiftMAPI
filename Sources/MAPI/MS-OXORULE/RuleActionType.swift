//
//  RuleActionType.swift
//
//
//  Created by Hugh Bellamy on 03/09/2020.
//

public enum RuleActionType: UInt8 {
    ///
    case error = 0x00

    /// Moves the message to a folder. MUST NOT be used in a public folder rule (2).
    case move = 0x01
    
    /// Copies the message to a folder. MUST NOT be used in a public folder rule (2).
    case copy = 0x02
    
    /// Replies to the message.
    case reply = 0x03
    
    /// Sends an OOF reply to the message.
    case outOfOfficeReply = 0x04
    
    /// Used for actions (2) that cannot be executed by the server (like playing a sound). MUST NOT be used in a public folder rule (2).
    case deferAction = 0x05
    
    /// Rejects the message back to the sender.
    case bounce = 0x06
    
    /// Forwards the message to a recipient (2) address.
    case forward = 0x07
    
    /// Resends the message to another recipient (2), who acts as a delegate.
    case delegate = 0x08
    
    /// Adds or changes a property on the message.
    case tag = 0x09
    
    /// Deletes the message.
    case delete = 0x0A
    
    /// Sets the MSGFLAG_READ flag in the PidTagMessageFlags property ([MSOXCMSG] section 2.2.1.6) on the message.
    case markAsRead = 0x0B
}
