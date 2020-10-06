//
//  ResolveMethod.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXCFXICS] 2.2.1.4.1 PidTagResolveMethod Property
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagResolveMethod property ([MS-OXPROPS] section 2.929) specifies how to resolve any conflicts with the message.
/// This property is not required. The following table defines valid values for the PidTagResolveMethod property.
public enum ResolveMethod: UInt32 {
    /// A conflict resolve message SHOULD be generated.
    case `default` = 0x00000000
    
    /// Overwrite the target message with the current changes being applied.
    case lastWriterWins = 0x00000001
    
    /// Do not send a conflict notification message when generating a conflict resolve message in a public folder.
    case noConflictNotification = 0x00000002
}
