//
//  StatusCode.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

/// Contains a bitmask of flags indicating details about a message submission.
/// One or more of the following flags can be set for the PR_SUBMIT_FLAGS bitmask:
/// Transport providers can also set their status objects' PR_STATUS_CODE properties to the following values:
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsubmitflags-canonical-property
public struct StatusCode: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// STATUS_AVAILABLE Indicates that the resource is operational.
    public static let available = StatusCode(rawValue: 0x00000001)
    
    /// STATUS_OFFLINE Indicates that only local data or services are available.
    public static let offline = StatusCode(rawValue: 0x00000002)
    
    /// STATUS_FAILURE Indicates that the resource is experiencing a problem. For service providers, STATUS_FAILURE indicates
    /// that the provider might soon be shut down to end the current session.
    public static let failure = StatusCode(rawValue: 0x00000004)
    
    /// STATUS_INBOUND_ACTIVE Indicates that the transport provider is receiving an inbound message.
    public static let inboundActive = StatusCode(rawValue: 0x00010000)

    /// STATUS_INBOUND_ENABLED Indicates that the transport provider can receive inbound messages.
    public static let inboundEnabled = StatusCode(rawValue: 0x00020000)

    /// STATUS_INBOUND_FLUSH Indicates that the transport provider is downloading messages from the inbound queue.
    public static let inboundFlush = StatusCode(rawValue: 0x00040000)

    /// STATUS_OUTBOUND_ACTIVE Indicates that the transport provider is receiving an outbound message.
    public static let outboundActive = StatusCode(rawValue: 0x00100000)

    /// STATUS_OUTBOUND_ENABLED Indicates that the transport provider can handle outbound messages.
    public static let outboundEnabled = StatusCode(rawValue: 0x00200000)

    /// STATUS_OUTBOUND_FLUSH Indicates that the transport provider is uploading messages from its outbound queue.
    public static let outboundFlush = StatusCode(rawValue: 0x00400000)

    /// STATUS_REMOTE_ACCESS Indicates that the transport provider supports remote access.
    public static let remoteAccess = StatusCode(rawValue: 0x00800000)

    public static let all: StatusCode = [.available, .offline, .failure, .inboundActive, .inboundEnabled, .inboundFlush, .outboundActive, .outboundEnabled, .outboundFlush, .remoteAccess]
}
