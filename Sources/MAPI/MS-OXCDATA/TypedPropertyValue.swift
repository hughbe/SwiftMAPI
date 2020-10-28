//
//  TypedPropertyValue.swift
//
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.11.3 TypedPropertyValue Structure
/// The TypedPropertyValue structure includes the property type with the value of the property.
public struct TypedPropertyValue {
    public let propertyType: PropertyType
    public let propertyValue: PropertyValue
    
    public init(dataStream: inout DataStream, standard: Bool) throws {
        /// PropertyType (2 bytes): An unsigned integer that specifies the data type of the property value, according to the table
        /// in section 2.11.1.
        let typeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        if let type = PropertyType(rawValue: typeRaw) {
            self.propertyType = type
        } else {
            self.propertyType = .unknown
        }

        /// PropertyValue (variable): A PropertyValue structure, as specified in section 2.11.2.1. specifying the value of the
        /// property. Its syntax is specified by the PropertyType field of the PropertyTag structure, and its semantics by the
        /// PropertyId field of the PropertyTag structure.
        self.propertyValue = try PropertyValue(dataStream: &dataStream, type: self.propertyType, standard: standard)
    }
}
