//
//  StoreEntryIDWrappedProviderData.swift
//  
//
//  Created by Hugh Bellamy on 05/02/2021.
//

import DataStream

public protocol StoreEntryIDWrappedProviderData {
    init(dataStream: inout DataStream, size: Int) throws
    var dataSize: Int { get }
    func write(to dataStream: inout OutputDataStream)
}
