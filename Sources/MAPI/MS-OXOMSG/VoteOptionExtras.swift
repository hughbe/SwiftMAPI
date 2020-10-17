//
//  VoteOptionExtras.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXOMSG] 2.2.1.74.2 VoteOptionExtras Structure
/// Each element contains additional information about the corresponding VoteOption structure (section 2.2.1.74.1).
/// The format is shown in the following diagram.
public struct VoteOptionExtra {
    public let displayNameCount: UInt8
    public let displayName: String
    public let displayNameCountRepeat: UInt8
    public let displayNameRepeat: String
    
    public init(dataStream: inout DataStream) throws {
        /// DisplayNameCount (1 byte):The COUNT ([MS-OXCDATA] section 2.11.1) of Unicode characters
        /// (not bytes) in the DisplayName field.
        self.displayNameCount = try dataStream.read()
        
        /// DisplayName (variable): The display name of this voting option, as a Unicode string without a null
        /// terminator.
        self.displayName = try dataStream.readString(count: Int(self.displayNameCount) * 2, encoding: .utf16LittleEndian)!
        
        /// DisplayNameCountRepeat (1 byte): The COUNT of characters in the DisplayNameRepeat field.
        /// MUST have the same value as the DisplayNameCount field.
        self.displayNameCountRepeat = try dataStream.read()
        
        /// DisplayNameRepeat (variable): A duplicate instance of the display name, as a Unicode string
        /// without a null terminator. MUST have the same value as the DisplayName field.
        self.displayNameRepeat = try dataStream.readString(count: Int(self.displayNameCountRepeat) * 2, encoding: .utf16LittleEndian)!
    }
}
