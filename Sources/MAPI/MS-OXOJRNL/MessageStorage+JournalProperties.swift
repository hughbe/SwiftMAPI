//
//  MessageStorage+JournalProperties.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import Foundation

/// [MS-OXOJRNL] 2.2 Message Syntax
/// A Journal object can be created and modified by clients and servers. Except where noted, this
/// section defines constraints under which both clients and servers operate.
/// Clients operate on a Journal object by using the Message and Attachment Object Protocol, as specified
/// in [MS-OXCMSG]. How a server operates on a Journal object is implementation-dependent, but the
/// results of any such operations MUST be exposed to clients in a manner that is consistent with the
/// Journal Object Protocol.
/// Unless otherwise specified, a Journal object adheres to all property constraints specified in [MSOXPROPS] and [MS-OXCMSG].
public extension MessageStorage {
    /// [MS-OXOJRNL] 2.2.1.1 PidLidLogType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogType property ([MS-OXPROPS] section 2.168) specifies the name of the activity that is
    /// being recorded.
    var logType: String? {
        return getProperty(name: .lidLogType)
    }

    /// [MS-OXOJRNL] 2.2.1.2 PidLidLogTypeDesc Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogTypeDesc property ([MS-OXPROPS] section 2.169) describes the activity that is being
    /// recorded.
    var logTypeDesc: String? {
        return getProperty(name: .lidLogTypeDesc)
    }

    /// [MS-OXOJRNL] 2.2.1.3 PidLidLogStart Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogStart property ([MS-OXPROPS] section 2.167) specifies the time, in Coordinated
    /// Universal Time (UTC), at which the activity began. The value of this property MUST be equal to the
    /// value of the PidLidCommonStart property ([MS-OXCMSG] section 2.2.1.18).
    var logStart: Date? {
        return getProperty(name: .lidLogStart)
    }
    
    /// [MS-OXOJRNL] 2.2.1.4 PidLidLogEnd Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogEnd property ([MS-OXPROPS] section 2.165) specifies the time, in UTC, at which the
    /// activity ended. The value of this property MUST be equal to the value of the PidLidCommonEnd
    /// property ([MS-OXCMSG] section 2.2.1.19) and therefore greater than or equal to the PidLidLogStart
    /// property (section 2.2.1.3).
    var logEnd: Date? {
        return getProperty(name: .lidLogEnd)
    }
    
    /// [MS-OXOJRNL] 2.2.1.5 PidLidLogDuration Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogDuration property ([MS-OXPROPS] section 2.164) specifies the duration, in minutes,
    /// of the activity. The value of this property is the difference between the values of the PidLidLogEnd
    /// (section 2.2.1.4) and PidLidLogStart (section 2.2.1.3) properties.
    var logDuration: UInt32? {
        return getProperty(name: .lidLogDuration)
    }
    
    /// [MS-OXOJRNL] 2.2.1.6 PidLidLogFlags Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogFlags property ([MS-OXPROPS] section 2.166) contains bits that specify whether the
    /// Journal object has a journal-associated attachment. This property MUST be set to one of the values
    /// in the following table.
    var logFlags: LogFlags? {
        guard let rawValue: UInt32 = getProperty(name: .lidLogFlags) else {
            return nil
        }
        
        return LogFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOJRNL] 2.2.1.7 PidLidLogDocumentPrinted Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogDocumentPrinted property ([MS-OXPROPS] section 2.161) indicates whether the file,
    /// on which activity is being tracked, was printed during the tracking of the activity.<1> If printing
    /// occurred, this property is set to 0x01.
    var logDocumentPrinted: Bool? {
        return getProperty(name: .lidLogDocumentPrinted)
    }
    
    /// [MS-OXOJRNL] 2.2.1.8 PidLidLogDocumentSaved Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogDocumentSaved property ([MS-OXPROPS] section 2.163) indicates whether the file,
    /// on which activity is being tracked, was saved during the tracking of the activity.<2> If the document
    /// was saved, this property is set to 0x01.
    var logDocumentSaved: Bool? {
        return getProperty(name: .lidLogDocumentSaved)
    }
    
    /// [MS-OXOJRNL] 2.2.1.9 PidLidLogDocumentRouted Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogDocumentRouted property ([MS-OXPROPS] section 2.162) indicates whether the file,
    /// on which activity is being tracked, was sent to a recipient during the tracking of the activity.<3> If
    /// the document was sent, this property is set to 0x01.
    var logDocumentRouted: Bool? {
        return getProperty(name: .lidLogDocumentRouted)
    }
    
    /// [MS-OXOJRNL] 2.2.1.10 PidLidLogDocumentPosted Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidLogDocumentPosted property ([MS-OXPROPS] section 2.160) indicates whether the file,
    /// on which activity is being tracked, was sent by e-mail or posted to a server's folder during the tracking
    /// of the activity.<4> If the document was posted, this property is set to 0x01. If the document was sent
    /// by e-mail, it is set to 0x00.
    var logDocumentPosted: Bool? {
        return getProperty(name: .lidLogDocumentPosted)
    }
    /// [MS-OXOJRNL] 2.2.2.4 PidLidCompanies Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidCompanies property ([MS-OXPROPS] section 2.64) contains a list of company names,
    /// each of which is associated with a contact that is specified in the PidLidContacts property ([MSOXCMSG] section 2.2.1.57.2).
    var companies: [String]? {
        return getProperty(name: .lidCompanies)
    }
}
