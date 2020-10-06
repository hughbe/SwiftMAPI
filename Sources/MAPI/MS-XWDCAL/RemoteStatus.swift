//
//  RemoteStatus.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-XWDCAL] 2.2.7.62 PidLidRemoteStatus
/// DAV property name: http://schemas.microsoft.com/mapi/remotestatus
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
/// The PidLidRemoteStatus property ([MS-OXPROPS] section 2.228) gets or sets a value that indicates the remote status of the calendar item.
/// The following table lists the valid values for this property.
public enum RemoteStatus: UInt32 {
    /// No status
    case noStatus = 0
    
    /// Unmarked
    case unmarked = 1
    
    /// Marked for download
    case markedForDownload = 2
    
    /// Marked for copy
    case markedForCopy = 3
    
    /// Marked for delete
    case markedForDelete = 4
}
