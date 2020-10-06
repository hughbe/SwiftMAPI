//
//  FolderType.swift
//
//
//  Created by Hugh Bellamy on 27/08/2020.
//

/// [MS-OXCFOLD] 2.2.2.2.2.7 PidTagFolderType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagFolderType property ([MS-OXPROPS] section 2.696) specifies the type of the folder.
/// The valid values of the PidTagFolderType property are listed in the following table.
public enum FolderType: UInt32 {
    /// The Root folder of the folder hierarchy table; that is, a folder that has no parent folder.
    case root = 0x00000000
    
    /// A generic folder that contains messages and other folders.
    case generic = 0x00000001
    
    /// A folder that contains the results of a search, in the form of links to messages that meet search criteria.
    case search = 0x00000002
}
