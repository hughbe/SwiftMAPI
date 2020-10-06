//
//  OutlookMessageCommonlyUsedPropertySets.swift
//  
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import Foundation

/// [MS-OXPROPS] 1.3.2 Commonly Used Property Sets
/// Each named property specified in the list in section 2 is listed with the GUID that describes its
/// property set. Several of the more common property sets and their functional areas are described in
/// the following table.
public enum CommonlyUsedPropertySet {
    /// Area: Common
    case publicStrings
    
    /// Area: Common
    case common
    
    /// Area: Contact
    case address
    
    /// Area: Email
    case internetHeaders
    
    /// Area: Calendar
    case appointment
    
    /// Area: Calendar
    case meeting
    
    /// Area: Journal
    case log
    
    /// Area: Messaging
    case messaging
    
    /// Area: Sticky note
    case note
    
    /// Area: Rss feed
    case postRss
    
    /// Area: Task
    case task
    
    /// Area: Unified messaging
    case unifiedMessaging
    
    /// Area: Common
    case mapi
    
    /// Area: Sync
    case airSync
    
    /// Area: Sharing
    case sharing

    /// Area: Extracted entities
    case xmlExtractedEntities
    
    /// Area: Attachment
    case attachment
    
    case calendarAssistant
    
    public var uuid: UUID {
        switch self {
        case .publicStrings:
            return UUID(uuidString: "00020329-0000-0000-C000-000000000046")!
        case .common:
            return UUID(uuidString: "00062008-0000-0000-C000-000000000046")!
        case .address:
            return UUID(uuidString: "00062004-0000-0000-C000-000000000046")!
        case .internetHeaders:
            return UUID(uuidString: "00020386-0000-0000-C000-000000000046")!
        case .appointment:
            return UUID(uuidString: "00062002-0000-0000-C000-000000000046")!
        case .meeting:
            return UUID(uuidString: "6ED8DA90-450B-101B-98DA-00AA003F1305")!
        case .log:
            return UUID(uuidString: "0006200A-0000-0000-C000-000000000046")!
        case .messaging:
            return UUID(uuidString: "41F28F13-83F4-4114-A584-EEDB5A6B0BFF")!
        case .note:
            return UUID(uuidString: "0006200E-0000-0000-C000-000000000046")!
        case .postRss:
            return UUID(uuidString: "00062041-0000-0000-C000-000000000046")!
        case .task:
            return UUID(uuidString: "00062003-0000-0000-C000-000000000046")!
        case .unifiedMessaging:
            return UUID(uuidString: "4442858E-A9E3-4E80-B900-317A210CC15B")!
        case .mapi:
            return UUID(uuidString: "00020328-0000-0000-C000-000000000046")!
        case .airSync:
            return UUID(uuidString: "71035549-0739-4DCB-9163-00F0580DBBDF")!
        case .sharing:
            return UUID(uuidString: "00062040-0000-0000-C000-000000000046")!
        case .xmlExtractedEntities:
            return UUID(uuidString: "23239608-685D-4732-9C55-4C95CB4E8E33")!
        case .attachment:
            return UUID(uuidString: "96357F7F-59E1-47D0-99A7-46515C183B54")!
        case .calendarAssistant:
            return UUID(uuidString: "11000E07-B51B-40D6-AF21-CAA85EDAB1D0")!
        }
    }
}
