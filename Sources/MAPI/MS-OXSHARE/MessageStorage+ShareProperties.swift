//
//  MessageStorage+ShareProperties.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation

/// [MS-OXSHARE] 2.2 Message Syntax
/// A Sharing Message object can be created and modified by clients and servers. Except where noted,
/// this section defines constraints under which both clients and servers operate.
/// Clients operate on Sharing Message objects by using the Email Object Protocol specified in [MSOXOMSG] and the Message and Attachment Object Protocol specified in [MS-OXCMSG]. How a server
/// operates on Sharing Message objects is implementation-dependent, but the results of any such
/// operation MUST be exposed to clients in a manner that is consistent with the Sharing Message Object
/// Protocol.
/// Unless otherwise specified, a Sharing Message object adheres to all property constraints specified in
/// [MS-OXPROPS] and all property constraints specified in [MS-OXCMSG].
/// Where a property's value is specified as a hexadecimal string representation of a binary value, the
/// characters composing the string represent the hexadecimal digits that reflect the byte sequence of the
/// binary value. For example, the string "00000000DCA740C8" is the hexadecimal string representation
/// of the following byte sequence.
/// 00 00 00 00 DC A7 40 C8
/// Where a property's value is specified as a hexadecimal string representation of an integer value, the
/// characters composing the string represent the hexadecimal digits that reflect the integer value in bigendian format. Leading "0" characters are not included. For example, the hexadecimal string
/// representation of the integer 0x0000010B is "10B".
/// [MS-OXSHARE] 2.2.2 Common Sharing Message Object Properties
/// The properties specified in section 2.2.2.1 through section 2.2.2.17 are common to all types of
/// Sharing Message objects.
/// [MS-OXSHARE] 2.2.3 Sharing Invitation and Response Acceptance Properties
/// The properties specified in section 2.2.3.1 through section 2.2.3.8 apply only to a sharing invitation,
/// which is a Sharing Message object with its PidLidSharingFlavor property (section 2.2.2.5) set to
/// either 0x00020310 or 0x00000310, and to a sharing response acceptance, which is a Sharing
/// Message object with its PidLidSharingFlavor property set to 0x0023310. For all other types of
/// Sharing Message objects, these properties SHOULD NOT<7> be set and MUST be ignored upon
/// receipt.
/// [MS-OXSHARE] 2.2.4 Sharing Request Properties
/// The properties specified in sections 2.2.4.1 and 2.2.4.2 apply only to a sharing request to which the
/// user has responded. A sharing request has its PidLidSharingFlavor property (section 2.2.2.5) set to
/// either 0x00020500 or 0x00020710. For all other types of Sharing Message objects, the properties
/// specified in sections 2.2.4.1 and 2.2.4.2 MUST NOT be set.
public extension MessageStorage {
    /// [MS-OXSHARE] 2.2.2.1 PidLidSharingCapabilities Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingCapabilities property ([MS-OXPROPS] section 2.237) MUST be set to one of the
    /// following values.
    var sharingCapabilities: SharingCapabilities? {
        guard let rawValue: UInt32 = getProperty(name: .lidSharingCapabilities) else {
            return nil
        }
        
        return SharingCapabilities(rawValue: rawValue)
    }
    
    /// [MS-OXSHARE] 2.2.2.2 PidNameXSharingCapabilities Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingCapabilities property ([MS-OXPROPS] section 2.482) contains the
    /// hexadecimal string representation of the value of the PidLidSharingCapabilities property (section
    /// 2.2.2.1), as specified in the following table. The string does not include the leading zeros of the
    /// hexadecimal value.
    /// Hex value Value of the PidNameXSharingCapabilities property
    /// 0x00040290 "40290"
    /// 0x000402B0 "402B0"
    var xSharingCapabilities: String? {
        return getProperty(name: .nameXSharingCapabilities)
    }
    
    /// [MS-OXSHARE] 2.2.2.3 PidLidSharingConfigurationUrl Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingConfigurationUrl property ([MS-OXPROPS] section 2.238) MUST be set to a
    /// zero-length string.
    var sharingConfigurationUrl: String? {
        return getProperty(name: .lidSharingConfigurationUrl)
    }
    
    /// [MS-OXSHARE] 2.2.2.4 PidNameXSharingConfigUrl Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingConfigUrl property ([MS-OXPROPS] section 2.483) MUST be set to the same
    /// value as the PidLidSharingConfigurationUrl property (section 2.2.2.3).
    var xSharingConfigUrl: String? {
        return getProperty(name: .nameXSharingConfigUrl)
    }
    
    /// [MS-OXSHARE] 2.2.2.5 PidLidSharingFlavor Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingFlavor property ([MS-OXPROPS] section 2.245) specifies the type of Sharing
    /// Message object. This property MUST be set to one of the following values.
    var sharingFlavor: SharingFlavor? {
        guard let rawValue: UInt32 = getProperty(name: .lidSharingFlavor) else {
            return nil
        }
        
        return SharingFlavor(rawValue: rawValue)
    }
    
    /// [MS-OXSHARE] 2.2.2.6 PidNameXSharingFlavor Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingFlavor property ([MS-OXPROPS] section 2.485) MUST be set to the
    /// hexadecimal string representation of the value of the PidLidSharingFlavor property (section
    /// 2.2.2.5), as specified in the following table. The string does not include the leading zeros of the
    /// hexadecimal value.
    /// Hex value Value of the PidNameXSharingFlavor property
    /// 0x00020310 "20310"
    /// 0x00000310 "310"
    /// 0x00020500 "20500"
    /// 0x00020710 "20710"
    /// 0x00025100 "25100"
    /// 0x00023310 "23310"
    var xSharingFlavor: String? {
        return getProperty(name: .nameXSharingFlavor)
    }
    
    /// [MS-OXSHARE] 2.2.2.7 PidLidSharingInitiatorEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingInitiatorEntryId property ([MS-OXPROPS] section 2.248) MUST be set to the
    /// value of the PidTagEntryId property ([MS-OXOABK] section 2.2.3.2) for the Address Book object
    /// of the currently logged on user.
    var sharingInitiatorEntryId: Data? {
        return getProperty(name: .lidSharingInitiatorEntryId)
    }
    
    /// [MS-OXSHARE] 2.2.2.8 PidLidSharingInitiatorName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingInitiatorName property ([MS-OXPROPS] section 2.249) MUST be set to the value
    /// of the PidTagDisplayName property ([MS-OXOABK] section 2.2.3.1) from the Address Book
    /// object that is identified by the PidLidSharingInitiatorEntryId property (section 2.2.2.7) and
    /// MAY<1> be ignored upon receipt.
    var sharingInitiatorName: String? {
        return getProperty(name: .lidSharingInitiatorName)
    }
    
    /// [MS-OXSHARE] 2.2.2.9 PidLidSharingInitiatorSmtp Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingInitiatorSmtp property ([MS-OXPROPS] section 2.250) MUST be set to the value
    /// of the PidTagSmtpAddress property ([MS-OXOABK] section 2.2.3.21) from the Address Book
    /// object that is identified by the PidLidSharingInitiatorEntryId property (section 2.2.2.7) and
    /// MAY<2> be ignored upon receipt.
    var sharingInitiatorSmtp: String? {
        return getProperty(name: .lidSharingInitiatorSmtp)
    }
    
    /// [MS-OXSHARE] 2.2.2.10 PidLidSharingLocalType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingLocalType property ([MS-OXPROPS] section 2.259) MUST be set to the value of
    /// the PidTagContainerClass property ([MS-OXCFOLD] section 2.2.2.2.2.3) of the folder that is to be
    /// shared. For a sharing response, the PidLidSharingLocalType property is set to the value of the
    /// PidLidSharingLocalType property of the associated sharing request.
    /// The valid values are listed in the following table. These values specify folder types. For details about
    /// these folder types, see ([MS-OXOSFLD] section 2.2.1.
    /// Type of folder Value
    /// Calendar "IPF.Appointment"
    /// Contacts "IPF.Contact"
    /// Tasks "IPF.Task"
    /// Notes "IPF.StickyNote"
    /// Journal "IPF.Journal"
    var sharingLocalType: String? {
        return getProperty(name: .lidSharingLocalType)
    }
    
    /// [MS-OXSHARE] 2.2.2.11 PidNameXSharingLocalType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingLocalType property ([MS-OXPROPS] section 2.487) MUST be set to the same
    /// value as the PidLidSharingLocalType property (section 2.2.2.10).
    var xSharingLocalType: String? {
        return getProperty(name: .nameXSharingLocalType)
    }
    
    /// [MS-OXSHARE] 2.2.2.12 PidLidSharingProviderGuid Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingProviderGuid property ([MS-OXPROPS] section 2.266) MUST be set to
    /// %xAE.F0.06.00.00.00.00.00.C0.00.00.00.00.00.00.46.
    var sharingProviderGuid: UUID? {
        if let uuid: UUID = getProperty(name: .lidSharingProviderGuid) {
            return uuid
        }
        
        guard let data: Data = getProperty(name: .lidSharingProviderGuid) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.read(type: UUID.self)
    }
    
    /// [MS-OXSHARE] 2.2.2.13 PidNameXSharingProviderGuid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingProviderGuid property ([MS-OXPROPS] section 2.488) MUST be set to the
    /// hexadecimal string representation of the value of the PidLidSharingProviderGuid property (section
    /// 2.2.2.12). That is, "AEF0060000000000C000000000000046".
    var xSharingProviderGuid: String? {
        return getProperty(name: .nameXSharingProviderGuid)
    }
    
    /// [MS-OXSHARE] 2.2.2.14 PidLidSharingProviderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingProviderName property ([MS-OXPROPS] section 2.267) specifies a userdisplayable name of the sharing provider that is identified by the PidLidSharingProviderGuid
    /// property (section 2.2.2.12). This property MAY<3> be ignored upon receipt.
    var sharingProviderName: String? {
        return getProperty(name: .lidSharingProviderName)
    }
    
    /// [MS-OXSHARE] 2.2.2.15 PidNameXSharingProviderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingProviderName property ([MS-OXPROPS] section 2.489) MUST be set to the
    /// same value as PidLidSharingProviderName (section 2.2.2.14) and MAY<4> be ignored upon
    /// receipt.
    var xSharingProviderName: String? {
        return getProperty(name: .nameXSharingProviderName)
    }
    
    /// [MS-OXSHARE] 2.2.2.16 PidLidSharingProviderUrl Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingProviderUrl property ([MS-OXPROPS] section 2.268) specifies a Uniform
    /// Resource Locator (URL) for the sharing provider that is identified by the
    /// PidLidSharingProviderGuid property (section 2.2.2.12). This property MAY<5> be ignored upon
    /// receipt.
    var sharingProviderUrl: String? {
        return getProperty(name: .lidSharingProviderUrl)
    }
    
    /// [MS-OXSHARE] 2.2.2.17 PidNameXSharingProviderUrl Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingProviderUrl property ([MS-OXPROPS] section 2.490) MUST be set to the
    /// same value as the PidLidSharingProviderUrl property (section 2.2.2.16) and MAY<6> be ignored
    /// upon receipt.
    var xSharingProviderUrl: String? {
        return getProperty(name: .nameXSharingProviderUrl)
    }
    
    /// [MS-OXSHARE] 2.2.3.1 PidLidSharingRemoteName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingRemoteName property ([MS-OXPROPS] section 2.277) MUST be set to the value
    /// of the PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) of the folder that is being
    /// shared.
    var sharingRemoteName: String? {
        return getProperty(name: .lidSharingRemoteName)
    }
    
    /// [MS-OXSHARE] 2.2.3.2 PidNameXSharingRemoteName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingRemoteName property ([MS-OXPROPS] section 2.491) MUST be set to the
    /// same value as the PidLidSharingRemoteName property (section 2.2.3.1).
    var xSharingRemoteName: String? {
        return getProperty(name: .nameXSharingRemoteName)
    }
    
    /// [MS-OXSHARE] 2.2.3.3 PidLidSharingRemoteStoreUid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingRemoteStoreUid property ([MS-OXPROPS] section 2.280) MUST be set to the
    /// hexadecimal string representation of the value of the PidTagStoreEntryId property ([MS-OXPROPS]
    /// section 2.1022) of the folder that is being shared.
    var sharingRemoteStoreUid: String? {
        return getProperty(name: .lidSharingRemoteStoreUid)
    }
    
    /// [MS-OXSHARE] 2.2.3.4 PidNameXSharingRemoteStoreUid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingRemoteStoreUid property ([MS-OXPROPS] section 2.493) MUST be set to
    /// the same value as PidLidSharingRemoteStoreUid (section 2.2.3.3).
    var xSharingRemoteStoreUid: String? {
        return getProperty(name: .nameXSharingRemoteStoreUid)
    }
    
    /// [MS-OXSHARE] 2.2.3.5 PidLidSharingRemoteType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingRemoteType property ([MS-OXPROPS] section 2.281) MUST be set to the same
    /// value as the PidLidSharingLocalType property (section 2.2.2.10) and MAY<8> be ignored upon
    /// receipt.
    var sharingRemoteType: String? {
        return getProperty(name: .lidSharingRemoteType)
    }
    
    ///[MS-OXSHARE] 2.2.3.6 PidNameXSharingRemoteType Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingRemoteType property ([MS-OXPROPS] section 2.494) MUST be set to the
    /// same value as PidLidSharingRemoteType (section 2.2.3.5) and MAY<9> be ignored.
    var xSharingRemoteType: String? {
        return getProperty(name: .nameXSharingRemoteType)
    }
    
    /// [MS-OXSHARE] 2.2.3.7 PidLidSharingRemoteUid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingRemoteUid property ([MS-OXPROPS] section 2.282) MUST be set to the
    /// hexadecimal string representation of the value of the PidTagEntryId property ([MS-OXCPERM]
    /// section 2.2.4) of the folder that is being shared.
    var sharingRemoteUid: String? {
        return getProperty(name: .lidSharingRemoteUid)
    }
    
    /// [MS-OXSHARE] 2.2.3.8 PidNameXSharingRemoteUid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXSharingRemoteUid property ([MS-OXPROPS] section 2.495) MUST be set to the
    /// same value as the PidLidSharingRemoteUid property (section 2.2.3.7).
    var xSharingRemoteUid: String? {
        return getProperty(name: .nameXSharingRemoteUid)
    }
    
    /// [MS-OXSHARE] 2.2.4.1 PidLidSharingResponseTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingResponseTime property ([MS-OXPROPS] section 2.285) specifies the time at
    /// which the recipient of the sharing request sent a sharing response.
    var sharingResponseTime: Date? {
        return getProperty(name: .lidSharingResponseTime)
    }
    
    /// [MS-OXSHARE] 2.2.4.2 PidLidSharingResponseType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidSharingResponseType property ([MS-OXPROPS] section 2.286) specifies the type of
    /// sharing response with which the recipient of the sharing request responded. This property MUST
    /// be set to one of the following values.
    var sharingResponseType: SharingResponseType? {
        guard let rawValue: UInt32 = getProperty(name: .lidSharingResponseType) else {
            return nil
        }
        
        return SharingResponseType(rawValue: rawValue)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingAnonymity ([MS-OXPROPS] section 2.234)
    var sharingAnonymity: UInt32? {
        return getProperty(name: .lidSharingAnonymity)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingBindingEntryId ([MS-OXPROPS] section 2.235)
    var sharingBindingEntryId: Data? {
        return getProperty(name: .lidSharingBindingEntryId)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingBrowseUrl ([MS-OXPROPS] section 2.236)
    var sharingBrowseUrl: String? {
        return getProperty(name: .lidSharingBrowseUrl)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidNameXSharingBrowseUrl ([MS-OXPROPS] section 2.481)
    var xSharingBrowseUrl: String? {
        return getProperty(name: .nameXSharingBrowseUrl)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingDataRangeEnd ([MS-OXPROPS] section 2.239)
    var sharingDataRangeEnd: Date? {
        return getProperty(name: .lidSharingDataRangeEnd)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingDataRangeStart ([MS-OXPROPS] section 2.240)
    var sharingDataRangeStart: Date? {
        return getProperty(name: .lidSharingDataRangeStart)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingDetail ([MS-OXPROPS] section 2.241)
    var sharingDetail: String? {
        return getProperty(name: .lidSharingDetail)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingExtensionXml ([MS-OXPROPS] section 2.242)
    var sharingExtensionXml: String? {
        return getProperty(name: .lidSharingExtensionXml)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidNameXSharingExendedCaps ([MS-OXPROPS] section 2.484)
    var xSharingExendedCaps: String? {
        return getProperty(name: .nameXSharingExendedCaps)
    }

    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingFilter ([MS-OXPROPS] section 2.243)
    var sharingFilter: String? {
        return getProperty(name: .lidSharingFilter)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingFlags ([MS-OXPROPS] section 2.244)
    var sharingFlags: UInt16? {
        return getProperty(name: .lidSharingFlags)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingFolderEntryId ([MS-OXPROPS] section 2.246)
    var sharingFolderEntryId: Data? {
        return getProperty(name: .lidSharingFolderEntryId)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingIndexEntryId ([MS-OXPROPS] section 2.247)
    var sharingIndexEntryId: Data? {
        return getProperty(name: .lidSharingIndexEntryId)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingInstanceGuid ([MS-OXPROPS] section 2.251)
    var sharingInstanceGuid: Data? {
        return getProperty(name: .lidSharingInstanceGuid)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidNameXSharingInstanceGuid ([MS-OXPROPS] section 2.486)
    var xSharingInstanceGuid: String? {
        return getProperty(name: .nameXSharingInstanceGuid)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLastAutoSyncTime ([MS-OXPROPS] section 2.252)
    var sharingLastAutoSyncTime: Date? {
        return getProperty(name: .lidSharingLastAutoSyncTime)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLastSyncTime ([MS-OXPROPS] section 2.253)
    var sharingLastSyncTime: Date? {
        return getProperty(name: .lidSharingLastSyncTime)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLocalComment ([MS-OXPROPS] section 2.254)
    var sharingLocalComment: String? {
        return getProperty(name: .lidSharingLocalComment)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLocalLastModificationTime ([MS-OXPROPS] section 2.255)
    var sharingLocalLastModificationTime: Date? {
        return getProperty(name: .lidSharingLocalLastModificationTime)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLocalName ([MS-OXPROPS] section 2.256)
    var sharingLocalName: String? {
        return getProperty(name: .lidSharingLocalName)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLocalPath ([MS-OXPROPS] section 2.257)
    var sharingLocalPath: String? {
        return getProperty(name: .lidSharingLocalPath)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLocalStoreUid ([MS-OXPROPS] section 2.258)
    var sharingLocalStoreUid: String? {
        return getProperty(name: .lidSharingLocalStoreUid)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingLocalUid ([MS-OXPROPS] section 2.260)
    var sharingLocalUid: String? {
        return getProperty(name: .lidSharingLocalUid)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingOriginalMessageEntryId ([MS-OXPROPS] section 2.261)
    var sharingOriginalMessageEntryId: Data? {
        return getProperty(name: .lidSharingOriginalMessageEntryId)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingParentBindingEntryId ([MS-OXPROPS] section 2.262)
    var sharingParentBindingEntryId: Data? {
        return getProperty(name: .lidSharingParentBindingEntryId)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingParticipants ([MS-OXPROPS] section 2.263)
    var sharingParticipants: String? {
        return getProperty(name: .lidSharingParticipants)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingPermissions ([MS-OXPROPS] section 2.264)
    var sharingPermissions: UInt32? {
        return getProperty(name: .lidSharingPermissions)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingProviderExtension ([MS-OXPROPS] section 2.265)
    var sharingProviderExtension: String? {
        return getProperty(name: .lidSharingProviderExtension)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRangeEnd ([MS-OXPROPS] section 2.269)
    var sharingRangeEnd: UInt32? {
        return getProperty(name: .lidSharingRangeEnd)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRangeStart ([MS-OXPROPS] section 2.270)
    var sharingRangeStart: UInt32? {
        return getProperty(name: .lidSharingRangeStart)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingReciprocation ([MS-OXPROPS] section 2.271)
    var sharingReciprocation: UInt32? {
        return getProperty(name: .lidSharingReciprocation)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteByteSize ([MS-OXPROPS] section 2.272)
    var sharingRemoteByteSize: UInt32? {
        return getProperty(name: .lidSharingRemoteByteSize)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteComment ([MS-OXPROPS] section 2.273)
    var sharingRemoteComment: String? {
        return getProperty(name: .lidSharingRemoteComment)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteCrc ([MS-OXPROPS] section 2.274)
    var sharingRemoteCrc: UInt32? {
        return getProperty(name: .lidSharingRemoteCrc)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteLastModificationTime ([MS-OXPROPS] section 2.275)
    var sharingRemoteLastModificationTime: Date? {
        return getProperty(name: .lidSharingRemoteLastModificationTime)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteMessageCount ([MS-OXPROPS] section 2.276)
    var sharingRemoteMessageCount: UInt32? {
        return getProperty(name: .lidSharingRemoteMessageCount)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemotePass ([MS-OXPROPS] section 2.278)
    var sharingRemotePass: String? {
        return getProperty(name: .lidSharingRemotePass)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemotePath ([MS-OXPROPS] section 2.279)
    var sharingRemotePath: String? {
        return getProperty(name: .lidSharingRemotePath)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidNameXSharingRemotePath ([MS-OXPROPS] section 2.492)
    var xSharingRemotePath: String? {
        return getProperty(name: .nameXSharingRemotePath)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteUser ([MS-OXPROPS] section 2.283)
    var sharingRemoteUser: String? {
        return getProperty(name: .lidSharingRemoteUser)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRemoteVersion ([MS-OXPROPS] section 2.284)
    var sharingRemoteVersion: String? {
        return getProperty(name: .lidSharingRemoteVersion)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingRoamLog ([MS-OXPROPS] section 2.287)
    var sharingRoamLog: UInt32? {
        return getProperty(name: .lidSharingRoamLog)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingStart ([MS-OXPROPS] section 2.288)
    var sharingStart: Date? {
        return getProperty(name: .lidSharingStart)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingStatus ([MS-OXPROPS] section 2.289)
    var sharingStatus: UInt32? {
        return getProperty(name: .lidSharingStatus)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingStop ([MS-OXPROPS] section 2.290)
    var sharingStop: Date? {
        return getProperty(name: .lidSharingStop)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingSyncFlags ([MS-OXPROPS] section 2.291)
    var sharingSyncFlags: UInt32? {
        return getProperty(name: .lidSharingSyncFlags)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingSyncInterval ([MS-OXPROPS] section 2.292)
    var sharingSyncInterval: UInt32? {
        return getProperty(name: .lidSharingSyncInterval)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingTimeToLive ([MS-OXPROPS] section 2.293)
    var sharingTimeToLive: UInt32? {
        return getProperty(name: .lidSharingTimeToLive)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingTimeToLiveAuto ([MS-OXPROPS] section 2.294)
    var sharingTimeToLiveAuto: UInt32? {
        return getProperty(name: .lidSharingTimeToLiveAuto)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingWorkingHoursDays ([MS-OXPROPS] section 2.295)
    var sharingWorkingHoursDays: UInt32? {
        return getProperty(name: .lidSharingWorkingHoursDays)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingWorkingHoursEnd ([MS-OXPROPS] section 2.296)
    var sharingWorkingHoursEnd: Date? {
        return getProperty(name: .lidSharingWorkingHoursEnd)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingWorkingHoursStart ([MS-OXPROPS] section 2.297)
    var sharingWorkingHoursStart: Date? {
        return getProperty(name: .lidSharingWorkingHoursStart)
    }
    
    /// [MS-OXSHARE] 2.2.6 Ignored Properties
    /// The following properties SHOULD NOT<10> be set and MUST be ignored upon receipt:
    ///  PidLidSharingWorkingHoursTimeZone ([MS-OXPROPS] section 2.298)
    var sharingWorkingHoursTimeZone: Data? {
        return getProperty(name: .lidSharingWorkingHoursTimeZone)
    }
}
