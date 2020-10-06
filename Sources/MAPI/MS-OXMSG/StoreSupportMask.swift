//
//  StoreSupportMask.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXMSG] 2.1.1.1 PidTagStoreSupportMask
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagStoreSupportMask property ([MS-OXPROPS] section 2.1024) indicates whether string
/// properties within the .msg file are Unicode-encoded or not. This property defines multiple flags, but
/// only the STORE_UNICODE_OK flag is valid. All other bits MUST be ignored. The settings for this
/// property are summarized in the following table.
public struct StoreSupportMask: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// Set if the string properties are Unicode-encoded.
    public static let unicodeOk = StoreSupportMask(rawValue: 0x00040000)
    
    public static let all: StoreSupportMask = [.unicodeOk]
}
