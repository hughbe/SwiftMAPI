//
//  TRowSet.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

import DataStream

/// [MS-OXOABKT] 2.2.2.1 Template Format
/// The dialog template consists of a set of rows that are represented by a TRowSet structure, as specified in section 2.2.2.1.1, with each
/// TRow structure, as specified in section 2.2.2.1.2, describing one control in the dialog. To create the dialog from the template, each
/// control that is described in a TRow structure MUST be added to a dialog in the location and with the size specified.
/// The ControlFlags field, as specified in section 2.2.2.1.2, indicates additional information about the control, including whether it is editable.
/// The CNTRL structure, as specified in section 2.2.2.1.3, will indicate which static strings are to be used for the control, and the property
/// that can be used to initialize the control and can be updated if the user edits the value in the control. When a page control is encountered,
/// a new tabbed page is added to the dialog, and the controls that follow the page control are placed on that page.
/// [MS-OXOABKT] 2.2.2.1.1 TRowSet Structure
/// A TRowSet structure is defined in the following table.
public struct TRowSet {
    public let type: UInt32
    public let cRows: UInt32
    public let rows: [TRow]

    public init(dataStream: inout DataStream) throws {
        let position = dataStream.position
        
        /// Type ULONG 4 Type of the template. This MUST be 0x00000001
        self.type = try dataStream.read(endianess: .littleEndian)
        if self.type != 0x00000001 {
            throw MAPIError.corrupted
        }
        
        /// cRows ULONG 4 Count of TRow structures that are defined in this structure. This field MUST be followed by exactly cRows
        /// TRow structures.
        self.cRows = try dataStream.read(endianess: .littleEndian)
        
        /// Row1 TRow structure 36 TRow structure that contains data about a control.
        /// Row2 TRow structure
        /// 36 TRow structure that contains data about a control.
        /// ...
        /// RowN TRow structure 36 Last of cRows TRow structures.
        var rows: [TRow] = []
        rows.reserveCapacity(Int(self.cRows))
        for _ in 0..<self.cRows {
            let row = try TRow(dataStream: &dataStream, rowSetBasePosition: position)
            rows.append(row)
        }
        
        self.rows = rows
    }
}
