//
//  MessageStorage+VoiceMailAndFaxProperties.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

import Foundation

/// [MS-OXOUM] 2.2 Message Syntax
/// Unlike many other client-server objects, the server creates Unified Messaging objects. The server
/// MUST include the general properties, as specified in [MS-OXCMSG] section 2.2.1.1. The server
/// SHOULD also set the submission properties, as specified in [MS-OXOMSG] section 2.2.3.
/// [MS-OXOUM] 2.2.5 Message Object Properties
/// Message object properties that can be defined on Message objects that contain voice messages
/// and protected voice messages are specified in section 2.2.5.1 through section 2.2.5.15. Message
/// objects are further specified in [MS-OXCMSG].
public extension MessageStorage {
    /// [MS-OXOUM] 2.2.5.1 PidTagSenderTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidTagSenderTelephoneNumber property ([MS-OXPROPS] section 2.1001) contains the
    /// telephone number of the caller associated with a voice message.
    /// The relationship between this property and the X-CallingTelephoneNumber MIME header is
    /// specified in [MS-OXCMAIL] section 2.1.3.2.3.
    var senderTelephoneNumber: String? {
        return getProperty(id: .tagOfflineAddressBookContainerGuidOrTagRwRulesStreamOrTagSenderTelephoneNumber)
    }

    /// [MS-OXOUM] 2.2.5.2 PidNameXSenderTelephoneNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidNameXSenderTelephoneNumber property ([MS-OXPROPS] section 2.480) contains the
    /// telephone number of the caller associated with a voice message.
    /// The relationship between this property and the X-CallingTelephoneNumber MIME header is
    /// specified in [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var xSenderTelephoneNumber: String? {
        return getProperty(name: .nameXSenderTelephoneNumber)
    }
    
    /// [MS-OXOUM] 2.2.5.3 PidTagVoiceMessageDuration Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagVoiceMessageDuration property ([MS-OXPROPS] section 2.1054) specifies the length of
    /// the attached voice message, in seconds.
    /// The relationship between this property and the X-VoiceMessageDuration MIME header is specified
    /// in [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var voiceMessageDuration: UInt32? {
        return getProperty(id: .tagOfflineAddressBookSequenceOrTagVoiceMessageDuration)
    }

    /// [MS-OXOUM] 2.2.5.4 PidNameXVoiceMessageDuration Property
    /// Type: PtypInteger16 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXVoiceMessageDuration property ([MS-OXPROPS] section 2.497) specifies the length
    /// of the attached voice message, in seconds.
    /// The relationship between this property and the X-VoiceMessageDuration MIME header is specified
    /// in [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var xVoiceMessageDuration: UInt16? {
        return getProperty(name: .nameXVoiceMessageDuration)
    }
    
    /// [MS-OXOUM] 2.2.5.5 PidTagVoiceMessageSenderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidTagVoiceMessageSenderName property ([MS-OXPROPS] section 2.1055) specifies the
    /// name of the caller who left the attached voice message, as provided by the voice network's caller ID
    /// system.
    /// The relationship between this property and the X-VoiceMessageSenderName MIME header is
    /// specified in [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var voiceMessageSenderName: String? {
        return getProperty(id: .tagOfflineAddressBookMessageClassOrTagVoiceMessageSenderName)
    }

    /// [MS-OXOUM] 2.2.5.6 PidNameXVoiceMessageSenderName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1.2)
    /// The PidNameXVoiceMessageSenderName property ([MS-OXPROPS] section 2.498) specifies the
    /// name of the caller who left the attached voice message, as provided by the voice network's caller ID
    /// system.
    /// The relationship between this property and the X-VoiceMessageSenderName MIME header is
    /// specified in [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var xVoiceMessageSenderName: String? {
        return getProperty(name: .nameXVoiceMessageSenderName)
    }
    
    /// [MS-OXOUM] 2.2.5.7 PidTagFaxNumberOfPages Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidTagFaxNumberOfPages property ([MS-OXPROPS] section 2.689) specifies how many
    /// discrete pages are contained within an attachment representing a facsimile message.
    /// The relationship between this property and the X-FaxNumberOfPages MIME header is specified in
    /// [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var faxNumberOfPages: UInt32? {
        return getProperty(id: .tagFaxNumberOfPagesOrTagOfflineAddressBookDistinguishedName)
    }

    /// [MS-OXOUM] 2.2.5.8 PidNameXFaxNumberOfPages Property
    /// Type: PtypInteger16 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXFaxNumberOfPages property ([MS-OXPROPS] section 2.478) specifies how many
    /// discrete pages are contained within an attachment representing a facsimile message.
    /// The relationship between this property and the X-FaxNumberOfPages MIME header is specified in
    /// [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var xFaxNumberOfPages: UInt16? {
        return getProperty(name: .nameXFaxNumberOfPages)
    }
    
    /// [MS-OXOUM] 2.2.5.9 PidTagVoiceMessageAttachmentOrder Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagVoiceMessageAttachmentOrder property ([MS-OXPROPS] section 2.1053) contains the
    /// list of names for the audio file attachments that are to be played as part of a message, in reverse
    /// order. The file names are separated by semicolons.
    /// The content of this property is a list of values assigned to the PidTagAttachLongFilename property
    /// ([MS-OXCMSG] section 2.2.2.10) for audio file attachments that are to be played as part of the
    /// message. The order MUST be the reverse of the order in which the attachments were added; that is,
    /// the most recently added message first, the next most recently added message second, and so on.
    /// The file names MUST be separated by semicolons. Each file name can be prefixed or suffixed with
    /// spaces. The first file name in the list can be preceded by a semicolon, and the last file name in the list
    /// can be suffixed with a semicolon.
    /// For example, for a message that contains only one voice file attachment, for which the value of the
    /// PidTagAttachLongFilename property is "vm.wav", acceptable values for the
    /// PidTagVoiceMessageAttachmentOrder property include but are not limited to the following:
    ///  vm.wav
    ///  ;vm.wav
    ///  ; vm.wav
    /// Or, for example, a message contains three attachments, for which the PidTagAttachLongFilename
    /// property values are "vm1.wav", "vm2.wav", and "vm3.wav". The files were added in the order
    /// "vm1.wav", then "vm2.wav", and then "vm3.wav". Acceptable values for the
    /// PidTagVoiceMessageAttachmentOrder property include but are not limited to the following:
    ///  vm3.wav;vm2.wav;vm1.wav
    ///  vm3.wav; vm2.wav; vm1.wav
    ///  ;vm3.wav;vm2.wav;vm1.wav
    ///  Vm3.wav;vm2.wav;vm1.wav
    /// The relationship between this property and the X-AttachmentOrder MIME header is specified in
    /// [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var voiceMessageAttachmentOrder: String? {
        return getProperty(id: .tagOfflineAddressBookTruncatedPropertiesOrTagVoiceMessageAttachmentOrder)
    }

    /// [MS-OXOUM] 2.2.5.10 PidNameXVoiceMessageAttachmentOrder Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXVoiceMessageAttachmentOrder property ([MS-OXPROPS] section 2.496) contains
    /// the list of names for the audio file attachments that are to be played as part of a voice message, in
    /// reverse order. The file names are separated by semicolons.
    /// The format of this property is identical to the format of the PidTagVoiceMessageAttachmentOrder
    /// property (section 2.2.5.9).
    /// The relationship between this property and the X-AttachmentOrder MIME header is specified in
    /// [MS-OXCMAIL] section 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var xVoiceMessageAttachmentOrder: String? {
        return getProperty(name: .nameXVoiceMessageAttachmentOrder)
    }
    
    /// [MS-OXOUM] 2.2.5.11 PidTagCallId Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidTagCallId property ([MS-OXPROPS] section 2.622) is a unique identifier associated with the
    /// phone call.
    /// The relationship between this property and the MIME header is specified in [MS-OXCMAIL] section
    /// 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var callId: String? {
        return getProperty(id: .tagOfflineAddressBookTruncatedPropertiesOrTagVoiceMessageAttachmentOrder)
    }

    /// [MS-OXOUM] 2.2.5.12 PidNameXCallId
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXCallId property ([MS-OXPROPS] section 2.477) is a unique identifier associated with
    /// the phone call.
    /// The relationship between this property and the MIME header is specified in [MS-OXCMAIL] section
    /// 2.1.3.2.3 and [MS-OXCMAIL] section 2.2.3.2.23.
    var xCallId: String? {
        return getProperty(name: .nameXCallId)
    }

    /// [MS-OXOUM] 2.2.5.13 PidNameAutomaticSpeechRecognitionData Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAutomaticSpeechRecognitionData property ([MS-OXPROPS] section 2.375) contains
    /// the automated text transcription of the attached voice message.
    /// Further details on the format of this property are specified in section 2.2.2.5.
    var automaticSpeechRecognitionData: String? {
        return getProperty(name: .nameAutomaticSpeechRecognitionData)
    }

    /// [MS-OXOUM] 2.2.5.14 PidNameXRequireProtectedPlayOnPhone Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidNameXRequireProtectedPlayOnPhone property ([MS-OXPROPS] section 2.479) specifies
    /// whether a protected voice message can only be played over the phone.
    /// Further details on the format of this property are specified in section 2.2.3.3.
    var xRequireProtectedPlayOnPhone: String? {
        return getProperty(name: .nameXRequireProtectedPlayOnPhone)
    }
    
    /// [MS-OXOUM] 2.2.5.15 PidNameAudioNotes Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAudioNotes property ([MS-OXPROPS] section 2.373) is an optional property set by the
    /// client that contains any notes added by the user to the voice message.
    var audioNotes: String? {
        return getProperty(name: .nameAudioNotes)
    }
}
