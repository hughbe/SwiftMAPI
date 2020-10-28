//
//  PropertyValue.swift
//
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.11.2 Property Value Structures
/// The PropertyValue structure, as specified in section 2.11.2.1, specifies the value of the property. It contains no information
/// about the property type or id.
/// The PropertyValue_r structure, as specified in [MS-NSPI], is an encoding of the PropertyValue data structure. For property
/// values with uninterpreted byte values, the permissible number of bytes in the PropertyValue_r structure exceeds that of the
/// PropertyValue data structure, as specified in [MS-NSPI]. For property values with multiple values, the permissible number
/// of values in the PropertyValue_r structure exceeds that of the PropertyValue data structure. The semantic meaning is otherwise
/// unchanged from the PropertyValue data structure.
/// [MS-OXCDATA] 2.11.2.2 PropertyValue_r Structure
public struct PropertyValue_r    {
    public let propertyTag: PropertyTag
    public let reserved: UInt32
    public let propertyValue: PropertyValue

    public init(dataStream: inout DataStream) throws {
        /// PropertyTag (4 bytes): This value encodes the property tag with the value represented by the PropertyValue_r structure.
        self.propertyTag = try PropertyTag(dataStream: &dataStream)

        /// Reserved (4 bytes): All clients and servers MUST set this value to 0x00000000.
        self.reserved = try dataStream.read(endianess: .littleEndian)
        if self.reserved != 0x00000000 {
            throw MAPIError.corrupted
        }

        /// PropertyValue (variable): This value encodes the PropertyValue field of the PropertyValue
        /// structure, as specified in section 2.11.2.1. This is the actual value of the property represented by
        /// the PropertyValue_r structure. The type value is specified by the PropertyTag field.
        self.propertyValue = try PropertyValue(dataStream: &dataStream, type: self.propertyTag.type, standard: true)
    }
}
