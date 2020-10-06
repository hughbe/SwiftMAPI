//
//  MessageStorage+SMSMMSProperties.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import Foundation

/// [MS-OXOSMMS] 2.2 Message Syntax
/// Clients operate on SMS objects and MMS objects using the Message and Attachment Object Protocol,
/// as specified in [MS-OXCMSG].
/// Unless otherwise specified, SMS objects and MMS objects adhere to all property constraints specified
/// in [MS-OXPROPS] and [MS-OXCMSG]. SMS objects and MMS objects can also contain other properties,
/// but these properties have no impact on this protocol.
/// [MS-OXOSMMS] 2.2.1 Common SMS and MMS Object Properties
public extension MessageStorage {
    /// [MS-OXOSMMS] 2.2.1.1 PidNameOMSAccountGuid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameOMSAccountGuid property ([MS-OXPROPS] section 2.454) specifies the GUID of the
    /// SMS account used to deliver the message. The GUID is encoded as a string in the following format
    /// (including the braces), where X is any hexadecimal digit: "{XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXXXXXX}"; for example, "{C200E360-38C5-11CE-AE62-08002B2B79EF}".
    var omsAccountGuid: String? {
        return getProperty(name: .nameOMSAccountGuid)
    }

    /// [MS-OXOSMMS] 2.2.1.2 PidNameOMSScheduleTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidNameOMSScheduleTime property ([MS-OXPROPS] section 2.456) specifies the time, in
    /// Coordinated Universal Time (UTC), that the client sends the requests instructing the service
    /// provider to send the SMS or MMS message.
    var omsScheduleTime: Date? {
        return getProperty(name: .nameOMSScheduleTime)
    }
    
    /// [MS-OXOSMMS] 2.2.1.3 PidNameOMSServiceType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameOMSServiceType property ([MS-OXPROPS] section 2.457) indicates the type of service
    /// used to send the SMS or MMS message. The value of this property MUST be one of the values in the
    /// following table.
    var omsServiceType: OMSServiceType? {
        guard let rawValue: UInt32 = getProperty(name: .nameOMSServiceType) else {
            return nil
        }
        
        return OMSServiceType(rawValue: rawValue)
    }
    
    /// [MS-OXOSMMS] 2.2.1.4 PidNameOMSSourceType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameOMSSourceType property ([MS-OXPROPS] section 2.458) indicates the source of the
    /// SMS or MMS message. The value of this property MUST be one of the values in the following table.
    var omsSourceType: OMSSourceType? {
        guard let rawValue: UInt32 = getProperty(name: .nameOMSServiceType) else {
            return nil
        }
        
        return OMSSourceType(rawValue: rawValue)
    }
    
    /// [MS-OXOSMMS] 2.2.1.6 PidNameOMSMobileModel Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameOMSMobileModel property ([MS-OXPROPS] section 2.455) indicates the model of the
    /// mobile device used to send the SMS or MMS message.
    var omsMobileModel: String? {
        return getProperty(name: .nameOMSMobileModel)
    }
}
