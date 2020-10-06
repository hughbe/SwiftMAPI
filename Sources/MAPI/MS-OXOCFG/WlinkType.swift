//
//  WlinkType.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOCFG] 2.2.9.5 PidTagWlinkType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagWlinkType property ([MS-OXPROPS] section 2.1073) specifies the type of navigation
/// shortcut, as specified in section 2.2.9. The valid values of this property are as follows.
public enum WlinkType: UInt32 {
    /// The shortcut points to a folder other than a search folder, group header
    /// shortcut, or a folder owned by a different user.
    case normalFolder = 0x00000000
    
    /// The shortcut points to a search folder.
    case searchFolder = 0x00000001
    
    /// The shortcut points to a folder that is owned by a different user.
    case sharedFolder = 0x00000003
    
    /// The shortcut points to the group header shortcut.
    case groupHeaderShortcut = 0x00000004
}
