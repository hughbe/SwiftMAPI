//
//  MessageStorage.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import WindowsDataTypes

public protocol MessageStorage {
    func getProperty<T>(id: UInt16) -> T?
    func getProperty<T>(name: NamedProperty) -> T?
}

public extension MessageStorage {
    func getProperty<T>(id: PropertyId) -> T? {
        return getProperty(id: id.rawValue)
    }
    
    func getProperty<T>(guid: GUID, lid: UInt32) -> T? {
        return getProperty(name: NamedProperty(guid: guid, lid: lid))
    }
    
    func getProperty<T>(set: CommonlyUsedPropertySet, lid: UInt32) -> T? {
        return getProperty(name: NamedProperty(set: set, lid: lid))
    }
    
    func getProperty<T>(guid: GUID, name: String) -> T? {
        return getProperty(name: NamedProperty(guid: guid, name: name))
    }
    
    func getProperty<T>(set: CommonlyUsedPropertySet, name: String) -> T? {
        return getProperty(name: NamedProperty(set: set, name: name))
    }
}
