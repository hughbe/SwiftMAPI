//
//  VoteOptionSendBehavior.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

/// SendBehavior (DWORD): Indicates the behavior on send. When a user chooses a voting option,
/// SendBehavior specifies whether the user is to be prompted to edit the response mail or whether
/// the client automatically sends it on behalf of the user. The value of this field is one of the values
/// defined in the following table.
public enum VoteOptionSendBehavior: UInt32 {
    case unknown = 0x00000000
    
    /// 0x00000001 Automatically send the voting response message.
    case automaticallySend = 0x00000001
    
    /// 0x00000002 Prompt the user to specify whether he or she would like to automatically send or edit the voting response first.
    case promptUser = 0x00000002
}
