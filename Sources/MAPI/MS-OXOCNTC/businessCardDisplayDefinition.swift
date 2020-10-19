//
//  BusinessCardDisplayDefinition.swift
//  
//
//  Created by Hugh Bellamy on 17/10/2020.
//

import DataStream

/// [MS-OXOCNTC] 2.2.1.7.1 PidLidBusinessCardDisplayDefinition Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidBusinessCardDisplayDefinition ([MS-OXPROPS] section 2.47) property specifies user-customization details for displaying a contact as a business card. This property is optional.
/// The layout of a business card can be represented as an image and a number of text fields. The image
/// can be either a contact photo, specified in section 2.2.1.8, or a card picture, specified in section
/// 2.2.1.7.2. Text fields consist of a value from another PtypString property set on the Contact object
/// and an optional customized label string provided by the user.
/// The following diagram specifies the format of the PidLidBusinessCardDisplayDefinition property.
/// Note that multiple-byte values are stored in little-endian format in the buffer.
public struct BusinessCardDisplayDefinition {
    public let majorVersion: UInt8
    public let minorVersion: UInt8
    public let templateID: TemplateID
    public let countOfFields: UInt8
    public let fieldInfoSize: UInt8
    public let extraInfoSize: UInt8
    public let imageAlignment: ImageAlignment
    public let imageSource: UInt8
    public let backgroundColor: UInt32
    public let imageArea: UInt8
    public let reserved: UInt32
    public let fieldInfoN: [FieldInfo]
    public let extraInfo: [String]
    
    public init(dataStream: inout DataStream) throws {
        /// MajorVersion (1 byte): An 8-bit value that specifies the major version number. This field MUST be set to 0x03 or greater.
        self.majorVersion = try dataStream.read()
        if self.majorVersion < 0x03 {
            throw MAPIError.corrupted
        }
        
        /// MinorVersion (1 byte): An 8-bit value that specifies the minor version number. This field SHOULD
        /// be set to 0x00.
        self.minorVersion = try dataStream.read()

        /// TemplateID (1 byte): An 8-bit value that specifies the layout of the business card. The valid values
        /// for this field are specified in the following table.
        let templateIDRaw: UInt8 = try dataStream.read()
        guard let templateID = TemplateID(rawValue: templateIDRaw) else {
            throw MAPIError.corrupted
        }
        
        self.templateID = templateID
        
        /// CountOfFields (1 byte): An integer that specifies the number of FieldInfo structures, as specified in section 2.2.1.7.1.1, contained in the FieldInfoN field.
        self.countOfFields = try dataStream.read()
        
        /// FieldInfoSize (1 byte): An integer that specifies the size, in bytes, of each FieldInfo structure that is contained in the FieldInfoN field. This field MUST be set to 16.
        self.fieldInfoSize = try dataStream.read()
        if self.fieldInfoSize != 16 {
            throw MAPIError.corrupted
        }
        
        /// ExtraInfoSize (1 byte): An integer that specifies the size, in bytes, of the ExtraInfo field.
        self.extraInfoSize = try dataStream.read()
        
        /// ImageAlignment (1 byte): An 8-bit value that specifies the alignment of the image within the image area. If the value of the TemplateID field is 0x04, indicating a text-only card, this field is
        /// ignored. The valid values for this field are specified in the following table.
        let imageAlignmentRaw: UInt8 = try dataStream.read()
        guard let imageAlignment = ImageAlignment(rawValue: imageAlignmentRaw) else {
            throw MAPIError.corrupted
        }
        
        self.imageAlignment = imageAlignment
        
        /// ImageSource (1 byte): An 8-bit value that specifies the source of the image that is used for the business card. The business card can display up to one image on the card.
        /// That image can be obtained from either the contact photo, as specified in section 2.2.1.8.1, or the card picture, as specified in section 2.2.1.7.2. If the value of the
        /// ImageSource field is 0x00, the contact photo SHOULD be used; otherwise, the card picture SHOULD be used.
        /// If the value of this field is 0x00, the PidLidBusinessCardCardPicture property ([MS-OXPROPS] section 2.46) SHOULD NOT exist on the Contact object.
        /// This field MUST NOT be set to 0x00 when the value of the PidLidHasPicture property (section 2.2.1.8.1) is zero (FALSE). If the value of the TemplateID field is 0x04,
        /// indicating a text-only card, this field is ignored.
        self.imageSource = try dataStream.read()
        
        /// BackgroundColor (4 bytes): A 32-bit value that specifies the background color of the business card. This field has the format 0x00BBGGRR, where the high byte is 0x00 and
        /// the three lower bytes, represented by BBGGRR, specify blue, green, and red intensities, respectively.
        self.backgroundColor = try dataStream.read(endianess: .littleEndian)
        
        /// ImageArea (1 byte): An integer that specifies the percent of space that the image will occupy on the business card. The value of this field SHOULD be between 4 and 50.
        /// The value of this field is ignored for text-only cards (TemplateID field is set to 0x04) and background image cards (TemplateID field is set to 0x05).
        self.imageArea = try dataStream.read()
        
        /// Reserved (4 bytes): This field MUST be set to zero when sent and MUST be ignored when received.
        self.reserved = try dataStream.read(endianess: .littleEndian)
        
        /// FieldInfoN (variable): An array of zero or more FieldInfo structures (section 2.2.1.7.1.1), each of which contains details about the text field of a business card.
        /// Each text field is associated with a user-customized label that is listed in the ExtraInfo field. The number of FieldInfo structures
        /// contained in this field is specified by the CountOfFields field.
        var fieldInfoN: [FieldInfo] = []
        fieldInfoN.reserveCapacity(Int(self.countOfFields))
        for _ in 0..<self.countOfFields {
            let fieldInfo = try FieldInfo(dataStream: &dataStream)
            fieldInfoN.append(fieldInfo)
        }
        
        self.fieldInfoN = fieldInfoN
        
        /// ExtraInfo (variable): An array of null-terminated Unicode strings, each of which specifies a business card label that has been provided by the user.
        /// Each business card label SHOULD be limited to 16 Unicode characters, including the terminating null character. Each business card label is
        /// associated with a text field of the business card and is referenced by the LabelOffset field of one of the FieldInfo structures contained in the FieldInfoN field.
        /// The total size, in bytes, of the ExtraInfo field is specified by the ExtraInfoSize field.
        var extraInfo: [String] = []
        let position = dataStream.position
        while dataStream.position - position < self.extraInfoSize {
            let string = try dataStream.readUnicodeString(endianess: .littleEndian)!
            extraInfo.append(string)
        }
        
        self.extraInfo = extraInfo
        
        assert(dataStream.remainingCount == 0)
    }
    
    /// TemplateID (1 byte): An 8-bit value that specifies the layout of the business card. The valid values
    /// for this field are specified in the following table.
    public enum TemplateID: UInt8 {
        /// 0x00 The image area will be left aligned, stretching the full height of the card vertically; text fields will appear to the right of the image area.
        case imageLeftAligned = 0x00
        
        /// 0x01 The image area will be right aligned, stretching the full height of the card vertically; text fields will appear to the left of the image area.
        case imageRightAligned = 0x01
        
        /// 0x02 The image area will be aligned to the top, stretching the full width of the card horizontally; text fields will appear under the image area.
        case imageTopAligned = 0x02

        /// 0x03 The image area will be aligned to the bottom, stretching the full width of the card horizontally; text fields will appear above the image area.
        case imageBottomAligned = 0x03
        
        /// 0x04 No image area is included in the card, only text fields are included. In this case, the PidLidBusinessCardCardPicture property (section 2.2.1.7.2) SHOULD NOT be set on the Contact
        /// object.
        case noImage = 0x04
        
        /// 0x05 The image area will be used as a background for the card, stretching the full height and width of the card. Text fields are displayed on top of the image area.
        case backgroundImage = 0x05
    }
    
    /// ImageAlignment (1 byte): An 8-bit value that specifies the alignment of the image within the image area. If the value of the TemplateID field is 0x04, indicating a text-only card, this field is
    /// ignored. The valid values for this field are specified in the following table.
    public enum ImageAlignment: UInt8 {
        /// 0x00 Image is stretched to fit.
        case stretchedToFit = 0x00
        
        /// 0x01 Align top left.
        case topLeft = 0x01
        
        /// 0x02 Align top center.
        case topCenter = 0x02
        
        /// 0x03 Align top right.
        case topRight = 0x03
        
        /// 0x04 Align middle left.
        case middleLeft = 0x04
        
        /// 0x05 Align middle center.
        case middleCenter = 0x05
        
        /// 0x06 Align middle right.
        case middleRight = 0x06
        
        /// 0x07 Align bottom left.
        case bottomLeft = 0x07
        
        /// 0x08 Align bottom center.
        case bottomCenter = 0x08
        
        /// 0x09 Align bottom right.
        case bottomRight = 0x09
    }
}
