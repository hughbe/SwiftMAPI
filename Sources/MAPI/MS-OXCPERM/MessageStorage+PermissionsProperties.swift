//
//  MessageStorage+PermissionsProperties.swift
//
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import DataStream
import Foundation

/// [MS-OXCPERM] 2.2 Message Syntax
/// Unless otherwise noted, sizes in this section are expressed in bytes.
/// Unless otherwise noted, the fields specified in this section are packed in buffers in the order that they
/// appear in this document, without any padding.
/// Unless otherwise noted, the fields specified in this section, which are larger than a single byte, MUST
/// be converted to little-endian order when packed in buffers and converted from little-endian order
/// when unpacked.
public extension MessageStorage {
    /// [MS-OXCPERM] 2.2.3 PidTagAccessControlListData Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAccessControlListData property ([MS-OXPROPS] section 2.500) contains a variablelength binary large object (BLOB) that constitutes a permissions list for a folder. This property is
    /// used when an ACL is copied from one folder to another.<2>
    /// The client does not understand the data contained in the BLOB and does not try to use the data. The
    /// BLOB is only used to copy the ACL from one folder to another.
    /// [MS-OXCFOLD] 2.2.2.2.2.9 PidTagAccessControlListData Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAccessControlListData property ([MS-OXCPERM] section 2.2.3) contains the access
    /// control list (ACL) of the folder.<11>
    var accessControlListData: Data? {
        return getProperty(id: .tagAccessControlListData)
    }

    /// [MS-OXCPERM] 2.2.4 PidTagEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagEntryId property ([MS-OXPROPS] section 2.677) identifies the Address Book object
    /// that specifies a user. The first two bytes of this property specify the number of bytes that follow. The
    /// remaining bytes constitute the PermanentEntryID structure ([MS-OXNSPI] section 2.2.9.3).
    /// If the PidTagMemberId property (section 2.2.5) is set to one of the two reserved values, the first
    /// two bytes of this property MUST be 0x0000, indicating that zero bytes follow (that is, no
    /// PermanentEntryID structure follows the first two bytes).
    /// [MS-OXOABK] 2.2.3.2 PidTagEntryId
    /// Data type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagEntryId property ([MS-OXCPERM] section 2.2.4) contains an entry ID that identifies an
    /// Address Book object on an NSPI server. The entry ID MUST be formatted as either a
    /// PermanentEntryID structure, as specified in [MS-NSPI] and [MS-OXNSPI] section 2.2.9.3, or an
    /// EphemeralEntryID structure, as specified in [MS-NSPI] and [MS-OXNSPI] section 2.2.9.2.<11>
    /// Messaging clients use this property to open an Address Book object. The client can then perform
    /// operations on the Address Book object, such as obtaining other properties. The types of operations
    /// that can be performed on an Address Book object are specified in [MS-NSPI] and [MS-OXNSPI]
    /// section 3.1.4 and in [MS-OXCMAPIHTTP] section 2.2.5. When the entry ID is in Permanent Entry ID
    /// format, its DN MUST match the value of the PidTagEmailAddress property (section 2.2.3.14) and
    /// MUST follow the format that is specified in section 2.2.1.1.
    /// The OAB Format and Schema Protocol specification, as specified in [MS-OXOAB], does not include
    /// value for the PidTagEntryId property for Address Book objects in its data structure. Instead, the
    /// PidTagEmailAddress property (section 2.2.3.14) identifies objects in an OAB.
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
    ///  PidTagOfflineAddressBookName, as specified in [MS-OXOAB] section 2.12.3.
    ///  PidTagOfflineAddressBookSequence, as specified in [MS-OXOAB] section 2.12.4.
    ///  PidTagOfflineAddressBookContainerGuid, as specified in [MS-OXOAB] section 2.12.1.
    ///  PidTagOfflineAddressBookDistinguishedName, as specified in [MS-OXOAB] section 2.12.2.
    ///  PidTagSortLocaleId, as specified in section 2.2.1.1.
    ///  PidTagMessageCodepage, as specified in section 2.2.1.2
    ///  PidTagParentEntryId, as specified in section 2.2.1.4.
    ///  PidTagEntryId, as specified in section 2.2.1.5.
    /// [MS-OXPFOAB] 2.2.1.5 PidTagEntryId
    /// This property contains the entry ID for the OAB public folder message. For details, see [MS-OXPROPS] section 2.674.<3>
    /// [MS-PST] 2.4.5.3 Recipient Table
    /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
    /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
    /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
    /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
    /// [MS-PST] 2.4.5.3.1 Recipient Table Template
    /// Each PST MUST have one recipient table template, which is identified with an NID value of
    /// NID_RECIPIENT_TABLE (0x692). The recipient table template defines the set of columns for every
    /// new Recipient Table that is created. The recipient table template MUST have no data rows, and MUST
    /// contain the following property columns.
    /// 0x0FFF PtypBinary PidTagEntryID EntryID of the recipient.
    var entryId: EntryID? {
        guard let data: Data = getProperty(id: .tagEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// [MS-OXCPERM] 2.2.5 PidTagMemberId Property
    /// Type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMemberId property ([MS-OXPROPS] section 2.776) specifies the unique identifier that
    /// the server generates for each user.
    /// The two reserved values for the PidTagMemberId property are listed in the following table.
    /// Value Meaning
    /// 0xFFFFFFFFFFFFFFFF Identifier for the anonymous user entry in the permissions list.
    /// 0x0000000000000000 Identifier for the default user entry in the permissions list.
    var memberId: UInt64? {
        return getProperty(id: .tagMemberId)
    }
    
    /// [MS-OXCPERM] 2.2.6 PidTagMemberName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMemberName property ([MS-OXPROPS] section 2.777) specifies the user-readable name
    /// of the user. The server provides the user-readable name for all entries in the permissions list.
    /// The user-readable names that the server provides for the reserved entries of the permissions list are
    /// listed in the following table.
    /// Reserved entry Value of the PidTagMemberId property User-readable name
    /// Anonymous user 0xFFFFFFFFFFFFFFFF "Anonymous"
    /// Default user 0x0000000000000000 "" (empty string)
    var memberName: String? {
        return getProperty(id: .tagMemberName)
    }
    
    /// [MS-OXCPERM] 2.2.7 PidTagMemberRights Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagMemberRights property ([MS-OXPROPS] section 2.778) specifies the folder permissions
    /// that are granted to the specified user.
    /// The flags that are used to specify permissions are listed in the following table. The client and server
    /// MUST NOT set any other flags.
    var memberRights: MessageRights? {
        guard let rawValue: UInt32 = getProperty(id: .tagMemberRights) else {
            return nil
        }
        
        return MessageRights(rawValue: rawValue)
    }
}
