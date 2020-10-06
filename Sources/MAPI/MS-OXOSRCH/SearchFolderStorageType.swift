//
//  SearchFolderStorageType.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXOSRCH] 2.2.1.2.6 PidTagSearchFolderStorageType
/// Type: PtypInteger32
/// The PidTagSearchFolderStorageType property ([MS-OXPROPS] section 2.988) contains flags that control the presence and content of
/// certain fields within the PidTagSearchFolderDefinition property (section 2.2.1.2.8 ). These flags are duplicated within the
/// PidTagSearchFolderDefinition property. The specific flags to use depend on the template; section 2.2.3 specifies the correct flags for each
/// template definition.
/// The flags are stored as a 4-byte integer. The following table shows the flags in big-endian order.
/// (The flags are in network byte order within the PidTagSearchFolderDefinition property.)
public enum OutlookMessageSearchFolderStorageType: UInt32 {
    case B = 0x00000040
    case C = 0x00000020
    case D = 0x00000010
    case E = 0x00000008
    case F = 0x00000004
    case G = 0x00000002
    case H = 0x00000001
    case J = 0x00004000
    case K = 0x00002000
    case L = 0x00001000
}
