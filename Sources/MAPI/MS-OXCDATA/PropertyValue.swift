//
//  PropertyValue.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

/// [MS-OXCDATA] 2.11.2 Property Value Structures
/// The PropertyValue structure, as specified in section 2.11.2.1, specifies the value of the property. It contains no information
/// about the property type or id.
/// The PropertyValue_r structure, as specified in [MS-NSPI], is an encoding of the PropertyValue data structure. For property
/// values with uninterpreted byte values, the permissible number of bytes in the PropertyValue_r structure exceeds that of the
/// PropertyValue data structure, as specified in [MS-NSPI]. For property values with multiple values, the permissible number
/// of values in the PropertyValue_r structure exceeds that of the PropertyValue data structure. The semantic meaning is otherwise
/// unchanged from the PropertyValue data structure.
/// [MS-OXCDATA] 2.11.2.1 PropertyValue Structure
public struct PropertyValue {
    public let propertyValue: Any?
    
    public init(dataStream: inout DataStream, type: PropertyType, standard: Bool) throws {
        
        func readMultipleValues<T>(readFunc: (inout DataStream) throws -> T) throws -> [T] {
            let count = try dataStream.readCOUNT(standard: standard)
            var results: [T] = []
            results.reserveCapacity(Int(count))
            for _ in 0..<count {
                let result = try readFunc(&dataStream)
                results.append(result)
            }
            
            return results
        }
        
        switch type {
        case .unspecified:
            self.propertyValue = nil
        case .null:
            self.propertyValue = nil
        case .integer16:
            self.propertyValue = try dataStream.read(endianess: .littleEndian) as UInt16
        case .integer32:
            self.propertyValue = try dataStream.read(endianess: .littleEndian) as UInt32
        case .floating32:
            self.propertyValue = try dataStream.readFloat(endianess: .littleEndian)
        case .floating64:
            self.propertyValue = try dataStream.readDouble(endianess: .littleEndian)
        case .currency:
            self.propertyValue = Double(currency: try dataStream.read(endianess: .littleEndian))
        case .floatingTime:
            self.propertyValue = Date(floatingTime: try dataStream.readDouble(endianess: .littleEndian))
        case .errorCode:
            self.propertyValue = try dataStream.read(endianess: .littleEndian) as UInt32
        case .boolean:
            self.propertyValue = try dataStream.read(endianess: .littleEndian) as UInt8 != 0
        case .objectOrEmbeddedTable:
            fatalError("NYI: PTypObjectOrEmbeddedTable")
        case .integer64:
            self.propertyValue = try dataStream.read(endianess: .littleEndian) as UInt64
        case .string8:
            self.propertyValue = try dataStream.readAsciiString()
        case .string:
            self.propertyValue = try dataStream.readUnicodeString(endianess: .littleEndian)
        case .time:
            self.propertyValue = try FILETIME(dataStream: &dataStream).date
        case .guid:
            self.propertyValue = try GUID(dataStream: &dataStream)
        case .serverId:
            let _ = try dataStream.readCOUNT(standard: standard)
            self.propertyValue = try ServerId(dataStream: &dataStream)
        case .restriction:
            self.propertyValue = try Restriction(dataStream: &dataStream, standard: standard)
        case .ruleAction:
            self.propertyValue = try readMultipleValues { try RuleAction(dataStream: &$0, standard: standard) }
        case .binary:
            let count = try dataStream.readCOUNT(standard: standard)
            self.propertyValue = Data(try dataStream.readBytes(count: Int(count)))
        case .multipleInteger16:
            self.propertyValue = try readMultipleValues { try $0.read(endianess: .littleEndian) as UInt16 }
        case .multipleInteger32:
            self.propertyValue = try readMultipleValues { try $0.read(endianess: .littleEndian) as UInt32 }
        case .multipleFloating32:
            self.propertyValue = try readMultipleValues { try $0.readFloat(endianess: .littleEndian) }
        case .multipleFloating64:
            self.propertyValue = try readMultipleValues { try $0.readDouble(endianess: .littleEndian) }
        case .multipleCurrency:
            self.propertyValue = try readMultipleValues { Double(currency: try $0.read(endianess: .littleEndian)) }
        case .multipleFloatingTime:
            self.propertyValue = try readMultipleValues { Date(floatingTime: try $0.readDouble(endianess: .littleEndian)) }
        case .multipleInteger64:
            self.propertyValue = try readMultipleValues { try $0.read(endianess: .littleEndian) as UInt64 }
        case .multipleString8:
            self.propertyValue = try readMultipleValues { try $0.readAsciiString() }
        case .multipleString:
            self.propertyValue = try readMultipleValues { try $0.readUnicodeString(endianess: .littleEndian) }
        case .multipleTime:
            self.propertyValue = try readMultipleValues { try FILETIME(dataStream: &$0).date }
        case .multipleGuid:
            self.propertyValue = try readMultipleValues { try GUID(dataStream: &$0) }
        case .multipleBinary:
            self.propertyValue = try readMultipleValues { (dataStream) -> Data in
                let count = try dataStream.readCOUNT(standard: standard)
                return Data(try dataStream.readBytes(count: Int(count)))
            }
        case .unknown:
            self.propertyValue = nil
        }
    }
}

fileprivate extension DataStream {
    mutating func readCOUNT(standard: Bool) throws -> UInt32 {
        if standard {
            return UInt32(try read(endianess: .littleEndian) as UInt16)
        } else {
            return try read(endianess: .littleEndian)
        }
    }
}
