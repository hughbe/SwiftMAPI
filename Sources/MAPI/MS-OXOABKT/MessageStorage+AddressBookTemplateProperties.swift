//
//  MessageStorage+AddressBookTemplateProperties.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

import DataStream
import Foundation

public extension MessageStorage {
    /// [MS-OXOABKT] Binary property that contains a TRowSet structure followed by data that is pointed to in the TRowSet structure
    /// (the Template format is specified in section 2.2.2.1).
    var templateData: TRowSet? {
        guard let data: Data = getProperty(id: .tagTemplateDataOrTagAcknowledgementMode) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? TRowSet(dataStream: &dataStream)
    }
}
