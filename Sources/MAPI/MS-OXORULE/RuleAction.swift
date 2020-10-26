//
//  RuleAction.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXORULE] 2.2.5 RuleAction Structure
/// The RuleAction structure MUST have one or more blocks of a binary data to specify various actions (2) of the rule (2). The
/// RuleAction structure has the following format for standard rules. The format for extended rules is the same except that the
/// size of the NoOfActions field is 4 bytes instead of 2 bytes.
public struct RuleAction {
    public let noOfActions: UInt32
    public let actionBlocks: [ActionBlock]

    public init(dataStream: inout DataStream, standard: Bool) throws {
        /// NoOfActions (2 bytes): Specifies the number of structures that are contained in the ActionBlocks field. This number
        /// MUST be greater than zero. For extended rules, the size of the NoOfActions field is 4 bytes instead of 2 bytes.
        if standard {
            self.noOfActions = UInt32(try dataStream.read(endianess: .littleEndian) as UInt16)
        } else {
            self.noOfActions = try dataStream.read(endianess: .littleEndian)
        }

        /// ActionBlocks (variable): An array of ActionBlock structures, each of which specifies an action (2)
        /// of the rule (2), as specified in section 2.2.5.1.
        var actionBlocks: [ActionBlock] = []
        actionBlocks.reserveCapacity(Int(self.noOfActions))
        for _ in 0..<self.noOfActions {
            let actionBlock = try ActionBlock(dataStream: &dataStream, standard: standard)
            actionBlocks.append(actionBlock)
        }
        
        self.actionBlocks = actionBlocks
    }
}
