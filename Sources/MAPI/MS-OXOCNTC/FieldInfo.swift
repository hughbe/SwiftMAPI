//
//  FieldInfo.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCNTC] 2.2.1.7.1.1 FieldInfo Structure
/// The FieldInfo structure contains details about a text field on the business card. The following diagram specifies the buffer format of the FieldInfo structure.
public struct FieldInfo {
    public let textPropertyID: UInt16
    public let textFormat: TextFormat
    public let labelFormat: LabelFormat
    public let fontSize: UInt8
    public let reserved: UInt8
    public let labelOffset: UInt16
    public let valueFontColor: UInt32
    public let labelFontColor: UInt32
    
    public init(dataStream: inout DataStream) throws {
        /// TextPropertyID (2 bytes): A 16-bit value that specifies the property to be used for the text field. The value of the TextPropertyID field MUST be either 0x0000,
        /// representing an empty text field, or the property ID of one of the properties specified in section 2.2.1.7.1.1.1.
        self.textPropertyID = try dataStream.read(endianess: .littleEndian)
        
        /// TextFormat (1 byte): An 8-bit value that specifies the alignment and formatting for the text field. The following diagram shows the bits and their meanings.
        /// If none of the bits are set, the text field is displayed as a single line, left-aligned. The Right align and Center align bits MUST be mutually exclusive.
        let textFormatRaw: UInt8 = try dataStream.read()
        self.textFormat = TextFormat(rawValue: textFormatRaw)
        
        /// LabelFormat (1 byte): An 8-bit value that specifies the alignment of a user-provided label that is associated with the text field. The following diagram shows the bits and their meanings.
        /// If none of the bits are set, the text field has no label. The Label to the right and Label to the left bits MUST be mutually exclusive.
        let labelFormatRaw: UInt8 = try dataStream.read()
        self.labelFormat = LabelFormat(rawValue: labelFormatRaw)
        
        /// FontSize (1 byte): An integer that specifies the font size, in points, of the text field. The font size MUST be between 3 and 32.
        /// The font size MUST zero if the text field is displayed as an empty line.
        let fontSize: UInt8 = try dataStream.read()
        if fontSize < 3 || fontSize > 32 {
            throw MAPIError.corrupted
        }
        
        self.fontSize = fontSize
        
        /// Reserved (1 byte): This field MUST be set to zero when sent and MUST be ignored when received.
        self.reserved = try dataStream.read()

        /// LabelOffset (2 bytes): An integer that specifies the byte offset into the ExtraInfo field of the PidLidBusinessCardDisplayDefinition property (section 2.2.1.7.1).
        /// The offset points to the start of the label string in the ExtraInfo field. The offset MUST be less than the value of the ExtraInfoSize field, which specifies the
        /// total size of the ExtraInfo field. If the text field does not have a label, the value of the LabelOffset field MUST be 0xFFFE.
        self.labelOffset = try dataStream.read(endianess: .littleEndian)
        
        /// ValueFontColor (4 bytes): An integer that specifies the color of the text field. The value of the ValueFontColor field has the format 0x00BBGGRR, where the high
        /// byte is 0x00, the next highest byte identifies the blue intensity, the next highest byte identifies the green intensity, and the lowest byte identifies the red intensity.
        self.valueFontColor = try dataStream.read(endianess: .littleEndian)

        /// LabelFontColor (4 bytes): An integer that specifies the color of the label. The value of the LabelFontColor field has the format 0x00BBGGRR, where the high
        /// byte is 0x00, the next highest byte identifies the blue intensity, the next highest byte identifies the green intensity, and the lowest byte identifies the red intensity.
        self.labelFontColor = try dataStream.read(endianess: .littleEndian)
    }
    
    /// TextFormat (1 byte): An 8-bit value that specifies the alignment and formatting for the text field. The following diagram shows the bits and their meanings.
    /// If none of the bits are set, the text field is displayed as a single line, left-aligned. The Right align and Center align bits MUST be mutually exclusive.
    public struct TextFormat: OptionSet {
        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        public static let centerAlign = TextFormat(rawValue: 0x02)
        
        public static let rightAlign = TextFormat(rawValue: 0x04)
        
        public static let underline = TextFormat(rawValue: 0x08)
        
        public static let italic = TextFormat(rawValue: 0x10)
        
        public static let bold = TextFormat(rawValue: 0x20)

        public static let multiline = TextFormat(rawValue: 0x40)

        public static let all: TextFormat = [.centerAlign, .rightAlign, .underline, .italic, .bold, .multiline]
    }
    
    /// LabelFormat (1 byte): An 8-bit value that specifies the alignment of a user-provided label that is associated with the text field. The following diagram shows the bits and their meanings.
    /// If none of the bits are set, the text field has no label. The Label to the right and Label to the left bits MUST be mutually exclusive.
    public struct LabelFormat: OptionSet {
        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        public static let rightToLeftReadingOrder = LabelFormat(rawValue: 0x20)
        
        public static let toTheLeft = LabelFormat(rawValue: 0x40)
        
        public static let toTheRight = LabelFormat(rawValue: 0x80)

        public static let all: LabelFormat = [.rightToLeftReadingOrder, .toTheLeft, .toTheRight]
    }
}
