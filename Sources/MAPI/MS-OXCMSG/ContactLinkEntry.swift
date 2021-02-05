//
//  ContactLinkEntry.swift
//  
//
//  Created by Hugh Bellamy on 17/10/2020.
//

import DataStream

/// [MS-OXCMSG] 2.2.1.57.1 PidLidContactLinkEntry Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidContactLinkEntry property ([MS-OXPROPS] section 2.70) contains the list of address book EntryIDs
/// linked to by this Message object.
public struct ContactLinkEntry {
    public let addrBookEntryIdCount: UInt32
    public let fieldSize: UInt32
    public let addrBookEntryIdData: [EntryID]
    public let padding: [UInt8]
    
    public init(dataStream: inout DataStream) throws {
        /// AddrBookEntryIdCount (4 bytes): The number of address book EntryIDs included in this property.
        self.addrBookEntryIdCount = try dataStream.read(endianess: .littleEndian)
        
        /// FieldSize (4 bytes): The size of the AddrBookEntryIdCount field, minus 4.
        self.fieldSize = try dataStream.read(endianess: .littleEndian)
        
        /// AddrBookEntryIdData (variable): The EntryID data. Repeated the number of times specified by the
        /// AddrBookEntryIdCount field. Address book EntryIDs are specified in [MS-OXCDATA] section 2.2.5.2.
        var addrBookEntryIdData: [EntryID] = []
        addrBookEntryIdData.reserveCapacity(Int(self.addrBookEntryIdCount))
        for _ in 0..<self.addrBookEntryIdCount {
            let entryId = try getEntryID(dataStream: &dataStream, size: Int(self.fieldSize))
            addrBookEntryIdData.append(entryId)
        }
        
        self.addrBookEntryIdData = addrBookEntryIdData
        
        /// Padding (3 bytes): Between 0 and 3 bytes of padding, up to the amount required to make the FieldSize
        /// field a multiple of 4. The value of each padded byte MUST be 0x0000.
        self.padding = try dataStream.readBytes(count: Int(self.fieldSize) % 4)
    }
}
