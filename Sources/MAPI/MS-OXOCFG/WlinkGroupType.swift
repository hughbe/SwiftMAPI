//
//  WlinkGroupType.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

/// [MS-OXOCFG] 2.2.9.19 PidTagWlinkROGroupType Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagWlinkROGroupType property ([MS-OXPROPS] section 2.1069) specifies the type of
/// group header. If the property does not exist, the client SHOULD<33> assume a value of -1. The
/// possible values are listed in the following table.
public enum WlinkGroupType: Int32 {
    /// None.
    case undefined = -1
    
    /// Group contains shortcuts to users in his department.
    case myDepartment = 0
    
    /// Group contains shortcuts to users in another department.
    case otherDepartment = 1
    
    /// Group contains shortcuts to users in his direct reporting group.
    case directReportGroup = 2
    
    /// Group contains shortcuts to coworkers of the user.
    case coworkerGroup = 3
    
    /// Group contains shortcuts to members of a distribution list.
    case distributionList = 4
}
