//
//  DisplayTableControlFlags.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

/// Contains a bitmask of flags governing the behavior of a control used in a dialog box built from a display table.
/// One or more of the following flags can be set for this property:
/// This property is stored in the ulCtlFlags member of a control's DTCTL structure. Most of the control flags apply to all of the
/// controls that allow user input; a few apply only to the edit control. Controls that do not allow user input, such as a button or a label,
/// set 0 for their control flags.
/// Many of the flag values are self-explanatory. For example, when DT_REQUIRED is set for a control, it must contain a value before
/// the dialog box is allowed to be dismissed. Either the service provider can supply a value through its IMAPIProp implementation or the user
/// can enter one. DT_EDITABLE indicates that the value for the control can be modified. DT_MULTILINE allows the value for an edit control to
/// span multiple lines.
/// Some control flags are not so obvious in their meaning. When a control sets the DT_SET_IMMEDIATE flag, any changes to its value take
/// affect as soon as the user moves to a new control. MAPI makes a single call to the property interface's IMAPIProp::SetProps method for
/// the control's property. This is different from the default behavior, which is to postpone having changes to control values take effect until
/// after the user selects the OK button or dismisses the dialog box. The DT_SET_IMMEDIATE flag is often used in combination with display
/// table notifications.
/// The following table lists the types of controls and all of the flag values that can be set for each type.
/// Control Valid values for this property
/// Button Must be zero
/// Check box DT_EDITABLE, DT_SET_IMMEDIATE
/// Combo box DT_EDITABLE, DT_REQUIRED, DT_SET_IMMEDIATE
/// Drop-down list box DT_EDITABLE, DT_SET_IMMEDIATE
/// Edit DT_ACCEPT_DBCS, DT_MULTILINE, DT_EDITABLE, DT_PASSWORD_EDIT, DT_REQUIRED, DT_SET_IMMEDIATE
/// Group box Must be zero
/// Label Must be zero
/// List box Must be zero
/// Multivalue drop-down list box Must be zero
/// Multivalue list box Must be zero
/// Tabbed page Must be zero
/// Radio button
/// Must be zero
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontrolflags-canonical-property
public struct DisplayTableControlFlags: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// DT_MULTILINE
    /// The edit control can contain multiple lines. This means a return character can be entered within the control. This flag is valid for edit controls only.
    public static let multiline = DisplayTableControlFlags(rawValue: 0x00000001)
    
    /// DT_EDITABLE
    /// The control can be edited; the value associated with the control can be changed. When this flag is not set, the control is read-only.
    /// This value is ignored on label, group box, standard push button, multivalued drop down list box and list box controls.
    public static let editable = DisplayTableControlFlags(rawValue: 0x00000002)
    
    /// DT_REQUIRED
    /// If the control allows changes (DT_EDITABLE), it must have a value before IMAPIProp::SaveChanges is called.
    public static let required = DisplayTableControlFlags(rawValue: 0x00000004)
    
    /// DT_SET_IMMEDIATE
    /// Enables immediate setting of a value; as soon as a value in the control changes, MAPI calls the SetProps method for the property
    /// associated with that control. When this flag is not set, the values are set when the dialog box is dismissed.
    public static let setImmediate = DisplayTableControlFlags(rawValue: 0x00000008)
    
    /// DT_PASSWORD_EDIT
    /// Applies to edit controls. The edit control is treated like a password. The value is displayed using asterisks instead of echoing
    /// the actual characters entered.
    public static let passwordEdit = DisplayTableControlFlags(rawValue: 0x00000010)
    
    /// DT_ACCEPT_DBCS The control can have Double-Byte Character Set (DBCS) characters in it. This flag is used with edit controls.
    /// It allows multiple-byte character sets.
    public static let acceptDBCS = DisplayTableControlFlags(rawValue: 0x00000020)
    
    /// DT_SET_SELECTION
    /// When a selection is made within the list box, the index column of that list box is set as a property. Always used with
    /// DT_SET_IMMEDIATE.
    public static let setSelection = DisplayTableControlFlags(rawValue: 0x00000040)

    public static let all: DisplayTableControlFlags = [.multiline, .editable, .required, .setImmediate, .passwordEdit, .acceptDBCS, .setSelection]
}
