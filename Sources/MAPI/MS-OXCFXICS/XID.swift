//
//  XID.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream
import Foundation

/// [MS-OXCFXICS] 2.2.2.2 XID Structure
/// An XID structure contains an external identifier for an entity within a message store.
public struct XID: CustomStringConvertible {
    public var namespaceGuid: UUID
    public var localId: [UInt8]
    
    public init(dataStream: inout DataStream, size: Int) throws {
        /// NamespaceGuid (16 bytes): A 128-bit GUID. This field identifies the namespace of the LocalId field.
        self.namespaceGuid = try dataStream.readGUID(endianess: .littleEndian)
        
        /// LocalId (variable): A variable binary value. This field contains the ID of the entity in the namespace
        /// specified by the NamespaceGuid field. This field has a minimum length of 1 byte and a maximum
        /// length of 8 bytes.
        /// For more details about GID structures, which are a subtype of an XID structure, see [MS-OXCDATA]
        /// section 2.2.1.3. For GIDs, the DatabaseGuid field maps to the NamespaceGuid field, and the
        /// GlobalCounter field maps to the LocalId field.
        /// All XID structures that have the same value for their NamespaceGuid fields MUST have LocalId
        /// fields of the same length. However, the size of the value specified by the LocalId field cannot be
        /// determined by examining the value of the NamespaceGuid field and MUST be provided externally. In
        /// most cases, XIDs are present within other structures that specify information about the size of the
        /// XID, such as the SizedXid structure, as specified in section 2.2.2.3.1, or the propValue element, as
        /// specified in section 2.2.4.3.21.
        self.localId = try dataStream.readBytes(count: size - 16)
    }
    
    public var description: String {
        return "XID(namespaceGuid: \(namespaceGuid), localId: \(localId.hexString))"
    }
}
