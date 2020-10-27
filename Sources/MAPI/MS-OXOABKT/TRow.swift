//
//  TRow.swift
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
/// [MS-OXOABKT] 2.2.2.1.2 TRow Structure
/// Each TRow structure describes a control that MUST be presented to the user in a display area. The display area is measured in pixels.
/// A TRow structure is defined in the following table.
/// XPos and YPos specify the X and Y coordinates of the upper-left corner of the control in pixels in the display area.
/// DeltaX and DeltaY specify the width and height of the control in pixels. The values are relative to the XPos and YPos of the control.
/// The other three properties describe various characteristics of the control.
/// The ControlType field indicates the type of control. The ControlType field MUST be one of the values listed in the following table.
/// The ControlFlags field is a bit field that describes the attributes of the control and MUST contain any combination of the bits that are
/// specified in the following table for all values of the ControlType field, except for 0x00000008 (tabbed page control), as specified in the
/// Description column. If the value of ControlType is 0x00000008, then the value of the ControlFlags field can be any value and MUST be
/// ignored.
/// The ControlStructure field is a CNTRL structure that contains information that is relevant to the particular type of control. For details,
/// see section 2.2.2.1.3.
public struct TRow {
    public let xPos: UInt32
    public let deltaX: UInt32
    public let yPos: UInt32
    public let deltaY: UInt32
    public let controlType: DisplayTableControlType
    public let controlFlags: DisplayTableControlFlags
    public let controlStructure: CNTRL
    
    public init(dataStream: inout DataStream, rowSetBasePosition: Int) throws {
        /// XPos ULONG 4 X coordinate of the upper-left corner of the control. For more details, see the text that follows this table.
        self.xPos = try dataStream.read(endianess: .littleEndian)
        
        /// DeltaX ULONG 4 Width of the control. For more details, see the text that follows this table.
        self.deltaX = try dataStream.read(endianess: .littleEndian)
        
        /// YPos ULONG 4 Y coordinate of the upper-left corner of the control. For more details, see the text that follows this table.
        self.yPos = try dataStream.read(endianess: .littleEndian)
        
        /// DeltaY ULONG 4 Height of the control. For more details, see the text that follows this table.
        self.deltaY = try dataStream.read(endianess: .littleEndian)
        
        /// ControlType ULONG 4 Type of the control. For more details, see the text that follows this table.
        let controlTypeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        guard let controlType = DisplayTableControlType(rawValue: controlTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.controlType = controlType
        
        /// ControlFlags ULONG 4 Flags that describe the control's attributes. For more details, see the text that follows this table.
        let controlFlagsRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.controlFlags = DisplayTableControlFlags(rawValue: controlFlagsRaw)
        
        /// ControlStructure CNTRL structure 12 Structure that contains data that is relevant to a particular control type.
        /// For more details, see section 2.2.2.1.3.
        self.controlStructure = try CNTRL(dataStream: &dataStream, rowSetBasePosition: rowSetBasePosition)
    }
}
