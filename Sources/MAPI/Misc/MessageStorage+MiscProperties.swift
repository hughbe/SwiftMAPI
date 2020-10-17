//
//  MessageStorage+MiscProprties.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

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
}
