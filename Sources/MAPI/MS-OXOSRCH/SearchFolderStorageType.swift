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
public struct SearchFolderStorageType: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    public static let B = SearchFolderStorageType(rawValue: 0x00000040)
    
    public static let C = SearchFolderStorageType(rawValue: 0x00000020)
    
    public static let D = SearchFolderStorageType(rawValue: 0x00000010)
    
    public static let E = SearchFolderStorageType(rawValue: 0x00000008)
    
    public static let F = SearchFolderStorageType(rawValue: 0x00000004)
    
    public static let G = SearchFolderStorageType(rawValue: 0x00000002)
    
    public static let H = SearchFolderStorageType(rawValue: 0x00000001)
    
    public static let J = SearchFolderStorageType(rawValue: 0x00004000)
    
    public static let K = SearchFolderStorageType(rawValue: 0x00002000)
    
    public static let L = SearchFolderStorageType(rawValue: 0x00001000)

    public static let all: SearchFolderStorageType = [.B, .C, .D, .E, .F, .G, .H, .J, .K, .L]
}
