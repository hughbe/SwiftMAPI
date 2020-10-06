//
//  ClientIntent.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.2.4 PidLidClientIntent Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidClientIntent property ([MS-OXPROPS] section 2.59) indicates what actions a user has taken on a Meeting object.
public struct ClientIntent: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// A - ciManager (1 bit): The user is the owner of the Meeting object's Calendar folder. If this bit is set, the ciDelegate bit SHOULD NOT be set.
    public static let manager = ClientIntent(rawValue: 0x00000001)

    /// B - ciDelegate (1 bit): The user is a delegate acting on a Meeting object in a delegator's Calendar folder.
    /// If this bit is set, the ciManager bit SHOULD NOT be set.
    public static let delegate = ClientIntent(rawValue: 0x00000002)

    /// C - ciDeletedWithNoResponse (1 bit): The user deleted the Meeting object with no response sent to the organizer.
    public static let deletedWithNoResponse = ClientIntent(rawValue: 0x00000004)

    /// D - ciDeletedExceptionWithNoResponse (1 bit): The user deleted an exception to a recurring series with no response sent to the organizer.
    public static let deletedExceptionWithNoResponse = ClientIntent(rawValue: 0x00000008)

    /// E - ciRespondedTentative (1 bit): The user tentatively accepted the meeting request.
    public static let respondedTentative = ClientIntent(rawValue: 0x00000010)

    /// F - ciRespondedAccept (1 bit): The user accepted the meeting request.
    public static let respondedAccept = ClientIntent(rawValue: 0x00000020)

    /// G - ciRespondedDecline (1 bit): The user declined the meeting request.
    public static let respondedDecline = ClientIntent(rawValue: 0x00000040)

    /// H - ciModifiedStartTime (1 bit): The user modified the start time.
    public static let modifiedStartTime = ClientIntent(rawValue: 0x00000080)

    /// I - ciModifiedEndTime (1 bit): The user modified the end time.
    public static let modifiedEndTime = ClientIntent(rawValue: 0x00000100)

    /// J - ciModifiedLocation (1 bit): The user changed the location of the meeting.
    public static let modifiedLocation = ClientIntent(rawValue: 0x00000200)

    /// K - ciRespondedExceptionDecline (1 bit): The user declined an exception to a recurring series.
    public static let respondedExceptionDecline = ClientIntent(rawValue: 0x00000400)

    /// L - ciCanceled (1 bit): The user canceled a meeting request.
    public static let canceled = ClientIntent(rawValue: 0x00000800)

    /// M - ciExceptionCanceled (1 bit): The user canceled an exception to a recurring series.
    public static let exceptionCanceled = ClientIntent(rawValue: 0x00000200)
    
    public static let all: ClientIntent = [.manager, .delegate, .deletedWithNoResponse, .deletedExceptionWithNoResponse, .respondedTentative, .respondedAccept, .respondedDecline, .modifiedStartTime, .modifiedEndTime, .modifiedLocation, .respondedExceptionDecline, .canceled, .exceptionCanceled]
}
