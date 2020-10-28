//
//  StoreState.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

/// [MS-OXCSTOR] 2.2.2.1.1.5 PidTagStoreState Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagStoreState property ([MS-OXPROPS] section 2.1023) indicates whether the mailbox has any active search folders.
/// The value 0x00000000 indicates that the mailbox does not have active search folders. The value 0x01000000 indicates that
/// one or more active search folders have been created.
public struct StoreState: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// STORE_HAS_SEARCHES The user has created one or more active searches in the store.
    public static let hasSearches = StoreState(rawValue: 0x01000000)

    public static let all: StoreState = [.hasSearches]
}
