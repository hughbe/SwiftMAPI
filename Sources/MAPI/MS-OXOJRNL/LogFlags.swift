//
//  LogFlags.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOJRNL] 2.2.1.6 PidLidLogFlags Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidLogFlags property ([MS-OXPROPS] section 2.166) contains bits that specify whether the
/// Journal object has a journal-associated attachment. This property MUST be set to one of the values
/// in the following table.
public enum LogFlags: UInt32 {
    case noAssociatedAttachment = 0x00000000
    case hasAssociatedAttachment = 0x40000000
}
