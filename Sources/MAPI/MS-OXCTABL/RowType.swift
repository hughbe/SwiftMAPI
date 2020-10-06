//
//  RowType.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OCTABL] 2.2.1.3 PidTagRowType
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagRowType property ([MS-OXPROPS] section 2.940) identifies the type of the row. The
/// possible values are given in the following table.
public enum RowType: UInt32 {
    /// The row is a row of data.
    case row = 0x00000001
    
    /// The row is a header row with no rows inside the category.
    case emptyCategory = 0x00000002
    
    /// The row is a header row that is expanded.
    case headerRowExpanded = 0x00000003
    
    /// The row is a header row that is collapsed.
    case headerRowCollapsed = 0x00000004
}
