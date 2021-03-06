//
//  NamedProperty.swift
//  
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import WindowsDataTypes

public struct NamedProperty: Hashable, CustomStringConvertible {
    public let guid: GUID
    public let lid: UInt32?
    public let name: String?
    public let kind: Kind
    
    public init(guid: GUID, lid: UInt32) {
        self.guid = guid
        self.lid = lid
        self.name = nil
        self.kind = .numericalNamed
    }
    
    public init(set: CommonlyUsedPropertySet, lid: UInt32) {
        self.guid = set.guid
        self.lid = lid
        self.name = nil
        self.kind = .numericalNamed
    }
    
    public init(guid: GUID, name: String) {
        self.guid = guid
        self.lid = nil
        self.name = name
        self.kind = .stringNamed
    }
    
    public init(set: CommonlyUsedPropertySet, name: String) {
        self.guid = set.guid
        self.lid = nil
        self.name = name
        self.kind = .stringNamed
    }
    
    public var description: String {
        let setName = CommonlyUsedPropertySet(guid: guid)?.description ?? guid.description
        switch kind {
        case .numericalNamed:
            return "\(lid!.hexString) (\(setName))"
        case .stringNamed:
            return "\"\(name!)\" (\(setName))"
        }
    }

    public enum Kind {
        case numericalNamed
        case stringNamed
    }
}
