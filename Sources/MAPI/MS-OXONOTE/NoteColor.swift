//
//  NoteColor.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

/// [MS-OXONOTE] 2.2.1.1 PidLidNoteColor Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidNoteColor property ([MS-OXPROPS] section 2.183) specifies the suggested background
/// color of the note. This property MUST be set to one of the values specified in the following table.<1>
public enum NoteColor: UInt32 {
    case blue = 0x00000000
    case green = 0x00000001
    case pink = 0x00000002
    case yellow = 0x00000003
    case white = 0x00000004
}
