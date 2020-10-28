//
//  ResourceFlags.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

import Foundation

/// Contains a bitmask of flags for message services and providers.
/// This property describes the characteristics of a message service, a service provider, or a status object. The flags that are set for this
/// property depend on its context. For example, some flags are valid only for status objects and other flags only for columns in the
/// message service table.
/// The flags are of three classes: static, modifiable, and dynamic. Static flags are set by MAPI from data in MAPISVC.INF and never altered.
/// Modifiable flags are set by MAPI from MAPISVC.INF but can be subsequently changed. Dynamic flags can be set and reset by MAPI
/// methods.
/// For a message service, one or more of the following flags can be set in this property:
/// For a service provider, one or more of the following flags can be set in PR_RESOURCE_FLAGS:
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourceflags-canonical-property
public struct ResourceFlags: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// SERVICE_DEFAULT_STORE Dynamic. The message service contains the default store. A user interface should be displayed
    /// prompting the user for confirmation before deleting or moving this service out of the profile.
    public static let serviceDefaultStore = ResourceFlags(rawValue: 0x00000001)

    /// SERVICE_SINGLE_COPY Static. Any attempt to create or copy this message service into a profile where the service already
    /// exists will fail. To create a single copy message service add the PR_RESOURCE_FLAGS property to the service's section in
    /// MAPISVC.INF and set this flag.
    public static let serviceSingleCopy = ResourceFlags(rawValue: 0x00000002)
    
    /// SERVICE_CREATE_WITH_STORE Reserved. Do not use.
    public static let serviceCreateWithStore = ResourceFlags(rawValue: 0x00000004)
    
    /// SERVICE_PRIMARY_IDENTITY Modifiable. The corresponding message service contains the provider used for the primary
    /// identity for this session. Use IMsgServiceAdmin::SetPrimaryIdentity to set this flag. Either this flag or
    /// SERVICE_NO_PRIMARY_IDENTITY should be set, but not both.
    public static let servicePrimaryIdentity = ResourceFlags(rawValue: 0x00000008)
    
    /// SERVICE_NO_PRIMARY_IDENTITY Static. The service level flag that should be set to indicate that none of the providers in the
    /// message service can be used to supply an identity. Either this flag or SERVICE_PRIMARY_IDENTITY should be set, but not both.
    public static let serviceNoPrimaryIdentity = ResourceFlags(rawValue: 0x00000020)
    
    /// HOOK_INBOUND Static. The spooler hook needs to process inbound messages.
    public static let hookInbound = ResourceFlags(rawValue: 0x00000200)
    
    /// HOOK_OUTBOUND Static. The spooler hook needs to process outbound messages.
    public static let hookOutbound = ResourceFlags(rawValue: 0x00000400)
    
    /// STATUS_DEFAULT_OUTBOUND Modifiable. This identity should be applied to outbound messages if the profile contains
    /// multiple instances of this transport provider. This can happen if multiple instances of a single transport provider appear in the profile.
    public static let statusDefaultOutbound = ResourceFlags(rawValue: 0x00000001)

    /// STATUS_DEFAULT_STORE Modifiable. This message store is the default store for the profile.
    public static let statusDefaultStore = ResourceFlags(rawValue: 0x00000002)
    
    /// STATUS_NEED_IPM_TREE Dynamic. The standard folders in this message store, including the interpersonal message (IPM) root
    /// folder, have not yet been verified. MAPI sets and clears this flag.
    public static let statusNeedIPMTree = ResourceFlags(rawValue: 0x00000800)

    /// STATUS_NO_DEFAULT_STORE Static. This message store is incapable of becoming the default message store for the profile.
    public static let statusNoDefaultStore = ResourceFlags(rawValue: 0x00000040)

    /// STATUS_NO_PRIMARY_IDENTITY Static. This provider does not furnish an identity in its status row. Either this flag or
    /// STATUS_PRIMARY_IDENTITY must be set.
    public static let statusNoPrimaryIdentity = ResourceFlags(rawValue: 0x00000020)

    /// STATUS_OWN_STORE Static. This transport provider is tightly coupled with a message store and furnishes the
    /// PR_OWN_STORE_ENTRYID (PidTagOwnStoreEntryId) property in its status row.
    public static let statusOwnStore = ResourceFlags(rawValue: 0x00000100)

    /// STATUS_PRIMARY_IDENTITY Modifiable. This provider furnishes the primary identity for the session; the entry identifier for the
    /// object furnishing the identity is returned from IMAPISession::QueryIdentity. Either this flag or STATUS_NO_PRIMARY_IDENTITY
    /// must be set.
    public static let statusPrimaryIdentity = ResourceFlags(rawValue: 0x00000004)

    /// STATUS_PRIMARY_STORE Modifiable. This message store is to be used when a client application logs on. Once opened, this
    /// store should be set as the default store for the profile.
    public static let statusPrimaryStore = ResourceFlags(rawValue: 0x00001000)

    /// STATUS_SECONDARY_STORE Modifiable. This message store is to be used if the primary store is not available when a client
    /// application logs on. Once opened, this store should be set as the default store for the profile.
    public static let statusSecondaryStore = ResourceFlags(rawValue: 0x00002000)

    /// STATUS_SIMPLE_STORE Dynamic. This message store will be used by Simple MAPI as its default message store.
    public static let statusSimpleStore = ResourceFlags(rawValue: 0x00000008)

    /// STATUS_TEMP_SECTION Dynamic. This message store should not be published in the message store table and will be deleted
    /// from the profile after logoff.
    public static let statusTempSection = ResourceFlags(rawValue: 0x00000080)

    /// STATUS_XP_PREFER_LAST Static. This transport expects to be the last transport selected to send a message when multiple
    /// transport providers are able to transmit the message.
    public static let statusXpPreferLast = ResourceFlags(rawValue: 0x00000080)

    public static let all: ResourceFlags = [.serviceDefaultStore, .serviceSingleCopy, .serviceCreateWithStore, .servicePrimaryIdentity, .serviceNoPrimaryIdentity, .hookInbound, .statusDefaultOutbound, .statusDefaultStore, .statusNeedIPMTree, .statusNoDefaultStore, .statusNoPrimaryIdentity, .statusOwnStore, .statusPrimaryIdentity, .statusPrimaryStore, .statusSecondaryStore, .statusSimpleStore, .statusTempSection, .statusXpPreferLast]
}
