//
//  MessageStorage+PhishingWarningProperties.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-OXPHISH] 2.2 Message Syntax
/// Before sending requests to the server, the client MUST obtain a handle to the Message object used
/// in property operations.
/// [MS-OXPHISH] 2.2.1 Phishing Warning Protocol Properties
/// The following property is specific to the Phishing Warning Protocol.
public extension MessageStorage {
    /// [MS-OXPHISH] 2.2.1.1 PidNamePhishingStamp
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNamePhishingStamp property ([MS-OXPROPS] section 2.464) indicates whether a message
    /// is likely to be a phishing message.
    /// The value of this named property is a 32-bit field. The structure is specified as follows.
    var phishingStamp: UInt32? {
        return getProperty(name: .namePhishingStamp)
    }
}
