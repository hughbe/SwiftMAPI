//
//  MessageStorage+MiscProprties.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

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
    
    /// PidTagOriginCheck Canonical Property
    /// Contains a binary verification value that enables a delivery report recipient to verify the origin of the original message.
    /// This property provides a means for a third party, such as a message transfer agent (MTA) or a messaging user receiving a delivery report,
    /// to verify the submitted message's origin. If present on a received message, this property should be copied onto any delivery report
    /// generated in response to the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagorigincheck-canonical-property
    var originCheck: Data? {
        return getProperty(id: .tagOriginCheck)
    }

    /// PidTagProofOfSubmissionRequested Canonical Property
    /// Contains an ASN.1 proof of submission value.
    /// This property corresponds to an X.400 submission envelope per-message attribute.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofsubmissionrequested-canonical-property
    var proofOfSubmissionRequested: Data? {
        return getProperty(id: .tagProofOfSubmissionRequested)
    }
    
    /// PidTagRedirectionHistory Canonical Property
    /// Contains information about the route covered by a delivered message.
    /// This property is used when a message is autoforwarded by an automatic agent.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagredirectionhistory-canonical-property
    var redirectionHistory: Data? {
        return getProperty(id: .tagRedirectionHistory)
    }

    /// PidTagRelatedMessageIds Canonical Property
    /// Contains a list of identifiers for messages to which a message is related.
    /// The identifiers use the same specific construction rules as are used for the PR_SEARCH_KEY (PidTagSearchKey) property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrelatedmessageids-canonical-property
    var relatedMessageIds: Data? {
        return getProperty(id: .tagRelatedMessageIds)
    }
    
    /// PidTagLanguages Canonical Property
    /// Contains an ASCII list of the languages that are incorporated in a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaglanguages-canonical-property
    var languages: String? {
        return getProperty(id: .tagLanguages)
    }

    /// PidTagReturnedMessageid Canonical Property
    /// Contains TRUE if the original message is being returned with a nonread report.
    /// An X.400 transport provider sets this property in the unread report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreturnedmessageid-canonical-property
    var returnedMessageid: Bool? {
        return getProperty(id: .tagReturnedMessageid)
    }

    /// PidTagIncompleteCopy Canonical Property
    /// Contains TRUE if this message is an incomplete copy of another message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagincompletecopy-canonical-property
    var incompleteCopy: Bool? {
        return getProperty(id: .tagIncompleteCopy)
    }
    
    /// PidTagX400ContentType Canonical Property
    /// This property contains the content type for a submitted message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagx400contenttype-canonical-property
    var x400ContentType: Data? {
        return getProperty(id: .tagX400ContentType)
    }

    /// PidTagNonReceiptReason Canonical Property
    /// Contains reasons why a message was not received that forms part of a non-delivery report.
    /// https://docs.microsoft.com/en-nz/office/client-developer/outlook/mapi/pidtagnonreceiptreason-canonical-property
    var nonReceiptReason: UInt32? {
        return getProperty(id: .tagNonReceiptReason)
    }
    
    /// PidTagProviderSubmitTime Canonical Property
    /// Contains the date and time a transport provider passed a message to its underlying messaging system.
    /// This property is set by the outgoing transport provider at the time a message is sent.
    /// This property corresponds to an X.400 submission envelope per-message attribute.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagprovidersubmittime-canonical-property
    var providerSubmitTime: Date? {
        return getProperty(id: .tagProviderSubmitTime)
    }
    
    /// PidTagOriginalAuthorSearchKey Canonical Property
    /// Contains the search key of the author of the first version of a message, that is, the message before being forwarded or replied to.
    /// This property is one of the address properties for the author of a message. At first submission of the message, the client application should
    /// set this property to the value of the PR_SENDER_SEARCH_KEYPidTagSenderSearchKey property. It is never changed when the message
    /// is forwarded or replied to.
    /// The original author properties allow for preservation of information from outside the local messaging domain. When a message arrives from
    /// another messaging domain, such as from the Internet, these properties provide a way to ensure that original information is not lost.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalauthorsearchkey-canonical-property
    var originalAuthorSearchKey: Data? {
        return getProperty(id: .tagOriginalAuthorSearchKey)
    }
    
    /// PidTagOriginalAuthorAddressType Canonical Property
    /// Contains the address type of the author of the first version of a message, that is, the message before being forwarded or replied to.
    /// These properties are examples of the address properties for the author of a message. At first submission of the message, the client
    /// application should set this property to the value of the PR_SENDER_ADDRTYPE (PidTagSenderAddressType) property. It is never
    /// changed when the message is forwarded or replied to.
    /// The original author properties allow for preservation of information from outside the local messaging domain. When a message arrives
    /// from another messaging domain, such as from the Internet, these properties provide a way to ensure that original information is not lost.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalauthoraddresstype-canonical-property
    var originalAuthorAddressType: String? {
        return getProperty(id: .tagOriginalAuthorAddressType)
    }

    /// PidTagOriginalAuthorEmailAddress Canonical Property
    /// Contains the email address of the author of the first version of a message, that is, the message before being forwarded or replied to.
    /// These properties are examples of the address properties for the author of a message. At first submission of the message, the client
    /// application should set these properties to the value of the PR_SENDER_EMAIL_ADDRESS (PidTagSenderEmailAddress) property.
    /// It is never changed when the message is forwarded or replied to.
    /// The original author properties allow for preservation of information from outside the local messaging domain. When a message arrives
    /// from another messaging domain, such as from the Internet, these properties provide a way to ensure that original information is not lost.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalauthoremailaddress-canonical-property
    var originalAuthorEmailAddress: String? {
        return getProperty(id: .tagOriginalAuthorEmailAddress)
    }

    /// PidTagOriginallyIntendedRecipAddrtype Canonical Property
    /// Contains the address type of the originally intended recipient of an autoforwarded message.
    /// These properties are one of the address properties for the originally intended message recipient. It must be set by the automatic agent
    /// that has forwarded the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipaddrtype-canonical-property
    var originallyIntendedRecipAddrtype: String? {
        return getProperty(id: .tagOriginallyIntendedRecipAddrtype)
    }

    /// PidTagOriginallyIntendedRecipEmailAddress Canonical Property
    /// Contains the address type of the originally intended recipient of an autoforwarded message.
    /// These properties are examples of the address properties for the originally intended message recipient. They must be set by the automatic
    /// agent that has forwarded the message.
    /// These properties correspond to the X.400 report per-recipient attribute.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipemailaddress-canonical-property
    var originallyIntendedRecipEmailAddress: String? {
        return getProperty(id: .tagOriginallyIntendedRecipEmailAddress)
    }

    /// PidTagOriginatorAndDistributionListExpansionHistory Canonical Property
    /// Contains information about a message originator and a distribution list expansion history.
    /// This property is used in report generation.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatoranddistributionlistexpansionhistory-canonical-property
    var originatorAndDistributionListExpansionHistory: Data? {
        return getProperty(id: .tagOriginatorAndDistributionListExpansionHistory)
    }

    /// PidTagReportingDistributionListName Canonical Property
    /// Contains the display name of a distribution list where the messaging system delivers a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportingdistributionlistname-canonical-property
    var reportingDistributionListName: Data? {
        return getProperty(id: .tagReportingDistributionListName)
    }

    /// PidTagReportingMessageTransferAgentCertificate Canonical Property
    /// Contains an identifier for the message transfer agent that generated a report.
    /// This property corresponds to an X.400 report per-message attribute.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportingmessagetransferagentcertificate-canonical-property
    var reportingMessageTransferAgentCertificate: Data? {
        return getProperty(id: .tagReportingMessageTransferAgentCertificate)
    }

    /// PidTagRtfSyncBodyCrc Canonical Property
    /// Contains the cyclical redundancy check (CRC) computed for the message text.
    /// The RTFSync function computes the CRC by using only the characters that it considers to be significant to the message. For
    /// example, some white space and other ignorable characters are omitted from the CRC.
    /// This property is a Rich Text Format (RTF) auxiliary property. These properties are used by the RTFSync function and are not
    /// intended to be used directly by client applications.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncbodycrc-canonical-property
    var rtfSyncBodyCrc: UInt32? {
        return getProperty(id: .tagRtfSyncBodyCrc)
    }

    /// PidTagRtfSyncBodyCount Canonical Property
    /// Contains a count of the significant characters of the message text.
    /// The RTFSync function computes the count of characters in the text using only those that it considers to be significant to the message. For example, some white space and other ignorable characters are omitted from the count.
    /// This property is a Rich Text Format (RTF) auxiliary property. These properties are used by the RTFSync function and are not intended
    /// to be used directly by client applications.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncbodycount-canonical-property
    var rtfSyncBodyCount: UInt32? {
        return getProperty(id: .tagRtfSyncBodyCount)
    }

    /// PidTagRtfSyncBodyTag Canonical Property
    /// Contains significant characters that appear at the beginning of the message text.
    /// The count of prefix characters does not include white space.
    /// The RTFSync function uses the text tag to indicate the beginning of the message text. When the text is modified, the tag is used to
    /// find the beginning of the previous text.
    /// These properties are Rich Text Format auxiliary properties. They are used by the RTFSync function and are not intended to be used directly by client applications.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncbodytag-canonical-property
    var rtfSyncBodyTag: String? {
        return getProperty(id: .tagRtfSyncBodyTag)
    }
    
    /// PidTagRtfSyncPrefixCount Canonical Property
    /// Contains a count of the ignorable characters that appear before the significant characters of the message.
    /// The count of prefix characters does not include white space.
    /// This property is a Rich Text Format (RTF) auxiliary property. RTF auxiliary properties are used by the RTFSync function and are not
    /// intended to be used directly by client applications.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncprefixcount-canonical-property
    var rtfSyncPrefixCount: UInt32? {
        return getProperty(id: .tagRtfSyncPrefixCount)
    }

    /// PidTagRtfSyncTrailingCount Canonical Property
    /// Contains a count of the ignorable characters that appear after the significant characters of the message.
    /// This property is a Rich Text Format (RFT) auxiliary property. These properties are used by the RTFSync function and are not
    /// intended to be used directly by client applications.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsynctrailingcount-canonical-property
    var rtfSyncTrailingCount: UInt32? {
        return getProperty(id: .tagRtfSyncTrailingCount)
    }

    /// PidTagOriginallyIntendedRecipEntryId Canonical Property
    /// Contains the entry identifier of the originally intended recipient of an auto-forwarded message.
    /// This property is one of the address properties for the originally intended message recipient. It must be set by the automatic agent
    /// that has forwarded the message.
    /// This property corresponds to the X.400 report per-recipient attribute.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipentryid-canonical-property
    var originallyIntendedRecipEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagOriginallyIntendedRecipEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagContentIntegrityCheck Canonical Property
    /// Contains an ASN.1 content integrity check value that allows a message sender to protect message content from disclosure to
    /// unauthorized recipients.
    /// This property provides for non-repudiation of message content. In conjunction with PR_MESSAGE_TOKEN (PidTagMessageToken),
    /// it ensures that the content of a message arrives at its destination unchanged.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentintegritycheck-canonical-property
    var contentIntegrityCheck: Data? {
        return getProperty(id: .tagContentIntegrityCheck)
    }

    /// PidTagExplicitConversion Canonical Property
    /// Indicates that a message sender has requested a message content conversion for a particular recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagexplicitconversion-canonical-property
    var explicitConversion: UInt32? {
        return getProperty(id: .tagExplicitConversion)
    }

    /// PidTagIpmReturnRequested Canonical Property
    /// Contains TRUE if this message should be returned with a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmreturnrequested-canonical-property
    var ipmReturnRequested: Bool? {
        return getProperty(id: .tagIpmReturnRequested)
    }

    /// PidTagDeliveryPoint Canonical Property
    /// Specifies the nature of the functional entity by means of which a message was or would have been delivered to the recipient.
    /// This property can have exactly one of the following values:
    /// The default value is MAPI_MH_DP_PRIVATE_UA, that is, a MAPI client.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdeliverypoint-canonical-property
    var deliveryPoint: DeliveryPoint? {
        guard let rawValue: UInt32 = getProperty(id: .tagDeliveryPoint) else {
            return nil
        }
        
        return DeliveryPoint(rawValue: rawValue)
    }
    
    /// PidTagOriginatorRequestedAlternateRecipient Canonical Property
    /// Contains an entry identifier for an alternate recipient designated by the sender.
    /// This property is used in autoforwarded messages. If autoforwarding is not permitted or if no alternate recipient has been designated,
    /// a nondelivery report should be generated.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatorrequestedalternaterecipient-canonical-property
    var originatorRequestedAlternateRecipient: EntryID? {
        guard let data: Data = getProperty(id: .tagOriginatorRequestedAlternateRecipient) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagPhysicalRenditionAttributes Canonical Property
    /// Contains an ASN.1 object identifier that is used for rendering message attachments.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagphysicalrenditionattributes-canonical-property
    var physicalRenditionAttributes: Data? {
        return getProperty(id: .tagPhysicalRenditionAttributes)
    }

    /// PidTagProofOfDelivery Canonical Property
    /// This property contains an ASN.1 proof of delivery value.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofdelivery-canonical-property
    var proofOfDelivery: Data? {
        return getProperty(id: .tagProofOfDelivery)
    }

    /// PidTagProofOfDeliveryRequested Canonical Property
    /// This property contains TRUE if a message sender requests proof of delivery for a particular recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofdeliveryrequested-canonical-property
    var proofOfDeliveryRequested: Bool? {
        return getProperty(id: .tagProofOfDeliveryRequested)
    }

    /// PidTagRecipientNumberForAdvice Canonical Property
    /// This property contains a message recipient's telephone number to call to advise of the physical delivery of a message.
    /// These properties are meant to be used in conjunction with delivery to a physical destination, rather than an electronic mailbox, when
    /// the human recipient is not expected to be present at delivery. An example is the telephone number on a fax cover sheet.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrecipientnumberforadvice-canonical-property
    var recipientNumberForAdvice: String? {
        return getProperty(id: .tagRecipientNumberForAdvice)
    }
    
    /// PidTagRegisteredMailType Canonical Property
    /// This property contains the type of registration used for physical delivery of a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagregisteredmailtype-canonical-property
    var registeredMailType: UInt32? {
        return getProperty(id: .tagRegisteredMailType)
    }

    /// PidTagRequestedDeliveryMethod Canonical Property
    /// This property contains a binary array of delivery methods (service providers), in the order of a message sender's preference.
    /// The array contained in the this property consists of ASN.1 identifiers for each of the service providers.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrequesteddeliverymethod-canonical-property
    var requestedDeliveryMethod: UInt32? {
        return getProperty(id: .tagRequestedDeliveryMethod)
    }
    
    /// PidTagTypeOfX400User Canonical Property
    /// This property contains the type of a message recipient for use in a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagtypeofx400user-canonical-property
    var typeOfX400User: UInt32? {
        return getProperty(id: .tagTypeOfX400User)
    }
    
    /// PidTagParentDisplay Canonical Property
    /// Contains the display name of the folder where a message was found during a search.
    /// These properties is not on any object. They can only appear in the contents table of a search-results folder.
    /// These properties and PR_PARENT_ENTRYID (PidTagParentEntryId) properties are not related to each other. They belong to entirely
    /// different contexts.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagparentdisplay-canonical-property
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E05 PtypString PidTagParentDisplayW Parent Display name. This property has an alternate name of PidTagParentDisplay_W. 
    var parentDisplay: String? {
        return getProperty(id: .tagParentDisplay)
    }
    
    /// PidTagCorrelate Canonical Property
    /// Contains TRUE if the sender of a message requests the correlation feature of the messaging system.
    /// This property is used to request the correlation of incoming reports with the original sent message. When a transport provider
    /// encounters a submitted message with PR_CORRELATE set to TRUE, it sets the PR_CORRELATE_MTSID (PidTagCorrelateMtsid)
    /// property to the message transfer system (MTS) identifier for that message.
    /// PR_CORRELATE should be used with messaging systems that support correlation by MTS identifier, such as X.400.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcorrelate-canonical-property
    var correlate: Bool? {
        return getProperty(id: .tagCorrelate)
    }

    /// PidTagDiscreteValues Canonical Property
    /// Contains TRUE if a nondelivery report applies only to discrete members of a distribution list rather than the entire list.
    /// This property is used within a nondelivery report when the message could not be delivered to one or more members of a distribution
    /// list. Its purpose is to limit retransmission attempts to only those individual members and not the distribution list as a whole.
    /// The recipient table of a nondelivery report contains entries for all recipients to whom the message could not be delivered, and also
    /// for the distribution lists, if any, to which they belong. The transport provider should set this property to TRUE for each distribution
    /// list entry, and it should copy the PR_DISPLAY_NAME (PidTagDisplayName), PR_ENTRYID (PidTagEntryId), and PR_SEARCH_KEY
    /// (PidTagSearchKey) from the distribution list to PR_ORIGINAL_DISPLAY_NAME (PidTagOriginalDisplayName),
    /// PR_ORIGINAL_ENTRYID (PidTagOriginalEntryId), and PR_ORIGINAL_SEARCH_KEY (PidTagOriginalSearchKey) properties for
    /// each member of that distribution list.
    /// PR_DISCRETE_VALUES should not be set for any nondelivery report recipient entry other than a distribution list.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdiscretevalues-canonical-property
    var discreteValues: Bool? {
        return getProperty(id: .tagDiscreteValues)
    }

    /// PidTagSpoolerStatus Canonical Property
    /// Contains the status of the message based on information that is available to the MAPI spooler.
    /// This property is computed by MAPI on message objects.
    /// This property appears on inbound messages only and is reserved in all other cases. It indicates whether or not a message has
    /// been delivered to its final location or whether a messaging hook provider potentially deleted the message while rerouting it.
    /// Client applications should never set this property. For an inbound message, a client or service provider can call IMAPIProp::GetProps
    /// on this property to determine the message status. The value S_OK indicates that the message was successfully delivered to the
    /// message store. The value MAPI_E_OBJECT_DELETED indicates that the message was deleted and was never committed to the
    /// store.
    /// Message store providers should support this property on messages, recipient tables, and the outgoing queue table. Clients and
    /// providers should be able to set columns on the outgoing queue table and restrict based on this property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagspoolerstatus-canonical-property
    var spoolerStatus: UInt32? {
        return getProperty(id: .tagSpoolerStatus)
    }
    
    /// PidTagSubmitFlags Canonical Property
    /// Contains a bitmask of flags indicating details about a message submission.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsubmitflags-canonical-property
    var submitFlags: SubmitFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagSubmitFlags) else {
            return nil
        }
        
        return SubmitFlags(rawValue: rawValue)
    }

    /// PidTagRecipientStatus Canonical Property
    /// Contains a value that is used by the MAPI spooler in assigning delivery responsibility among transport providers.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrecipientstatus-canonical-property
    var recipientStatus: UInt32? {
        return getProperty(id: .tagRecipientStatus)
    }

    /// PidTagTransportKey Canonical Property
    /// Contains a value used by the MAPI spooler to track the progress of an outbound message through the outgoing transport providers.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-ca/office/client-developer/outlook/mapi/pidtagtransportkey-canonical-property
    var transportKey: UInt32? {
        return getProperty(id: .tagTransportKey)
    }
    
    /// PidTagMessageDownloadTime Canonical Property
    /// Contains the estimated time to download a message from a remote server to a local message store.
    /// This property is expressed in seconds and represents the best estimate of the time it would take a remote transport provider to
    /// download a given message from its current location to a message store local to the client viewing the header folder. The remote
    /// transport provider typically calculates the value for this property by dividing the value of the PR_MESSAGE_SIZE
    /// (PidTagMessageSize) property by the speed of the communications link in bytes per second. If the provider cannot calculate the
    /// download time, for example if it does not know the link speed, it should furnish a PT_ERROR value such as MAPI_E_NO_SUPPORT
    /// for this column in the header folder contents table.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagedownloadtime-canonical-property
    var messageDownloadTime: UInt32? {
        return getProperty(id: .tagMessageDownloadTime)
    }

    /// PidTagBodyCrc Canonical Property
    /// Contains a cyclic redundancy check (CRC) value on the message text.
    /// The message store can use any CRC algorithm that generates a PT_LONG value. It must compute this property as part of the
    /// IMAPIProp::SaveChanges method when the PR_BODY (PidTagBody) property has been set for the first time and whenever it
    /// has been subsequently modified.
    /// A client application uses PR_BODY_CRC to aid in comparing message text strings contained in PR_BODY properties or their
    /// variants. Using this property, the client can quickly and easily detect when the message text has changed. It can realize significant
    /// performance gains by using PR_BODY_CRC instead of obtaining PR_BODY from the message store and comparing it with a local
    /// version.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagbodycrc-canonical-property
    var bodyCrc: UInt32? {
        return getProperty(id: .tagBodyCrc)
    }
    
    /// PidTagPreprocess Canonical Property
    /// Contains TRUE if the message requires preprocessing.
    /// Important: Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagpreprocess-canonical-property
    var preprocess: Bool? {
        return getProperty(id: .tagPreprocess)
    }

    /// PidTagInternetArticleNumber Canonical Property
    /// A number associated with an item in a message store.
    /// In IMAPI message stores, this property corresponds to the IMAPI UID.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetarticlenumber-canonical-property
    var internetArticleNumber: UInt32? {
        return getProperty(id: .tagInternetArticleNumber)
    }

    /// PidTagOriginatingMtaCertificate
    /// Contains an identifier for the message transfer agent (MTA) that originated the message.
    /// This property, if set, is available on sent messages in the Sent Items folder.
    /// This property corresponds to the X.400 report per-message attribute.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatingmtacertificate-canonical-property
    var originatingMtaCertificate: Data? {
        return getProperty(id: .tagOriginatingMtaCertificate)
    }

    /// PidTagProofOfSubmission
    /// This property contains TRUE if a message sender requests proof that the message transfer system has submitted a message for delivery
    /// to the originally intended recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofsubmission-canonical-property
    var proofOfSubmission: Data? {
        return getProperty(id: .tagProofOfSubmission)
    }
    
    /// PidTagMiniIcon Canonical Property
    /// Contains a bitmap of a half-size icon for a form.
    /// This property contains a 32 × 32 pixel image of an icon, the same as the contents of a .ICO file, but only the upper left 16 × 16 pixels
    /// are considered significant. This property is normally copied from the .ICO file specified in the SmallIcon line of the appropriate
    /// [Description] section of the form configuration file.
    /// Note Some platforms do not support 16 × 16 pixel icons. The 32 × 32 format of this property is usable in such a case but client
    /// applications should be aware of display inconsistencies.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagminiicon-canonical-property
    var miniIcon: Data? {
        return getProperty(id: .tagMiniIcon)
    }
    
    /// PidTagStoreRecordKey Canonical Property
    /// Contains the unique binary-comparable identifier (record key) of the message store in which an object resides.
    /// For a message store, this property is identical to the store's own PR_RECORD_KEY (PidTagRecordKey) property.
    /// The relationship between this property and PR_RECORD_KEY is the same as the relationship between PR_STORE_ENTRYID
    /// (PidTagStoreEntryId) and PR_ENTRYID (PidTagEntryId).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstorerecordkey-canonical-property
    var storeRecordKey: Data? {
        return getProperty(id: .tagStoreRecordKey)
    }

    /// PidTagProviderDisplay Canonical Property
    /// Contains the vendor-defined display name for a service provider.
    /// These properties and PR_PROVIDER_DLL_NAME (PidTagProviderDllName) are defined only on profile sections belonging to
    /// service providers. They must be present in MAPISVC.INF.
    /// https://docs.microsoft.com/en-US/office/client-developer/outlook/mapi/pidtagproviderdisplay-canonical-property
    var providerDisplay: String? {
        return getProperty(id: .tagProviderDisplay)
    }

    /// PidTagResourceFlags Canonical Property
    /// Contains a bitmask of flags for message services and providers.
    /// This property describes the characteristics of a message service, a service provider, or a status object. The flags that are set for
    /// this property depend on its context. For example, some flags are valid only for status objects and other flags only for columns
    /// in the message service table.
    /// The flags are of three classes: static, modifiable, and dynamic. Static flags are set by MAPI from data in MAPISVC.INF and never
    /// altered. Modifiable flags are set by MAPI from MAPISVC.INF but can be subsequently changed. Dynamic flags can be set and
    /// reset by MAPI methods.
    /// For a message service, one or more of the following flags can be set in this property:
    /// For a service provider, one or more of the following flags can be set in PR_RESOURCE_FLAGS:
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourceflags-canonical-property
    var resourceFlags: ResourceFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagResourceFlags) else {
            return nil
        }
        
        return ResourceFlags(rawValue: rawValue)
    }

    /// PidTagProviderDllName Canonical Property
    /// Contains the base file name of the MAPI service provider dynamic-link library (DLL).
    /// MAPI uses a DLL file naming convention. It appends the string 32 to the base DLL name to identify the version that runs on
    /// 32-bit platforms. For example, when the name MAPI.DLL is specified, MAPI constructs the name MAPI32.DLL to represent
    /// the corresponding 32-bit version of the DLL.
    /// These properties should specify the base name. MAPI appends the string 32 as appropriate. Including the string 32 as part
    /// of this property results in an error.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproviderdllname-canonical-property
    var providerDllName: String? {
        return getProperty(id: .tagProviderDllName)
    }

    /// PidTagProviderUid Canonical Property
    /// Contains a MAPIUID structure of the service provider that is handling a message.
    /// This property is computed by all service providers. It contains a MAPIUID structure associated with, and usually hard-coded by,
    /// the provider. It is typically used by a client application that is interested in only the address book containers supplied by a particular
    /// provider.
    /// This property appears only as a column entry in the provider table.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagprovideruid-canonical-property
    var providerUid: GUID? {
        guard let data: Data = getProperty(id: .tagProviderUid) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? GUID(dataStream: &dataStream)
    }

    /// PidTagProviderOrdinal Canonical Property
    /// Contains the zero-based index of a service provider's position in the provider table.
    /// This property is computed by MAPI.
    /// Obtain the provider table by calling the IMsgServiceAdmin::GetProviderTable method. Sort the provider table on this property to
    /// display the transport order.
    var providerOrdinal: UInt32? {
        return getProperty(id: .tagProviderOrdinal)
    }

    /// PidTagFormVersion Canonical Property
    /// Contains the version of a form.
    /// These properties indicate what design version is currently in effect for the form. The version is defined and maintained by the
    /// form's designer and is not necessarily related to any MAPI component version.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformversion-canonical-property
    var formVersion: String? {
        return getProperty(id: .tagFormVersion)
    }
    
    /// PidTagFormClassId Canonical Property
    /// Contains the 128-bit Object Linking and Embedding (OLE) globally unique identifier (GUID) of a form.
    /// The MAPIUID structure contains the definition of the unique identifier.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformclassid-canonical-property
    var formClassId: GUID? {
        return getProperty(id: .tagFormClassId)
    }
    
    /// PidTagFormContactName Canonical Property
    /// Contains the name of a contact for information about a form.
    /// The contact typically contains the name of a person or an alias that is responsible for maintaining the form.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformcontactname-canonical-property
    var formContactName: String? {
        return getProperty(id: .tagFormContactName)
    }
    
    /// PidTagFormCategory Canonical Property
    /// Contains the category of a form.
    /// The category name is defined by a client application in a way that is appropriate to the application.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformcategory-canonical-property
    var formCategory: String? {
        return getProperty(id: .tagFormCategory)
    }
    
    /// PidTagFormCategorySub Canonical Property
    /// Contains the subcategory of a form, as defined by a client application.
    /// These properties are subordinate to the main form category that is provided in the PR_FORM_CATEGORY (PidTagFormCategory)
    /// property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformcategorysub-canonical-property
    var formCategorySub: String? {
        return getProperty(id: .tagFormCategorySub)
    }
    
    /// PidTagFormHostMap Canonical Property
    /// Contains a host map of available forms.
    /// A client application should update this property, along with the PR_DISPLAY_NAME (PidTagDisplayName) property, when changing
    /// the underlying structure in the IMAPIFormProp interface.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformhostmap-canonical-property
    var formHostMap: [UInt32]? {
        return getProperty(id: .tagFormHostMap)
    }
    
    /// PidTagFormHidden Canonical Property
    /// Contains TRUE if a form is to be suppressed from display by compose menus and dialog boxes.
    /// Form-related properties are read-only.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformhidden-canonical-property
    var formHidden: Bool? {
        return getProperty(id: .tagFormHidden)
    }

    /// PidTagFormDesignerName Canonical Property
    /// Contains the display name for the object that is used to design the form.
    /// These properties contain the unique identifier for the form designer object.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformdesignername-canonical-property
    var formDesignerName: String? {
        return getProperty(id: .tagFormDesignerName)
    }

    /// PidTagFormDesignerGuid Canonical Property
    /// Contains the unique identifier for the object that is used to design a form.
    /// This property usually contains the globally unique identifier (GUID) of the design program that is used to create the form.
    /// This property can be empty.
    /// The MAPIUID structure contains the definition of the unique identifier.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformdesignerguid-canonical-property
    var formDesignerGuid: GUID? {
        return getProperty(id: .tagFormDesignerGuid)
    }
    
    /// PidTagFormMessageBehavior Canonical Property
    /// Contains TRUE if a message should be composed in the current folder.
    /// A value of FALSE indicates that the message should be composed as any other interpersonal message, that is, in the Outbox folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagformmessagebehavior-canonical-property
    var formMessageBehavior: UInt32? {
        return getProperty(id: .tagFormMessageBehavior)
    }

    /// PidTagDefaultStore Canonical Property
    /// Contains TRUE if a message store is the default message store in the message store table.
    /// This property appears as a column in the message store table. The value is based on PR_RESOURCE_FLAGS (PidTagResourceFlags).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefaultstore-canonical-property
    var defaultStore: Bool? {
        return getProperty(id: .tagDefaultStore)
    }
    
    /// PidTagStoreUnicodeMask Canonical Property
    /// Contains a bitmask of flags that client applications should query to determine the characteristics of a message store.
    /// This property discloses the capabilities of a message store to client applications planning to send it a message. The flags can
    /// facilitate decisions by a client or another store, such as whether to send PR_BODY (PidTagBody) or only
    /// PR_RTF_COMPRESSED (PidTagRtfCompressed). A client should never set this property. An attempt returns MAPI_E_COMPUTED.
    /// One or more of the following flags can be set for this property:
    /// An RTF version of a message can always be stored, even if the message store is non-RTF-aware. If the STORE_RTF_OK bit is not
    /// set for a particular store, a client maintaining RTF versions must itself call the RTFSync function to keep the PR_BODY and
    /// PR_RTF_COMPRESSED versions synchronized for text content. RTF is always stored in PR_RTF_COMPRESSED, whether
    /// it is actually compressed or not.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstoreunicodemask-canonical-property
    var storeUnicodeMask: StoreSupportMask? {
        guard let rawValue: UInt32 = getProperty(id: .tagStoreUnicodeMask) else {
            return nil
        }
        
        return StoreSupportMask(rawValue: rawValue)
    }

    /// PidTagStoreProvider Canonical Property
    /// The MAPIUID structure identifies the type of message store. The value is computed by message store providers on message store
    /// objects and is unique to each provider. It is typically used for browsing through the message store table to find a store of the
    /// desired type, such as public folders.
    /// This property is analogous to the PR_AB_PROVIDER_ID (PidTagAbProviderId) property for address books.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstoreprovider-canonical-property
    var storeProvider: GUID? {
        guard let data: Data = getProperty(id: .tagStoreProvider) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? GUID(dataStream: &dataStream)
    }

    /// PidTagReceiveFolderSettings Canonical Property
    /// Contains a table of a message store's receive folder settings.
    /// This property can be excluded in IMAPIProp::CopyTo operations or included in IMAPIProp::CopyProps operations. As a property of
    /// type PT_OBJECT, it cannot be successfully retrieved by the IMAPIProp::GetProps method; its contents should be accessed by the
    /// IMAPIProp::OpenProperty method, requesting the interface with identifier IID_IMAPITable. Service providers must report it to the
    /// IMAPIProp::GetPropList method if it is set, but can optionally report it or not if it is not set.
    /// To retrieve table contents, a client application should call the IMsgStore::GetReceiveFolderTable method. For more information,
    /// see Receive Folder Tables.
    /// This property contains a table of mappings of the receive folders for the message store. Calling OpenProperty on this property
    /// is equivalent to calling GetReceiveFolderTable on the message store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreceivefoldersettings-canonical-property
    var receiveFolderSettings: Data? {
        return getProperty(id: .tagReceiveFolderSettings)
    }
    
    /// PidTagValidFolderMask Canonical Property
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
    
    /// PidTagIpmSubtreeEntryId Canonical Property
    /// Contains the entry identifier of the root of the interpersonal message (IPM) folder subtree in the message store's folder tree.
    /// This property represents the root of the IPM hierarchy. IPM clients should not display any folders that are not subfolders of the
    /// folder represented by this property.
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x35E0 PtypBinary PidTagIpmSubTreeEntryId EntryID of the Root Mailbox Folder
    var ipmSubTreeEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagIpmSubTreeEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }
    
    /// PidTagIpmOutboxEntryId Canonical Property
    /// Contains the entry identifier of the standard interpersonal message (IPM) Outbox folder.
    /// Outbound messages are usually created in the Outbox folder. Interpersonal messages should be placed in this folder for submission.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmoutboxentryid-canonical-property
    var ipmOutboxEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagIpmOutboxEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }
    
    /// PidTagIpmWastebasketEntryId Canonical Property
    /// Contains the entry identifier of the standard interpersonal message (IPM) Deleted Items folder.
    /// A client application should move deleted interpersonal messages to the Deleted Items folder. If the message is already in this
    /// folder, or if this property is not supported, the client should delete the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmwastebasketentryid-canonical-property
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x35E3 PtypBinary PidTagIpmWastebasketEntryId EntryID of the Deleted Items Folder object
    var ipmWastebasketEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagIpmWastebasketEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }

    /// PidTagIpmSentMailEntryId Canonical Property
    /// Contains the entry identifier of the standard interpersonal message (IPM) Sent Items folder.
    /// After being sent, interpersonal messages are usually placed in the Sent Items folder. A client can use this property to set the
    /// PR_SENTMAIL_ENTRYID (PidTagSentMailEntryId) property on a submitted message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmsentmailentryid-canonical-property
    var ipmSentMailEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagIpmSentMailEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }
    
    /// PidTagViewsEntryId Canonical Property
    /// Contains the entry identifier of the user-defined Views folder.
    /// The common view folder contains a predefined set of standard view specifiers, while the view folder contains specifiers defined
    /// by a messaging user. These folders, which are not visible in the interpersonal message (IPM) hierarchy, can hold many view
    /// specifiers, each one stored as a message. The client application can choose to merge the two sets of specifiers and make them
    /// both available.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagviewsentryid-canonical-property
    var viewsEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagViewsEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }
    
    /// PidTagCommonViewsEntryId Canonical Property
    /// Contains the entry identifier of the predefined common view folder.
    /// The common view folder contains a predefined set of standard view specifiers, while the view folder contains specifiers defined
    /// by a messaging user. These folders, which are not visible in the interpersonal message (IPM) hierarchy, can hold many view
    /// specifiers, each one stored as a message. A client application can choose to merge the two sets of specifiers and make them
    /// both available.
    /// For more information on views, see View Folders.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcommonviewsentryid-canonical-property
    var commonViewsEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagCommonViewsEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }
    
    /// PidTagFinderEntryId Canonical Property
    /// Contains the entry identifier for the folder where search results are typically created.
    /// The entry identifier contained in this property has the same format as the ENTRYID structure.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagfinderentryid-canonical-property
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x35E7 PtypBinary PidTagFinderEntryId EntryID of the search Folder object
    var finderEntryId: ENTRYID? {
        guard let data: Data = getProperty(id: .tagFinderEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? ENTRYID(dataStream: &dataStream)
    }

    /// PidTagCreateTemplates Canonical Property
    /// Contains an embedded table object that contains dialog box template entry identifiers.
    /// To learn what template objects can be created inside a container, call the IMAPIProp::OpenProperty method on this property.
    /// The resulting object is the one-off table that gives the entry identifiers for all the templates that you can create inside the container.
    /// To create the template objects, call the container object's CreateEntry method on the PR_ENTRYID (PidTagEntryId) column values
    /// from the one-off table.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcreatetemplates-canonical-property
    var createTemplates: Data? {
        return getProperty(id: .tagCreateTemplates)
    }

    /// PidTagDetailsTable Canonical Property
    /// Passing this property to the IMAPIProp::OpenProperty method for the object returns an IMAPITable interface that allows
    /// creation of the display table. MAPI uses this table to display property sheets for an address book object in response to an
    /// IAddrBook::Details call.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdetailstable-canonical-property
    var detailsTable: Data? {
        return getProperty(id: .tagDetailsTable)
    }

    /// PidTagSearch Canonical Property
    /// Contains a container object that is used for advanced searches.
    /// A container that does not support advanced search capabilities does not have to supply the property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsearch-canonical-property
    var search: Data? {
        return getProperty(id: .tagSearch)
    }
    
    /// PidTagStatus Canonical Property
    /// Contains a 32-bit bitmask of flags that define folder status.
    /// This property for folders is analogous to the PR_MSG_STATUS (PidTagMessageStatus) property for messages. Its flags are
    /// provided for the client application only and do not affect the message store. Clients can use or ignore these settings. The
    /// client can also define its own values for the client-definable bits of this property.
    /// One or more of the following flags can be set for the bitmask:
    /// Message store providers set this property on a folder to one or more of these values and clients interpret the status as appropriate for
    /// their applications. For example, a client can use the folder status to visually differentiate between folders in a hierarchy table, displaying
    /// folders with the same status in the same way. Highlighted folders can be shown in reverse video, tagged folders and folders marked
    /// for deletion can be shown with a meaningful icon, and hidden folders can be concealed.
    /// Bits 16 through 31 ("0x10000" through "0x80000000") of this property are available for use by the IPM client application. All other
    /// bits are reserved for use by MAPI; those not defined in the preceding list should be initially set to zero and not altered. 
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstatus-canonical-property
    var status: FolderStatus? {
        guard let rawValue: UInt32 = getProperty(id: .tagStatus) else {
            return nil
        }
        
        return FolderStatus(rawValue: rawValue)
    }

    /// PidTagDefCreateDl Canonical Property
    /// Contains the template entry identifier for a default distribution list.
    /// Client applications use this property to create a distribution list within a container. Support of entry creation is optional for address
    /// book containers; those that do not support it are not required to expose this property.
    /// This property specifies an entry that can appear in the PR_CREATE_TEMPLATES (PidTagCreateTemplates) property for distribution
    /// lists. After obtaining the identifier, the client uses it in a call to the IABContainer::CreateEntry method. The entry represents the
    /// template for the default distribution list.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefcreatedl-canonical-property
    var defCreateDl: EntryID? {
        guard let data: Data = getProperty(id: .tagDefCreateDl) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagDefCreateMailuser Canonical Property
    /// Contains the template entry identifier for a default messaging user object.
    /// Client applications use this property to create a messaging user object within a container. Support of entry creation is optional for
    /// address book containers; those that do not support it are not required to expose this property.
    /// This property specifies an entry that can appear in the PR_CREATE_TEMPLATES (PidTagCreateTemplates) property for messaging
    /// users. After obtaining the identifier, the client uses it in a call to the IABContainer::CreateEntry method. The entry represents the
    /// template for the default messaging user.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefcreatemailuser-canonical-property
    var defCreateMailuser: EntryID? {
        guard let data: Data = getProperty(id: .tagDefCreateMailuser) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// PidTagAbProviderId Canonical Property
    /// Contains an address book provider's MAPIUID structure.
    /// The MAPIUID structure identifies which address book provider supplies this particular container in the container hierarchy.
    /// The value is unique to each provider.
    /// An address book provider can provide more than one identifier. For example, a provider that supplies two different containers
    /// can publish in PR_AB_PROVIDER_ID unique identifiers for each container.
    /// PR_AB_PROVIDER_ID is analogous to the PR_MDB_PROVIDER (PidTagStoreProvider) property for message stores. Client
    /// applications can use PR_AB_PROVIDER_ID to find related rows in an address book hierarchy table.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabproviderid-canonical-property
    var abProviderId: GUID? {
        guard let data: Data = getProperty(id: .tagAbProviderId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? GUID(dataStream: &dataStream)
    }

    /// PidTagDefaultViewEntryId Canonical Property
    /// Contains the entry identifier of a folder's default view.
    /// This property is the entry identifier of the folder view that should be set as the initial view. The property need not be set if the
    /// "Normal" view is to be used as the initial view.
    /// A client application can obtain this property at the time it opens the folder and realize significant performance gains. This property
    /// can be used as a shortcut to obtain the default view, instead of opening the associated contents table and submitting a restriction.
    /// A service provider implementation of the IMAPIFolder::CopyFolder method can copy this property when it copies folders.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefaultviewentryid-canonical-property
    var defaultViewEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagDefaultViewEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagAssociatedContentCount Canonical Property
    /// Contains the count of items in the associated contents table of the folder.
    /// This property contains the number of entries in the contents table of the folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagassociatedcontentcount-canonical-property
    var associatedContentCount: UInt32? {
        return getProperty(id: .tagAssociatedContentCount)
    }
    
    /// PidTag7BitDisplayName Canonical Property
    /// Contains a 7-bit ASCII representation of a messaging user's name.
    /// These properties map the PR_DISPLAY_NAME (PidTagDisplayName) property into a 7-bit character set. Some messaging systems,
    /// such as Internet and certain X.400 links, are limited to the 128-character 7-bit ASCII code set. Gateways to such messaging
    /// systems can improve their performance by calling the IAddrBook::PrepareRecips method directly to retrieve the this property,
    /// thereby avoiding extra processing for code conversion.
    /// [MS-PST] 2.4.5.3 Recipient Table
    /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
    /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
    /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
    /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
    /// [MS-PST] 2.4.5.3.1 Recipient Table Template
    /// Each PST MUST have one recipient table template, which is identified with an NID value of
    /// NID_RECIPIENT_TABLE (0x692). The recipient table template defines the set of columns for every
    /// new Recipient Table that is created. The recipient table template MUST have no data rows, and MUST
    /// contain the following property columns.
    /// 0x39FF PtypString PidTag7BitDisplayName 7-bit Display name. 
    var sevenBitDisplayName: String? {
        return getProperty(id: .tagAddressBookDisplayNamePrintableOrTag7BitDisplayName)
    }
    
    /// PidTagAlternateRecipient Canonical Property
    /// Contains a list of entry identifiers for alternate recipients designated by the original recipient.
    /// This property is used for auto forwarded messages. It contains a FLATENTRYLIST structure of alternate recipients. If autoforwarding
    /// is not permitted or if no alternate recipient has been designated, a nondelivery report is generated.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagalternaterecipient-canonical-property
    var alternateRecipient: FlatEntryList? {
        guard let data: Data = getProperty(id: .tagAlternateRecipient) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? FlatEntryList(dataStream: &dataStream)
    }

    /// PidTagConversionProhibited Canonical Property
    /// Contains TRUE if message conversions are prohibited by default for the associated messaging user.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversionprohibited-canonical-property
    var conversionProhibited: Bool? {
        return getProperty(id: .tagConversionProhibited)
    }
    
    /// PidTagMailPermission Canonical Property
    /// Contains TRUE if the messaging user is allowed to send and receive messages.
    /// If this property is not set, MAPI treats it as having a TRUE value.
    /// Set this property to FALSE in a corporate directory where some of the entries are not email-enabled.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmailpermission-canonical-property
    var mailPermission: Bool? {
        return getProperty(id: .tagMailPermission)
    }
    
    /// PidTagOriginalDisplayName Canonical Property
    /// Contains the original display name for an entry copied from an address book to a personal address book or other writable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginaldisplayname-canonical-property
    var originalDisplayName: String? {
        return getProperty(id: .tagOriginalDisplayName)
    }
    
    /// PidTagOriginalSearchKey Canonical Property
    /// Contains the original search key for an entry copied from an address book to a personal address book or other writeable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalsearchkey-canonical-property
    var originalSearchKey: Data? {
        return getProperty(id: .tagOriginalSearchKey)
    }
    
    /// PidTagContactVersion Canonical Property
    /// Contains the version of a recipient's contact information.
    /// This property is one of the properties that provides identification and access information about a recipient. These properties are
    /// defined by the recipient and the recipient's organization.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactversion-canonical-property
    var contactVersion: GUID? {
        return getProperty(id: .tagContactVersion)
    }
    
    /// PidTagContactAddressTypes Canonical Property
    /// Contains a list of address types for a contact.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactaddresstypes-canonical-property
    var contactAddressTypes: [String]? {
        return getProperty(id: .tagContactAddressTypes)
    }
    
    /// PidTagStoreProviders Canonical Property
    /// Contains a list of identifiers of message store providers in the current profile.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstoreproviders-canonical-property
    var storeProviders: Data? {
        return getProperty(id: .tagStoreProviders)
    }

    /// PidTagAbProviders Canonical Property
    /// Contains a list of identifiers for address book providers in the current profile.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabproviders-canonical-property
    var abProviders: [GUID]? {
        guard let data: Data = getProperty(id: .tagAbProviders) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        let count = dataStream.count / 16
        var results: [GUID] = []
        results.reserveCapacity(count)
        for _ in 0..<count {
            let result = try! GUID(dataStream: &dataStream)
            results.append(result)
        }
        
        return results
    }

    /// PidTagTransportProviders Canonical Property
    /// Contains a list of identifiers of transport providers in the current profile.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagtransportproviders-canonical-property
    var transportProviders: [GUID]? {
        guard let data: Data = getProperty(id: .tagTransportProviders) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        let count = dataStream.count / 16
        var results: [GUID] = []
        results.reserveCapacity(count)
        for _ in 0..<count {
            let result = try! GUID(dataStream: &dataStream)
            results.append(result)
        }
        
        return results

    }

    /// PidTagDefaultProfile Canonical Property
    /// Contains TRUE if a messaging user profile is the MAPI default profile.
    /// This property does not appear as a property of any object but only as a column in a profile table. A client application can use the
    /// IProfAdmin::SetDefaultProfile method to designate the default profile.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefaultprofile-canonical-property
    var defaultProfile: Bool? {
        return getProperty(id: .tagDefaultProfile)
    }

    /// PidTagAbSearchPath Canonical Property
    /// Contains a list of entry identifiers for address book containers that are to be searched to resolve names.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabsearchpath-canonical-property
    var abSearchPath: [EntryID]? {
        guard let data: [Data] = getProperty(id: .tagAbSearchPath) else {
            return nil
        }
        
        return data.compactMap { data -> EntryID? in
            var dataStream = DataStream(data)
            return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
        }
    }

    /// PidTagAbDefaultDir Canonical Property
    /// Contains the entry identifier of the address book container to display first.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabdefaultdir-canonical-property
    var abDefaultDir: EntryID? {
        guard let data: Data = getProperty(id: .tagAbDefaultDir) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagAbDefaultPab Canonical Property
    /// Contains the entry identifier of the address book container to use as the personal address book (PAB).
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabdefaultpab-canonical-property
    var abDefaultPab: EntryID? {
        guard let data: Data = getProperty(id: .tagAbDefaultPab) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    /// PidTagServiceName Canonical Property
    /// Contains the name of a message service as set by the user in the MapiSvc.inf file.
    /// The name contained in these properties is specific to the message service. It comes from the [Services] section in MapiSvc.inf.
    /// These properties appear as a column in the message service table and can be used to filter services. Because it is used to identify
    /// and filter services, the value should not be localized.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagservicename-canonical-property
    var serviceName: String? {
        return getProperty(id: .tagServiceName)
    }

    /// PidTagServiceDllName Canonical Property
    /// Contains the filename of the DLL containing the message service provider entry point function to call for configuration.
    /// When the entry point function name appears in the PR_SERVICE_ENTRY_NAME (PidTagServiceEntryName) method, it indicates
    /// that the entry point exists.
    /// MAPI uses a DLL file naming convention. It appends the string 32 to the base DLL name to identify the version that runs on 32-bit
    /// platforms. For example, when the name MAPI.DLL is specified, MAPI constructs the name MAPI32.DLL to represent the
    /// corresponding 32-bit version of the DLL.
    /// These properties should specify the base name. MAPI appends the string 32 as appropriate. Including the string 32 as part of
    /// these properties result in an error.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagservicedllname-canonical-property
    var serviceDllName: String? {
        return getProperty(id: .tagServiceDllName)
    }
    
    /// PidTagServiceEntryName Canonical Property
    /// Contains the name of the entry point function for configuration of a message service.
    /// It is recommended that message service implementers provide a message service entry point, but the entry point is not required.
    /// However, the entry point should be supplied only if the related configuration properties exist. If these properties do not exist,
    /// MAPI assumes that no entry point is provided.
    /// The dynamic-link library (DLL) in which the entry point function appears is named by the PR_SERVICE_DLL_NAME
    /// (PidTagServiceDllName) property.
    /// For more information on message service entry points, see Implementing a Service Provider Entry Point Function.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagserviceentryname-canonical-property
    var serviceEntryName: String? {
        return getProperty(id: .tagServiceEntryName)
    }
    
    /// PidTagServiceUid Canonical Property
    /// Contains the MAPIUID structure for a message service.
    /// This property is computed by MAPI on profile section objects. MAPI uses it to group all the providers that belong to the same
    /// message service. This property is supplied as a parameter to most of the IMsgServiceAdmin methods. It must not appear in
    /// Mapisvc.inf.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagserviceuid-canonical-property
    var serviceUid: GUID? {
        guard let data: Data = getProperty(id: .tagServiceUid) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? GUID(dataStream: &dataStream)
    }
    
    /// PidTagServiceExtraUids Canonical Property
    /// Contains a list of MAPIUID structures that identify additional profile sections for the message service.
    /// New profile sections can be created for each message filter. When the information about the message service is to be copied to
    /// another profile, it is important to copy the additional profile sections for the filters as well. A service provider that uses additional
    /// profile sections can store the MAPIUID structures of those profile sections in PR_SERVICE_EXTRA_UIDS, which allows MAPI
    /// to copy the additional message service information.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagserviceextrauids-canonical-property
    var serviceExtraUids: [GUID]? {
        guard let data: Data = getProperty(id: .tagServiceExtraUids) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        let count = dataStream.count / 16
        var results: [GUID] = []
        results.reserveCapacity(count)
        for _ in 0..<count {
            let result = try! GUID(dataStream: &dataStream)
            results.append(result)
        }
        
        return results
    }
    
    /// PidTagServices Canonical Property
    /// Contains a list of identifiers of message services in the current profile.
    /// Do not use this property. It is reserved for use by MAPI.
    // https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagservices-canonical-property
    var services: Data? {
        return getProperty(id: .tagServices)
    }
    
    /// PidTagServiceSupportFiles Canonical Property
    /// Contains a list of the files that belong to the message service.
    /// Using a dialog box in the control panel applet, a user can obtain the list of files that belong to the message service. For example,
    /// the user can obtain the names of all dynamic-link libraries (DLLs) that belong to the service. The user can then seek additional
    /// details about the specified files, such as the names and version numbers of all the DLLs. MAPI uses the these properties to
    /// create a support file list in a dialog box for messaging user selection.
    /// MAPI works only with filenames, and other strings passed to it, in the Active Directory Service Interfaces (ANSI) character set.
    /// Client applications that use filenames in an original equipment manufacturer (OEM) character set must convert them to ANSI
    /// before calling MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagservicesupportfiles-canonical-property
    var serviceSupportFiles: [String]? {
        return getProperty(id: .tagServiceSupportFiles)
    }
    
    /// PidTagServiceDeleteFiles Canonical Property
    /// Contains a list of filenames that are to be deleted when the message service is uninstalled.
    /// The filenames in the list contained in these properties are deleted from the computer when using the control panel to uninstall the
    /// message service. Do not include in the list any DLL that supports multiple message services, or additional message services could
    /// be inadvertently removed.
    /// MAPI works only with filenames, and other strings passed to it, in the ANSI character set. Applications that use filenames in an
    /// OEM character set must convert them to ANSI before calling MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagservicedeletefiles-canonical-property
    var serviceDeleteFiles: [String]? {
        return getProperty(id: .tagServiceDeleteFiles)
    }
    
    /// PidTagAbSearchPathUpdate Canonical Property
    /// Contains a list of entry identifiers for address book containers explicitly configured by the user.
    /// Do not use this property. It is reserved for use by MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabsearchpathupdate-canonical-property
    var abSearchPathUpdate: Data? {
        return getProperty(id: .tagAbSearchPathUpdate)
    }
    
    /// PidTagProfileName Canonical Property
    /// Contains the name of the profile.
    /// These properties are computed by service providers. A provider's implementation of the ServiceEntry function can use these
    /// properties to discover the profile name.
    /// Client applications can use these properties as a convenient alternative to obtaining the profile name by examining the
    /// PR_DISPLAY_NAME (PidTagDisplayName) property in the MAPI subsystem's status table row.
    /// These properties may not be unique across time, for example where a profile is deleted and later recreated with the same name.
    /// MAPI furnishes a totally unique PR_SEARCH_KEY (PidTagSearchKey) property in a hard-coded profile section called
    /// MUID_PROFILE_INSTANCE.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagprofilename-canonical-property
    var profileName: Data? {
        return getProperty(id: .tagProfileName)
    }
    
    /// PidTagIdentityDisplay Canonical Property
    /// Contains the display name for a service provider's identity as defined within a messaging system.
    /// These properties do not appear as properties on any object but only as a column in a status table. It is part of the identity of the
    /// service provider exposing the status table row. The provider's identity typically refers to its account on the server, but can refer
    /// to any representation the provider defines within the messaging system.
    /// A service provider furnishing any of the identity properties should furnish all of them. Providers that belong to the same message
    /// service should expose the same values for the identity properties.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagidentitydisplay-canonical-property
    var identityDisplay: String? {
        return getProperty(id: .tagIdentityDisplay)
    }

    /// PidTagIdentityEntryId Canonical Property
    /// Contains the entry identifier for a service provider's identity as defined within a messaging system.
    /// This property does not appear as a property on any object but only as a column in a status table. It is part of the identity of the
    /// service provider exposing the status table row. The provider's identity typically refers to its account on the server, but can refer
    /// to any representation the provider defines within the messaging system.
    /// This proprerty is commonly set to the appropriate address book entry identifier.
    /// A service provider furnishing any of the identity properties should furnish all of them. Providers that belong to the same message
    /// service should expose the same values for the identity properties.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagidentityentryid-canonical-property
    var identityEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagIdentityEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagResourceMethods Canonical Property
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
    var resourceMethods: ResourceMethods? {
        guard let rawValue: UInt32 = getProperty(id: .tagResourceMethods) else {
            return nil
        }
        
        return ResourceMethods(rawValue: rawValue)
    }

    /// PidTagResourceType Canonical Property
    /// Contains a value that indicates the service provider type.
    /// This property can have exactly one of the following values:
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourcetype-canonical-property
    var resourceType: ResourceType? {
        guard let rawValue: UInt32 = getProperty(id: .tagResourceType) else {
            return nil
        }
        
        return ResourceType(rawValue: rawValue)
    }

    /// PidTagStatusCode Canonical Property
    /// Contains a bitmask of flags that indicate the current status of a session resource. All service providers set status codes as does
    /// MAPI to report on the status of the subsystem, the MAPI spooler, and the integrated address book.
    /// The status code must appear in the Mapisvc.inf file for all providers.
    /// Status objects are implemented by MAPI and by all service providers. There are two sets of valid values for status codes, one set
    /// for all status objects and another set for transport providers only. All status objects can set this property to the following values:
    /// Transport providers can also set their status objects' PR_STATUS_CODE properties to the following values:
    /// https://www.google.com/search?q=0x3E04+mapi&oq=0x3E04+mapi&aqs=chrome..69i57j33.704j0j1&sourceid=chrome&ie=UTF-8
    var statusCode: StatusCode? {
        guard let rawValue: UInt32 = getProperty(id: .tagStatusCode) else {
            return nil
        }
        
        return StatusCode(rawValue: rawValue)
    }

    /// PidTagIdentitySearchKey Canonical Property
    /// Contains the search key for a service provider's identity as defined within a messaging system.
    /// This property does not appear as a property on any object but only as a column in a status table. It is part of the identity of the
    /// service provider exposing the status table row. The provider's identity typically refers to its account on the server, but can refer
    /// to any representation the provider defines within the messaging system.
    /// A service provider furnishing any of the identity properties should furnish all of them. Providers that belong to the same message
    /// service should expose the same values for the identity properties.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagidentitysearchkey-canonical-property
    var identitySearchKey: Data? {
        return getProperty(id: .tagIdentitySearchKey)
    }

    /// PidTagOwnStoreEntryId Canonical Property
    /// Contains the entry identifier of a transport's tightly coupled message store.
    /// This property specifies the entry identifier for the tightly coupled store, if one exists. For example, a transport provider can specify
    /// the private folder store entry identifier so that the MAPI spooler can connect the transport provider to the store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagownstoreentryid-canonical-property
    var ownStoreEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagOwnStoreEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// PidTagResourcePath Canonical Property
    /// Contains a path to the service provider's server.
    /// The path contained in these properties represents the suggested path where the user can find resources. The definition of these
    /// properties is provider specific. For example, a scheduling application uses these properties to specify the suggested location for its
    /// scheduling application files. The messaging user profile furnishes these properties as a convenience so that a client application
    /// does not have to prompt the messaging user for a network path or network drive letter.
    /// MAPI works only with filenames in the American National Standards Institute (ANSI) character set. Applications that use filenames
    /// in an original equipment manufacturer (OEM) character set must convert them to ANSI before calling MAPI.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourcepath-canonical-property
    var resourcePath: String? {
        return getProperty(id: .tagResourcePath)
    }

    /// PidTagStatusString Canonical Property
    /// Contains a message that indicates the current status of a session resource.
    /// These properties give service providers and MAPI the opportunity to supply specific information about the status of a session
    /// resource, such as the integrated address book or a particular service provider. This property explains and provides additional
    /// information about a status code, or the PR_STATUS_CODE (PidTagStatusCode) property. Whereas PR_STATUS_CODE is
    /// required for all status objects, PR_STATUS_STRING and associated properties are optional. When the transport provider
    /// does not supply a value, the MAPI spooler supplies a default value.
    /// The string is generated on the same side of the remote procedure call as the MAPI spooler; it travels through shared memory
    /// rather than being marshaled across a process boundary.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstatusstring-canonical-property
    var statusString: String? {
        return getProperty(id: .tagStatusString)
    }

    /// PidTagRemoteProgress Canonical Property
    /// This property contains a number that indicates the status of a remote transfer.
    /// If no transfer is in progress, this property should be set to 1. If a transfer is in progress, it should be set to a value from 0 to 100
    /// indicating the transfer's percent of completion.
    /// The text associated with the numeric status code appears in the PR_REMOTE_PROGRESS_TEXT (PidTagRemoteProgressText)
    /// property.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagremoteprogress-canonical-property
    var remoteProgress: UInt32? {
        return getProperty(id: .tagRemoteProgress)
    }

    /// PidTagRemoteProgressText Canonical Property
    /// This property contains a string that indicates the status of a remote transfer.
    /// A numeric code associated with this text is passed in the PR_REMOTE_PROGRESS (PidTagRemoteProgress) property.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagremoteprogresstext-canonical-property
    var remoteProgressText: String? {
        return getProperty(id: .tagRemoteProgressText)
    }

    /// PidTagRemoteValidateOk Canonical Property
    /// This property contains TRUE if the remote viewer is allowed to call the IMAPIStatus::ValidateState method.
    /// This property appears in the status table and offers some control over transport performance. It can be considered as another
    /// way of directing the remote viewer to idle. When it is set to TRUE, the remote viewer can call IMAPIStatus::ValidateState as
    /// often as desired. A value of FALSE indicates that the remote viewer cannot make any more calls.
    /// The transport provider usually sets this property dynamically, by setting the value to FALSE to disable additional calls when the
    /// transport provider has a sufficient amount of processing to perform. When the transport provider is done, it then sets the value
    /// to TRUE to allow the client application to make further IMAPIStatus::ValidateState calls.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagremotevalidateok-canonical-property
    var remoteValidateOk: Bool? {
        return getProperty(id: .tagRemoteValidateOk)
    }
    
    /// -------
    
    /// PidTagRpcOverHttpFlags Canonical Property
    /// Contains the settings in a profile used by Microsoft Office Outlook to connect to Microsoft Exchange Server by using
    /// a remote procedure call (RPC) over Hypertext Transfer Protocol (HTTP).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpflags-canonical-property
    var rpcOverHttpFlags: RpcOverHttpFlags? {
        guard let rawValue: UInt32 = getProperty(id: .tagRpcOverHttpFlags) else {
            return nil
        }
        
        return RpcOverHttpFlags(rawValue: rawValue)
    }
    
    /// PidTagItemTemporaryflags Canonical Property
    /// Contains a flag that indicates that a message has been read, but not marked as read.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagitemtemporaryflags-canonical-property
    var itemTemporaryflags: UInt32? {
        return getProperty(id: .tagItemTemporaryflags)
    }
    
    /// PidTagRoamingBinary Canonical Property
    /// Contains a message stream associated with a subclass of the IPM.Configuration class.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagroamingbinary-canonical-property
    var roamingBinary: Data? {
        return getProperty(id: .tagRoamingBinary)
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

    /// [MS-OXPROPS] 2.777 PidTagRecipientResourceState
    /// Canonical name: PidTagRecipientResourceState
    /// Property ID: 0x5FDE
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportRecipient
    /// References: [MS-OXCFXICS], [MS-OXCMSG], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_RESOURCESTATE
    /// Not documented in specification - removed
    var recipientResourceState: UInt32? {
        return getProperty(id: .tagRecipientResourceState)
    }

    /// (Removed 080404) [MS-OXPROPS] 2.645 PidTagOriginalMessageEntryId
    /// Canonical name: PidTagOriginalMessageEntryId
    /// Property ID: 0x300F
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// References: [MS-OXCSYNC]
    /// Alternate names: PR_ORIG_ENTRYID
    /// Not documented in specification - removed
    var originalMessageEntryId: EntryID? {
        guard let data: Data = getProperty(id: .tagOriginalMessageEntryId) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    /// [MS-OXPROPS] 2.1118 PidTagSenderFlags
    /// Canonical name: PidTagSenderFlags
    /// Property ID: 0x4019
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// References: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagSenderFlags
    /// Not documented in specification - removed
    var senderFlags: UInt32? {
        return getProperty(id: .tagSenderFlags)
    }

    /// [MS-OXPROPS] 2.1015 PidTagSentRepresentingFlags
    /// Canonical name: PidTagSentRepresentingFlags
    /// Description:
    /// Property ID: 0x401A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference:
    /// Consuming references: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagSentRepresentingFlags
    var sentRepresentingFlags: UInt32? {
        return getProperty(id: .tagSentRepresentingFlags)
    }

    /// [MS-OXPROPS] 2.998 PidTagReceivedByFlags
    /// Canonical name: PidTagReceivedByFlags
    /// Property ID: 0x401B
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagRcvdByFlags
    /// Not documented in specification - removed
    var receivedByFlags: UInt32? {
        return getProperty(id: .tagReceivedByFlags)
    }

    /// [MS-OXPROPS] 2.1004 PidTagReceivedRepresentingFlags
    /// Canonical name: PidTagReceivedRepresentingFlags
    /// Property ID: 0x401C
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagRcvdRepresentingFlags
    /// Not documented in specification - removed
    var rReceivedRepresentingFlags: UInt32? {
        return getProperty(id: .tagReceivedRepresentingFlags)
    }
    
    /// [MS-OXPROPS] 2.523 PidTagCreatorAddressType
    /// Canonical name: PidTagCreatorAddressType
    /// Property ID: 0x4022
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXCMAIL]
    /// Alternate names: ptagCreatorAddrType
    /// Not documented in specification - removed
    var creatorAddressType: String? {
        return getProperty(id: .tagCreatorAddressType)
    }

    /// [MS-OXPROPS] 2.524 PidTagCreatorEmailAddress
    /// Canonical name: PidTagCreatorEmailAddress
    /// Property ID: 0x4023
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXCMAIL]
    /// Alternate names: ptagCreatorEmailAddr
    /// Not documented in specification - removed
    var creatorEmailAddress: String? {
        return getProperty(id: .tagCreatorEmailAddress)
    }
    
    /// [MS-OXPROPS] 2.1122 PidTagSenderSimpleDisplayName
    /// Canonical name: PidTagSenderSimpleDisplayName
    /// Property ID: 0x4030
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagSenderSimpleDispName
    /// Not documented in specification - removed
    var senderSimpleDisplayName: String? {
        return getProperty(id: .tagSenderSimpleDisplayName)
    }
    
    /// [MS-OXPROPS] 2.1136 PidTagSentRepresentingSimpleDisplayName
    /// Canonical name: PidTagSentRepresentingSimpleDisplayName
    /// Property ID: 0x4031
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagSentRepresentingSimpleDispName
    /// Not documented in specification - removed
    var sentRepresentingSimpleDisplayName: String? {
        return getProperty(id: .tagSentRepresentingSimpleDisplayName)
    }
    
    /// (Removed) [MS-OXPROPS] 2.732 PidTagCreatorSimpleDisplayName
    /// Canonical name: PidTagCreatorSimpleDisplayName
    /// Property ID: 0x4038
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagCreatorSimpleDispName
    /// Not documented in specification - removed
    var creatorSimpleDisplayName: String? {
        return getProperty(id: .tagCreatorSimpleDisplayName)
    }

    /// [MS-OXPROPS] 2.869 PidTagLastModifierSimpleDisplayName
    /// Canonical name: PidTagLastModifierSimpleDisplayName
    /// Property ID: 0x4039
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagLastModifierSimpleDispName
    /// Not documented in specification - removed
    var lastModifierSimpleDisplayName: String? {
        return getProperty(id: .tagLastModifierSimpleDisplayName)
    }
    
    var senderSid: SID? {
        guard let data: Data = getProperty(id: .PR_SENDER_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var reportSid: SID? {
        guard let data: Data = getProperty(id: .PR_REPORT_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var creatorSid: SID? {
        guard let data: Data = getProperty(id: .PR_CREATOR_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var receivedBySid: SID? {
        guard let data: Data = getProperty(id: .PR_RECEIVED_BY_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var originatorSid: SID? {
        guard let data: Data = getProperty(id: .PR_ORIGINATOR_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var readReceiptSid: SID? {
        guard let data: Data = getProperty(id: .PR_READ_RECEIPT_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var lastModifierSid: SID? {
        guard let data: Data = getProperty(id: .PR_LAST_MODIFIER_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var originalSenderSid: SID? {
        guard let data: Data = getProperty(id: .PR_ORIGINAL_SENDER_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var originalAuthorSid: SID? {
        guard let data: Data = getProperty(id: .PR_ORIGINAL_AUTHOR_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var reportDestinationSid: SID? {
        guard let data: Data = getProperty(id: .PR_REPORT_DESTINATION_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var sentRepresentingSid: SID? {
        guard let data: Data = getProperty(id: .PR_SENT_REPRESENTING_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    var receivedRepresentingSid: SID? {
        guard let data: Data = getProperty(id: .PR_RCVD_REPRESENTING_SID) else {
            return nil
        }
        
        var dataStream = DataStream(data)
        return try? SID(dataStream: &dataStream, endianess: .littleEndian)
    }
    
    /// Source: Mapitag.h
    var creatorFlag: UInt32? {
        return getProperty(id: .PR_CREATOR_FLAG)
    }
    
    /// Source: Mapitag.h
    var modifierFlag: UInt32? {
        return getProperty(id: .PR_MODIFIER_FLAG)
    }
    
    /// Source: Mapitag.h
    var folderChildCount: UInt32? {
        return getProperty(id: .tagSerializedReplidGuidMapOrPR_FOLDER_CHILD_COUNT)
    }
    
    /// Source: Mapitag.h
    var designInProgress: Bool? {
        return getProperty(id: .PR_DESIGN_IN_PROGRESS)
    }
    
    /// Source: Mapitag.h
    var secureOrigination: Bool? {
        return getProperty(id: .PR_SECURE_ORIGINATION)
    }
    
    /// Source: Mapitag.h
    var publishInAddressBook: Bool? {
        return getProperty(id: .PR_PUBLISH_IN_ADDRESS_BOOK)
    }
}
