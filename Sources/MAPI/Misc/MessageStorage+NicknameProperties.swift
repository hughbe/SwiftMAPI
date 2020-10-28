//
//  MessageStorage+NicknameProperties.swift
//  
//
//  Created by Hugh Bellamy on 28/10/2020.
//

/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/autocomplete-stream
/// Significant properties
/// As mentioned previously in this topic, the binary blocks that represent properties have property tags that correspond to properties on
/// address book recipients. For properties that are not listed here, you can look up the property description at
/// https://msdn.microsoft.com/library/cc433490(EXCHG.80).aspx.
/// http://portalvhds6gyn3khqwmgzd.blob.core.windows.net/files/NK2/NK2WithBinaryExample.pdf
public extension MessageStorage {
    /// PR_NICK_NAME_W (not transmitted on recipients, specific to autocomplete stream only) 0x6001001f
    /// This property must be first in each recipient row. It functionally serves as a key identifier for the recipient row.
    var nickName: String? {
        return getProperty(id: .PR_DOTSTUFF_STATE_OR_PR_NICK_NAME_W)
    }

    /// PR_NEW_NICK_NAME (not transmitted on recipients, specific to .nk2 file only) 0x6002000B
    /// Specifies whether this row was just added to the nickname cache or not. If you are creating a new row, this should be set to true.
    var newNickName: Bool? {
        return getProperty(id: .PR_NEW_NICK_NAME)
    }
    
    /// PR_DROPDOWN_DISPLAY_NAME_W (not transmitted on recipients, specific to .nk2 file only)
    /// 0x6003001F The display string that shows up in the autocomplete list.
    var dropDownDisplayName: String? {
        return getProperty(id: .PR_DROPDOWN_DISPLAY_NAME_W)
    }
    
    /// PR_NICK_NAME_WEIGHT (not transmitted on recipients, specific to autocomplete stream only) 0x60040003
    /// The weight of this autocomplete entry. The weight is used to determine in what order autocomplete entries occur when matching the
    /// autocomplete list. Entries with higher weight will show before entries with lower weight. The complete autocomplete list is sorted by
    /// this property. The weight periodically decreases over time and increases when the user sends an email to this recipient. See the
    /// description later in this topic for more information about this property.
    var nickNameWeight: UInt32? {
        return getProperty(id: .PR_NICK_NAME_WEIGHT)
    }
}
