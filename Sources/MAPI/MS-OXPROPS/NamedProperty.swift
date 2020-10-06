//
//  NamedProperty.swift
//  
//
//  Created by Hugh Bellamy on 07/09/2020.
//

import Foundation

public struct NamedProperty: Hashable, CustomStringConvertible {
    public let guid: UUID
    public let lid: UInt32?
    public let name: String?
    public let kind: Kind
    
    public init(guid: UUID, lid: UInt32) {
        self.guid = guid
        self.lid = lid
        self.name = nil
        self.kind = .numericalNamed
    }
    
    public init(set: CommonlyUsedPropertySet, lid: UInt32) {
        self.guid = set.uuid
        self.lid = lid
        self.name = nil
        self.kind = .numericalNamed
    }
    
    public init(guid: UUID, name: String) {
        self.guid = guid
        self.lid = nil
        self.name = name
        self.kind = .stringNamed
    }
    
    public init(set: CommonlyUsedPropertySet, name: String) {
        self.guid = set.uuid
        self.lid = nil
        self.name = name
        self.kind = .stringNamed
    }
    
    public var description: String {
        var s = "NamedProperty(Guid: \(guid), "
        switch kind {
        case .numericalNamed:
            s += "LID: \(lid!.hexString)"
        case .stringNamed:
            s += "Name: \(name!)"
        }
        
        s += ")"
        return s
    }

    public enum Kind {
        case numericalNamed
        case stringNamed
    }
}
