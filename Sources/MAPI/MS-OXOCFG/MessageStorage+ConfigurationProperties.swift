//
//  MessageStorage+ConfigurationProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import DataStream
import Foundation

/// [MS-OXOCFG] 2.2 Message Syntax
/// Sections 2.2.1 through 2.2.9.19 specify the location and format of the property and stream buffers
/// that are specific to the Configuration Information Protocol.
/// [MS-OXOCFG] 2.2.2 Configuration Data Properties
/// Configuration data consists of groups of related application settings. Each group of settings is stored in
/// separate stream properties that are set on FAI messages.
/// The streams can contain a serialized dictionary of name-value pairs that allow access to individual
/// settings by name. The dictionary is serialized using an XML schema that is common to all dictionary
/// streams. Most simple settings use this type of stream.
/// For more structured data, such as the user's preferred working hours, the streams can contain an
/// XML document that uses an arbitrary schema that corresponds to the structure of the data. The
/// settings that use an arbitrary XML stream include the user's preferred working hours, which can be
/// used by the client and server to make improved scheduling suggestions for that user, and the user's
/// customized category list, which allows the user to build a list of commonly used message categories
/// and assign color values to those categories.
/// The properties specified in sections 2.2.2.1 through 2.2.2.3 are present on FAI messages that contain
/// configuration data.
/// [MS-OXOCFG] 2.2.6 View Definitions
/// The client and server MAY<15> store view settings as view definitions. The format of the view
/// definitions, as well as which settings are included, is specified in sections 2.2.6.1 through 2.2.6.2.
/// View definitions can be created by the client to make view settings available to the server. These
/// settings consist of column descriptions, including column header names and sizes, groupings, sort
/// orders, and an optional restriction. The data is stored in several stream properties in an FAI
/// message.
/// A message that contains view definitions MUST be an FAI message in the folder where the view is
/// used. The message MUST have the following properties set on it, and the value of each property MUST
/// meet the following criteria:
/// The message has the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) set and the
/// value of the property is "IPM.Microsoft.FolderDesign.NamedView".
/// The message has the PidTagViewDescriptorVersion property ([MS-OXPROPS] section 2.1052) set
/// and the value of the property is 0x00000008.
/// The message has the PidTagViewDescriptorName property ([MS-OXPROPS] section 2.1050) set
/// and the value of the property is a non-empty string.
/// The view definitions MUST be stored as a binary stream in the PidTagViewDescriptorBinary
/// property (section 2.2.6.1) of the message. The column headers are stored in the
/// PidTagViewDescriptorStrings property (section 2.2.6.2) on the message as strings using the
/// current code page of the client. Section 2.2.6.1 and section 2.2.6.2 specify the packet format of
/// these two properties respectively.
/// [MS-OXOCFG] 2.2.8 Conversation Actions
/// Conversation actions are a limited set of actions that a user applies to all E-mail objects, currently
/// in the message store or delivered in the future, that share the same value of the
/// PidTagConversationId property ([MS-OXOMSG] section 2.2.1.2) and thus are part of the same
/// conversation. Unlike rules, as specified in [MS-OXORULE], at most one conversation action applies
/// to any given E-mail object, and conversation actions can be automatically deleted after a period of
/// disuse.
/// A conversation action is a combination of any of the following actions:
///  Ignore
///  Stop Ignoring
///  Move to Folder
///  Move to Store
///  Stop Move
///  Add Category
///  Remove Category
///  Clear All Categories
/// The client and server SHOULD<19> persist conversation action settings in an FAI message in the
/// conversation actions settings special folder, as specified in [MS-OXOSFLD] section 2.2.5.1. The
/// relevant properties of a conversation action FAI message are enumerated in sections 2.2.8.1 through
/// 2.2.8.10.
/// [MS-OXOCFG] 2.2.9 Navigation Shortcuts
/// Navigation shortcuts are objects that contain identifying information to locate a folder in a message
/// store. Clients can use navigation shortcuts to provide quick access to particular folders via the client's
/// user interface.
/// Navigation shortcuts are stored as FAI messages, as specified in [MS-OXCMSG], in the Common
/// Views folder, as specified in [MS-OXOSFLD], within a message database.
/// These messages possess additional properties that describe navigation shortcuts. These properties are
/// described in sections 2.2.9.1 through 2.2.9.19.<29>
public extension MessageStorage {
    /// [MS-OXOCFG] 2.2.2.1 PidTagRoamingDatatypes Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRoamingDatatypes property ([MS-OXPROPS] section 2.930) contains a bitmask that
    /// indicates which stream properties exist on the message. The types of the streams, and thus the flags,
    /// are not mutually exclusive.
    /// The bitmask is a bitwise OR of the following bits. Other bits MUST NOT be set and MUST be ignored if
    /// set.
    var roamingDatatypes: RoamingDatatypes? {
        guard let rawValue: UInt32 = getProperty(id: .tagRoamingDatatypes) else {
            return nil
        }
        
        return RoamingDatatypes(rawValue: rawValue)
    }
    
    /// [MS-OXOCFG] 2.2.2.2 PidTagRoamingDictionary Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRoamingDictionary property ([MS-OXPROPS] section 2.931) contains a dictionary
    /// stream that is serialized into a fixed XML schema, as specified in section 2.2.5.1.
    var roamingDictionary: String? {
        guard let data: Data = getProperty(id: .tagRoamingDictionary) else {
            return nil
        }
        
        return String(bytes: data, encoding: .utf8)
    }
    
    /// [MS-OXOCFG] 2.2.2.3 PidTagRoamingXmlStream Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRoamingXmlStream property ([MS-OXPROPS] section 2.932) contains an XML stream
    /// that uses an arbitrary XML schema, as specified in section 2.2.5.2.
    var roamingXmlStream: String? {
        guard let data: Data = getProperty(id: .tagRoamingXmlStream) else {
            return nil
        }
        
        return String(bytes: data, encoding: .utf8)
    }
    
    /// [MS-OXOCFG] 2.2.6.1 PidTagViewDescriptorBinary Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// View definitions, as specified in section 2.2.6, MUST be stored in the PidTagViewDescriptorBinary
    /// property ([MS-OXPROPS] section 2.1049) of the message.<16> The property is in binary format, and
    /// the packet structure is specified as follows.
    var viewDescriptorBinary: Data? {
        return getProperty(id: .tagViewDescriptorBinary)
    }
    
    /// [MS-OXOCFG] 2.2.6.2 PidTagViewDescriptorStrings Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The client MUST store the display strings referenced in the PidTagViewDescriptorBinary property
    /// (section 2.2.6.1) separately in the PidTagViewDescriptorStrings property ([MS-OXPROPS] section
    /// 2.1051).<17> The client MUST concatenate the strings in the same order in which the strings are
    /// referenced in the PidTagViewDescriptorBinary property. The first set of strings consists of the
    /// display names of each of the ColumnInfo structures, followed by the value of each restriction
    /// structure's PropValue field that uses the PtypString property type.
    /// The client MUST use the following binary layout in the PidTagViewDescriptorStrings property.
    var viewDescriptorStrings: String? {
        return getProperty(id: .tagViewDescriptorStrings)
    }
    
    /// [MS-OXOCFG] 2.2.8.1 PidLidConversationActionLastAppliedTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConversationActionLastAppliedTime property ([MS-OXPROPS] section 2.82)
    /// SHOULD<20> be the time (in UTC) that an E-mail object was last received in the conversation or
    /// the last time that the user modified the conversation action, whichever occurs later.
    var conversationActionLastAppliedTime: Data? {
        return getProperty(name: .lidConversationActionLastAppliedTime)
    }
    
    /// [MS-OXOCFG] 2.2.8.2 PidLidConversationActionMaxDeliveryTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConversationActionMaxDeliveryTime property ([MS-OXPROPS] section 2.83)
    /// SHOULD<21> be the maximum value of the PidTagMessageDeliveryTime property ([MS-OXOMSG]
    /// section 2.2.3.9) of all the E-mail objects modified in response to the last time the user changed a
    /// conversation action on the client. If no E-mail objects were changed, this property SHOULD be set to
    /// 00:00:00 Apr 1, 1601 (UTC).
    var conversationActionMaxDeliveryTime: Data? {
        return getProperty(name: .lidConversationActionMaxDeliveryTime)
    }
    
    /// [MS-OXOCFG] 2.2.8.3 PidLidConversationActionMoveFolderEid Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConversationActionMoveFolderEid property ([MS-OXPROPS] section 2.84)
    /// SHOULD<22> be set based on the action or actions being performed on the conversation, as shown
    /// in the following table.
    /// Action on the conversation Value
    /// Move to Folder (move to a folder in the same message store as this FAI message) The EntryID of that folder
    /// Move to Store (move to a folder in a different message store than this FAI message) The EntryID of that folder
    /// Ignore Byte array of size zero
    /// None of the above Not set
    var conversationActionMoveFolderEid: Data? {
        return getProperty(name: .lidConversationActionMoveFolderEid)
    }
    
    /// [MS-OXOCFG] 2.2.8.4 PidLidConversationActionMoveStoreEid Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConversationActionMoveStoreEid property ([MS-OXPROPS] section 2.85) SHOULD<23>
    /// be set based on the action or actions being performed on the conversation, as shown in the
    /// following table.
    /// Action on the conversation Value
    /// Move to Folder (move to a folder in the same message store as this FAI
    /// message)
    /// Not set
    /// Move to Store (move to a folder in a different message store than this FAI
    /// message)
    /// The EntryID of that message
    /// store
    /// Ignore Not set
    /// None of the above Not set
    var conversationActionMoveStoreEid: EntryID? {
        guard let data: Data = getProperty(name: .lidConversationActionMoveStoreEid) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// [MS-OXOCFG] 2.2.8.5 PidLidConversationActionVersion Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConversationActionVersion property ([MS-OXPROPS] section 2.86) SHOULD<24> be set
    /// to the version of the conversation action FAI message, as specified in section 2.2.8. The format of the
    /// value of this property MUST be as follows.
    var conversationActionVersion: UInt32? {
        return getProperty(name: .lidConversationActionVersion)
    }

    /// [MS-OXOCFG] 2.2.8.6 PidLidConversationProcessed Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidConversationProcessed property ([MS-OXPROPS] section 2.87) specifies a sequential
    /// number to be used in the processing of a conversation action, as specified in section 3.1.5.1.
    var conversationProcessed: UInt32? {
        return getProperty(name: .lidConversationProcessed)
    }
    
    /// [MS-OXOCFG] 2.2.9.3 PidTagWlinkGroupHeaderID Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkGroupHeaderID property ([MS-OXPROPS] section 2.1065) specifies the ID of the navigation shortcut,
    /// as specified in section 2.2.9, that groups other navigation shortcuts. This property SHOULD be set only when the value
    /// of the PidTagWlinkType property (section 2.2.9.5) is wblHeader.
    var wlinkGroupHeaderID: UUID? {
        guard let data: Data = getProperty(id: .tagSearchFolderIdOrTagScheduleInfoDelegatorWantsCopyOrTagWlinkGroupHeaderID) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.readGUID(endianess: .littleEndian)
    }
    
    /// [MS-OXOCFG] 2.2.9.4 PidTagWlinkSaveStamp Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkSaveStamp property ([MS-OXPROPS] section 2.1070) specifies an integer that
    /// allows a client to identify with a high probability whether the navigation shortcut, as specified in
    /// section 2.2.9, was saved by the current client session. When writing a navigation shortcut, the client
    /// writes the Session ID, as specified in section 3.1.3.1, as the value for this property.
    var wlinkSaveStamp: UInt32? {
        return getProperty(id: .tagFreeBusyPublishStartOrTagSearchFolderTagOrTagWlinkSaveStamp)
    }
    
    /// [MS-OXOCFG] 2.2.9.5 PidTagWlinkType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkType property ([MS-OXPROPS] section 2.1073) specifies the type of navigation
    /// shortcut, as specified in section 2.2.9. The valid values of this property are as follows.
    var wlinkType: WlinkType? {
        guard let rawValue: UInt32 = getProperty(id: .tagFreeBusyMessageEmailAddressOrTagWlinkType) else {
            return nil
        }
        
        return WlinkType(rawValue: rawValue)
    }
    
    /// [MS-OXOCFG] 2.2.9.5 PidTagWlinkType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkType property ([MS-OXPROPS] section 2.1073) specifies the type of navigation
    /// shortcut, as specified in section 2.2.9. The valid values of this property are as follows.
    var wlinkFlags: WlinkFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagScheduleInfoDelegateNamesWOrTagWlinkFlags) else {
            return nil
        }
        
        return WlinkFlags(rawValue: rawValue)
    }
    
    /// [MS-OXOCFG] 2.2.9.7 PidTagWlinkOrdinal Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkOrdinal property ([MS-OXPROPS] section 2.1067) specifies a variable-length binary
    /// property that SHOULD be used to sort shortcuts lexicographically. For example, to insert a shortcut C
    /// between shortcut A with the one-byte ordinal value of 128 and shortcut B with the one-byte ordinal
    /// value of 129, shortcut C can be assigned the two-byte ordinal 128, 128. The final byte of this property
    /// MUST NOT be 0 or 255 to ensure that shortcuts can be inserted before and after other shortcuts.
    var wlinkOrdinal: Data? {
        return getProperty(id: .tagScheduleInfoDelegatorWantsInfoOrTagWlinkOrdinal)
    }
    
    /// [MS-OXOCFG] 2.2.9.8 PidTagWlinkEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkEntryId property ([MS-OXPROPS] section 2.1061) specifies the EntryID of the folder pointed to by the shortcut.
    var wlinkEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagWlinkEntryId) else {
            return nil
        }

        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCFG] 2.2.9.9 PidTagWlinkRecordKey Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkRecordKey property ([MS-OXPROPS] section 2.1068) specifies the value of the
    /// PidTagRecordKey property ([MS-OXCPRPT] section 2.2.1.8) of the folder pointed to by the shortcut
    var wlinkRecordKey: Data? {
        return getProperty(id: .tagWlinkRecordKey)
    }
    
    /// [MS-OXOCFG] 2.2.9.10 PidTagWlinkStoreEntryId Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkStoreEntryId property ([MS-OXPROPS] section 2.1072) specifies the value of the PidTagStoreEntryId property
    /// ([MS-OXPROPS] section 2.1022) of the folder pointed to by the shortcut.
    var wlinkStoreEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagWlinkStoreEntryId) else {
            return nil
        }

        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCFG] 2.2.9.11 PidTagWlinkFolderType Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkFolderType property ([MS-OXPROPS] section 2.1063) specifies the type of folder pointed to by the
    /// shortcut. The possible values are listed in the following table.
    /// Value Value name Meaning
    /// {0x00780600, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}} CLSID_MailFolder The folder is a mail folder.
    /// {0x02780600, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}} CLSID_CalendarFolder The folder is a Calendar folder.
    /// {0x01780600, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}} CLSID_ContactFolder The folder is a Contact folder.
    /// {0x03780600, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}} CLSID_TaskFolder The folder is a Task folder.
    /// {0x04780600, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}} CLSID_NoteFolder The folder is a Note folder.
    /// {0x08780600, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x 00, 0x00, 0x46}} CLSID_JournalFolder The folder is a Journal folder.
    var wlinkFolderType: UUID? {
        guard let data: Data = getProperty(id: .tagScheduleInfoMonthsMergedOrTagWlinkFolderType) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.readGUID(endianess: .littleEndian)
    }
    
    /// [MS-OXOCFG] 2.2.9.12 PidTagWlinkGroupClsid Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkGroupClsid property ([MS-OXPROPS] section 2.1064) specifies the value of the PidTagWlinkGroupHeaderID
    /// property (section 2.2.9.3) of the group header associated with the shortcut.
    var wlinkGroupClsid: UUID? {
        guard let data: Data = getProperty(id: .tagScheduleInfoFreeBusyMergedOrTagWlinkGroupClsid) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.readGUID(endianess: .littleEndian)
    }
    
    /// [MS-OXOCFG] 2.2.9.13 PidTagWlinkGroupName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkGroupName property ([MS-OXPROPS] section 2.1066) specifies the value of the
    /// PidTagNormalizedSubject property (section 2.2.9.2) of the group header associated with the
    /// shortcut.
    var wlinkGroupName: String? {
        return getProperty(id: .tagScheduleInfoMonthsTentativeOrTagWlinkGroupName)
    }
    
    /// [MS-OXOCFG] 2.2.9.14 PidTagWlinkSection Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkSection property ([MS-OXPROPS] section 2.1071) specifies the section where the
    /// shortcut can be grouped. The possible values are listed in the following table.
    var wlinkSection: WlinkSection? {
        guard let rawValue: UInt32 = getProperty(id: .tagScheduleInfoFreeBusyTentativeOrTagWlinkSection) else {
            return nil
        }
        
        return WlinkSection(rawValue: rawValue)
    }
    
    /// [MS-OXOCFG] 2.2.9.15 PidTagWlinkCalendarColor Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkCalendarColor property ([MS-OXPROPS] section 2.1059) specifies the background
    /// color of the calendar. The RGB values listed in the following table can be used.
    /// Value Color (R, G, B)
    /// -1 Automatic (determined by implementation)
    /// 0 141, 174, 217
    /// 1 156, 191, 139
    /// 2 209, 149, 170
    /// 3 176, 182, 190
    /// 4 176, 182, 190
    /// 5 140, 140, 215
    /// 6 141, 193, 157
    /// 7 211, 150, 150
    /// 8 186, 186, 137
    /// 9 174, 153, 216
    /// 10 195, 176, 141
    /// 11 139, 191, 174
    /// 12 144, 182, 200
    /// 13 255, 223, 134
    /// 14 150, 169, 209
    var wlinkCalendarColor: Int32? {
        guard let rawValue: UInt32 = getProperty(id: .tagScheduleInfoMonthsBusyOrTagWlinkCalendarColor) else {
            return nil
        }
        
        return Int32(bitPattern: rawValue)
    }
    
    /// [MS-OXOCFG] 2.2.9.16 PidTagWlinkAddressBookEID Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkAddressBookEID property ([MS-OXPROPS] section 2.1057) specifies the value of the PidTagEntryId property
    /// ([MS-OXCPERM] section 2.2.4) of the user that the folder belongs to, as specified in [MS-OXOABK] section 2.2.3.2. This property
    /// SHOULD<30> be set on calendar shortcuts.
    var wlinkAddressBookEID: EntryID? {
        guard let data: Data = getProperty(id: .tagScheduleInfoFreeBusyBusyOrTagWlinkAddressBookEID) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCFG] 2.2.9.17 PidTagWlinkAddressBookStoreEID Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkAddressBookStoreEID property ([MS-OXPROPS] section 2.1058) specifies the value of the PidTagStoreEntryId property
    /// ([MS-OXPROPS] section 2.1022) of the current user (not the owner of the folder). This property SHOULD<31> be set on calendar shortcuts.
    var wlinkAddressBookStoreEID: EntryID? {
        guard let data: Data = getProperty(id: .tagWlinkAddressBookStoreEID) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOCFG] 2.2.9.18 PidTagWlinkClientID Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkClientID property ([MS-OXPROPS] section 2.1060) specifies the Client ID that allows the client to
    /// determine whether the shortcut was created on the current machine or by the currently logged-in user via an equality test.
    /// The ID is specified in section 3.1.3.1. If this property is set, the client SHOULD<32> compare the value of this property
    /// to the Client ID and display the shortcut only if the GUIDs match.
    var wlinkClientID: UUID? {
        guard let data: Data = getProperty(id: .tagWlinkClientID) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? dataStream.readGUID(endianess: .littleEndian)
    }
    
    /// [MS-OXOCFG] 2.2.9.19 PidTagWlinkROGroupType Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagWlinkROGroupType property ([MS-OXPROPS] section 2.1069) specifies the type of group header.
    /// If the property does not exist, the client SHOULD<33> assume a value of -1. The possible values are listed in the following table.
    var wlinkROGroupType: WlinkGroupType? {
        guard let rawValue: UInt32 = getProperty(id: .tagWlinkROGroupType) else {
            return nil
        }
        
        return WlinkGroupType(rawValue: Int32(bitPattern: rawValue))
    }
}
