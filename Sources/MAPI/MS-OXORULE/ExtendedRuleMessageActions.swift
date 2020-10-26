//
//  ExtendedRuleMessageActions.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXORULE] 2.2.4.1.9 PidTagExtendedRuleMessageActions Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidTagExtendedRuleMessageActions property ([MS-OXPROPS] section 2.688) MUST be set on the FAI message. This
/// property serves the same purpose for extended rules as the PidTagRuleActions property (section 2.2.1.3.1.10) serves for
/// standard rules; however, it contains additional information about the version of the rule (2) and about the named properties used.
/// The format of the PidTagExtendedRuleMessageActions property is as follows.
public struct ExtendedRuleMessageActions {
    public let namedPropertyInformation: NamedPropertyInformation
    public let ruleVersion: UInt32
    public let ruleActionsBuffer: RuleAction
    
    public init(dataStream: inout DataStream) throws {
        /// NamedPropertyInformation (variable): A structure that specifies information about named properties used in this
        /// action (2) as specified in section 2.2.4.2.
        self.namedPropertyInformation = try NamedPropertyInformation(dataStream: &dataStream)
        
        /// RuleVersion (4 bytes): Specifies the extended rules version format. This document defines version 1, and thus
        /// this value MUST be set to 0x00000001.
        self.ruleVersion = try dataStream.read(endianess: .littleEndian)
        if self.ruleVersion != 0x00000001 {
            throw MAPIError.corrupted
        }
        
        /// RuleActionsBuffer (variable): A RuleAction structure, as specified in section 2.2.5, containing the actions (2) to
        /// be executed when the condition for the rule (2) to which these actions (2) apply evaluates to "TRUE". All string
        /// values contained in any part of the RuleAction structure MUST be in Unicode format.
        self.ruleActionsBuffer = try RuleAction(dataStream: &dataStream, standard: false)
        
        assert(dataStream.remainingCount == 0)
    }
}
