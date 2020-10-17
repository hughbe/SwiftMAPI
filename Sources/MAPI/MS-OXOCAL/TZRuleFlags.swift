//
//  TZRuleFlags.swift
//  
//
//  Created by Hugh Bellamy on 17/10/2020.
//

/// [MS-OXOCAL] TZRule flags (2 bytes): This field contains individual bit flags that specify information about this TZRule structure,
/// represented here in little-endian byte order.
/// If the TZRULE property associated with this TZRULE flags field specifies the time zone rule (2)
/// that will be used to convert to and from UTC, both of the flags specified in the following diagram
/// are set (for example, the value is 0x0003). If this is not the active time zone rule (2), neither of
/// these flags are set. These flags are set on exactly one TZRule structure that is contained in the
/// associated property, and the flags for all other rules (2) MUST be set to zero (0).
public struct TZRuleFlags: OptionSet {
    public let rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }

    /// R - TZRULE_FLAG_RECUR_CURRENT_TZREG (1 bit): This flag specifies that this rule (2) is associated with a recurring series.
    public static let recurCurrentTzReg = TZRuleFlags(rawValue: 0x00000001)
    
    /// E - TZRULE_FLAG_EFFECTIVE_TZREG (1 bit): This flag specifies that this rule (2) is the effective rule (2).
    public static let effectiveTzReg = TZRuleFlags(rawValue: 0x00000002)
    
    /// unused (14 bits): These bits are not used. MUST be zero and MUST be ignored.

    public static let all: TZRuleFlags = [.recurCurrentTzReg, .effectiveTzReg]
}
