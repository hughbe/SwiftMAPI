//
//  MessageSenderStatus.swift
//
//
//  Created by Hugh Bellamy on 20/08/2020.
//

/// [MS-OXOMSG] 2.2.1.80 PidTagSenderIdStatus Property
/// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagSenderIdStatus property ([MS-OXPROPS] section 2.997) contains the results reported by the Sender ID agent, which compares
/// the IP address of the message sender against the domain (called the purported responsible domain) of the sender's e-mail address.
/// The value of this property indicates the likelihood that the current message is spam. Valid values are given in the following table.
public enum MessageSenderStatus: UInt32 {
    /// The verification check was inconclusive.
    case neutral = 0x00000001
    
    /// The IP address and the purported responsible domain match
    case pass = 0x00000002
    
    /// The IP address and the purported responsible domain do not match.
    case fail = 0x00000003
    
    /// It is possible that the IP address does not belong to the purported responsible domain. A soft fail indicates less confidence in the
    /// message's authenticity than a value of Neutral (0x00000001).
    case softFail = 0x00000004
    
    ///  No data could be obtained from the Domain Name System (DNS).
    case none = 0x00000005
    
    /// There was a transient error (such as the unavailability of DNS) that prevented this value from being computed.
    case temporaryError = 0x00000006
    
    /// There was an unrecoverable error that prevented this value from being computed.
    case permanentError = 0x00000007
}
