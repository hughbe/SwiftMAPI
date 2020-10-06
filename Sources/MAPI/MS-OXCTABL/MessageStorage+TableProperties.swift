//
//  MessageStorage+TableProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXCTABL] 2.2 Message Syntax
/// Unless otherwise specified, field sizes in this section are expressed in bytes.
/// [MS-OXCTABL] 2.2.1 Table-Specific Properties
/// The following properties can be included in the column set of a table for the purpose of collapsing
/// and expanding categories. The following properties are used by the client but are produced by the
/// server. For more details about these properties, see [MS-OXPROPS].
public extension MessageStorage {
    /// [MS-OXCTABL] 2.2.1.1 PidTagInstID
    /// Data type: PtypInteger64 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInstID property ([MS-OXPROPS] section 2.745) is an identifier for all instances of a row
    /// in the table. When a RopGetCollapseState ROP request ([MS-OXCROPS] section 2.2.5.18) is sent,
    /// the client passes this property value in the RowId field, as specified in [MS-OXCROPS] section
    /// 2.2.5.18.1, to specify a cursor to store. When the PidTagInstID property is included in the column
    /// set, the server sets the property to the same value for each row that is an instance of the same
    /// underlying data.
    var instID: UInt64? {
        return getProperty(id: .tagInstID)
    }

    /// [MS-OXCTABL] 2.2.1.2 PidTagInstanceNum
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagInstanceNum property ([MS-OXPROPS] section 2.744) is an identifier for a single
    /// instance of a row in the table. When a RopGetCollapseState ROP request ([MS-OXCROPS] section
    /// 2.2.5.18) is sent, the client passes this property value in the RowInstanceNumber field to specify a
    /// cursor to store. When this property is included in the column set, the server sets it to a different
    /// value for each row that is an instance of the same underlying data.
    var instanceNum: UInt32? {
        return getProperty(id: .tagInstanceNum)
    }
    
    /// [MS-OCTABL] 2.2.1.3 PidTagRowType
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagRowType property ([MS-OXPROPS] section 2.940) identifies the type of the row. The
    /// possible values are given in the following table.
    var rowType: RowType? {
        guard let rawValue: UInt32 = getProperty(id: .tagRowType) else {
            return nil
        }
        
        return RowType(rawValue: rawValue)
    }
    
    /// [MS-OCTABL] 2.2.1.4 PidTagDepth
    /// Data type: PtypInteger32 property ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDepth property ([MS-OXPROPS] section 2.673) specifies the number of nested
    /// categories in which a given row is contained. For example, if a row is contained within two header
    /// rows, its depth is 0x0002. When a table contains no categories, all rows will have a depth of 0x0000.
    /// [MS-OXOABK] 2.2.2.2 PidTagDepth
    /// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDepth property ([MS-OXCTABL] section 2.2.1.4) represents the relative level of depth of
    /// a container in a hierarchy table. Objects in the hierarchy table that share the same value for the
    /// PidTagDepth property SHOULD be considered peer containers by clients if they are adjacent or if
    /// they are separated only by containers that have equivalent or larger depth values.
    /// Because this property applies to a container in the hierarchy table, it is not present on objects in an
    /// offline address book (OAB). An OAB has its own structure for maintaining the hierarchy, using the
    /// OAB Public Folder Retrieval Protocol, as specified in [MS-OXPFOAB].
    var depth: UInt32? {
        return getProperty(id: .tagDepth)
    }
}
