//
//  FolderFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCFOLD] 2.2.2.2.1.5 PidTagFolderFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagFolderFlags property ([MS-OXPROPS] section 2.695) contains a computed value that
/// specifies the type or state of a folder. The value is a bitwise OR of zero or more values from the
/// following table.
public struct FolderFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The folder belongs to the IPM subtree portion of the mailbox.
    public static let ipm = FolderFlags(rawValue: 0x00000001)

    /// The folder contains the results of a search.
    public static let search = FolderFlags(rawValue: 0x00000002)

    /// The folder is a generic folder that contains messages and other folders.
    public static let normal = FolderFlags(rawValue: 0x00000004)
    
    /// The folder has rules associated with it.
    public static let rules = FolderFlags(rawValue: 0x00000008)

    public static let all: FolderFlags = [.ipm, .search, .normal, .rules]
}
