//
//  DisplayType.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXNSPI] 2.2.1.3 Display Type Values
/// The values listed in this section are used to specify display types. They appear in various places in the Exchange Server NSPI Protocol
/// as object properties and as part of EntryIDs. Except where otherwise specified in the following table, all Exchange NSPI servers MUST
/// recognize and be capable of accepting and returning these display types. The following table lists the permitted display type values for the
/// Exchange Server NSPI Protocol.
/// All clients and servers MUST NOT use any other display types.
public enum DisplayType: UInt32 {
    /// A typical messaging user.
    case mailUser = 0x00000000
    
    /// A distribution list.
    case distributionList = 0x00000001
    
    /// A forum, such as a bulletin board service or a public or shared folder.
    case forum = 0x00000002
    
    /// An automated agent, such as Quote-Of-The-Day or a weather chart display.
    case agent = 0x00000003
    
    /// An Address Book object defined for a large group, such as helpdesk, accounting, coordinator, or department. Department objects
    /// usually have this display type. An Exchange NSPI server MUST NOT return display type.
    case organization = 0x00000004
    
    /// A private, personally administered distribution list.
    case privateDistributionList = 0x00000005
    
    /// An Address Book object known to be from a foreign or remote messaging system.
    case remoteMailUser = 0x00000006
    
    /// An address book hierarchy table container. An Exchange NSPI server MUST NOT return this display type except as part of an EntryID
    /// of an object in the address book hierarchy table.
    case container = 0x00000100
    
    /// A display template object. An Exchange NSPI server MUST NOT return this display type.
    case template = 0x00000101
    
    /// An address creation template. An Exchange NSPI server MUST NOT return this display type except as part of an EntryID of an object
    /// in the Address Creation Table.
    case addressTemplate = 0x00000102
    
    /// A search template. An Exchange NSPI server MUST NOT return this display type.
    case searchTemplate = 0x00000200
}
