//
//  DeliveryPoint.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

/// Specifies the nature of the functional entity by means of which a message was or would have been delivered to the recipient.
/// This property can have exactly one of the following values:
/// The default value is MAPI_MH_DP_PRIVATE_UA, that is, a MAPI client.
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdeliverypoint-canonical-property
public enum DeliveryPoint: UInt32 {
    /// MAPI_MH_DP_PUBLIC_UA Delivered to a public user agent, or public service provider.
    case publicUA = 0
    
    /// MAPI_MH_DP_PRIVATE_UA Delivered to a private user agent (UA), such as a client in an in-house messaging system.
    case privateUA = 1
    
    /// MAPI_MH_DP_MS Delivered to a message store instead of directly to a recipient.
    case ms = 2
    
    /// MAPI_MH_DP_ML Delivered to a distribution list, a delivery point which in turn may distribute the message to many recipients.
    case ml = 3
    
    /// MAPI_MH_DP_PDAU Delivered to a physical delivery access unit, such as a human postal carrier.
    case pdau = 4
    
    /// MAPI_MH_DP_PDS_PATRON Delivered to a physical delivery system patron, such as a conventional postal mailbox.
    case pdsPatron = 5
    
    /// MAPI_MH_DP_OTHER_AU Delivered to an access unit (AU) other than a physical delivery access unit (PDAU), such as a FAX system.
    case otherAU = 6
}
