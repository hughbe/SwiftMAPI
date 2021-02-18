//
//  PropertyTag.swift
//
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import DataStream

/// [MS-OXCDATA] 2.9 PropertyTag Structure
/// A property tag both identifies a property and gives the data type its value.
public struct PropertyTag: CustomStringConvertible {
    public let type: PropertyType
    public let id: UInt16

    public init(dataStream: inout DataStream) throws {
        /// PropertyType (2 bytes): An unsigned integer that identifies the data type of the property value, as specified by the table in section 2.11.1.
        let typeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        if let type = PropertyType(rawValue: typeRaw) {
            self.type = type
        } else {
            self.type = .unknown
        }

        /// PropertyId (2 bytes): An unsigned integer that identifies the property.
        self.id = try dataStream.read(endianess: .littleEndian)
    }
    
    public var idString: String {
        if let knownId = PropertyId(rawValue: id) {
            return "\(knownId)"
        } else if id >= 0x8000 {
            return "Named property \(id.hexString)"
        } else {
            return "Unknown property: \(id.hexString)"
        }
    }
    
    public var description: String {
        return "PropertyId.\(idString) (\(type))"
    }
    
    public var dataSize: UInt32 {
        return 4
    }
    
    public func write(to dataStream: inout OutputDataStream) {
        dataStream.write(type.rawValue, endianess: .littleEndian)
        dataStream.write(id, endianess: .littleEndian)
    }
}
