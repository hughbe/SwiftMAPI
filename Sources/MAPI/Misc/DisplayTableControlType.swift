//
//  DisplayTableControlType.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontroltype-canonical-property
public enum DisplayTableControlType: UInt32 {
    /// DTCT_LABEL A dialog label.
    case label = 0x00000000
    
    /// DTCT_EDIT A dialog edit text box.
    case edit = 0x00000001
    
    /// DTCT_LBX A dialog list box.
    case listBox = 0x00000002
    
    /// DTCT_COMBOBOX A dialog combo box.
    case comboBox = 0x00000003
    
    /// DTCT_DDLBX A dialog drop-down list box.
    case dropDownListBox = 0x00000004
    
    /// DTCT_CHECKBOX A dialog check box.
    case checkBox = 0x00000005
    
    /// DTCT_GROUPBOX A dialog group box.
    case groupBox = 0x00000006
    
    /// DTCT_BUTTON A dialog button control.
    case button = 0x00000007
    
    /// DTCT_PAGE A dialog tabbed page.
    case page = 0x00000008
    
    /// DTCT_RADIOBUTTON A dialog radio button.
    case radioButton = 0x00000009
    
    /// DTCT_MVLISTBOX A multivalued list box populated by a multivalued property of type string.
    case multiValuedListBox = 0x0000000B
    
    /// DTCT_MVDDLBX A multivalued drop-down list box populated by a multivalued property of type string.
    case multiValuedDropDownListBox = 0x0000000C
}
