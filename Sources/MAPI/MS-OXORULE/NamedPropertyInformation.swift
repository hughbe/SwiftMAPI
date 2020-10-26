//
//  NamedPropertyInformation.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXORULE] 2.2.4.2 NamedPropertyInformation Structure
/// The NamedPropertyInformation structure provides context to any named properties that are present in the structure it precedes.
/// For every distinct (unique) named property used in the structure it precedes, the NamedPropertyInformation structure contains
/// one property ID – named property pair.
/// The format of the NamedPropertyInformation structure is as follows. Note that if there are no named properties to be listed, the
/// NamedPropertyInformation structure reduces to a 2-byte value of 0x0000.
public struct NamedPropertyInformation {
    public let noOfNamedProps: UInt16
    public let propIds: [UInt16]
    public let namedPropertiesSize: UInt32
    public let namedProperties: [PropertyName]
    
    public init(dataStream: inout DataStream) throws {
        /// NoOfNamedProps (2 bytes): An integer that specifies the number of named property mappings that are packed in
        /// this structure. If no named properties are used in the structure that follows the NamedPropertyInformation structure,
        /// the value of this field MUST be 0x0000 and no other fields are present.
        self.noOfNamedProps = try dataStream.read(endianess: .littleEndian)

        /// PropIds (variable): An array of property IDs, each of which is a value of 0x8000 or greater and
        /// uniquely identifies the named property within an extended rule. There MUST be one property ID
        /// in this array for each PropertyName structure in the NamedProperties field.
        var propIds: [UInt16] = []
        propIds.reserveCapacity(Int(self.noOfNamedProps))
        for _ in 0..<self.noOfNamedProps {
            let propId: UInt16 = try dataStream.read(endianess: .littleEndian)
            propIds.append(propId)
        }
        
        self.propIds = propIds

        /// NamedPropertiesSize (4 bytes): The total size, in bytes, of the following fields. Only present if NoOfNamedProps
        /// is greater than zero.
        if self.noOfNamedProps > 0 {
            self.namedPropertiesSize = try dataStream.read(endianess: .littleEndian)
        } else {
            self.namedPropertiesSize = 0
        }
        
        /// NamedProperties (variable): An array of PropertyName structures, each of which contains details about a named
        /// property. The format of the PropertyName structure is specified in [MSOXCDATA] section 2.6.1. The PropertyName
        /// structures in this field MUST coincide with the property IDs in the PropIds field.
        var namedProperties: [PropertyName] = []
        namedProperties.reserveCapacity(Int(self.noOfNamedProps))
        for _ in 0..<self.noOfNamedProps {
            let namedProperty = try PropertyName(dataStream: &dataStream)
            namedProperties.append(namedProperty)
        }
        
        self.namedProperties = namedProperties
    }
}
