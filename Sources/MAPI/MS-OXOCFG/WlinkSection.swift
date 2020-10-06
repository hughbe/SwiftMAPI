//
//  WlinkSection.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOCFG] 2.2.9.14 PidTagWlinkSection Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagWlinkSection property ([MS-OXPROPS] section 2.1071) specifies the section where the
/// shortcut can be grouped. The possible values are listed in the following table.
public enum WlinkSection: UInt32 {
    /// Shortcut is grouped under Mail.
    case mail = 0x00000001
    
    /// NA
    case na = 0x00000002
    
    /// Shortcut is grouped under Calendar.
    case calendar = 0x00000003
    
    /// Shortcut is grouped under Contacts.
    case contacts = 0x00000004
    
    /// Shortcut is grouped under Tasks.
    case tasks = 0x00000005
    
    /// Shortcut is grouped under Notes.
    case notes = 0x00000006
    
    /// Shortcut is grouped under Journal.
    case journal = 0x00000007
}
