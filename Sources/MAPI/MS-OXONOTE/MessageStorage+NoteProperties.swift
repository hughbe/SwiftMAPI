//
//  MessageStorage+NoteProperties.swift
//
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import Foundation

/// [MS-OXONOTE] 2.2 Message Syntax
/// A Note object can be created and modified by clients and servers. Except where noted, this section
/// defines constraints under which both clients and servers operate.
/// A client operates on a Note object by using the Message and Attachment Object Protocol, as specified
/// in [MS-OXCMSG]. How a server operates on a Note object is implementation-dependent, but the
/// results of any such operation MUST be exposed to clients in a manner that is consistent with the Note
/// Object Protocol.
/// Unless otherwise specified, a Note object adheres to all property constraints specified in [MSOXPROPS] and all property constraints specified in [MS-OXCMSG].
/// 2.2.1 Note Object Properties
/// The properties specific to a Note object are defined in section 2.2.1.1 through section 2.2.1.5.
public extension MessageStorage {
    /// [MS-OXONOTE] 2.2.1.1 PidLidNoteColor Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNoteColor property ([MS-OXPROPS] section 2.183) specifies the suggested background
    /// color of the note. This property MUST be set to one of the values specified in the following table.<1>
    var noteColor: NoteColor? {
        guard let rawValue: UInt32 = getProperty(name: .lidNoteColor) else {
            return nil
        }
        
        return NoteColor(rawValue: rawValue)
    }

    /// [MS-OXONOTE] 2.2.1.2 PidLidNoteWidth Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNoteWidth property ([MS-OXPROPS] section 2.185) specifies the width of the note's
    /// visible window in pixels. The value of this property MUST be greater than zero.
    var noteWidth: UInt32? {
        return getProperty(name: .lidNoteWidth)
    }

    /// [MS-OXONOTE] 2.2.1.3 PidLidNoteHeight Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNoteHeight property ([MS-OXPROPS] section 2.184) specifies the height of the note's
    /// visible window in pixels. The value of this property MUST be greater than zero.
    var noteHeight: UInt32? {
        return getProperty(name: .lidNoteHeight)
    }

    /// [MS-OXONOTE] 2.2.1.4 PidLidNoteX Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNoteX property ([MS-OXPROPS] section 2.186) specifies the distance, in pixels, from the
    /// left edge of the screen that a user interface displays the note.
    var noteX: UInt32? {
        return getProperty(name: .lidNoteX)
    }

    /// [MS-OXONOTE] 2.2.1.5 PidLidNoteY Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidNoteY property ([MS-OXPROPS] section 2.187) specifies the distance, in pixels, from the
    /// top edge of the screen that a user interface displays the note.
    var noteY: UInt32? {
        return getProperty(name: .lidNoteY)
    }
}
