//
//  StoreObjectType.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import Foundation

/// ObjectType (2 bytes): An unsigned integer indicating the type of Store object to which the EntryID corresponds.
/// The object types and their associated values are specified in the following table.
public enum StoreObjectType: UInt16 {
    /// PrivateFolder (eitLTPrivateFolder) 0x0001 %x01.00
    case privateFolder = 0x0001
    
    /// PublicFolder (eitLTPublicFolder) 0x0003 %x03.00
    case publicFolder = 0x0003
    
    /// MappedPublicFolder<2> (eitLTWackyFolder) 0x0005 %x05.00
    case mappedPublicFolder = 0x0005
    
    /// PrivateMessage (eitLTPrivateMessage) 0x0007 %x07.00
    case privateMessage = 0x0007
    
    /// PublicMessage (eitLTPublicMessage) 0x0009 %x09.00
    case publicMessage = 0x0009
    
    /// MappedPublicMessage<3> (eitLTWackyMessage) 0x000B %x0B.00
    case mappedPublicMessage = 0x000B
    
    /// PublicNewsgroupFolder (eitLTPublicFolderByName) 0x000C %x0C.00
    case publicNewsgroupFolder = 0x000C
}
