//
//  OutlookMessageCommonlyUsedPropertySets.swift
//
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import WindowsDataTypes

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
    
    public static let PS_PUBLIC_STRINGS = GUID(0x00020329, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PSETID_Common = GUID(0x00062008, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PSETID_Address = GUID(0x00062004, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PS_INTERNET_HEADERS = GUID(0x00020386, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PSETID_Appointment = GUID(0x00062002, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PSETID_Meeting = GUID(0x6ED8DA90, 0x450B, 0x101B, 0x98DA, 0x00AA003F1305)
    
    public static let PSETID_Log = GUID(0x0006200A, 0x0000, 0x0000, 0xC000, 0x000000000046)

    public static let PSETID_Messaging = GUID(0x41F28F13, 0x83F4, 0x4114, 0xA584, 0xEEDB5A6B0BFF)

    public static let PSETID_Note = GUID(0x0006200E, 0x0000, 0x0000, 0xC000, 0x000000000046)

    public static let PSETID_PostRss = GUID(0x00062041, 0x0000, 0x0000, 0xC000, 0x000000000046)

    public static let PSETID_Task = GUID(0x00062003, 0x0000, 0x0000, 0xC000, 0x000000000046)

    public static let PSETID_UnifiedMessaging = GUID(0x4442858E, 0xA9E3, 0x4E80, 0xB900, 0x317A210CC15B)

    public static let PS_MAPI = GUID(0x00020328, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PSETID_AirSync = GUID(0x71035549, 0x0739, 0x4DCB, 0x9163, 0x00F0580DBBDF)
    
    public static let PSETID_Sharing = GUID(0x00062040, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public static let PSETID_XmlExtractedEntities = GUID(0x23239608, 0x685D, 0x4732, 0x9C55, 0x4C95CB4E8E33)
    
    public static let PSETID_Attachment = GUID(0x96357F7F, 0x59E1, 0x47D0, 0x99A7, 0x46515C183B54)
    
    public static let PSETID_CalendarAssistant = GUID(0x11000E07, 0xB51B, 0x40D6, 0xAF21, 0xCAA85EDAB1D0)
    
    public static let PSETID_Remote = GUID(0x00062014, 0x0000, 0x0000, 0xC000, 0x000000000046)
    
    public init?(guid: GUID) {
        switch guid {
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
    
    public var guid: GUID {
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
