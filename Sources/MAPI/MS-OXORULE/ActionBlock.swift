//
//  ActionBlock.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream
import Foundation

/// [MS-OXORULE] 2.2.5.1 ActionBlock Structure
/// The ActionBlock structure has the following format for standard rules. The format for extended rules is the same except that
/// the size of the ActionLength field is 4 bytes instead of 2 bytes.
public struct ActionBlock {
    public let standard: Bool
    public let actionLength: UInt32
    public let actionType: ActionType
    public let actionFlavor: Flavor
    public let actionFlags: UInt32
    public let actionData: Any?
    
    public init(dataStream: inout DataStream, standard: Bool) throws {
        self.standard = standard

        /// ActionLength (2 bytes): An integer that specifies the cumulative length, in bytes, of the subsequent    fields in this
        /// ActionBlock structure. For extended rules, the size of the ActionLength field is 4 bytes instead of 2 bytes.
        if standard {
            self.actionLength = UInt32(try dataStream.read(endianess: .littleEndian) as UInt16)
        } else {
            self.actionLength = try dataStream.read(endianess: .littleEndian)
        }
        
        /// ActionType (1 byte): An integer that specifies the type of action (2). The valid actions (2) are listed in the following table.
        let actionTypeRaw: UInt8 = try dataStream.read()
        guard let actionType = ActionType(rawValue: actionTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.actionType = actionType
        
        /// ActionFlavor (4 bytes): The flags that are associated with a particular type of action (2). The flags MUST be used
        /// in conjunction with the type of action (2) that supports them and MUST be zero otherwise. For more details see
        /// section 2.2.5.1.1.
        let actionFlavorRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.actionFlavor = Flavor(rawValue: actionFlavorRaw)

        /// ActionFlags (4 bytes): Client-defined flags. The ActionFlags field is used solely by the client.<4> It
        /// is not used by the server but stored only.
        self.actionFlags = try dataStream.read(endianess: .littleEndian)

        /// ActionData (variable): An ActionData structure, as specified in section 2.2.5.1.2, that specifies
        /// data related to the particular action (2).
        switch self.actionType {
        case .move, .copy:
            if standard {
                self.actionData = try MoveCopyActionDataStandard(dataStream: &dataStream)
            } else {
                self.actionData = try MoveCopyActionDataExtended(dataStream: &dataStream)
            }
        case .reply, .oofReply:
            if standard {
                self.actionData = try ReplyOOFReplyActionDataStandard(dataStream: &dataStream)
            } else {
                self.actionData = try ReplyOOFReplyActionDataExtended(dataStream: &dataStream)
            }
        case .deferAction:
            /// [MS-OXORULE]
            /// [MS-OXORULE] 2.2.5.1.2.3 OP_DEFER_ACTION ActionData Structure
            /// If one or more actions (2) for a specific rule (2) cannot be executed on the server, the rule (2) is
            /// required to be a client-side rule, with a value in the ActionType field of "OP_DEFER_ACTION".
            /// Execution of the rule (2) is postponed until the client is available.
            /// The client encodes the rule (2) information as a client-dependent data structure designating the action
            /// (2) to be performed. The format is client-implementation-dependent and contains enough information
            /// to allow the client to perform the client-side operation when requested. The size of the buffer is
            /// obtained by reading the value in the ActionLength field in the ActionBlock structure containing an
            /// OP_DEFER_ACTION in the ActionType field.
            /// If the action (2) type is "OP_DEFER_ACTION", the ActionData structure is completely under the
            /// control of the client that created the rule (2). This structure MUST be treated as an opaque BLOB by
            /// the server. When a message that satisfies the rule (2) condition is received, the server creates a
            /// DAM and places the entire content of the ActionBlocks field of the RuleAction structure in the
            /// PidTagClientActions property (section 2.2.6.6) on the DAM as specified in sections 3.2.5.1.2, 2.2.6,
            /// and 2.2.6.6.
            self.actionData = try dataStream.readBytes(count: Int(self.actionLength))
        case .forward, .delegate:
            /// [MS-OXORULE] 2.2.5.1.2.4 OP_FORWARD and OP_DELEGATE ActionData Structure
            /// The ActionData structure that MUST be used with the "OP_FORWARD" and "OP_DELEGATE" action (2)
            /// types is formatted as follows.
            self.actionData = try ForwardDelegateActionData(dataStream: &dataStream, standard: standard)
        case .bounce:
            /// [MS-OXORULE] 2.2.5.1.2.5 OP_BOUNCE ActionData Structure
            /// The OP_BOUNCE ActionData structure is specified as follows.
            self.actionData = try BounceActionData(dataStream: &dataStream)
        case .tag:
            /// [MS-OXORULE] 2.2.5.1.2.6 OP_TAG ActionData Structure
            /// An OP_TAG ActionData structure is a TaggedPropertyValue structure, packaged as specified in
            /// [MS-OXCDATA] section 2.11.4.
            self.actionData = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
        case .delete, .markAsRead:
            /// [MS-OXORULE] 2.2.5.1.2.7 OP_DELETE or OP_MARK_AS_READ ActionData Structure
            /// For the OP_DELETE or OP_MARK_AS_READ action types, the incoming messages are deleted<9>
            /// or marked as read according to the ActionType itself. These actions (2) have no ActionData
            /// structure.
            self.actionData = nil
        }
    }
    
    public enum ActionType: UInt8 {
        /// OP_MOVE 0x01 Moves the message to a folder. MUST NOT be used in a public folder rule (2).
        case move = 0x01
        
        /// OP_COPY 0x02 Copies the message to a folder. MUST NOT be used in a public folder rule (2).
        case copy = 0x02
        
        /// OP_REPLY 0x03 Replies to the message.
        case reply = 0x03
        
        /// OP_OOF_REPLY 0x04 Sends an OOF reply to the message.
        case oofReply = 0x04
        
        /// OP_DEFER_ACTION 0x05 Used for actions (2) that cannot be executed by the server (like playing a sound).
        /// MUST NOT be used in a public folder rule (2).
        case deferAction = 0x05
        
        /// OP_BOUNCE 0x06 Rejects the message back to the sender.
        case bounce = 0x06
        
        /// OP_FORWARD 0x07 Forwards the message to a recipient (2) address.
        case forward = 0x07
        
        /// OP_DELEGATE 0x08 Resends the message to another recipient (2), who acts as a delegate.
        case delegate = 0x08
        
        /// OP_TAG 0x09 Adds or changes a property on the message.
        case tag = 0x09
        
        /// OP_DELETE 0x0A Deletes the message.
        case delete = 0x0A
        
        /// OP_MARK_AS_READ 0x0B Sets the MSGFLAG_READ flag in the PidTagMessageFlags property ([MSOXCMSG] section 2.2.1.6) on the message.
        case markAsRead = 0x0B
    }
    
    /// [MS-OXORULE] 2.2.5.1.1 Action Flavors
    /// The ActionFlavor field contains flags used in conjunction with the ActionType field and specifies additional information
    /// associated with the action (2) to be taken.
    /// The only ActionType field values that currently support an Action Flavor are "OP_REPLY", "OP_OOF_REPLY" and "OP_FORWARD".
    /// The value of the ActionFlavor field MUST be 0x00000000 if the value of the ActionType field is not one of these values.
    /// If the value of the ActionType field is "OP_FORWARD", the ActionFlavor field contains a combination of the bitwise flags
    /// specified as follows.
    /// If the ActionType field value is "OP_REPLY" or "OP_OOF_REPLY", the ActionFlavor field MUST have one of the values
    /// specified in the following table or zero (0x00000000). A value of zero (0x00000000) indicates standard reply behavior, as
    /// specified in section 3.1.4.2.5.
    public struct Flavor: OptionSet {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        /// PR (Bitmask 0x00000001): Preserves the sender information and indicates that the message was autoforwarded.
        /// Can be combined with the NC ActionFlavor flag.
        public static let pr = Flavor(rawValue: 0x00000080)
        
        /// NC (Bitmask 0x00000002): Forwards the message without making any changes to the message.
        /// Can be combined with the PR ActionFlavor flag.
        public static let nc = Flavor(rawValue: 0x00000040)
        
        /// AT (Bitmask 0x00000004): Forwards the message as an attachment. This value MUST NOT be combined with other
        /// ActionFlavor flags.
        public static let at = Flavor(rawValue: 0x00000020)
        
        /// TM (Bitmask 0x00000008): Indicates that the message SHOULD<5> be forwarded as a Short Message Service (SMS)
        /// text message. This value MUST NOT be combined with other ActionFlavor flags.
        public static let tm = Flavor(rawValue: 0x00000010)
        
        /// NS (Bitmask 0x00000001): The server SHOULD NOT<6> send the message to the message sender (the reply template
        /// MUST contain recipients (2) in this case).
        public static let ns = Flavor(rawValue: 0x00000080)
        
        /// ST (Bitmask 0x00000002): Server will use fixed, server-defined text in the reply message and ignore the text in the
        /// reply template. This text is an implementation detail.
        public static let st = Flavor(rawValue: 0x00000040)
        
        public static let all: Flavor = [.pr, .nc, .at, .tm, .ns, .st]
    }

    /// [MS-OXORULE] 2.2.5.1.2 ActionData Structure
    /// The ActionData structure is different for each type of action (2). The various ActionData structures are specified in
    /// section 2.2.5.1.2.1 through section 2.2.5.1.2.7. The appropriate structure MUST be used for the action (2) that is
    /// specified in the ActionType field of the ActionBlock structure.
    /// [MS-OXORULE] 2.2.5.1.2.1 OP_MOVE and OP_COPY ActionData Structure
    /// A Move/Copy action (2) is used to move or copy an incoming message to a specified folder in the destination message
    /// store. The ActionData structure used in an action (2) of type "OP_MOVE" or "OP_COPY" is one of two formats, depending
    /// on whether the rule is a standard rule or an extended rule.
    /// Buffer Format for Standard Rules
    /// The OP_MOVE and OP_COPY ActionData structure MUST be in the following format for a standard rule. The destination
    /// folder for a Move/Copy action in a standard rule can be in the user's mailbox or a different mailbox.
    public struct MoveCopyActionDataStandard {
        public let folderInThisStore: UInt8
        public let storeEIDSize: UInt16
        public let storeEID: StoreObjectEntryID?
        public let folderEIDSize: UInt16
        public let folderEID: Any
        
        public init(dataStream: inout DataStream) throws {
            /// FolderInThisStore (1 byte): A Boolean value that indicates whether the folder is in the user's
            /// mailbox or a different mailbox. This field MUST be set to either a nonzero (TRUE) value, if the
            /// destination folder is in the user's mailbox, or to zero (FALSE), if the destination folder is outside
            /// the user's mailbox (for example, a local message store that the server cannot access).
            self.folderInThisStore = try dataStream.read()
            
            /// StoreEIDSize (2 bytes): An integer that specifies the size, in bytes, of the StoreEID field.
            self.storeEIDSize = try dataStream.read(endianess: .littleEndian)

            /// StoreEID (variable): A Store Object EntryID structure, as specified in [MS-OXCDATA] section
            /// 2.2.4.3, that identifies the message store. This field is relevant only if the FolderInThisStore
            /// field is set to 0x00.
            /// If the FolderInThisStore field is set to 0x01, the following applies to the StoreEID field for both
            /// the client and the server:
            ///  The StoreEID field can be set to any non-null value in request.
            ///  The contents of the StoreEID field MUST be ignored when received.
            if self.folderInThisStore == 0x00 {
                self.storeEID = try StoreObjectEntryID(dataStream: &dataStream)
            } else {
                dataStream.position += Int(self.storeEIDSize)
                self.storeEID = nil
            }
            
            /// FolderEIDSize (2 bytes): An integer that specifies the size, in bytes, of the FolderEID field.
            self.folderEIDSize = try dataStream.read(endianess: .littleEndian)
            
            /// FolderEID (variable): A structure that identifies the destination folder. If the value of the
            /// FolderInThisStore field is 0x01, this field contains a ServerEid structure, as specified in section
            /// 2.2.5.1.2.1.1. If the value of the FolderInThisStore field is 0x00, the contents of this field can
            /// be any value that the client finds useful for locating the destination folder when the client
            /// processes a DAM that it receives from the server.
            if self.folderInThisStore == 0x00 {
                self.folderEID = try dataStream.readBytes(count: Int(self.folderEIDSize))
            } else {
                self.folderEID = try ServerEid(dataStream: &dataStream)
            }
        }
    }
    
    /// [MS-OXORULE] 2.2.5.1.2 ActionData Structure
    /// The ActionData structure is different for each type of action (2). The various ActionData structures are specified in
    /// section 2.2.5.1.2.1 through section 2.2.5.1.2.7. The appropriate structure MUST be used for the action (2) that is
    /// specified in the ActionType field of the ActionBlock structure.
    /// [MS-OXORULE] 2.2.5.1.2.1 OP_MOVE and OP_COPY ActionData Structure
    /// A Move/Copy action (2) is used to move or copy an incoming message to a specified folder in the destination message
    /// store. The ActionData structure used in an action (2) of type "OP_MOVE" or "OP_COPY" is one of two formats, depending
    /// on whether the rule is a standard rule or an extended rule.
    /// Buffer Format for Extended Rules
    /// The OP_MOVE and OP_COPY ActionData structure MUST be in the following format for an extended rule. The destination
    /// folder for a Move/Copy action in an extended rule MUST be in the user's mailbox.
    public struct MoveCopyActionDataExtended {
        public let storeEIDSize: UInt32
        public let storeEID: EntryID?
        public let folderEIDSize: UInt32
        public let folderEID: FolderEntryID?
        
        public init(dataStream: inout DataStream) throws {
            /// StoreEIDSize (4 bytes): An integer that specifies the size, in bytes, of the StoreEID field.
            self.storeEIDSize = try dataStream.read(endianess: .littleEndian)
            
            /// StoreEID (variable): This field is not used and can be set to any non-null value by the client and the
            /// server. This field MUST be ignored when received by either the client or the server.
            self.storeEID = nil
            dataStream.position += Int(self.storeEIDSize)
            
            /// FolderEIDSize (4 bytes): An integer that specifies the size, in bytes, of the FolderEID field.
            self.folderEIDSize = try dataStream.read(endianess: .littleEndian)
            
            /// FolderEID (variable): A Folder EntryID structure, as specified in [MS-OXCDATA] section 2.2.4.1, that identifies the destination folder.
            self.folderEID = try FolderEntryID(dataStream: &dataStream)
        }
    }
    
    /// [MS-OXORULE] 2.2.5.1.2.2 OP_REPLY and OP_OOF_REPLY ActionData Structure
    /// The ActionData structure used in an action (2) of type "OP_REPLY" or "OP_OOF_REPLY" is one of two formats, depending
    /// on whether the rule (2) is a standard rule or an extended rule. Prior to creating a rule (2) that has an action (2) of "OP_REPLY"
    /// or "OP_OOF_REPLY", the client is required to first create an FAI message to be used as the reply template. For details
    /// about creating a reply template, see section 3.1.4.2.5.
    /// Buffer Format for Standard Rules
    /// The OP_REPLY and OP_OOF_REPLY ActionData structure MUST be in the following format for a standard rule.
    public struct ReplyOOFReplyActionDataStandard {
        public let replyTemplateFID: FolderID
        public let replyTemplateMID: MessageID
        public let replyTemplateGUID: UUID

        public init(dataStream: inout DataStream) throws {
            /// ReplyTemplateFID (8 bytes): A Folder ID structure, as specified in [MS-OXCDATA] section 2.2.1.1, that
            /// identifies the folder that contains the reply template.
            self.replyTemplateFID = try FolderID(dataStream: &dataStream)
            
            /// ReplyTemplateMID (8 bytes): A Message ID structure, as specified in [MS-OXCDATA] section
            /// 2.2.1.2, that identifies the FAI message being used as the reply template.
            self.replyTemplateMID = try MessageID(dataStream: &dataStream)
            
            /// ReplyTemplateGUID (16 bytes): A GUID that is generated by the client in the process of creating
            /// a reply template. The value of the ReplyTemplateGUID field is equal to the value of the
            /// PidTagReplyTemplateId property (section 2.2.9.2) that is set on the reply template.
            self.replyTemplateGUID = try dataStream.readGUID(endianess: .littleEndian)
        }
    }
    
    /// [MS-OXORULE] 2.2.5.1.2.2 OP_REPLY and OP_OOF_REPLY ActionData Structure
    /// The ActionData structure used in an action (2) of type "OP_REPLY" or "OP_OOF_REPLY" is one of two formats, depending
    /// on whether the rule (2) is a standard rule or an extended rule. Prior to creating a rule (2) that has an action (2) of "OP_REPLY"
    /// or "OP_OOF_REPLY", the client is required to first create an FAI message to be used as the reply template. For details
    /// about creating a reply template, see section 3.1.4.2.5.
    /// Buffer Format for Extended Rules
    /// The OP_REPLY and OP_OOF_REPLY ActionData structure MUST be in the following format for an extended rule.
    public struct ReplyOOFReplyActionDataExtended {
        public let messageEIDSize: UInt32
        public let replyTemplateMessageEID: MessageEntryID
        public let replyTemplateGUID: UUID

        public init(dataStream: inout DataStream) throws {
            /// MessageEIDSize (4 bytes): An integer that specifies the size, in bytes, of the ReplyTemplateMessageEID field.
            self.messageEIDSize = try dataStream.read(endianess: .littleEndian)
            
            /// ReplyTemplateMessageEID (70 bytes): A Message EntryID structure, as specified in [MSOXCDATA] section
            /// 2.2.4.2, that contains the entry ID of the reply template.
            self.replyTemplateMessageEID = try MessageEntryID(dataStream: &dataStream)
            
            /// ReplyTemplateGUID (16 bytes): A GUID that is generated by the client in the process of creating a reply template.
            /// The value of the ReplyTemplateGUID field is equal to the value of the PidTagReplyTemplateId property that is
            /// set on the reply template.
            self.replyTemplateGUID = try dataStream.readGUID(endianess: .littleEndian)
        }
    }
    
    /// [MS-OXORULE] 2.2.5.1.2.4 OP_FORWARD and OP_DELEGATE ActionData Structure
    /// The ActionData structure that MUST be used with the "OP_FORWARD" and "OP_DELEGATE" action (2) types is formatted
    /// as follows.
    public struct ForwardDelegateActionData {
        public let recipientCount: UInt32
        public let recipientBlocks: [RecipientBlockData]
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RecipientCount (4 bytes): An integer that specifies the number of RecipientBlockData structures, as specified
            /// in section 2.2.5.1.2.4.1, contained in the RecipientBlocks field. This number MUST be greater than zero.
            self.recipientCount = try dataStream.read(endianess: .littleEndian)
            if self.recipientCount == 0 {
                throw MAPIError.corrupted
            }
            
            /// RecipientBlocks (variable): An array of RecipientBlockData structures, each of which specifies
            /// information about one recipient (2).
            var recipientBlocks: [RecipientBlockData] = []
            recipientBlocks.reserveCapacity(Int(self.recipientCount))
            for _ in 0..<self.recipientCount {
                let recipientBlock = try RecipientBlockData(dataStream: &dataStream, standard: standard)
                recipientBlocks.append(recipientBlock)
            }

            self.recipientBlocks = recipientBlocks
        }
        
        /// [MS-OXORULE] 2.2.5.1.2.4.1 RecipientBlockData Structure
        /// The RecipientBlockData structure contains properties that specify information about a recipient (2). The client is
        /// required to, at a minimum, include the PidTagDisplayName ([MS-OXCFOLD] section 2.2.2.2.2.5), PidTagEmailAddress
        /// ([MS-OXOABK] section 2.2.3.14), and PidTagRecipientType ([MS-OXOMSG] section 2.2.3.1) properties; some
        /// rules (2) MAY<7> require more.
        /// The RecipientBlockData structure has the following format.
        public struct RecipientBlockData {
            public let reserved: UInt8
            public let noOfProperties: UInt32
            public let propertyValues: [TaggedPropertyValue]

            public init(dataStream: inout DataStream, standard: Bool) throws {
                /// Reserved (1 byte): This value is implementation-specific and not required for interoperability.<8>
                self.reserved = try dataStream.read()
    
                /// NoOfProperties (4 bytes): An integer that specifies the number of structures present in the
                /// PropertyValues field. This number MUST be greater than zero.
                self.noOfProperties = try dataStream.read(endianess: .littleEndian)
                
                /// PropertyValues (variable): An array of TaggedPropertyValue structures, each of which contains a property
                /// that provides some information about the recipient (2). The format of the TaggedPropertyValue structure
                /// is specified in [MS-OXCDATA] section 2.11.4.
                var propertyValues: [TaggedPropertyValue] = []
                propertyValues.reserveCapacity(Int(self.noOfProperties))
                for _ in 0..<self.noOfProperties {
                    let propertyValue = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
                    propertyValues.append(propertyValue)
                }
                
                self.propertyValues = propertyValues
            }
        }
    }
    
    /// [MS-OXORULE] 2.2.5.1.2.5 OP_BOUNCE ActionData Structure
    /// The OP_BOUNCE ActionData structure is specified as follows.
    public struct BounceActionData {
        public let bounceCode: BounceCode
        
        public init(dataStream: inout DataStream) throws {
            /// BounceCode (4 bytes): An integer that specifies a bounce code.
            let bounceCodeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
            guard let bounceCode = BounceCode(rawValue: bounceCodeRaw) else {
                throw MAPIError.corrupted
            }

            self.bounceCode = bounceCode
        }
        
        public enum BounceCode: UInt32 {
            /// 0x0000000D The message was rejected because it was too large.
            case tooLarge = 0x0000000D
            
            /// 0x0000001F The message was rejected because it cannot be displayed to the user.
            case cannotBeDisplayedToUser = 0x0000001F
            
            /// 0x00000026 The message delivery was denied for other reasons.
            case otherReasons = 0x00000026
        }
    }
}
