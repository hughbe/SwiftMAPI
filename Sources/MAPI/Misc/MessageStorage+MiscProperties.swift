//
//  MessageStorage+MiscProprties.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import Foundation

public extension MessageStorage {
    /// PidTagSubmitFlags
    /// Contains a bitmask of flags indicating details about a message submission.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsubmitflags-canonical-property
    var submitFlags: SubmitFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagSubmitFlags) else {
            return nil
        }
        
        return SubmitFlags(rawValue: rawValue)
    }
    
    /// PidTagRpcOverHttpFlags
    /// Not documented in specification but known on internet
    /// Contains the settings in a profile used by Microsoft Office Outlook to connect to Microsoft Exchange Server by using
    /// a remote procedure call (RPC) over Hypertext Transfer Protocol (HTTP).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpflags-canonical-property
    var rpcOverHttpFlags: RpcOverHttpFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagRpcOverHttpFlags) else {
            return nil
        }
        
        return RpcOverHttpFlags(rawValue: rawValue)
    }
    
    /// PidTagOriginalDisplayName
    /// Contains the original display name for an entry copied from an address book to a personal address book or other writable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginaldisplayname-canonical-property
    var originalDisplayName: String? {
        return getProperty(id: .tagOriginalDisplayName)
    }
    
    /// PidTagOriginalSearchKey
    /// Contains the original search key for an entry copied from an address book to a personal address book or other writeable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalsearchkey-canonical-property
    var originalSearchKey: Data? {
        return getProperty(id: .tagOriginalSearchKey)
    }
    
    /// PidTagItemTemporaryflags
    /// Contains a flag that indicates that a message has been read, but not marked as read.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagitemtemporaryflags-canonical-property
    var itemTemporaryflags: UInt32? {
        return getProperty(id: .tagItemTemporaryflags)
    }
}
