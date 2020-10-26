//
//  PropertyName.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.6 Property Name Structures
/// The PropertyName structure, as specified in section 2.6.1, describes a named property. It is used in RopGetPropertyIdsFromNames
/// ([MS-OXCROPS] section 2.2.8.1) and RopGetNamesFromPropertyIds ([MS-OXCROPS] section 2.2.8.2) ROP requests.
/// The PropertyName_r structure, specified in [MS-NSPI], is an encoding of the PropertyName data structure. Strictly speaking,
/// both the PropertyName_r structure and the PropertyName structure are distinct encodings of the same abstract data structure
/// rather than PropertyName_r being an encoding of PropertyName. In this case, the semantics of the PropertyName_r structure is
/// different from the PropertyName structure; PropertyName_r uses no string names, only long IDs (LIDs). The packet diagrams in
/// sections 2.6.1 and 2.6.2 illustrate the differences between the two structures.
/// [MS-OXCDATA] 2.6.1 PropertyName Structure
public struct PropertyName {
    public let kind: Kind
    public let guid: FlatUID
    public let lid: UInt32?
    public let nameSize: UInt8?
    public let name: String?
    
    public init(dataStream: inout DataStream) throws {
        /// Kind (1 byte): The possible values for the Kind field are in the following table.
        let kindRaw: UInt8 = try dataStream.read()
        guard let kind = Kind(rawValue: kindRaw) else {
            throw MAPIError.corrupted
        }
        
        self.kind = kind
        
        /// GUID (16 bytes): The GUID that identifies the property set for the named property. Note The GUID field is treated as
        /// a FlatUID structure, as specified in section 2.5.1, and consequently is always in little-endian byte order. Client code
        /// on big-endian systems is therefore required to place GUID fields in little-endian byte order in the request buffer.
        self.guid = try FlatUID(dataStream: &dataStream)
        
        /// LID (optional) (4 bytes): This field is present only if the value of the Kind field is equal to 0x00. An unsigned integer
        /// that identifies the named property within its property set.
        if kind == .identifiedByLIDField {
            self.lid = try dataStream.read(endianess: .littleEndian)
        } else {
            self.lid = nil
        }
        
        /// NameSize (optional) (1 byte): The value of this field is equal to the number of bytes in the Name
        /// string that follows it. This field is present only if the value of the Kind field is equal to 0x01.
        if self.kind == .identifiedByNameField {
            self.nameSize = try dataStream.read()
        } else {
            self.nameSize = nil
        }
        
        /// Name (optional) (variable): This field is present only if Kind is equal to 0x01. The value is a Unicode (UTF-16 format)
        /// string, followed by two zero bytes as terminating null characters, that identifies the property within its property set.
        if self.kind == .identifiedByNameField {
            self.name = try dataStream.readString(count: Int(self.nameSize!), encoding: .utf16LittleEndian)
        } else {
            self.name = nil
        }
    }
    
    public enum Kind: UInt8 {
        case identifiedByLIDField = 0x00
        case identifiedByNameField = 0x01
        case noAssociatedField = 0xFF
    }
}
