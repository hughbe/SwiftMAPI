//
//  File.swift
//
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import Foundation

/// The PR_ROH_FLAGS property is stored in the Global Profile Section of a Messaging Application Programming Interface (MAPI)
/// profile. The value of PR_ROH_FLAGS is a bitmask that is made up of one or more of the following flags.
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpflags-canonical-property
public struct RpcOverHttpFlags: OptionSet {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    /// ROHFLAGS_USE_ROH 0x1 Connect to the Exchange Server using RPC over HTTP.
    public static let useRpcOverHtml = RpcOverHttpFlags(rawValue: 0x1)
    
    /// ROHFLAGS_SSL_ONLY 0x2 Connect to the Exchange Server using Secure Socket Layer (SSL) only.
    public static let sslOnly = RpcOverHttpFlags(rawValue: 0x2)
    
    /// ROHFLAGS_MUTUAL_AUTH 0x4 Mutually authenticate the session when connecting by using SSL.
    public static let mutualAuth = RpcOverHttpFlags(rawValue: 0x4)
    
    /// ROHFLAGS_HTTP_FIRST_ON_FAST 0x8 On fast networks, connect by using HTTP first. Then, connect by using TCP/IP.
    public static let httpFirstOnFast = RpcOverHttpFlags(rawValue: 0x8)
    
    /// ROHFLAGS_HTTP_FIRST_ON_SLOW 0x20 On slow networks, connect by using HTTP first. Then, connect by using TCP/IP.
    public static let httpFirstOnSlow = RpcOverHttpFlags(rawValue: 0x20)

    public static let all: RpcOverHttpFlags = [.useRpcOverHtml, .sslOnly, .mutualAuth, .httpFirstOnFast, .httpFirstOnSlow]
}
