//
//  File.swift
//  
//
//  Created by Hugh Bellamy on 23/10/2020.
//

public extension Double {
    init(currency: UInt64) {
        self = Double(currency) / 10000
    }
}
