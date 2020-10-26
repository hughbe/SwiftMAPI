//
//  MessageStorage+FreeBusyProperties.swift
//  
//
//  Created by Hugh Bellamy on 27/08/2020.
//

import Foundation

/// [MS-OXOPFFB] 2.2 Message Syntax
/// [MS-OXOPFFB] 2.2.1 Free/Busy Message
/// Free/busy data is represented as a set of properties that are set on a message in the public folders
/// message store. The message is referred to as the free/busy message. The location of this message is
/// specified in section 3.1.4.1.2. Unless otherwise specified, the free/busy message conforms to a
/// Message object, as specified in [MS-OXCMSG].
public extension MessageStorage {
    /// [MS-OXOPFFB] 2.2.1.2.1 PidTagScheduleInfoMonthsTentative Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoMonthsTentative property ([MS-OXPROPS] section 2.975) specifies the
    /// months for which the free/busy status is tentative. The number of PtypInteger32 values in this
    /// property MUST be between 0 (zero) and the number of months covered by the publishing range,
    /// which is the interval between the values of the PidTagFreeBusyPublishStart property (section
    /// 2.2.1.2.9) and the PidTagFreeBusyPublishEnd property (section 2.2.1.2.10).
    /// Each value in this PtypMultipleInteger32 property data type, interpreted as a signed
    /// PtypInteger32, has a month and year encoded in it. This is calculated by using the following
    /// expression, in which year and month are based on the Gregorian calendar:
    /// year × 16 + month
    /// The values are sorted in ascending order and are encoded in little-endian format.
    /// If an event is spread across multiple months or multiple years, there MUST be one value for each of
    /// the months that fall in the publishing range. If there are no tentative events in the publishing range,
    /// this property and the PidTagScheduleInfoFreeBusyTentative property (section 2.2.1.2.2) are not
    /// set or, if they already exist, are deleted.
    var scheduleInfoMonthsTentative: [UInt32]? {
        return getProperty(id: .tagScheduleInfoMonthsTentativeOrTagWlinkGroupName)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.2 PidTagScheduleInfoFreeBusyTentative Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoFreeBusyTentative property ([MS-OXPROPS] section 2.971) specifies the
    /// blocks of times for which the free/busy status is tentative. This property has as many values as the
    /// number of values in the PidTagScheduleInfoMonthsTentative property (section 2.2.1.2.1). Each
    /// binary value represents a month and corresponds to the value at the same index in the
    /// PidTagScheduleInfoMonthsTentative property. The binary values are sorted in the same order as
    /// the values in the PidTagScheduleInfoMonthsTentative property.
    /// Each binary value has one or more 4-byte blocks, and each block contains the start time in the first
    /// two bytes and the end time in the second two bytes in little-endian format. The start time is the
    /// number of minutes between 12:00 A.M. Coordinated Universal Time (UTC) of the first day of the
    /// month and the start time of the event in UTC. The end time is the number of minutes between 12:00
    /// A.M. UTC of the first day of the month and the end time of the event in UTC. The 4-byte blocks are
    /// sorted in ascending order.
    /// Consecutive or overlapping blocks of time are merged into one block with start time as the start time
    /// of the first block and end time as the end time of the last block. If an event is spread across multiple
    /// months or years, the event is split into multiple blocks, one for each month. If there are no tentative
    /// events in the publishing range, this property and the PidTagScheduleInfoMonthsTentative
    /// property are not set or, if they already exist, are deleted. Otherwise, this property MUST be set.
    var scheduleInfoFreeBusyTentative: [Data]? {
        return getProperty(id: .tagScheduleInfoFreeBusyTentativeOrTagWlinkSection)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.3 PidTagScheduleInfoMonthsBusy Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoMonthsBusy property ([MS-OXPROPS] section 2.973) specifies the months
    /// for which the free/busy status is busy. The format, computation, and constraints of this property are
    /// the same as those for the PidTagScheduleInfoMonthsTentative property (section 2.2.1.2.1) but
    /// refer to appointments that are marked as busy on the associated Calendar object.
    var scheduleInfoMonthsBusy: [UInt32]? {
        return getProperty(id: .tagScheduleInfoMonthsBusyOrTagWlinkCalendarColor)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.4 PidTagScheduleInfoFreeBusyBusy Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoFreeBusyBusy property ([MS-OXPROPS] section 2.969) specifies the
    /// blocks of time for which the free/busy status is busy. The format, computation, and constraints of this
    /// property are the same as those for the PidTagScheduleInfoFreeBusyTentative property (section
    /// 2.2.1.2.2) but refer to appointments that are marked as busy on the associated Calendar object.
    var scheduleInfoFreeBusyBusy: [Data]? {
        return getProperty(id: .tagScheduleInfoFreeBusyBusyOrTagWlinkAddressBookEID)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.5 PidTagScheduleInfoMonthsAway Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoMonthsAway property ([MS-OXPROPS] section 2.972) specifies the
    /// months for which free/busy status is OOF. The format, computation, and constraints of this property
    /// are the same as those for the PidTagScheduleInfoMonthsTentative property (section 2.2.1.2.1)
    /// but refer to appointments that are marked as OOF on the associated Calendar object.
    var scheduleInfoMonthsAway: [UInt32]? {
        return getProperty(id: .tagScheduleInfoMonthsAway)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.6 PidTagScheduleInfoFreeBusyAway Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoFreeBusyAway property ([MS-OXPROPS] section 2.968) specifies the
    /// blocks of time for which the free/busy status is OOF. The format, computation, and constraints of this
    /// property are the same as those for the PidTagScheduleInfoFreeBusyTentative property (section
    /// 2.2.1.2.2) but refer to appointments that are marked as OOF on the associated Calendar object.
    var scheduleInfoFreeBusyAway: [Data]? {
        return getProperty(id: .tagScheduleInfoFreeBusyAway)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.7 PidTagScheduleInfoMonthsMerged Property
    /// Type: PtypMultipleInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoMonthsMerged property ([MS-OXPROPS] section 2.974) specifies the
    /// months for which free/busy status is either busy or OOF. The syntax/format and constraints of this
    /// property are the same as those for the PidTagScheduleInfoMonthsTentative property (section
    /// 2.2.1.2.1) but refer to appointments that are marked as either busy or OOF on the associated
    /// Calendar object.
    var scheduleInfoMonthsMerged: [UInt32]? {
        return getProperty(id: .tagScheduleInfoMonthsMergedOrTagWlinkFolderType)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.8 PidTagScheduleInfoFreeBusyMerged Property
    /// Type: PtypMultipleBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidTagScheduleInfoFreeBusyMerged property ([MS-OXPROPS] section 2.970) specifies the
    /// blocks of time for which the free/busy status is either busy or OOF. The format, computation, and
    /// constraints of this property are the same as those for the PidTagScheduleInfoFreeBusyTentative
    /// property (section 2.2.1.2.2) but refer to appointments that are marked as either busy or OOF on the
    /// associated Calendar object.
    var scheduleInfoFreeBusyMerged: [Data]? {
        return getProperty(id: .tagScheduleInfoFreeBusyMergedOrTagWlinkGroupClsid)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.9 PidTagFreeBusyPublishStart Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFreeBusyPublishStart property ([MS-OXPROPS] section 2.699) specifies the start time
    /// of the publishing range. This property is set to 12:00 A.M. UTC on the first day of the month or the
    /// first day of the week, whichever occurs earlier at the time of publishing. This value is expressed as the
    /// number of minutes since midnight, January 1, 1601, in UTC.
    var freeBusyPublishStart: UInt32? {
        return getProperty(id: .tagFreeBusyPublishStartOrTagSearchFolderTagOrTagWlinkSaveStamp)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.10 PidTagFreeBusyPublishEnd Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFreeBusyPublishEnd property ([MS-OXPROPS] section 2.698) specifies the end time of
    /// the publishing range. The value of this property is computed by adding the value of the
    /// PidTagFreeBusyCountMonths property ([MS-OXOCAL] section 2.2.12.1) to the value of the
    /// PidTagFreeBusyPublishStart property (section 2.2.1.2.9). This value is expressed as the number of
    /// minutes since midnight, January 1, 1601 in UTC.
    var freeBusyPublishEnd: UInt32? {
        return getProperty(id: .tagFreeBusyPublishEndOrTagSearchFolderEfpFlags)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.11 PidTagFreeBusyRangeTimestamp Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFreeBusyRangeTimestamp property ([MS-OXPROPS] section 2.700) specifies the time,
    /// in UTC, that the data was published.
    var freeBusyRangeTimestamp: Date? {
        return getProperty(id: .tagFreeBusyRangeTimestamp)
    }
    
    /// [MS-OXOPFFB] 2.2.1.2.12 PidTagFreeBusyMessageEmailAddress Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFreeBusyMessageEmailAddress property ([MS-OXPROPS] section 2.697) specifies the
    /// email address of the user or resource to whom this free/busy message applies. The value of this
    /// property is the same as the value of the PidTagEmailAddress property ([MS-OXOABK] section
    /// 2.2.3.14) of the Address Book object for the attendee or resource.
    var freeBusyMessageEmailAddress: String? {
        return getProperty(id: .tagFreeBusyMessageEmailAddressOrTagWlinkType)
    }
}
