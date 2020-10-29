//
//  OpenStoreFlags.swift
//  
//
//  Created by Hugh Bellamy on 29/10/2020.
//

public struct OpenStoreFlags: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// #define OPENSTORE_USE_ADMIN_PRIVILEGE        ((ULONG)0x00000001)
    public static let useAdminPrivlege = OpenStoreFlags(rawValue: 0x00000001)

    /// #define OPENSTORE_PUBLIC                    ((ULONG)0x00000002)
    public static let `public` = OpenStoreFlags(rawValue: 0x00000002)

    /// #define OPENSTORE_HOME_LOGON                ((ULONG)0x00000004)
    public static let homeLogon = OpenStoreFlags(rawValue: 0x00000004)

    /// #define OPENSTORE_TAKE_OWNERSHIP            ((ULONG)0x00000008)
    public static let takeOwnership = OpenStoreFlags(rawValue: 0x00000008)

    /// #define OPENSTORE_OVERRIDE_HOME_MDB            ((ULONG)0x00000010)
    public static let overrideHomeMdb = OpenStoreFlags(rawValue: 0x00000010)

    /// #define OPENSTORE_TRANSPORT                    ((ULONG)0x00000020)
    public static let transport = OpenStoreFlags(rawValue: 0x00000020)

    /// #define OPENSTORE_REMOTE_TRANSPORT            ((ULONG)0x00000040)
    public static let remoteTransport = OpenStoreFlags(rawValue: 0x00000040)

    /// #define OPENSTORE_INTERNET_ANONYMOUS        ((ULONG)0x00000080)
    public static let internetAnonymous = OpenStoreFlags(rawValue: 0x00000080)

    /// #define OPENSTORE_ALTERNATE_SERVER            ((ULONG)0x00000100) /* reserved for internal use */
    public static let alternateServer = OpenStoreFlags(rawValue: 0x00000100)

    /// #define OPENSTORE_IGNORE_HOME_MDB            ((ULONG)0x00000200) /* reserved for internal use */
    public static let ignoreHomeMdb = OpenStoreFlags(rawValue: 0x00000200)

    /// #define OPENSTORE_NO_MAIL                    ((ULONG)0x00000400) /* reserved for internal use */
    public static let noMail = OpenStoreFlags(rawValue: 0x00000400)

    /// #define OPENSTORE_OVERRIDE_LAST_MODIFIER    ((ULONG)0x00000800)
    public static let overrideLastModifier = OpenStoreFlags(rawValue: 0x00000800)

    /// #define OPENSTORE_CALLBACK_LOGON            ((ULONG)0x00001000) /* reserved for internal use */
    public static let callbackLogon = OpenStoreFlags(rawValue: 0x00001000)

    /// #define OPENSTORE_LOCAL                        ((ULONG)0x00002000)
    public static let local = OpenStoreFlags(rawValue: 0x00002000)

    /// #define OPENSTORE_FAIL_IF_NO_MAILBOX        ((ULONG)0x00004000) /* reserved for internal use */
    public static let failIfNoMailbox = OpenStoreFlags(rawValue: 0x00004000)

    /// #define OPENSTORE_CACHE_EXCHANGE            ((ULONG)0x00008000)
    public static let cacheExchange = OpenStoreFlags(rawValue: 0x00008000)

    /// #define OPENSTORE_CLI_WITH_NAMEDPROP_FIX    ((ULONG)0x00010000) /* reserved for internal use */
    public static let cliWithNamedpropFix = OpenStoreFlags(rawValue: 0x00010000)

    /// #define OPENSTORE_ENABLE_LAZY_LOGGING        ((ULONG)0x00020000) /* reserved for internal use */
    public static let enableLazyLoading = OpenStoreFlags(rawValue: 0x00020000)

    /// #define OPENSTORE_CLI_WITH_REPLID_GUID_MAPPING_FIX    ((ULONG)0x00040000) /* reserved for internal use */
    public static let cliWithReplidGuidMappingFix = OpenStoreFlags(rawValue: 0x00040000)

    /// #define OPENSTORE_NO_LOCALIZATION            ((ULONG)0x00080000) /* reserved for internal use */
    public static let noLocalization = OpenStoreFlags(rawValue: 0x00080000)

    /// #define OPENSTORE_RESTORE_DATABASE            ((ULONG)0x00100000)
    public static let restoreDatabase = OpenStoreFlags(rawValue: 0x00100000)

    /// #define OPENSTORE_XFOREST_MOVE                ((ULONG)0x00200000) /* reserved for internal use */
    public static let xforestMove = OpenStoreFlags(rawValue: 0x00200000)

    public static let all: OpenStoreFlags = [.useAdminPrivlege, .`public`, .homeLogon, .takeOwnership, .overrideHomeMdb, .transport, .remoteTransport, .internetAnonymous, .alternateServer, .ignoreHomeMdb, .noMail, .overrideLastModifier, .callbackLogon, .local, .failIfNoMailbox, .cacheExchange, .cliWithNamedpropFix, .enableLazyLoading, .cliWithReplidGuidMappingFix, .noLocalization, .restoreDatabase, .xforestMove]
}
