//
//  ChangeHighlightStructure.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.1.44.3 ChangeHighlight Structure
/// The ChangeHighlight structure is present only when the value of the WriterVersion2 field in the associated AppointmenRecurrencePattern
/// structure specified in section 2.2.1.44.5 is greater than or equal to 0x00003009.
public struct ChangeHighlightStructure {
    public let changeHighlightSize: UInt32
    public let changeHighlightValue: ChangeHighlight
    public let reserved: [UInt8]
    
    public init(dataStream: inout DataStream) throws {
        /// ChangeHighlightSize (4 bytes): The size of the ChangeHighlightValue and Reserved fields combined.
        self.changeHighlightSize = try dataStream.read(endianess: .littleEndian)
        
        /// ChangeHighlightValue (4 bytes): The value of the PidLidChangeHighlight property (section 2.2.6.2) in the
        /// Exception Embedded Message object.
        let changeHighlightValueRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.changeHighlightValue = ChangeHighlight(rawValue: changeHighlightValueRaw)
        
        /// Reserved (variable): Reserved.<15> This field is reserved for future enhancements and is not used.
        /// This field is not read or written to.
        if self.changeHighlightSize > 4 {
            self.reserved = try dataStream.readBytes(count: Int(self.changeHighlightSize) - 4)
        } else {
            self.reserved = []
        }
    }
}
