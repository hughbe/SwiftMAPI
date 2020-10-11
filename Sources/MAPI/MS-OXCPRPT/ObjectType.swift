//
//  ObjectType.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCPRPT] 2.2.1.7 PidTagObjectType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagObjectType property ([MS-OXPROPS] section 2.807) indicates the type of Server
/// object. This property does not apply to Folder objects and Logon objects. The value of this
/// property MUST be one of the values in the following table. This property is read-only for the client.
public enum ObjectType: UInt32 {
    case storeObject = 0x00000001
    case addressBookObject = 0x00000002
    case folder = 0x00000003
    case addressBookContainer = 0x00000004
    case message = 0x00000005
    case mailUser = 0x00000006
    case attachment = 0x00000007
    case distributionList = 0x00000008
}
