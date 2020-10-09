//
//  AddressBookEntryType.swift
//  
//
//  Created by Hugh Bellamy on 08/10/2020.
//

/// Type (4 bytes): An integer representing the type of the object. It MUST be one of the values from the following table.
public enum AddressBookEntryType: UInt32 {
    /// 0x00000000 %x00.00.00.00 Local mail user
    case localMailUser = 0x00000000
    
    /// 0x00000001 %x01.00.00.00 Distribution list
    case distributionList = 0x00000001
    
    /// 0x00000002 %x02.00.00.00 Bulletin board or public folder
    case bulletinBoardOrPublicFolder = 0x00000002
    
    /// 0x00000003 %x03.00.00.00 Automated mailbox
    case automatedMailbox = 0x00000003
    
    /// 0x00000004 %x04.00.00.00 Organizational mailbox
    case organizationalMailbox = 0x00000004
    
    /// 0x00000005 %x05.00.00.00 Private distribution list
    case privateDistributionList = 0x00000005
    
    /// 0x00000006 %x06.00.00.00 Remote mail user
    case remoteMailUser = 0x00000006
    
    /// 0x00000100 %x00.01.00.00 Container
    case container = 0x00000100
    
    /// 0x00000101 %x01.01.00.00 Template
    case template = 0x00000101
    
    /// 0x00000102 %x02.01.00.00 One-off user
    case oneOffUser = 0x00000102
    
    /// 0x00000200 %x00.02.00.00 Search
    case search = 0x00000200
}
