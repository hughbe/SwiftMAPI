//
//  ResourceMethods.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

/// Contains a bitmask of flags that indicate the methods in the IMAPIStatus interface that are supported by the status object.
/// This property indicates which of the methods in a status object's implementation of IMAPIStatus are supported. Status objects
/// are allowed to return MAPI_E_NO_SUPPORT from unsupported methods.
/// Clients use a status object's PR_RESOURCE_METHODS property to avoid making calls to unsupported methods. If the flag that
/// corresponds to a particular method is set, the method exists and can be called. If that flag is clear, the method should not be called.
/// The status objects implemented by MAPI support the following methods:
/// Status object    Supported methods
/// MAPI subsystem ValidateState only
/// MAPI address book ValidateState only
/// MAPI spooler ValidateState and FlushQueues
/// One or more of the following flags can be set in PR_RESOURCE_METHODS:
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourcemethods-canonical-property
public struct ResourceMethods: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// STATUS_VALIDATE_STATE Indicates that the IMAPIStatus::ValidateState method is supported.
    public static let validateState = ResourceMethods(rawValue: 0x00000001)
    
    /// STATUS_SETTINGS_DIALOG Indicates that the IMAPIStatus::SettingsDialog method is supported.
    public static let settingsDialog = ResourceMethods(rawValue: 0x00000002)
    
    /// STATUS_CHANGE_PASSWORD Indicates that the IMAPIStatus::ChangePassword method is supported.
    public static let changePassword = ResourceMethods(rawValue: 0x00000004)

    /// STATUS_FLUSH_QUEUES Indicates that the IMAPIStatus::FlushQueues method is supported.
    public static let flushQueues = ResourceMethods(rawValue: 0x00000008)

    public static let all: ResourceMethods = [.validateState, .settingsDialog, .changePassword, .flushQueues]
}
