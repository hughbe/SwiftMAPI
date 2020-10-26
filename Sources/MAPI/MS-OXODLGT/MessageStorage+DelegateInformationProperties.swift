//
//  MessageStorage+DelegateInformationProperties.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import Foundation

/// [MS-OXODLGT] 2.2 Message Syntax
/// This protocol uses the structures specified in [MS-OXCDATA] and the properties specified in [MSOXPROPS] as the low-level syntax through which the following property/value pairs are encoded. For
/// more details about the values stored in these properties, see section 3.
/// [MS-OXODLGT] 2.2.2 Delegate Information Object
/// The Delegate Information object is a special Message object used to store delegate access
/// settings for a delegator. This Delegate Information object is stored in the delegate data folder for
/// the delegator.
/// Unless otherwise specified, the Delegate Information object adheres to all property constraints
/// specified in [MS-OXPROPS] and [MS-OXCMSG]. A Delegate Information object can also contain other
/// properties, which are defined in [MS-OXPROPS], but these properties have no impact on the Delegate
/// Access Configuration Protocol.
/// [MS-OXODLGT] 2.2.2.2 Delegate Information Properties
/// [MS-OXODLGT] 2.2.3 Delegate Rule
/// To enable calendar workflow scenarios in which delegates receive copies of meeting-related
/// objects that are sent to the delegator, a delegator's client creates a specific type of server-side
/// rule, as specified in [MS-OXORULE] section 3.1.4.2.
/// [MS-OXODLGT] 2.2.3.1 Delegate Rule Properties
/// The delegate rule is specified by setting the properties listed in section 2.2.3.1.1 through section
/// 2.2.3.1.6.
public extension MessageStorage {
    /// [MS-OXODLGT] 2.2.2.2.1 PidTagScheduleInfoDelegatorWantsCopy Property
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDelegatorWantsCopy property ([MS-OXPROPS] section 2.965) indicates
    /// whether the delegator wants to receive copies of the meeting-related objects that are sent to the
    /// delegate.
    /// This property MUST be set on the Delegate Information object.
    var scheduleInfoDelegatorWantsCopy: Bool? {
        return getProperty(id: .tagSearchFolderIdOrTagScheduleInfoDelegatorWantsCopyOrTagWlinkGroupHeaderID)
    }
    
    /// [MS-OXODLGT] 2.2.2.2.2 PidTagScheduleInfoDelegatorWantsInfo Property
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDelegatorWantsInfo property ([MS-OXPROPS] section 2.966) indicates
    /// whether the delegator wants to receive informational updates, as specified in [MS-OXOCAL]
    /// section 3.1.4.7.4.1.<1> For more details about informational updates, see [MS-OXOCAL] section
    /// 3.1.5.6.
    /// This property MUST be set on the Delegate Information object.
    var scheduleInfoDelegatorWantsInfo: Bool? {
        return getProperty(id: .tagScheduleInfoDelegatorWantsInfoOrTagWlinkOrdinal)
    }
    
    /// [MS-OXODLGT] 2.2.2.2.3 PidTagScheduleInfoDelegateNames Property
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDelegateNames property ([MS-OXPROPS] section 2.963) specifies the
    /// names of the delegates. Each entry contains the value of the PidTagDisplayName property (section
    /// 2.2.1.1.1) of each delegate's Address Book object. For details about the Address Book object, see
    /// [MS-OXOABK].
    /// This property MAY<2> be accessed and manipulated as a PtypMultipleString8 ([MS-OXCDATA]
    /// section 2.11.1) property, which can cause a loss of fidelity when converting from Unicode.
    /// Requirements for this property are specified in section 3.1.4.3.3.
    var scheduleInfoDelegateNames: [String]? {
        return getProperty(id: .tagSearchFolderRecreateInfoOrTagScheduleInfoDelegateNames)
    }
    
    /// [MS-OXODLGT] 2.2.2.2.3 PidTagScheduleInfoDelegateNames Property
    /// Data type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDelegateNames property ([MS-OXPROPS] section 2.963) specifies the
    /// names of the delegates. Each entry contains the value of the PidTagDisplayName property (section
    /// 2.2.1.1.1) of each delegate's Address Book object. For details about the Address Book object, see
    /// [MS-OXOABK].
    /// This property MAY<2> be accessed and manipulated as a PtypMultipleString8 ([MS-OXCDATA]
    /// section 2.11.1) property, which can cause a loss of fidelity when converting from Unicode.
    /// Requirements for this property are specified in section 3.1.4.3.3.
    var scheduleInfoDelegateNamesW: [String]? {
        return getProperty(id: .tagScheduleInfoDelegateNamesWOrTagWlinkFlags)
    }
    
    /// [MS-OXODLGT] 2.2.2.2.5 PidTagScheduleInfoDelegateEntryIds Property
    /// Data type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDelegateEntryIds property ([MS-OXPROPS] section 2.962) specifies the
    /// EntryIDs of the delegates. Each entry contains the value of the PidTagEntryId property ([MSOXCPERM] section 2.2.4) of each delegate's Address Book object. For more details about the
    /// Address Book object, see [MS-OXOABK].
    /// This property MUST be set on the Delegate Information object.
    var scheduleInfoDelegateEntryIds: [Data]? {
        return getProperty(id: .tagScheduleInfoDelegateEntryIdsOrTagSearchFolderDefinition)
    }
    
    /// [MS-OXODLGT] 2.2.2.2.6 PidTagDelegateFlags Property
    /// Data type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagDelegateFlags property ([MS-OXPROPS] section 2.661) indicates whether delegates can
    /// view Message objects that are marked as private, meaning the PidTagSensitivity property ([MSOXCMSG] section 2.2.1.13) has a value of 0x00000002. Each entry of this property MUST be set to
    /// one of the following values.
    /// This property MUST be set on the Delegate Information object.
    var delegateFlags: [DelegateFlags]? {
        guard let rawValue: [UInt32] = getProperty(id: .tagDelegateFlags) else {
            return nil
        }

        return rawValue.compactMap(DelegateFlags.init)
    }
    
    /// [MS-OXODLGT] 2.2.2.2.7 PidTagScheduleInfoDontMailDelegates Property
    /// Data type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoDontMailDelegates property ([MS-OXPROPS] section 2.969) is set to
    /// TRUE by the client, regardless of user input. The value of this property has no meaning in the context
    /// of this protocol.
    var scheduleInfoDontMailDelegates: Bool? {
        return getProperty(id: .tagScheduleInfoDontMailDelegates)
    }
}
