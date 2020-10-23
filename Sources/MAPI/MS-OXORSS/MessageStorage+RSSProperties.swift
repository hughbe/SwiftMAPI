//
//  MessageStorage+RSSProperties.swift
//
//
//  Created by Hugh Bellamy on 05/09/2020.
//

import Foundation

/// [MS-OXORSS] 2.2 Message Syntax
/// An RSS object can be created and modified by clients and servers. Except where noted, this section
/// defines constraints under which both clients and servers operate.
/// Clients operate on an RSS object by using the Message and Attachment Object Protocol, as specified
/// in [MS-OXCMSG]. The manner in which a server operates on an RSS object is implementationdependent, but the results of any such operations MUST be exposed to clients in a manner that is
/// consistent with the RSS Object Protocol.
/// Unless otherwise specified in this section, an RSS object adheres to all property constraints, as
/// specified in both [MS-OXPROPS] and [MS-OXCMSG]. An RSS object can also contain other properties,
/// but these properties have no impact on the RSS Object Protocol.
/// The values of the properties specified in this section are taken from the XML elements of the RSS
/// feed or atom feed, unless otherwise specified. For details about the XML formats of the RSS feed and
/// the atom feed, see [RSS2.0] and [RFC4287], respectively.
/// [MS-OXORSS] 2.2.1 RSS Object-Specific Properties
/// The properties that are specific to RSS objects are defined in section 2.2.1.1 through section 2.2.1.8.
public extension MessageStorage {
    /// [MS-OXORSS] 2.2.1.1 PidLidPostRssChannelLink Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssChannelLink property ([MS-OXPROPS] section 2.205) contains the URL of the
    /// RSS feed or atom feed from which the XML file came.
    /// This property is set as follows:
    ///  For an RSS feed, this property is set to the value of the link child element of the channel
    /// element.
    ///  For an atom feed, this property is set to the value of the href attribute of the link child element of
    /// the feed element. This property is set only if the rel attribute of the link element either is set to
    /// "alternate" or is not present. Otherwise, this property is not set for an atom entry.
    var postRssChannelLink: String? {
        return getProperty(name: .lidPostRssChannelLink)
    }
    
    /// [MS-OXORSS] 2.2.1.2 PidLidPostRssItemLink Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssItemLink property ([MS-OXPROPS] section 2.208) contains the URL of the item
    /// or entry.
    /// This property is set as follows:
    ///  For an RSS item, this property is set to the value of the link child element of the item element.
    ///  For an atom entry, this property is set to the value of the href attribute of the link child element
    /// of the entry element. This property is set only if the rel attribute of the link element either is set
    /// to "alternate" or is not present. Otherwise, this property is not set for an atom entry.
    var postRssItemLink: String? {
        return getProperty(name: .lidPostRssItemLink)
    }
    
    /// [MS-OXORSS] 2.2.1.3 PidLidPostRssItemHash Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssItemHash property ([MS-OXPROPS] section 2.207) contains a hash of the XML
    /// from the RSS feed or the atom feed. The hash is computed by using an implementation-dependent
    /// algorithm and is used to quickly determine whether two items are different.
    var postRssItemHash: String? {
        return getProperty(name: .lidPostRssItemHash)
    }
    
    /// [MS-OXORSS] 2.2.1.4 PidLidPostRssItemGuid Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssItemGuid property ([MS-OXPROPS] section 2.206) contains a unique identifier for
    /// the object.
    /// This property is set as follows:
    ///  For an RSS item, this property is set to the value of the GUID element or the link element.
    ///  For an atom entry, this property is set to the value of the id element. If the id element is not
    /// present, this property is set to the value of the href attribute of the link element.
    var postRssItemGuid: String? {
        return getProperty(name: .lidPostRssItemGuid)
    }
    
    /// [MS-OXORSS] 2.2.1.5 PidLidPostRssChannel Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssChannel property ([MS-OXPROPS] section 2.204) contains the title of the atom
    /// feed or the RSS feed. For an atom feed, this property is set to the value of the title child element of
    /// the feed element. For an RSS feed, this property is set to the value of the title child element of the
    /// channel element.
    var postRssChannel: String? {
        return getProperty(name: .lidPostRssChannel)
    }
    
    /// [MS-OXORSS] 2.2.1.6 PidLidPostRssItemXml Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssItemXml property ([MS-OXPROPS] section 2.209) contains either the contents of
    /// the item element and all of its child elements from an RSS feed or the contents of the entry element
    /// and all of its child elements from an atom feed.
    var postRssItemXml: String? {
        return getProperty(name: .lidPostRssItemXml)
    }
    
    /// [MS-OXORSS] .2.1.7 PidLidPostRssSubscription Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPostRssSubscription property ([MS-OXPROPS] section 2.210) contains the user's
    /// preferred name for the subscription. This property either is set to a user-specified value or is set as
    /// follows:
    ///  For an RSS feed, this property is set to the value of the title child element of the channel
    /// element.
    ///  For an atom feed, this property is set to the value of the title child element of the feed element.
    var postRssSubscription: String? {
        return getProperty(name: .lidPostRssSubscription)
    }
}
