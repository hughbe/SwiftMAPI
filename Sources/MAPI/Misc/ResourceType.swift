//
//  ResourceType.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

/// Contains a value that indicates the service provider type.
/// This property can have exactly one of the following values:
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourcetype-canonical-property
public enum ResourceType: UInt32 {
    /// MAPI_STORE_PROVIDER Message store provider
    case storeProvider = 33

    /// MAPI_AB Address book
    case ab = 34

    /// MAPI_AB_PROVIDER Address book provider
    case abProvider = 35
    
    /// MAPI_TRANSPORT_PROVIDER Transport provider
    case transportProvider = 36

    /// MAPI_SPOOLER Message spooler
    case spooler = 37
    
    /// MAPI_PROFILE_PROVIDER Profile provider
    case profileProvider = 38
    
    /// MAPI_SUBSYSTEM Internal MAPI subsystem
    case subsystem = 39
    
    /// MAPI_HOOK_PROVIDER Spooler hook provider
    case hookProvider = 40
}
