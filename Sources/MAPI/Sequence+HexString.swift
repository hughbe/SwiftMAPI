//
//  Sequence+HexString.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

public extension Sequence where Element: FixedWidthInteger {
    var hexString: String {
        return "[\(map { $0.hexString }.joined(separator: ", "))]"
    }
}
