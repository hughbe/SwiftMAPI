//
//  MessageStorage+MiscProprties.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import Foundation

public extension MessageStorage {
    /// PidTagAcknowledgementMode
    /// Contains the identifier of the mode for message acknowledgment.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagacknowledgementmode-canonical-property
    var acknowledgementMode: AcknowledgementMode? {
        guard let rawValue: UInt32 = getProperty(id: .tagTemplateDataOrTagAcknowledgementMode) else {
            return nil
        }
        
        return AcknowledgementMode(rawValue: rawValue)
    }
    
    /// PidTagAuthorizingUsers Canonical Property
    /// Contains a list of entry identifiers for users who have authorized the sending of a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagauthorizingusers-canonical-property
    var authorizingUsers: Data? {
        return getProperty(id: .tagAuthorizingUsers)
    }
    
    /// PidTagContentConfidentialityAlgorithmId Canonical Property
    /// Contains an identifier for the algorithm used to confirm message content confidentiality.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagcontentconfidentialityalgorithmid-canonical-property
    var contentConfidentialityAlgorithmId: Data? {
        return getProperty(id: .tagContentConfidentialityAlgorithmId)
    }
    
    /// PidTagContentCorrelator Canonical Property
    /// Contains a value the message sender can use to match a report with the original message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentcorrelator-canonical-property
    /// The contents of the binary string are defined by the message originator. If set on an outgoing message, this property should be
    /// copied onto any reports generated in response to the message.
    var contentCorrelator: Data? {
        return getProperty(id: .tagContentCorrelator)
    }

    /// PidTagContentIdentifier Canonical Property
    /// Contains a key value that enables the message recipient to identify its content.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentidentifier-canonical-property
    var contentIdentifier: String? {
        return getProperty(id: .tagContentIdentifier)
    }
    
    /// PidTagContentLength Canonical Property
    /// Contains a message length, in bytes, passed to a client application or service provider to determine if a message of that length
    /// can be delivered.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentlength-canonical-property
    var contentLength: UInt32? {
        return getProperty(id: .tagContentLength)
    }
    
    /// PidTagConversationKey
    /// Contains the conversation key used in Microsoft Outlook only when locating IPM.MessageManager messages, such as the message
    /// that contains download history for a Post Office Protocol (POP3) account. This property has been deprecated in Microsoft Exchange
    /// Server.
    /// When accessing email messages as conversations and converting message properties to Transport-Neutral Encapsulation Format
    /// (TNEF), do not use this property; instead, use the PidTagConversationIndex and PidTagConversationTopic canonical properties.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversationkey-canonical-property
    var contentKey: Data? {
        return getProperty(id: .tagConversationKey)
    }
    
    /// PidTagContentReturnRequested Canonical Property
    /// Contains TRUE if a message should be returned with a nondelivery report.
    /// If this property is not set, MAPI treats it as having a TRUE value.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentreturnrequested-canonical-property
    var contentReturnRequested: Bool? {
        return getProperty(id: .tagContentReturnRequested)
    }

    /// PidTagConversionEits Canonical Property
    /// Contains the encoded information types (EITs) that are applied to a message in transit to describe conversions.
    /// X.400 environments use this property for both non-delivery and delivery reports.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversioneits-canonical-property
    var conversionEits: Data? {
        return getProperty(id: .tagConversionEits)
    }
    
    /// PidTagConversionWithLossProhibited Canonical Property
    /// Contains TRUE if a message transfer agent (MTA) is prohibited from making message text conversions that lose information.
    /// An example of the type of conversion being prohibited is the "lossy" mapping from Unicode (two bytes per character) to a
    /// single-byte character set.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversionwithlossprohibited-canonical-property
    var conversionWithLossProhibited: Bool? {
        return getProperty(id: .tagConversionWithLossProhibited)
    }
    
    /// PidTagConvertedEits Canonical Property
    /// Contains an identifier for the types of text in a message after conversion.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconvertedeits-canonical-property
    var convertedEits: Data? {
        return getProperty(id: .tagConvertedEits)
    }

    /// PidTagDiscardReason Canonical Property
    /// Contains a reason why a message transfer agent (MTA) has discarded a message.
    /// The reason contained in this property is used in a nondelivery report for the message.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagdiscardreason-canonical-property
    var discardReason: Bool? {
        return getProperty(id: .tagDiscardReason)
    }

    /// PidTagDisclosureOfRecipients Canonical Property
    /// Contains TRUE if disclosure of recipients is allowed.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagdisclosureofrecipients-canonical-property
    var disclosureOfRecipients: Bool? {
        return getProperty(id: .tagDisclosureOfRecipients)
    }

    /// PidTagDistributionListExpansionHistory Canonical Property
    /// Contains a history showing how a distribution list has been expanded during message transmission.
    /// This property is available to receiving client applications if the transport provider has set it. It is also available to the sending client if the
    /// message content is returned with a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdistributionlistexpansionhistory-canonical-property
    var distributionListExpansionHistory: Data? {
        return getProperty(id: .tagDistributionListExpansionHistory)
    }

    /// PidTagDistributionListExpansionProhibited Canonical Property
    /// Contains TRUE if a message transfer agent (MTA) is prohibited from expanding distribution lists.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdistributionlistexpansionprohibited-canonical-property
    var distributionListExpansionProhibited: Bool? {
        return getProperty(id: .tagDistributionListExpansionProhibited)
    }
    
    /// PidTagImplicitConversionProhibited Canonical Property
    /// Contains TRUE if a message transfer agent (MTA) is prohibited from making implicit message text conversions.
    /// If this property is TRUE, the messaging system must not perform any content conversion on the message unless it is explicitly requested
    /// on a per-recipient basis with the PR_EXPLICIT_CONVERSION (PidTagExplicitConversion) property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagimplicitconversionprohibited-canonical-property
    var implicitConversionProhibited: Bool? {
        return getProperty(id: .tagImplicitConversionProhibited)
    }

    /// PidTagLatestDeliveryTime Canonical Property
    /// Contains the latest date and time when a message transfer agent (MTA) should deliver a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaglatestdeliverytime-canonical-property
    var latestDeliveryTime: Date? {
        return getProperty(id: .tagLatestDeliveryTime)
    }
    
    /// PidTagMessageDeliveryId
    /// Contains a message transfer system (MTS) identifier for a message delivered to a client application.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagedeliveryid-canonical-property
    var messageDeliveryId: Data? {
        return getProperty(id: .tagMessageDeliveryId)
    }
    
    /// PidTagMessageSecurityLabel
    /// Contains a security label for a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagesecuritylabel-canonical-property
    var messageSecurityLabel: Data? {
        return getProperty(id: .tagMessageSecurityLabel)
    }

    /// PidTagOriginallyIntendedRecipientName Canonical Property
    /// Contains the encoded name of the originally intended recipient of an autoforwarded message.
    /// The PR_ORIGINALLY_INTENDED_RECIPIENT_NAME property must be set by the automatic agent that has forwarded the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipientname-canonical-property
    var originallyIntendedRecipientName: Data? {
        return getProperty(id: .tagOriginallyIntendedRecipientName)
    }

    /// PidTagOriginalEits Canonical Property
    /// Contains a copy of the original encoded information types (EITs) for message text.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginaleits-canonical-property
    var originalEits: Data? {
        return getProperty(id: .tagOriginalEits)
    }

    /// PidTagOriginatorCertificate Canonical Property
    /// Contains an ASN.1 certificate for the message originator.
    /// This property is a copy of the originator's PR_USER_CERTIFICATE (PidTagUserCertificate) property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatorcertificate-canonical-property
    var originatorCertificate: Data? {
        return getProperty(id: .tagOriginatorCertificate)
    }


    /// PidTagSubmitFlags
    /// Contains a bitmask of flags indicating details about a message submission.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsubmitflags-canonical-property
    var submitFlags: SubmitFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagSubmitFlags) else {
            return nil
        }
        
        return SubmitFlags(rawValue: rawValue)
    }
    
    /// PidTagRpcOverHttpFlags
    /// Not documented in specification but known on internet
    /// Contains the settings in a profile used by Microsoft Office Outlook to connect to Microsoft Exchange Server by using
    /// a remote procedure call (RPC) over Hypertext Transfer Protocol (HTTP).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpflags-canonical-property
    var rpcOverHttpFlags: RpcOverHttpFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagRpcOverHttpFlags) else {
            return nil
        }
        
        return RpcOverHttpFlags(rawValue: rawValue)
    }
    
    /// PidTagOriginalDisplayName
    /// Contains the original display name for an entry copied from an address book to a personal address book or other writable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginaldisplayname-canonical-property
    var originalDisplayName: String? {
        return getProperty(id: .tagOriginalDisplayName)
    }
    
    /// PidTagOriginalSearchKey
    /// Contains the original search key for an entry copied from an address book to a personal address book or other writeable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalsearchkey-canonical-property
    var originalSearchKey: Data? {
        return getProperty(id: .tagOriginalSearchKey)
    }
    
    /// PidTagItemTemporaryflags
    /// Contains a flag that indicates that a message has been read, but not marked as read.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagitemtemporaryflags-canonical-property
    var itemTemporaryflags: UInt32? {
        return getProperty(id: .tagItemTemporaryflags)
    }
    
    /// PidTagRoamingBinary
    /// Contains a message stream associated with a subclass of the IPM.Configuration class.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagroamingbinary-canonical-property
    var roamingBinary: Data? {
        return getProperty(id: .tagRoamingBinary)
    }
    
    /// PidTagAssociatedContentCount
    /// Contains the count of items in the associated contents table of the folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagassociatedcontentcount-canonical-property
    var associatedContentCount: UInt32? {
        return getProperty(id: .tagAssociatedContentCount)
    }
    
    /// PidTagControlFlags Canonical Property
    /// Contains a bitmask of flags governing the behavior of a control used in a dialog box built from a display table.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontrolflags-canonical-property
    var controlFlags: DisplayTableControlFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagControlFlags) else {
            return nil
        }
        
        return DisplayTableControlFlags(rawValue: rawValue)
    }
    
    /// PidTagControlStructure Canonical Property
    /// Contains a pointer to a structure for a control used in a dialog box.
    /// This property represents a long pointer that is cast to one of the control structures. The control structures include:
    /// DTBLBUTTON
    /// DTBLCHECKBOX
    /// DTBLCOMBOBOX
    /// DTBLDDLBX
    /// DTBLEDIT
    /// DTBLGROUPBOX
    /// DTBLLABEL
    /// DTBLLBX
    /// DTBLMVDDLBOX
    /// DTBLMVLISTBOX
    /// DTBLPAGE
    /// DTBLRADIOBUTTON
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontroltype-canonical-property
    var controlStructure: Data? {
        return getProperty(id: .tagControlStructure)
    }
    
    /// PidTagControlType Canonical Property
    /// Contains a value indicating a control type for a control used in a dialog box.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontroltype-canonical-property
    var controlType: DisplayTableControlType? {
        guard let rawValue: UInt32 = getProperty(id: .tagControlType) else {
            return nil
        }
        
        return DisplayTableControlType(rawValue: rawValue)
    }
    
    /// PidTagDeltaX Canonical Property
    /// Contains the width of a dialog box control in standard Windows dialog units.
    /// The PR_XPOS (PidTagXCoordinate), PR_YPOS (PidTagYCoordinate), PR_DELTAY (PidTagDeltaY) properties ,and this property control
    /// the position and size the dialog box control.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdeltax-canonical-property
    var deltaX: UInt32? {
        return getProperty(id: .tagDeltaX)
    }
    
    /// PidTagDeltaY Canonical Property
    /// Contains the height of a dialog box control in standard Windows dialog units.
    /// The PR_XPOS (PidTagXCoordinate), PR_YPOS (PidTagYCoordinate), PR_DELTAX (PidTagDeltaX), and this property control the
    /// position and size the dialog box control.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdeltay-canonical-property
    var deltaY: UInt32? {
        return getProperty(id: .tagDeltaY)
    }
    
    /// PidTagXCoordinate Canonical Property
    /// Contains the x coordinate of the starting position (the upper-left corner) of a dialog box control, in standard Windows dialog units.
    /// The PR_XPOS (PidTagXCoordinate), PR_YPOS (PidTagYCoordinate), PR_DELTAX (PidTagDeltaX), and this property control the
    /// position and size the dialog box control.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagxcoordinate-canonical-property
    var xCoordinate: UInt32? {
        return getProperty(id: .tagXCoordinate)
    }
    
    /// PidTagYCoordinate Canonical Property
    /// Contains the y coordinate of the starting position (the upper-left corner) of a dialog box control, in standard Windows dialog units.
    /// The PR_XPOS (PidTagXCoordinate), PR_YPOS (PidTagYCoordinate), PR_DELTAX (PidTagDeltaX), and this property control the
    /// position and size the dialog box control.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagycoordinate-canonical-property
    var yCoordinate: UInt32? {
        return getProperty(id: .tagYCoordinate)
    }

    /// PidTagControlId Canonical Property
    /// Contains a unique identifier for a control used in a dialog box.
    /// This property contains a unique identifier for the control. This identifier should contain a GUID structure and a binary value of type
    /// LONG. All controls in the dialog box should use the same GUID to identify the service provider, and each control should use a unique
    /// LONG value to ensure that the controls do not collide.
    /// This property is used in notifications. For example, notifications sent on the display table must set this property to uniquely identify
    /// the control to update.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontrolid-canonical-property
    var controlId: Data? {
        return getProperty(id: .tagControlId)
    }
    
    /// PidTagValidFolderMask
    /// Contains a bitmask of flags that indicate the validity of the entry identifiers of the folders in a message store.
    /// A folder's entry identifier can become invalid if a user deletes the folder or if the message store becomes corrupted.
    /// One or more of the following flags can be set for the bitmask:
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagvalidfoldermask-canonical-property
    var validFolderMask: ValidFolderMask? {
        guard let rawValue: UInt32 = getProperty(id: .tagValidFolderMask) else {
            return nil
        }
        
        return ValidFolderMask(rawValue: rawValue)
    }
}
