//
//  File.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import Foundation

/// One or more of the following flags can be set for the PR_SUBMIT_FLAGS bitmask:
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsubmitflags-canonical-property
public struct SubmitFlags: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// SUBMITFLAG_LOCKED The MAPI spooler currently has the message locked.
    public static let locked = SubmitFlags(rawValue: 0x00000001)
    
    /// SUBMITFLAG_PREPROCESS The message needs preprocessing. When the MAPI spooler is done preprocessing this
    /// message, it should call the IMessage::SubmitMessage method. The message store provider recognizes that the spooler,
    /// rather than the client application, has called SubmitMessage, clears the flag, and continues message submission.
    public static let preprocess = SubmitFlags(rawValue: 0x00000002)

    public static let all: SubmitFlags = [.locked, .preprocess]
}
