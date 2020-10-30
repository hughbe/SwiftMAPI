//
//  MessageStorage+SpecialFolderProperties.swift
//  
//
//  Created by Hugh Bellamy on 02/09/2020.
//

import DataStream
import Foundation

/// [MS-OXOSFLD] 2.2.3 Binary Identification Properties
/// Each binary identification property contains the identifier of a special folder. These properties are
/// read from or written to either the Inbox folder or the Root folder. The implementation MUST use
/// the Inbox folder when the mailbox is that of the owner, and it MUST use the Root folder when the
/// mailbox is that of a delegate. For details about delegates, see [MS-OXODLGT].
public extension MessageStorage {
    /// [MS-OXOSFLD] Contains the entry ID of the Calendar folder
    var ipmAppointmentEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIpmAppointmentEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOSFLD] Contains the entry ID of the Contacts folder
    var ipmContactEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIpmContactEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)

    }
    
    /// [MS-OXOSFLD] Contains the entry ID of the Journal folder
    var ipmJournalEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIpmJournalEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)

    }
    
    /// [MS-OXOSFLD] Contains the entry ID of the Notes folder
    var ipmNoteEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIpmNoteEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)

    }
    
    /// [MS-OXOSFLD] Contains the entry ID of the Tasks folder
    var ipmTaskEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIpmTaskEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOSFLD] Contains the entry ID of the Reminders folder
    var remindersOnlineEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagRemindersOnlineEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)

    }
    
    /// [MS-OXOSFLD] Contains the entry ID of the Drafts folder
    var ipmDraftsEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIpmDraftsEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)

    }
    
    /// [MS-OXOSFLD] 2.2.4 PidTagAdditionalRenEntryIds Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAdditionalRenEntryIds property ([MS-OXPROPS] section 2.503) of the Inbox folder specifies the identifiers of several special
    /// folders. Each identifier is an entry ID. The index into the array contained in the PidTagAdditionalRenEntryIds property for each of these
    /// special folders is listed in the following table. The implementation MUST ignore and MUST preserve data at other indexes.
    /// Index Folder identified
    /// 0x0000 Conflicts
    /// 0x0001 Sync Issues
    /// 0x0002 Local Failures
    /// 0x0003 Server Failures
    /// 0x0004 Junk E-mail
    /// [MS-OXCSPAM] 2.2.3.1 PidTagAdditionalRenEntryIds Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAdditionalRenEntryIds property ([MS-OXOSFLD] section 2.2.4) is persisted on the Inbox folder of a message store. The value
    /// at zero-based index five of this property is used to validate the PidNameExchangeJunkEmailMoveStamp property (section 2.2.1.2), as
    /// specified in section 3.1.4.1.
    var additionalRenEntryIds: AdditionalRenEntryIds? {
        guard let data: [Data] = getProperty(id: .tagAdditionalRenEntryIds) else {
            return nil
        }

        return try? AdditionalRenEntryIds(data: data)
    }
    
    /// [MS-OXOSFLD] 2.2.5 PidTagAdditionalRenEntryIdsEx Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagAdditionalRenEntryIdsEx property ([MS-OXPROPS] section 2.504) of the Store object
    /// specifies the identifiers of several special folders. If this property is present, its value is an array of
    /// PersistData structures (section 2.2.5.1), each of which pertains to a particular special folder. The last
    /// PersistData structure in the array is indicated either by the PERSIST_SENTINEL value in the
    /// PersistID field of the PersistData structure or by the end of the data stream.
    var additionalRenEntryIdsEx: AdditionalRenEntryIdsEx? {
        guard let data: Data = getProperty(id: .tagAdditionalRenEntryIdsEx) else {
            return nil
        }
        
        var dataStream = DataStream(data: data)
        return try? AdditionalRenEntryIdsEx(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// [MS-OXOSFLD] 2.2.6 PidTagFreeBusyEntryIds Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFreeBusyEntryIds property ([MS-OXPROPS] section 2.699) is set on the Root folder and on the Inbox folder of the local
    /// message store. The value on the Root folder of the local message store MUST be equal to the value on the Inbox folder. The property
    /// contains four binary values, as follows:
    ///  The first value is null.
    ///  The second value is the EntryID of the Delegate Information object. For details about the Delegate Information object, see [MS-OXODLGT].
    ///  The third value can be the EntryID of the free/busy message of the logged-on user. If the free/busy public folder is unavailable, the third
    /// value is null. This value is set when a client initially creates the free/busy message for a user.
    ///  The fourth value is the EntryID of the public folder that has its PidTagDisplayName property ([MS-OXCFOLD] section 2.2.2.2.2.5) set
    /// to "Freebusy Data". This folder is a child folder of the Root folder of the public folders message store.
    var freeBusyEntryIds: FreeBusyEntryIds? {
        guard let data: [Data] = getProperty(id: .tagFreeBusyEntryIds) else {
            return nil
        }

        return try? FreeBusyEntryIds(data: data)
    }
}
