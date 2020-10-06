//
//  MessageStorage+ICalendarProperties.swift
//
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import Foundation

/// [MS-OXCICAL] 2.1.3.4 Calendar Object Properties
/// This algorithm specifies the following additional properties for Calendar objects.
///  PidLidInboundICalStream (section 2.1.3.4.1)
///  PidLidSingleBodyICal (section 2.1.3.4.2)
///  PidNameLocationUrl (section 2.1.3.4.3)
public extension MessageStorage {
    /// [MS-OXCICAL] 2.1.3.4.1 PidLidInboundICalStream
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidInboundICalStream property ([MS-OXPROPS] section 2.148) is an optional property on
    /// Calendar objects that were converted from MIME messages. It contains the contents of the
    /// iCalendar MIME part of the original MIME message.
    var inboundICalStream: Data? {
        return getProperty(name: .lidInboundICalStream)
    }

    /// [MS-OXCICAL] 2.1.3.4.2 PidLidSingleBodyICal
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSingleBodyICal property ([MS-OXPROPS] section 2.300) is an optional property on
    /// Calendar objects that were converted from MIME messages. A value of TRUE indicates that the
    /// original MIME message contained a single MIME part.
    var singleBodyICal: Bool? {
        return getProperty(name: .lidSingleBodyICal)
    }

    /// [MS-OXCICAL] 2.1.3.4.3 PidNameLocationUrl
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameLocationUrl property ([MS-OXPROPS] section 2.453) is an optional property on
    /// Calendar objects. It contains a URL where attendees can access location information in HTML
    /// format.
    var locationUrl: String? {
        return getProperty(name: .nameLocationUrl)
    }
}
