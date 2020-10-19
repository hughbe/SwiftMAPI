//
//  OutlookMessageCommonlyUsedPropertySets.swift
//  
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import Foundation

/// [MS-OXPROPS] 1.3.2 Commonly Used Property Sets
/// Each named property specified in the list in section 2 is listed with the GUID that describes its property set.
/// Several of the more common property sets and their functional areas are described in the following table.
public enum CommonlyUsedPropertySet: CustomStringConvertible {
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
    
    case remote
    
    public static let PS_PUBLIC_STRINGS = UUID(uuidString: "00020329-0000-0000-C000-000000000046")!
    
    public static let PSETID_Common = UUID(uuidString: "00062008-0000-0000-C000-000000000046")!
    
    public static let PSETID_Address = UUID(uuidString: "00062004-0000-0000-C000-000000000046")!
    
    public static let PS_INTERNET_HEADERS = UUID(uuidString: "00020386-0000-0000-C000-000000000046")!
    
    public static let PSETID_Appointment = UUID(uuidString: "00062002-0000-0000-C000-000000000046")!
    
    public static let PSETID_Meeting = UUID(uuidString: "6ED8DA90-450B-101B-98DA-00AA003F1305")!
    
    public static let PSETID_Log = UUID(uuidString: "0006200A-0000-0000-C000-000000000046")!

    public static let PSETID_Messaging = UUID(uuidString: "41F28F13-83F4-4114-A584-EEDB5A6B0BFF")!

    public static let PSETID_Note = UUID(uuidString: "0006200E-0000-0000-C000-000000000046")!

    public static let PSETID_PostRss = UUID(uuidString: "00062041-0000-0000-C000-000000000046")!

    public static let PSETID_Task = UUID(uuidString: "00062003-0000-0000-C000-000000000046")!

    public static let PSETID_UnifiedMessaging = UUID(uuidString: "4442858E-A9E3-4E80-B900-317A210CC15B")!

    public static let PS_MAPI = UUID(uuidString: "00020328-0000-0000-C000-000000000046")!
    
    public static let PSETID_AirSync = UUID(uuidString: "71035549-0739-4DCB-9163-00F0580DBBDF")!
    
    public static let PSETID_Sharing = UUID(uuidString: "00062040-0000-0000-C000-000000000046")!
    
    public static let PSETID_XmlExtractedEntities = UUID(uuidString: "23239608-685D-4732-9C55-4C95CB4E8E33")!
    
    public static let PSETID_Attachment = UUID(uuidString: "96357F7F-59E1-47D0-99A7-46515C183B54")!
    
    public static let PSETID_CalendarAssistant = UUID(uuidString: "11000E07-B51B-40D6-AF21-CAA85EDAB1D0")!
    
    public static let PSETID_Remote = UUID(uuidString: "00062014-0000-0000-C000-000000000046")!
    
    public init?(uuid: UUID) {
        switch uuid {
        case CommonlyUsedPropertySet.PS_PUBLIC_STRINGS:
            self = .publicStrings
        case CommonlyUsedPropertySet.PSETID_Common:
            self = .common
        case CommonlyUsedPropertySet.PSETID_Address:
            self = .address
        case CommonlyUsedPropertySet.PS_INTERNET_HEADERS:
            self = .internetHeaders
        case CommonlyUsedPropertySet.PSETID_Appointment:
            self = .appointment
        case CommonlyUsedPropertySet.PSETID_Meeting:
            self = .meeting
        case CommonlyUsedPropertySet.PSETID_Log:
            self = .log
        case CommonlyUsedPropertySet.PSETID_Messaging:
            self = .messaging
        case CommonlyUsedPropertySet.PSETID_Note:
            self = .note
        case CommonlyUsedPropertySet.PSETID_PostRss:
            self = .postRss
        case CommonlyUsedPropertySet.PSETID_Task:
            self = .task
        case CommonlyUsedPropertySet.PSETID_UnifiedMessaging:
            self = .unifiedMessaging
        case CommonlyUsedPropertySet.PS_MAPI:
            self = .mapi
        case CommonlyUsedPropertySet.PSETID_AirSync:
            self = .airSync
        case CommonlyUsedPropertySet.PSETID_Sharing:
            self = .sharing
        case CommonlyUsedPropertySet.PSETID_XmlExtractedEntities:
            self = .xmlExtractedEntities
        case CommonlyUsedPropertySet.PSETID_Attachment:
            self = .attachment
        case CommonlyUsedPropertySet.PSETID_CalendarAssistant:
            self = .calendarAssistant
        case CommonlyUsedPropertySet.PSETID_Remote:
            self = .remote
        default:
            return nil
        }
    }
    
    public var uuid: UUID {
        switch self {
        case .publicStrings:
            return CommonlyUsedPropertySet.PS_PUBLIC_STRINGS
        case .common:
            return CommonlyUsedPropertySet.PSETID_Common
        case .address:
            return CommonlyUsedPropertySet.PSETID_Address
        case .internetHeaders:
            return CommonlyUsedPropertySet.PS_INTERNET_HEADERS
        case .appointment:
            return CommonlyUsedPropertySet.PSETID_Appointment
        case .meeting:
            return CommonlyUsedPropertySet.PSETID_Meeting
        case .log:
            return CommonlyUsedPropertySet.PSETID_Log
        case .messaging:
            return CommonlyUsedPropertySet.PSETID_Messaging
        case .note:
            return CommonlyUsedPropertySet.PSETID_Note
        case .postRss:
            return CommonlyUsedPropertySet.PSETID_PostRss
        case .task:
            return CommonlyUsedPropertySet.PSETID_Task
        case .unifiedMessaging:
            return CommonlyUsedPropertySet.PSETID_UnifiedMessaging
        case .mapi:
            return CommonlyUsedPropertySet.PS_MAPI
        case .airSync:
            return CommonlyUsedPropertySet.PSETID_AirSync
        case .sharing:
            return CommonlyUsedPropertySet.PSETID_Sharing
        case .xmlExtractedEntities:
            return CommonlyUsedPropertySet.PSETID_XmlExtractedEntities
        case .attachment:
            return CommonlyUsedPropertySet.PSETID_Attachment
        case .calendarAssistant:
            return CommonlyUsedPropertySet.PSETID_CalendarAssistant
        case .remote:
            return CommonlyUsedPropertySet.PSETID_Remote
        }
    }
    
    public var description: String {
        switch self {
        case .publicStrings:
            return "PS_PUBLIC_STRINGS"
        case .common:
            return "PSETID_Common"
        case .address:
            return "PSETID_Address"
        case .internetHeaders:
            return "PS_INTERNET_HEADERS"
        case .appointment:
            return "PSETID_Appointment"
        case .meeting:
            return "PSETID_Meeting"
        case .log:
            return "PSETID_Log"
        case .messaging:
            return "PSETID_Messaging"
        case .note:
            return "PSETID_Note"
        case .postRss:
            return "PSETID_PostRss"
        case .task:
            return "PSETID_Task"
        case .unifiedMessaging:
            return "PSETID_UnifiedMessaging"
        case .mapi:
            return "PS_MAPI"
        case .airSync:
            return "PSETID_AirSync"
        case .sharing:
            return "PSETID_Sharing"
        case .xmlExtractedEntities:
            return "PSETID_XmlExtractedEntities"
        case .attachment:
            return "PSETID_Attachment"
        case .calendarAssistant:
            return "PSETID_CalendarAssistant"
        case .remote:
            return "PSETID_Remote"
        }
    }
}
