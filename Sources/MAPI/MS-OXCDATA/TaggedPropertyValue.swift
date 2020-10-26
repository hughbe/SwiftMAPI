//
//  TaggedPropertyValue.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.11.4 TaggedPropertyValue Structure
/// As a rule, property tags are not specified explicitly in ROP buffers. To save space, property tags are specified implicitly by a
/// previous operation and only the property values are put in the buffer. But under some circumstances a TaggedPropertyValue
/// structure is used to explicitly include the property type and ID in the buffer.
public struct TaggedPropertyValue {
    public let propertyTag: PropertyTag
    public let propertyValue: PropertyValue
    
    public init(dataStream: inout DataStream) throws {
        /// PropertyTag (4 bytes): A PropertyTag structure, as specified in section 2.9, giving the values of the PropertyId and
        /// PropertyType fields for the property.
        self.propertyTag = try PropertyTag(dataStream: &dataStream)
        
        /// PropertyValue (variable): A PropertyValue structure, as specified in section 2.11.2.1. specifying the value of the
        /// property. Its syntax is specified by the PropertyType field of the PropertyTag structure, and its semantics by the
        /// PropertyId field of the PropertyTag structure.
        self.propertyValue = try PropertyValue(dataStream: &dataStream, type: self.propertyTag.type)
    }
}
