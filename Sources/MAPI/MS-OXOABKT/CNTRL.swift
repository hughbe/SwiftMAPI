//
//  CNTRL.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

import DataStream

/// [MS-OXOABKT] 2.2.2.1.3 Buffer Format of the CNTRL Structure
/// The base CNTRL structure is defined as follows, with each entry taking a different meaning, depending on the type of control,
/// as shown in the following table.
/// [MS-OXOABKT] 2.2.2.1.3.1 CNTRL Structure Describing a Label Control
/// dwType: MUST be 0x00000000 and MUST be ignored.
/// ulSize: SHOULD be 0x00000000 and MUST be ignored.
/// ulString: String that contains the label text of a label control. The string MUST NOT be over 128 characters long, including the
/// NULL-terminating character.
/// [MS-OXOABKT] 2.2.2.1.3.2 CNTRL Structure Describing an Edit Control
/// dwType: Property of data entered into the edit control.
/// ulSize: Number of characters allowed to be entered into the edit control.
/// ulString: String that contains a regular expression that describes the allowed characters that can be entered into the edit control
/// (see the following subsection). The string MUST NOT be over 15 characters long, including the NULL-terminating character.
/// [MS-OXOABKT] 2.2.2.1.3.2.1 Expression Syntax for Allowed Characters
/// The filter string has two possible expressions. The first expression allows any character to be entered into the edit control, and this
/// expression is simply a string that contains only the "*" (asterisk) character. The second expression lists the characters that are valid
/// to be entered or that are invalid to be entered into the edit control. This expression is shown in Augmented Backus-Naur Form (ABNF)
/// in the following format:
/// "[" *1("~") 1*(char-val / char-val "-" char-val) "]"
/// The expression MUST be included in square brackets ("[]"). When the first character inside the brackets is the tilde ("~") character,
/// the expression represents characters that are not allowed in the edit control; otherwise, it represents only the characters that are
/// allowed in the edit control. The rest of the characters inside the brackets are characters or ranges of characters to be allowed or
/// disallowed from the edit control.
/// To represent any character that is a special character in this expression syntax with a backslash character ("\"), the backslash character
/// can be placed in front of the character. The backslash character will be ignored, and the character that follows it will be treated as a
/// normal character and not as a special character. To represent a single character to allow/disallow, the character (with the leading backslash
/// if necessary) is put in the string. To represent a range of characters to allow/disallow, the first character in the range is put in the string,
/// followed by a dash ("-") character, followed by the final character in the range. The combination of all individual characters and character
/// ranges is the set of characters that will be allowed or disallowed.
/// For example, if only the characters A, F, and T through Z are allowed to be entered into the control, the expression is:
/// [AFT-Z]
/// If all characters except the"[" (which will need the backslash character) and Z characters are allowed, the expression is:
/// [~\[Z]
/// [MS-OXOABKT] 2.2.2.1.3.3 CNTRL Structure Describing a List Box Control
/// dwType: Property of the table to populate this list box control from and to which the data from this list box control SHOULD be saved.
/// ulSize: SHOULD be 0x00000000 and MUST be ignored.
/// ulString: MUST be a string that contains only the character "*"and MUST be ignored.
/// [MS-OXOABKT] 2.2.2.1.3.4 CNTRL Structure Describing a Check Box Control
/// dwType: Property of data that is represented by this check box control.
/// ulSize: SHOULD be 0x00000000 and MUST be ignored.
/// ulString: String that contains the label text of check box control. The string MUST NOT be over 128 bytes long, including the
/// NULL terminating character.
/// [MS-OXOABKT] 2.2.2.1.3.5 CNTRL Structure Describing a Group Box Control
/// dwType: SHOULD be 0x00000000 and MUST be ignored.
/// ulSize: SHOULD be 0x00000000 and MUST be ignored.
/// ulString: String that contains the label text of the group box control. The string MUST NOT be over 128 bytes long, including the
/// NULL-terminating character.
/// [MS-OXOABKT] 2.2.2.1.3.6 CNTRL Structure Describing a Button Control
/// dwType: Property that is used to perform an action. This value MUST be the PidTagAddressBookManageDistributionList property, as
/// specified in [MS-OXOABK] section
/// [MS-OXOABKT] 2.2.10.2. If this value is anything else, it MUST be ignored.
/// ulSize: MUST be 0x00000000 and MUST be ignored.
/// ulString: String that contains the label text of the button control. The string MUST NOT be greater than 128 bytes in length, including the
/// NULL-terminating character.
/// [MS-OXOABKT] 2.2.2.1.3.7 CNTRL Structure Describing a Tabbed Page Control
/// dwType: SHOULD be 0x00000000 and all other values MUST be ignored.
/// ulSize: SHOULD be 0x00000000 and MUST be ignored.
/// ulString: String that contains the label text of the tabbed page control. The string MUST NOT be greater than 32 bytes in length, including
/// the NULL-terminating character.
/// [MS-OXOABKT] 2.2.2.1.3.8 CNTRL Structure Describing a Multi-Valued List Box Control
/// dwType: Property for multi-valued data that is displayed in this list box control.
/// ulSize: SHOULD be 0x00000000 and MUST be ignored.
/// ulString: MUST be a string that contains only the character "*" and MUST be ignored.
/// [MS-OXOABKT]2.2.2.1.3.9 CNTRL Structure Describing a Multi-Valued Drop-Down List Box Control
/// dwType: Property for the multi-valued data that is displayed in this list box control.
/// ulSize: MUST be ignored.
/// ulString: MUST be a string that contains only the character "*" and MUST be ignored.
public struct CNTRL {
    public let dwType: UInt32
    public let ulSize: UInt32
    public let ulString: UInt32
    public let string: String?
    
    public init(dataStream: inout DataStream, rowSetBasePosition: Int) throws {
        /// dwType DWORD 4 Varies depending on the control. For details, see sections 2.2.2.1.3.1 through 2.2.2.1.3.9.
        self.dwType = try dataStream.read(endianess: .littleEndian)

        /// ulSize ULONG 4 Varies depending on the control. For details, see sections 2.2.2.1.3.1 through 2.2.2.1.3.9.
        self.ulSize = try dataStream.read(endianess: .littleEndian)

        /// ulString ULONG 4 The offset in BYTEs from the base of the TRowSet structure to a null-terminated non-Unicode string.
        /// This string MUST be in the code page indicated by dwCodePage parameter of the NspiGetTemplateInfo function call, as
        /// specified in [MS-NSPI] and [MS-OXNSPI] section 3.1.4.1.18, and MUST be terminated by a NULL character. In these
        /// strings, the "&" (ampersand) has special meaning and indicates that the character that immediately follows it MUST be
        /// used as a shortcut key to select this control. If the control cannot be selected, the control that follows it is selected. If an
        /// "&" needs to be in the string and it SHOULD NOT have any special meaning, a sequence of "&&" can be used to indicate this.
        /// For more details about string values, usage and limitations, see sections 2.2.2.1.3.1 through 2.2.2.1.3.9.
        self.ulString = try dataStream.read(endianess: .littleEndian)
        
        let position = dataStream.position
        dataStream.position = rowSetBasePosition + Int(self.ulString)
        self.string = try dataStream.readAsciiString()
        dataStream.position = position
    }
}
