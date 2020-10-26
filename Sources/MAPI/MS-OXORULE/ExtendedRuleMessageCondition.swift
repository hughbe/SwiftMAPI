//
//  ExtendedRuleMessageCondition.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXORULE] 2.2.4.1.10 PidTagExtendedRuleMessageCondition Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidTagExtendedRuleMessageCondition property ([MS-OXPROPS] section 2.689) MUST be set on the FAI message.
/// This property serves the same purpose for extended rules as the PidTagRuleCondition property (section 2.2.1.3.1.9) serves
/// for standard rules; however, it contains additional information about the named properties used.
/// All string values contained in any part of this condition property value MUST be in Unicode format. If the
/// PidTagExtendedRuleSizeLimit property ([MS-OXCSTOR] section 2.2.2.1.1.1) is set on the Logon object, the client is
/// required to keep the size of the PidTagExtendedRuleMessageCondition property under the value specified by the
/// PidTagExtendedRuleSizeLimit property.
/// The format of the PidTagExtendedRuleMessageCondition property is as follows.
public struct ExtendedRuleMessageCondition {
    public let namedPropertyInformation: NamedPropertyInformation
    public let ruleRestriction: Restriction
    
    public init(dataStream: inout DataStream) throws {
        /// NamedPropertyInformation (variable): A structure that specifies information about named properties used in this condition,
        /// as specified in section 2.2.4.2.
        self.namedPropertyInformation = try NamedPropertyInformation(dataStream: &dataStream)

        /// RuleRestriction (variable): A structure containing the condition to be evaluated. The condition is expressed as a restriction,
        /// as specified in [MS-OXCDATA] section 2.12.
        self.ruleRestriction = try Restriction(dataStream: &dataStream, standard: false)
        
        assert(dataStream.remainingCount == 0)
    }
}
