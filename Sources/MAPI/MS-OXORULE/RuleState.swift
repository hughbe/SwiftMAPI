//
//  RuleState.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXORULE] 2.2.1.3.1.3 PidTagRuleState Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagRuleState property ([MS-OXPROPS] section 2.959) contains a value interpreted as a Bitmask combination of flags that
/// specify the state of the rule (2). The value of the PidTagRuleState property is defined as follows.
public struct RuleState: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// EN (ST_ENABLED, Bitmask 0x00000001): The rule (2) is enabled for execution. If neither this flag nor the ST_ONLY_WHEN_OOF
    /// flag are set, the server skips this rule (2) when evaluating rules (2).
    public static let enabled = RuleState(rawValue: 0x00000001)

    /// ER (ST_ERROR, Bitmask 0x00000002): The server has encountered any nonparsing error processing the rule (2). This flag is not
    /// to be set by the client and is to be ignored by the server if it is.
    public static let error = RuleState(rawValue: 0x00000002)
    
    /// OF (ST_ONLY_WHEN_OOF, Bitmask 0x00000004): The rule (2) is executed only when a user sets the Out of Office (OOF) state on
    /// the mailbox, as specified in [MS-OXWOOF] section 2.2.5.2. This flag MUST NOT be set in a public folder rule (2). For details on
    /// this flag, see section 3.2.5.1.1.1.
    public static let onlyWhenOutOfOffice = RuleState(rawValue: 0x00000004)
    
    /// HI (ST_KEEP_OOF_HIST, Bitmask 0x00000008): For details, see section 3.2.5.1.1. This flag MUST NOT be set in a public folder rule (2).
    public static let keepOutOfOfficeHistory = RuleState(rawValue: 0x00000008)
    
    /// EL (ST_EXIT_LEVEL, Bitmask 0x00000010): Rule (2) evaluation will terminate after executing this rule (2), except for evaluation of
    /// Out of Office rules. For details, see section 3.2.5.1.1.1.
    public static let exitLevel = RuleState(rawValue: 0x00000010)
    
    /// SCL (ST_SKIP_IF_SCL_IS_SAFE, Bitmask 0x00000020): Evaluation of this rule (2) MAY be skipped if the delivered message's
    /// PidTagContentFilterSpamConfidenceLevel property ([MSOXPROPS] section 2.643) has a value of 0xFFFFFFFF.
    public static let skipIfSpamConfidenceLevelIsSafe = RuleState(rawValue: 0x00000020)
    
    /// PE (ST_RULE_PARSE_ERROR, Bitmask 0x00000040): The server has encountered rule (2) data from the client that is in an
    /// incorrect format, which caused an error parsing the rule (2) data. This flag is not to be set by the client and is to be ignored
    /// by the server if it is.
    public static let ruleParseError = RuleState(rawValue: 0x00000040)

    public static let all: RuleState = [.enabled, .error, .onlyWhenOutOfOffice, .keepOutOfOfficeHistory, .exitLevel, .skipIfSpamConfidenceLevelIsSafe, .ruleParseError]
}
