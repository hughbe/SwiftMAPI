//
//  PredecessorChangeList.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import DataStream

/// [MS-OXCFXICS] 2.2.2.3 PredecessorChangeList Structure
/// The PredecessorChangeList structure contains a set of XID structures, as specified in section
/// 2.2.2.2, that identify change numbers of messaging objects in different replicas (1). The order of
/// the XIDs does not have significance for interpretation, but is significant for serialization and
/// deserialization. The set of XIDs MUST be serialized without padding as an array of SizedXid
/// structures binary-sorted by the value of NamespaceGuid field of the XID structure in the ascending
/// order.
public struct PredecessorChangeList: Collection, CustomStringConvertible {
    public var values: [XID]
    
    public init(dataStream: inout DataStream) throws {
        values = []

        while dataStream.position < dataStream.count {
            let sizedXid = try SizedXid(dataStream: &dataStream)
            values.append(sizedXid.xid)
        }
        
        assert(dataStream.remainingCount == 0, "Expected to read everything")
    }
    
    public func makeIterator() -> IndexingIterator<[XID]> {
        return values.makeIterator()
    }

    public var startIndex: Int {
        return values.startIndex
    }

    public var endIndex: Int {
        return values.endIndex
    }

    public subscript(index: Int) -> XID {
        return values[index]
    }

    public func index(after i: Int) -> Int {
        return values.index(after: i)
    }
    
    public var description: String {
        var s = "[\n"
        for entry in values.enumerated() {
            s += "\t - [\(entry.offset)] \(entry.element)\n"
        }
        s += "]"
        return s
    }
    
    /// [MS-OXCFXICS] 2.2.2.3.1 SizedXid Structure
    public struct SizedXid {
        public var size: UInt8
        public var xid: XID
        
        public init(dataStream: inout DataStream) throws {
            /// XidSize (1 byte): An unsigned 8-bit integer that specifies the length of the XID field, in bytes.
            size = try dataStream.read()
            
            /// XID (variable): An XID structure, as specified in section 2.2.2.2, that contains the value of the
            /// internal identifier of an object, or internal or external identifier of a change number. The length
            /// of this field is specified by the XidSize field, in bytes.
            xid = try XID(dataStream: &dataStream, size: Int(size))
        }
    }
}
