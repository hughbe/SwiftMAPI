//
//  AdditionalRenEntryIds.swift
//  
//
//  Created by Hugh Bellamy on 30/10/2020.
//

import DataStream
import Foundation

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
public struct AdditionalRenEntryIds {
    public let conflictsEntryId: EntryID?
    public let syncIssuesEntryId: EntryID?
    public let localFailuresEntryId: EntryID?
    public let serverFailuresEntryId: EntryID?
    public let junkEmailEntryId: EntryID?
    public let remainingData: [Data]
    
    public init(data: [Data]) throws {
        func getEntryId(index: Int) throws -> EntryID? {
            var dataStream = DataStream(data[index])
            if dataStream.count == 0 {
                return nil
            }

            return try getEntryID(dataStream: &dataStream, size: dataStream.count)
        }

        self.conflictsEntryId = try getEntryId(index: 0)
        self.syncIssuesEntryId = try getEntryId(index: 1)
        self.localFailuresEntryId = try getEntryId(index: 2)
        self.serverFailuresEntryId = try getEntryId(index: 3)
        self.junkEmailEntryId = try getEntryId(index: 4)
        self.remainingData = [Data](data.suffix(from: 5))
    }
}
