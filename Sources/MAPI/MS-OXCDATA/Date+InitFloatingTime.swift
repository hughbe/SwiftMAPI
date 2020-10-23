//
//  Date+InitFloatingTime.swift
//  
//
//  Created by Hugh Bellamy on 23/10/2020.
//

import Foundation

public extension Date {
    // All OA dates must be greater than (not >=) OADateMinAsDouble
    private static let OADateMinAsDouble = -657435.0;

    // All OA dates must be less than (not <=) OADateMaxAsDouble
    private static let OADateMaxAsDouble = 2958466.0

    init?(floatingTime: Double) {
        if floatingTime >= Date.OADateMaxAsDouble || floatingTime <= Date.OADateMinAsDouble {
            return nil
        }
        
        print("NYI: Date(floatingTime: Double)")
        return nil
    }
}
