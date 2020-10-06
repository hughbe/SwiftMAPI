//
//  ServerProcessingActions.swift
//  
//
//  Created by Hugh Bellamy on 05/09/2020.
//

/// [MS-OXOCAL] 2.2.5.5 PidLidServerProcessingActions Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidLidServerProcessingActions property ([MS-OXPROPS] section 2.234) indicates what processing actions have been taken on the
/// Meeting Request object or Meeting Update object. The following flags can be set.
public struct ServerProcessingActions: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let delegatorWantsCopy = ServerProcessingActions(rawValue: 0x00000002)
    
    public static let createdOnPrincipal = ServerProcessingActions(rawValue: 0x00000010)
    
    public static let updatedCalItem = ServerProcessingActions(rawValue: 0x00000080)
    
    public static let copiedOldProperties = ServerProcessingActions(rawValue: 0x00000100)
    
    public static let sendAutoResponse = ServerProcessingActions(rawValue: 0x00000400)
    
    public static let revivedException = ServerProcessingActions(rawValue: 0x00000800)
    
    public static let processedMeetingForwardNotification = ServerProcessingActions(rawValue: 0x00001000)

    public static let all: ServerProcessingActions = [.delegatorWantsCopy, .createdOnPrincipal, .updatedCalItem, .copiedOldProperties, .sendAutoResponse, .revivedException, .processedMeetingForwardNotification]
}
