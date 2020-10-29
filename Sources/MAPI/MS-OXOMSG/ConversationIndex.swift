//
//  OutlookMessageConversationIndex.swift
//
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

/// [MS-OXOMSG] 2.2.1.3 PidTagConversationIndex Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidTagConversationIndex property ([MS-OXPROPS] section 2.644) indicates the relative position of this message within a
/// conversation thread. It is set according to the description in the following diagram.
public struct ConversationIndex {
    public let header: Header
    public let responseLevels: [ResponseLevel]
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let position = dataStream.position
        
        /// Conversation Index Header (22 bytes): Set according to the description in the following diagram.
        self.header = try Header(dataStream: &dataStream)
        
        /// Response Levels (5 bytes each): Set according to the description in the following diagram.
        let count = (size - 22) / 5
        var responseLevels: [ResponseLevel] = []
        responseLevels.reserveCapacity(count)
        for _ in 0..<count {
            let responseLevel = try ResponseLevel(dataStream: &dataStream)
            responseLevels.append(responseLevel)
        }
    
        self.responseLevels = responseLevels
        
        if dataStream.position - position != size {
            throw MAPIError.corrupted
        }
    }

    /// Conversation Index Header (22 bytes): Set according to the description in the following diagram.
    public struct Header {
        public var reserved: UInt8
        public var currentFileTime: Date
        public var guid: UUID
        
        public init(dataStream: inout DataStream) throws {
            /// Reserved (8 bits): Set to 0x01.
            self.reserved = try dataStream.read()
            
            if self.reserved != 0x01 {
                throw MAPIError.corrupted
            }
            
            /// Current FILETIME (40 bits): The time of delivery in UTC expressed as a PtypTime type ([MSOXCDATA] section 2.11.1) is
            /// obtained, where the 32 bits of the high part and the 8 high bits of the low part of the FILETIME ([MS-DTYP]) are included
            /// in Current FILETIME high part and
            /// Current FILETIME low part, as shown in the following table.<2>
            /// 40 bits | 24 least significant bits
            /// ------------------------
            /// Included     | Excluded
            /// The data is stored in big-endian format: the five bytes of the time are written from most significant byte to least significant byte.
            let h1: UInt8 = try dataStream.read()
            let h2: UInt8 = try dataStream.read()
            let h3: UInt8 = try dataStream.read()
            let l1: UInt8 = try dataStream.read()
            let l2: UInt8 = try dataStream.read()
            
            // Encoding of the file time drops the high byte, which is always 1
            // So we add it back to get a time which makes more sense
            let filetime = FILETIME(
                dwLowDateTime: 1 << 24 | UInt32(h1) << 16 | UInt32(h2) << 8 | UInt32(h3),
                dwHighDateTime: UInt32(l1) << 24 | UInt32(l2) << 16)
            self.currentFileTime = filetime.date
            
            /// GUID (16 bytes): A PtypGuid type ([MS-OXCDATA] section 2.11.1) that is generated for each new conversation thread.
            /// The Data1, Data2, and Data3 fields are stored in big-endian format in the packet.
            self.guid = try dataStream.readGUID(endianess: .bigEndian)
        }
    }
    
    /// Response Levels (5 bytes each): Set according to the description in the following diagram.
    public struct ResponseLevel: Equatable {
        public let deltaCode: Bool
        public let deltaTime: UInt32
        public let random: UInt8
        public let level: UInt8
        
        /// Response Levels (5 bytes each): Set according to the description in the following diagram.
        public init(dataStream: inout DataStream) throws {
            /// DC (Delta code) (1 bit) and Time Delta (31 bits): Calculated based on TimeDiff, a 64-bit value representing the difference
            /// between the current time and the time stored in the conversation index header:<3>
            ///  If the difference is less than 1.7 years (high order part of the delta file time bitwise AND with 0x00FE0000 resulting
            /// in "0"), the Delta Code field is 0 and the Time Delta field is the least significant 31 bits of the TimeDiff value remaining
            /// after the 18 least significant bits are excluded.
            /// The following table depicts which portion of the TimeDiff value is included in the Time Delta field in this scenario.
            /// 15 most significant bits | 31 bits | 18 least significant bits
            /// --------------------------------------------------------------
            /// Excluded                                         | Included       | Excluded
            ///  If the difference is greater than or equal to 1.7 years (high order part of the delta file time bitwise AND with 0x00FE0000
            /// resulting in nonzero), the Delta Code field is 1 and the Time Delta field is the least significant 31 bits of the TimeDiff value
            /// remaining after the 23 least significant bits are excluded. The following table depicts which portion of the TimeDiff value
            /// is included in the Time Delta field in this scenario.
            /// 10 most significant bits | 31 bits | 23 least significant bits
            /// --------------------------------------------------------------
            /// Excluded                                         | Included       | Excluded
            /// For both cases, Time Delta is stored in big-endian format.
            let dcAndDeltaTime: UInt32 = try dataStream.read(endianess: .bigEndian)
            self.deltaCode = (dcAndDeltaTime & 0x80000000) != 0
            self.deltaTime = dcAndDeltaTime & ~0x80000000
            
            /// Random (8 bits): Random value generated by using an implementation-specific algorithm.
            let random: UInt8 = try dataStream.read()
            self.random = random >> 4
            self.level = random & 0x0F
        }
    }
}
