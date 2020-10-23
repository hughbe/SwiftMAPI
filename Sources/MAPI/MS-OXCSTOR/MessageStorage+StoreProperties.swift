//
//  MessageStorage+StoreProperties.swift
//  
//
//  Created by Hugh Bellamy on 01/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCSTOR] 2.2.2 Logon-Specific Properties
/// The following properties are available on Logon objects. A Logon object is obtained by issuing a
/// RopLogon request (section 2.2.1.1.1), and receiving a successful response. Some logon properties
/// are read-only. Some logon properties are write-only. Some properties can be deleted by the client.
/// Some properties are available only on public folder logons. Some properties are available only on
/// private mailbox logons.
/// To read any of the readable properties, the client issues a RopGetPropertiesSpecific ROP with the
/// Logon object obtained from a successful invocation of RopLogon (section 2.2.1.1). To write any of
/// the writable properties, the client issues a RopSetProperties ROP with the Logon object obtained
/// from a successful invocation of RopLogon. To delete any of the deletable properties, the client issues
/// RopDeleteProperties with the Logon object obtained from a successful invocation of RopLogon. For
/// more details about RopSetProperties, RopGetPropertiesSpecific, or RopDeleteProperties see
/// [MS-OXCROPS] and [MS-OXCPRPT].
/// [MS-OXCSTOR] 2.2.2.1.1 Read-Only Properties
/// The read-only properties that are available on a private mailbox logon are specified in section
/// 2.2.2.1.1.1 through section 2.2.2.1.1.15.
/// [MS-OXCSTOR] .2.2.1.2 Read/Write Properties
/// The read/write properties that are available on a private mailbox logon are specified in section
/// 2.2.2.1.2.1 through section 2.2.2.1.2.5.
/// [MS-OXCSTOR] 2.2.2.2 Public Folders Logon Properties
/// The properties that are available on a public folders logon are specified in section 2.2.2.2.1 and
/// section 2.2.2.2.2. These properties are read only.
public extension MessageStorage {
    /// [MS-OXCSTOR] 2.2.2.1.1.1 PidTagExtendedRuleSizeLimit Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagExtendedRuleSizeLimit property ([MS-OXPROPS] section 2.688) contains the Maximum
    /// size, in bytes, the user is allowed to accumulate for a single "extended" rule. For details of extended
    /// rules, see [MS-OXORULE] section 2.2.4.
    var extendedRuleSizeLimit: UInt32? {
        return getProperty(id: .tagExtendedRuleSizeLimit)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.2 PidTagMaximumSubmitMessageSize Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMaximumSubmitMessageSize property ([MS-OXPROPS] section 2.775) contains the
    /// maximum size, in kilobytes, of a message a user is allowed to submit for transmission to another user.
    /// An unset value or a value of -1 indicates that there is no limit.
    var maximumSubmitMessageSize: Int32? {
        return getProperty(id: .tagMaximumSubmitMessageSize)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.3 PidTagProhibitReceiveQuota Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagProhibitReceiveQuota property ([MS-OXPROPS] section 2.868) contains the maximum
    /// size, in kilobytes, a user is allowed to accumulate in their mailbox, before no further mail will be
    /// delivered. An unset value or a value of -1 indicates that there is no limit.
    var prohibitReceiveQuota: Int32? {
        return getProperty(id: .tagProhibitReceiveQuota)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.4 PidTagProhibitSendQuota Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagProhibitSendQuota property ([MS-OXPROPS] section 2.869) contains the maximum size,
    /// in kilobytes, a user is allowed to accumulate in their mailbox, before the user can no longer submit
    /// any more mail. An unset value or a value of -1 indicates that there is no limit.
    var prohibitSendQuota: Int32? {
        return getProperty(id: .tagProhibitSendQuota)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.5 PidTagStoreState Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagStoreState property ([MS-OXPROPS] section 2.1023) indicates whether the mailbox has
    /// any active search folders. The value 0x00000000 indicates that the mailbox does not have active
    /// search folders. The value 0x01000000 indicates that one or more active search folders have been
    /// created.
    var storeState: UInt32? {
        return getProperty(id: .tagStoreState)
    }

    /// [MS-OXCSTOR] 2.2.2.1.1.7 PidTagMailboxOwnerEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMailboxOwnerEntryId property ([MS-OXPROPS] section 2.771) contains the EntryID in
    /// the Global Address List (GAL) of the owner of the mailbox.
    var mailboxOwnerEntryId: Data? {
        return getProperty(id: .tagMailboxOwnerEntryId)
    }

    /// [MS-OXCSTOR] 2.2.2.1.1.8 PidTagMailboxOwnerName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMailboxOwnerName property ([MS-OXPROPS] section 2.772) contains the display name
    /// of the owner of the mailbox.
    var mailboxOwnerName: String? {
        return getProperty(id: .tagMailboxOwnerName)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.11 PidTagUserEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagUserEntryId property ([MS-OXPROPS] section 2.1047) contains the Address book
    /// EntryID of the user logged on to the mailbox.
    /// [MS-OXCSTOR] 2.2.2.2.1 PidTagUserEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagUserEntryId property ([MS-OXPROPS] section 2.1047) contains the Address book
    /// EntryID of the user logged on to the public folder. This property is also available on private mailbox
    /// logon (section 2.2.2.1.1.11).
    var userEntryId: Data? {
        return getProperty(id: .tagUserEntryId)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.12 PidTagLocaleId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagLocaleId property ([MS-OXPROPS] section 2.768) establishes the language locale for
    /// translating system-generated messages, such as delivery reports. For more details, see [MS-LCID].
    var localeId: UInt32? {
        return getProperty(id: .tagLocaleId)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.13 PidTagSerializedReplidGuidMap
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSerializedReplidGuidMap property ([MS-OXPROPS] section 2.1013) contains a serialized
    /// list of REPLID and REPLGUID pairs which represents all or part of the REPLID /REPLGUID mapping
    /// of the associated Logon object. This property allows a client to more efficiently seed a local cache of
    /// the REPLID /REPLGUID mapping without having to issue separate remote operations
    /// RopLongTermIdFromId ([MS-OXCROPS] section 2.2.3.8) or RopIdFromLongTermId ([MSOXCROPS] section 2.2.3.9).
    /// The binary property, if returned, is made up of a combination of 18-byte pairs where each pair consists of a 2-byte REPLID
    /// followed by a 16-byte REPLGUID. The value when returned from the server contains as much of the mapping that can be
    /// returned, but not necessarily the entire mapping. Any residual data less than 18 bytes in size can be ignored.
    /// For additional information on REPLID and REPLGUID mapping, please see section 3.2.5.8 and section 3.2.5.9.
    var serializedReplidGuidMap: SerializedReplidGuidMap? {
        guard let data: Data = getProperty(id: .tagSerializedReplidGuidMapOrPR_FOLDER_CHILD_COUNT) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? SerializedReplidGuidMap(dataStream: &dataStream)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.14 PidTagSortLocaleId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagSortLocaleId property ([MS-OXPROPS] section 2.1015) establishes the language locale
    /// for sorting the contents of tables. For more details, see [MS-LCID]. For additional information about
    /// this property, see section 3.2.5.1.1.
    /// [MS-OXPFOAB] 2.2 Message Syntax
    /// [MS-OXPFOAB] 2.2.1 OAB Messages
    /// OAB data is stored as a set of properties and attachments on a message in the public folders
    /// message store.<1> The message is referred to as the full OAB message or differential OAB
    /// message. The location of this message is specified in section 3. Unless otherwise specified, the OAB
    /// messages adhere to the format specified in [MS-OXCMSG].
    /// There are two types of OAB messages — full messages and differential messages — with some
    /// additional differences related to the version of the OAB. Full messages contain all of the information
    /// that is needed to create a current OAB. Differential messages contain enough information to update a
    /// previous OAB to a more current OAB. The following properties are common to all OAB messages that
    /// use public folder retrieval.
    ///  PidTagSortLocaleId, as specified in section 2.2.1.1.
    /// [MS-OXPFOAB] 2.2.1.1 PidTagSortLocaleId
    /// The value of this property is the locale identifier, as described in [MS-LCID], that is used in
    /// combination with the PidTagMessageCodepage property to sort RDN2_REC and ANR_REC in OAB
    /// version 2 files. For details, see [MS-OXPROPS] section 2.1011 and [MS-OXOAB].
    var sortLocaleId: UInt32? {
        return getProperty(id: .tagSortLocaleId)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.1.15 PidTagCodePageId Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCodePageId property ([MS-OXPROPS] section 2.630) establishes the client code page for
    /// Unicode to double-byte character set (DBCS) string conversion. For details, see [MS-UCODEREF].
    var codePageId: UInt32? {
        return getProperty(id: .tagCodePageId)
    }
    
    /// [MS-OXCSTOR] 2.2.2.1.2.4 PidTagOutOfOfficeState Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagOutOfOfficeState property ([MS-OXPROPS] section 2.849) indicates whether the user is
    /// Out of Office (OOF). The value TRUE indicates that the user is OOF, in which case the out of office
    /// rules are evaluated and executed. When the value of this property is reset, regardless of the value,
    /// the accumulated OOF history is cleared for all OOF rules. For more details about rules, see [MSOXORULE].
    var outOfOfficeState: Bool? {
        return getProperty(id: .tagOutOfOfficeState)
    }

    /// [MS-OXCSTOR] 2.2.2.2.2 PidTagAddressBookMessageId Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAddressBookMessageId property ([MS-OXPROPS] section 2.545) contains the shortterm MID of the first message in the local site's offline address book public folder, if it exists and has a
    /// local replica. The property MUST have an error value of ecNotFound (0x8004010F) if there is no local
    /// site offline address book public folder, the server can't open the folder, the server can't access the
    /// message, or there is no local replica of the folder.
    var addressBookMessageId: UInt64? {
        return getProperty(id: .tagAddressBookMessageId)
    }
}
