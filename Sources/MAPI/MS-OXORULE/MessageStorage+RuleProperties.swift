//
//  MessageStorage+RuleProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import DataStream
import Foundation

/// [MS-OXORULE] 2.2 Message Syntax
/// Standard rules are the most common and typical way of specifying rules (2) for a folder. Sections
/// 2.2.1, 2.2.2, and 2.2.3 specify the ROP request buffers and ROP response buffers specific to this
/// protocol. The syntax of these requests and responses is documented in [MS-OXCROPS], as specified in
/// each section below.
/// Unless otherwise noted, sizes in this section are expressed in bytes.
/// Unless otherwise noted, the fields specified in this section are packed in buffers in the order they
/// appear in this document, without any padding in little-endian format.
/// [MS-OXORULE] 2.2.1.3.1 Properties of a Standard Rule
/// The properties for a standard rule are specified in sections 2.2.1.3.1.1 through 2.2.1.3.1.10. These
/// properties are set by using the RopModifyRules ROP (section 2.2.1). The RuleData structure, which
/// is specified in section 2.2.1.3, contains the property settings for each standard rule.
/// [MS-OXORULE] 2.2.4 Extended Rules Message Syntax
/// Using standard rules for message processing, as specified in section 2.2.1, section 2.2.2, and section
/// 2.2.3, has one major limitation as a consequence of using the ROP layer as the underlying transport:
/// there is an inherent size limitation of 32 kilobytes per ROP package. To work around this limitation,
/// extended rules were created. Extended rules are built using the Message and Attachment Protocol as
/// specified in [MS-OXCMSG], so that messages can be spread over multiple ROPs to avoid the size
/// limitation. An extended rule is defined as an FAI message in a folder that has the value of the
/// PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) set to "IPM.ExtendedRule.Message".
/// This FAI message also has a set of rule-related properties set on it, as specified in the following
/// subsections. To create, modify, or delete an extended rule, the application is required to create,
/// modify, or delete the underlying FAI message.
/// Extended rules use a different set of properties than the RopModifyRules ROP ([MS-OXCROPS]
/// section 2.2.11.1). However, these properties map to properties for RopModifyRules; and except
/// where noted, their formats are identical and the same syntactic restrictions and semantic meanings
/// of values apply as the respective property defined in section 2.2.1.3.1.
/// [MS-OXORULE] 2.2.4.1 Properties of an Extended Rule
/// The following properties have a particular meaning when set on FAI messages representing an
/// extended rule. The application can store additional meta-data in any other property on the FAI
/// message. The server is to ignore any properties not explicitly listed here when evaluating an extended
/// rule.
/// [MS-OXORULE] 2.2.6 DAM Syntax
/// A DAM has to be created by the server to indicate to the client that it needs to further process a
/// client-side rule action (2). This process is specified in section 3.2.5.1.2. Extended rules are not
/// used in DAMs.
/// In addition to properties required on any message (as specified in [MS-OXCMSG] section 2.2.1), the
/// following properties are specific to a DAM.
/// [MS-OXORULE] 2.2.7 DEM Syntax
/// A DEM SHOULD be created by the server when an error is encountered while executing a rule (2).
/// This process is specified in section 3.2.5.1.3. Extended rules are not used in DEMs.
/// In addition to properties required on any message, as specified in [MS-OXCMSG] section 2.2.1, the
/// following properties are specific to a DEM.
/// [MS-OXORULE] 2.2.8 Rules-Related Folder Properties
/// [MS-OXORULE] 2.2.9 Rules-Related Message Properties
public extension MessageStorage {
    /// [MS-OXORULE] 2.2.1.3.1.1 PidTagRuleId Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleId property ([MS-OXPROPS] section 2.945) specifies a unique identifier the
    /// messaging server generates for each rule (2) when the rule (2) is first created. The PidTagRuleId
    /// property MUST NOT be used when requesting that a new rule (2) be created but MUST be used when
    /// requesting that a rule (2) be modified or deleted.
    var ruleId: UInt64? {
        return getProperty(id: .tagRuleId)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.2 PidTagRuleSequence Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleSequence property ([MS-OXPROPS] section 2.958) contains a value used to
    /// determine the order in which rules (2) are evaluated and executed. Rules (2) are evaluated in
    /// sequence according to the increasing order of this value. The evaluation order for rules (2) that have
    /// the same value in the PidTagRuleSequence property is undefined: the server can choose an
    /// arbitrary order for rules (2) with the same value, but that does not affect the sequence of other rules
    /// (2).
    var ruleSequence: UInt32? {
        return getProperty(id: .tagRuleSequence)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.3 PidTagRuleState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleState property ([MS-OXPROPS] section 2.959) contains a value interpreted as a
    /// Bitmask combination of flags that specify the state of the rule (2). The value of the
    /// PidTagRuleState property is defined as follows.
    /// [MS-OXODLGT] 2.2.3.1.1 PidTagRuleState Property
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleState property ([MS-OXPROPS] section 2.957) MUST be set to 0x00000001
    var ruleState: RuleState? {
        guard let rawValue: UInt32 = getProperty(id: .tagRuleState) else {
            return nil
        }
        
        return RuleState(rawValue: rawValue)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.4 PidTagRuleName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleName property ([MS-OXPROPS] section 2.955) specifies the name of the rule (2).
    /// [MS-OXODLGT] 2.2.3.1.2 PidTagRuleName Property
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleName property ([MS-OXPROPS] section 2.953) MUST be set to "" (a zero-length
    /// string).
    var ruleName: String? {
        return getProperty(id: .tagRuleName)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.5 PidTagRuleProvider Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleProvider property ([MS-OXPROPS] section 2.956) identifies the client application
    /// that owns the rule (2). The client specifies this property when adding or modifying a rule (2).
    /// Rules that are stored on folders are associated with the application that owns the rules (2) by using a
    /// rule provider string. Each client application is to only add, modify or delete rules (2) that it is
    /// responsible for.
    /// A client can define its own rule provider string. The value of the string MUST NOT be the same as a
    /// rule provider string being used by another client that could be setting rules (2) on the same
    /// folder.<2>
    /// [MS-OXORULE] 2.2.6.4 PidTagRuleProvider Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleProvider property ([MS-OXPROPS] section 2.956) MUST be set to the same value as
    /// the PidTagRuleProvider property on the rule or rules that have generated the DAM.
    /// [MS-OXORULE] 2.2.7.5 PidTagRuleProvider Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleProvider property (section 2.2.1.3.1.5) MUST be set to the same value as the
    /// PidTagRuleProvider property on the rule or rules that have caused the DEM to be generated.
    /// [MS-OXODLGT] 2.2.3.1.3 PidTagRuleProvider Property
    /// Data type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleProvider property ([MS-OXPROPS] section 2.954) MUST be set to "Schedule+ EMS
    /// Interface".
    var ruleProvider: String? {
        return getProperty(id: .tagRuleProvider)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.6 PidTagRuleLevel Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleLevel property ([MS-OXPROPS] section 2.947) is not used; if a client requests that
    /// this property be set, the requested value MUST be 0x00000000.
    /// [MS-OXORULE] 2.2.3.1.4 PidTagRuleLevel Property
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleLevel property ([MS-OXPROPS] section 2.945) MUST be set to 0x00000000.
    var ruleLevel: UInt32? {
        return getProperty(id: .tagRuleLevel)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.7 PidTagRuleUserFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleUserFlags property ([MS-OXPROPS] section 2.960) is an opaque property that the
    /// client sets for the exclusive use of the client. The server is to preserve this value if set by the client
    /// but ignores its contents during rule (2) evaluation and processing.
    var ruleUserFlags: UInt32? {
        return getProperty(id: .tagRuleUserFlags)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.8 PidTagRuleProviderData Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleProviderData property ([MS-OXPROPS] section 2.957) is an opaque property that
    /// the client sets for the exclusive use of the client. The server is to preserve this value if set by the
    /// client but ignores its contents during rule (2) evaluation and processing.
    var ruleProviderData: Data? {
        return getProperty(id: .tagRuleProviderData)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.9 PidTagRuleCondition Property
    /// Type: PtypRestriction ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleCondition property ([MS-OXPROPS] section 2.942) sets the condition used when
    /// evaluating the rule (2). The condition is expressed as a restriction, as specified in [MS-OXCDATA]
    /// section 2.12.
    /// [MS-OXODLGT] 2.2.3.1.5 PidTagRuleCondition Property
    /// Data type: PtypRestriction ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleCondition property ([MS-OXPROPS] section 2.940) contains a restriction of type
    /// RES_AND with the following restrictions:
    ///  A restriction of type RES_CONTENT that limits a table view to rows that include the string
    /// "IPM.Schedule.Meeting" in the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3)
    /// column. The level of precision, which is specified in the FuzzyLevelLow field of the
    /// ContentRestriction structure, is set to FL_PREFIX.
    ///  A restriction of type RES_NOT with a restriction of type RES_EXIST that specifies the
    /// PidTagDelegatedByRule property ([MS-OXPROPS] section 2.660).
    ///  A restriction of type RES_OR with the following restrictions:
    ///  A restriction of type RES_NOT with a restriction of type RES_EXIST that specifies the
    /// PidTagSensitivity property ([MS-OXCMSG] section 2.2.1.13)
    ///  A restriction of type RES_PROPERTY that specifies a comparison of the value of the
    /// PidTagSensitivity property to the value 0x00000002, indicating a private message. The
    /// relationship operator, which is specified in the RelOp field of the PropertyRestriction
    /// structure, is set to RELOP_NE.
    /// For more details about restrictions, see [MS-OXCDATA] section 2.12.
    var ruleCondition: Data? {
        return getProperty(id: .tagRuleCondition)
    }
    
    /// [MS-OXORULE] 2.2.1.3.1.10 PidTagRuleActions Property
    /// Type: PtypRuleAction ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleActions property ([MS-OXPROPS] section 2.940) contains the set of actions (2)
    /// associated with the rule (2). Its structure is specified in section 2.2.5.
    /// [MS-OXODLGT] 2.2.3.1.6 PidTagRuleActions Property
    /// Data type: PtypRuleAction ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleActions property ([MS-OXPROPS] section 2.938) specifies the delegate's rule
    /// actions, which are used to perform the following actions:
    /// 1. Send copies of meeting-related objects to delegates, by using the OP_DELEGATE action, as
    /// specified in [MS-OXORULE] section 2.2.5.1.2.4.
    /// 2. Delete the delegator's copy of meeting-related objects, by using the OP_DELETE action, as
    /// specified in [MS-OXORULE] section 2.2.5.1.2.7.
    /// Sections 3.1.4.3.2.1 and 3.1.4.3.5 specify when these actions are specified in the delegate rule. For
    /// more details about rule actions, see [MS-OXORULE] section 2.2.5.
    var ruleActions: Data? {
        return getProperty(id: .tagRuleActions)
    }
    
    /// [MS-OXORULE] 2.2.4.1.1 PidTagRuleMessageName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleMessageName property ([MS-OXPROPS] section 2.949) SHOULD be set on the FAI
    /// message. This property has the same semantics as the PidTagRuleName property (section
    /// 2.2.1.3.1.4).
    var ruleMessageName: String? {
        return getProperty(id: .tagRuleMessageName)
    }
    
    /// [MS-OXORULE] 2.2.4.1.3 PidTagRuleMessageSequence Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleMessageSequence property ([MS-OXPROPS] section 2.952) MUST be set on the
    /// FAI message. This property has the same semantics as the PidTagRuleSequence property (section
    /// 2.2.1.3.1.2).
    var ruleMessageSequence: UInt32? {
        return getProperty(id: .tagRuleMessageSequence)
    }
    
    /// [MS-OXORULE] 2.2.4.1.4 PidTagRuleMessageState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleMessageState property ([MS-OXPROPS] section 2.953) MUST be set on the FAI
    /// message. This property has the same semantics and flag meanings as the PidTagRuleState property
    /// (section 2.2.1.3.1.3).
    var ruleMessageState: RuleState? {
        guard let rawValue: UInt32 = getProperty(id: .tagRuleMessageState) else {
            return nil
        }
        
        return RuleState(rawValue: rawValue)
    }
    
    /// [MS-OXORULE] 2.2.4.1.5 PidTagRuleMessageUserFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// This PidTagRuleMessageUserFlags property ([MS-OXPROPS] section 2.954) MAY be set on the FAI
    /// message. This property has the same semantics as the PidTagRuleUserFlags property (section
    /// 2.2.1.3.1.7).
    var ruleMessageUserFlags: UInt32? {
        return getProperty(id: .tagRuleMessageUserFlags)
    }
    
    /// [MS-OXORULE] 2.2.4.1.6 PidTagRuleMessageLevel Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleMessageLevel property ([MS-OXPROPS] section 2.948) SHOULD be set on the FAI
    /// message. This property has the same semantics as the PidTagRuleLevel property (section
    /// 2.2.1.3.1.6).
    var ruleMessageLevel: UInt32? {
        return getProperty(id: .tagRuleMessageLevel)
    }
    
    /// [MS-OXORULE] 2.2.4.1.7 PidTagRuleMessageProvider Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleMessageProvider property ([MS-OXPROPS] section 2.950) MUST be set on the FAI
    /// message. This property has the same semantics as the PidTagRuleProvider property (section
    /// 2.2.1.3.1.5).
    var ruleMessageProvider: String? {
        return getProperty(id: .tagRuleMessageProvider)
    }
    
    /// [MS-OXORULE] 2.2.4.1.8 PidTagRuleMessageProviderData Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleMessageProviderData property ([MS-OXPROPS] section 2.951) MAY be set on the
    /// FAI message. This property has the same syntax and semantics as the PidTagRuleProviderData
    /// property (section 2.2.1.3.1.8).
    var ruleMessageProviderData: Data? {
        return getProperty(id: .tagRuleMessageProviderData)
    }
        
    /// [MS-OXORULE] 2.2.4.1.9 PidTagExtendedRuleMessageActions Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagExtendedRuleMessageActions property ([MS-OXPROPS] section 2.688) MUST be set on
    /// the FAI message. This property serves the same purpose for extended rules as the
    /// PidTagRuleActions property (section 2.2.1.3.1.10) serves for standard rules; however, it contains
    /// additional information about the version of the rule (2) and about the named properties used.
    /// The format of the PidTagExtendedRuleMessageActions property is as follows.
    var extendedRuleMessageActions: ExtendedRuleMessageActions? {
        guard let data: Data = getProperty(id: .tagExtendedRuleMessageActions) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? ExtendedRuleMessageActions(dataStream: &dataStream)
    }
        
    /// [MS-OXORULE] 2.2.4.1.10 PidTagExtendedRuleMessageCondition Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagExtendedRuleMessageCondition property ([MS-OXPROPS] section 2.689) MUST be set
    /// on the FAI message. This property serves the same purpose for extended rules as the
    /// PidTagRuleCondition property (section 2.2.1.3.1.9) serves for standard rules; however, it contains
    /// additional information about the named properties used.
    /// All string values contained in any part of this condition property value MUST be in Unicode format. If
    /// the PidTagExtendedRuleSizeLimit property ([MS-OXCSTOR] section 2.2.2.1.1.1) is set on the
    /// Logon object, the client is required to keep the size of the
    /// PidTagExtendedRuleMessageCondition property under the value specified by the
    /// PidTagExtendedRuleSizeLimit property.
    /// The format of the PidTagExtendedRuleMessageCondition property is as follows.
    var extendedRuleMessageCondition: ExtendedRuleMessageCondition? {
        guard let data: Data = getProperty(id: .tagExtendedRuleMessageCondition) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? ExtendedRuleMessageCondition(dataStream: &dataStream)
    }
    
    /// [MS-OXORULE] 2.2.6.2 PidTagDamBackPatched Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDamBackPatched property ([MS-OXPROPS] section 2.654) MUST be set to "FALSE"
    /// when the DAM is generated; it MUST be set to "TRUE" if the DAM was updated by the server as a
    /// result of a RopUpdateDeferredActionMessages request ([MS-OXCROPS] section 2.2.11.3).
    var damBackPatched: Bool? {
        return getProperty(id: .tagDamBackPatched)
    }
    
    /// [MS-OXORULE] 2.2.6.3 PidTagDamOriginalEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// This PidTagDamOriginalEntryId property ([MS-OXPROPS] section 2.655) MUST be set to the
    /// EntryID of the delivered (target) message that the client has to process.
    /// [MS-OXORULE] 2.2.7.6 PidTagDamOriginalEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDamOriginalEntryId property (section 2.2.6.3) SHOULD<10> be set to the EntryID of
    /// the message that was being processed by the server when this error was encountered (that is, the
    /// "delivered message").
    var damOriginalEntryId: Data? {
        return getProperty(id: .tagDamOriginalEntryId)
    }
    
    /// [MS-OXORULE] 2.2.6.5 PidTagRuleFolderEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleFolderEntryId property ([MS-OXPROPS] section 2.944) MUST be set to the EntryID
    /// of the folder where the rule (2) that triggered the generation of this DAM is stored.
    /// [MS-OXORULE] 2.2.7.7 PidTagRuleFolderEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleFolderEntryId property (section 2.2.6.5) SHOULD<11> be set to the EntryID of
    /// the folder where the rule (2) that triggered the generation of this DEM is stored.
    var ruleFolderEntryId: Data? {
        return getProperty(id: .tagRuleFolderEntryId)
    }
    
    /// [MS-OXORULE] 2.2.6.6 PidTagClientActions Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagClientActions property ([MS-OXPROPS] section 2.630) is a binary buffer specifying the
    /// actions (2) the client is required to take on the message. The buffer MUST be packed according to
    /// the RuleAction structure specified in section 2.2.5.
    /// The server is required to set values in this property according to the relevant actions (2) as they were
    /// set by the client when the rule (2) was created or changed by using the RopModifyRules ROP
    /// ([MS-OXCROPS] section 2.2.11.1). Note that the server can combine actions (2) from different rules
    /// (2) into one DAM, in which case the RuleAction structures will be concatenated in the DAM's
    /// PidTagClientActions property by using the proper action (2) syntax specified in section 2.2.5.
    var clientActions: Data? {
        return getProperty(id: .tagClientActions)
    }
    
    /// [MS-OXORULE] 2.2.6.7 PidTagRuleIds Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleIds property ([MS-OXPROPS] section 2.946) is a buffer that contains the
    /// PidTagRuleId (section 2.2.1.3.1.1) value (8 bytes) from the first rule (2) that contributed actions
    /// (2) in the PidTagClientActions property (section 2.2.6.6), and repeats that value once for each rule
    /// (2) that contributed actions (2). The length of this binary property MUST be a multiple of 8 bytes.
    /// [MS-OXORULE] 2.2.7.8 PidTagRuleId Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleId (section 2.2.1.3.1.1) property MUST be set to the same value as the value of the
    /// PidTagRuleId property on the rule (2) that has generated this error.
    var ruleIds: Data? {
        return getProperty(id: .tagRuleIds)
    }
    
    /// [MS-OXORULE] 2.2.6.8 PidTagDeferredActionMessageOriginalEntryId Property
    /// Type: PtypServerId ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDeferredActionMessageOriginalEntryId property ([MS-OXPROPS] section 2.657)
    /// contains the server EntryID for the DAM message on the server. This property is set by the server
    /// when the DAM is created.
    var deferredActionMessageOriginalEntryId: Data? {
        return getProperty(id: .tagDeferredActionMessageOriginalEntryId)
    }

    /// [MS-OXORULE] 2.2.7.2 PidTagRuleError Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleError property ([MS-OXPROPS] section 2.943) MUST be set to one of the following
    /// values, indicating the cause of the error encountered during the execution of the rule (2).
    var ruleError: RuleError? {
        guard let rawValue: UInt32 = getProperty(id: .tagRuleError) else {
            return nil
        }
        
        return RuleError(rawValue: rawValue)
    }
    
    /// [MS-OXORULE] 2.2.7.3 PidTagRuleActionType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleActionType property ([MS-OXPROPS] section 2.941) specifies the action (2) of the
    /// rule (2) that failed. This property MUST be set either to the value of the ActionType field, as
    /// specified in section 2.2.5.1, or to 0x00000000 if the failure is not specific to an action (2). Related
    /// property: PidTagRuleActionNumber (section 2.2.7.4).
    var ruleActionType: RuleActionType? {
        guard let rawValue: UInt32 = getProperty(id: .tagRuleActionType) else {
            return nil
        }
        
        return RuleActionType(rawValue: UInt8(rawValue))
    }
    
    /// [MS-OXORULE] 2.2.7.4 PidTagRuleActionNumber Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRuleActionNumber property ([MS-OXPROPS] section 2.939) MUST be set to the zerobased index of the action (2) that failed or set to 0x00000000 if the failure is not specific to an action
    /// (2). (For example, if specific to an action (2), a property value of 0x00000000 means that the first
    /// action (2) failed, 0x00000001 means that the second action (2) failed.) The ActionType field value of
    /// the action (2) at this index MUST be the same value as the value of the PidTagRuleActionType
    /// property (section 2.2.7.3) in this DEM.
    var ruleActionNumber: UInt32? {
        return getProperty(id: .tagRuleActionNumber)
    }
    
    /// [MS-OXORULE] 2.2.8.1 PidTagHasRules Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHasRules property ([MS-OXPROPS] section 2.715) specifies whether rules (2) are set on
    /// a folder. This property SHOULD<12> be set to "TRUE" if any rules (2) are set on a folder and "FALSE"
    /// otherwise. If this property does not exist, it is treated as though its value is "FALSE".
    var hasRules: Bool? {
        return getProperty(id: .tagHasRules)
    }
    
    /// [MS-OXORULE] 2.2.9.1 PidTagHasDeferredActionMessages Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagHasDeferredActionMessages property ([MS-OXPROPS] section 2.713) specifies whether
    /// a message has at least one associated DAM. This property MUST be set to "TRUE" if it does and
    /// "FALSE" otherwise. If this property does not exist, it is treated as though its value is "FALSE".
    var hasDeferredActionMessages: Bool? {
        return getProperty(id: .tagHasDeferredActionMessages)
    }
    
    /// [MS-OXORULE] 2.2.9.2 PidTagReplyTemplateId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagReplyTemplateId property ([MS-OXPROPS] section 2.914) specifies the GUID for the reply template.
    var replyTemplateId: UUID? {
        guard let data: Data = getProperty(id: .tagReplyTemplateId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.readGUID(endianess: .littleEndian)
    }
    
    /// [MS-OXORULE] 2.2.9.3 PidTagRwRulesStream Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRwRulesStream property ([MS-OXPROPS] section 2.961) contains client-specific data
    /// about the Rule FAI message. The value of this property is opaque to the server.
    var rwRulesStream: Data? {
        return getProperty(id: .tagOfflineAddressBookContainerGuidOrTagRwRulesStreamOrTagSenderTelephoneNumber)
    }
}
