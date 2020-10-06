//
//  OutlookMessageRuleError.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXORULE] 2.2.7.2 PidTagRuleError Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagRuleError property ([MS-OXPROPS] section 2.943) MUST be set to one of the following values, indicating the cause
/// of the error encountered during the execution of the rule (2).
public enum RuleError: UInt32 {
    /// Generic error that doesn't fall into any of the other categories.
    case genericError = 0x00000001
    
    /// Error opening the rules folder.
    case errorOpeningRulesFolder = 0x00000002
    
    /// Error delivering the message.
    case errorDeliveringMessage = 0x00000003
    
    /// Error while parsing the rule format.
    case errorParsingMessage = 0x00000004
    
    /// Error while parsing the rule format.
    case errorProcessingRule = 0x00000005
    
    /// Error moving or copying the message to the destination folder.
    case errorMovingOrCopyingMessage = 0x00000006
    
    /// Permission error moving or copying the message to the destination folder.
    case permissionErrorMovingOrCopyingMessage = 0x00000007
    
    /// Error creating the DAM.
    case errorCreatingDAM = 0x00000008
    
    /// Error sending as another user.
    case errorSendingAsAnotherUser = 0x00000009
    
    /// Error retrieving the reply template.
    case errorRetrievingReplyTemplate = 0x0000000A
    
    /// Generic error while executing the rule (2) on the server.
    case genericErrorWhileExecutingOnServer = 0x0000000B
    
    /// Error processing rule (2) due to mailbox quotas.
    case errorProcessingRuleDueToMailboxQuotas = 0x0000000C
    
    /// Error processing the message due to the large number of recipients (2).
    case errorProcessingMessageDueToLargeNumberOfRecipients = 0x0000000D
    
    /// Error copying or moving a message due to folder quotas.
    case errorCopyingOrMovingMessageDueToFolderQuotas = 0x0000000E
}
