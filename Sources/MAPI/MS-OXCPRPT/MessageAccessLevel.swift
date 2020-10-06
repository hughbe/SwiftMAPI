//
//  MessageAccessLevel.swift
//  
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXCPRPT] 2.2.1.2 PidTagAccessLevel Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagAccessLevel property ([MS-OXPROPS] section 2.501) indicates the client's access level to
/// the object. This property does not apply to Folder objects and Logon objects. This value of this
/// property MUST be one of the values in the following table. This property is read-only for the client.
public enum MessageAccessLevel: UInt32 {
    case readOnly = 0x00000000
    case modify = 0x00000001
}
