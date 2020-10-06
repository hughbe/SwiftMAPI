//
//  MessageStorage+DocumentProperties.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

import Foundation

/// [MS-OXODOC] 2.2 Message Syntax
/// A Document object can be created and modified by both clients and servers. Except where noted,
/// this section defines constraints under which both clients and servers operate.
/// Clients operate on a Document object by using the Message and Attachment Object Protocol, as
/// specified in [MS-OXCMSG], and by using the Property and Stream Object Protocol, as specified in [MSOXCPRPT]. The manner in which a server operates on a Document object is implementationdependent, but the results of any such operations MUST be exposed to clients in a manner that is that
/// is consistent with the Document Object Protocol.
/// Unless otherwise stated in sections 2.2.1 and 2.2.2, a Document object MUST adhere to all property
/// constraints specified in both [MS-OXPROPS] and [MS-OXCMSG].
/// 2.2.1 Document-Specific Properties
/// A Document object encapsulates the behavior of the attached file. As such, properties on the file can
/// be promoted as properties on the Message object. Document object-specific properties that can be
/// set on the Message object are specified in section 2.2.1.1 through section 2.2.1.34.
public extension MessageStorage {
    /// [MS-OXODOC] 2.2.1.1 PidNameTitle Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameTitle property ([MS-OXPROPS] section 2.475) specifies the title of the file attached to
    /// the Document object.
    var documentTitle: String? {
        return getProperty(name: .nameTitle)
    }
    
    /// [MS-OXODOC] 2.2.1.2 PidNameSubject Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameSubject property ([MS-OXPROPS] section 2.472) specifies the subject of the file
    /// attached to the Document object.
    var documentSubject: String? {
        return getProperty(name: .nameSubject)
    }
    
    /// [MS-OXODOC] 2.2.1.3 PidNameAuthor Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameAuthor property ([MS-OXPROPS] section 2.374) specifies the original author of the file
    /// attached to the Document object.
    var author: String? {
        return getProperty(name: .nameAuthor)
    }
    
    /// [MS-OXODOC] 2.2.1.5 PidNameComments Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameComments property ([MS-OXPROPS] section 2.407) specifies the comments of the file
    /// attached to the Document object.
    var comments: String? {
        return getProperty(name: .nameComments)
    }
    
    /// [MS-OXODOC] 2.2.1.6 PidNameTemplate Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameTemplate property ([MS-OXPROPS] section 2.473) specifies the template of the file
    /// attached to the Document object.
    var template: String? {
        return getProperty(name: .nameTemplate)
    }
    
    /// [MS-OXODOC] 2.2.1.7 PidNameLastAuthor Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameLastAuthor property ([MS-OXPROPS] section 2.448) specifies the most recent author
    /// of the file attached to the Document object.
    var lastAuthor: String? {
        return getProperty(name: .nameLastAuthor)
    }
    
    /// [MS-OXODOC] 2.2.1.8 PidNameRevisionNumber Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameRevisionNumber property ([MS-OXPROPS] section 2.467) specifies the revision
    /// number of the file attached to the Document object.
    var revisionNumber: String? {
        return getProperty(name: .nameRevisionNumber)
    }
    
    /// [MS-OXODOC] 2.2.1.9 PidNameApplicationName Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameApplicationName property ([MS-OXPROPS] section 2.367) specifies the application
    /// that can be used to open the file attached to the Document object.
    var applicationName: String? {
        return getProperty(name: .nameApplicationName)
    }
    
    /// [MS-OXODOC] 2.2.1.10 PidNameEditTime Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameEditTime property ([MS-OXPROPS] section 2.420) specifies the time that the file was
    /// last edited.
    var editTime: String? {
        return getProperty(name: .nameEditTime)
    }
    
    /// [MS-OXODOC] 2.2.1.11 PidNameLastPrinted Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidNameLastPrinted property ([MS-OXPROPS] section 2.449) specifies the time that the file
    /// was last printed.
    var lastPrinted: String? {
        return getProperty(name: .nameLastPrinted)
    }
    
    /// [MS-OXODOC] 2.2.1.12 PidNameCreateDateTimeReadOnly Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCreateDateTimeReadOnly property ([MS-OXPROPS] section 2.412) specifies the time
    /// that the file was created.
    var createDateTimeReadOnly: Date? {
        return getProperty(name: .nameCreateDateTimeReadOnly)
    }
    
    /// [MS-OXODOC] 2.2.1.13 PidNameLastSaveDateTime Property
    /// Type: PtypTime ([MS-OXCDATA] section 2.11.1)
    /// The PidNameLastSaveDateTime property ([MS-OXPROPS] section 2.450) specifies the time that the
    /// file was last saved.
    var lastSaveDateTime: Date? {
        return getProperty(name: .nameLastSaveDateTime)
    }
    
    /// [MS-OXODOC] 2.2.1.14 PidNamePageCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNamePageCount property ([MS-OXPROPS] section 2.462) specifies the number of pages in
    /// the file attached to the Document object.
    var pageCount: UInt32? {
        return getProperty(name: .namePageCount)
    }
    
    /// [MS-OXODOC] 2.2.1.15 PidNameWordCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameWordCount property ([MS-OXPROPS] section 2.476) specifies the number of words in
    /// the file attached to the Document object.
    var wordCount: UInt32? {
        return getProperty(name: .nameWordCount)
    }
    
    /// [MS-OXODOC] 2.2.1.16 PidNameCharacterCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCharacterCount property ([MS-OXPROPS] section 2.406) specifies the number of
    /// characters in the file attached to the Document object.
    var characterCount: UInt32? {
        return getProperty(name: .nameCharacterCount)
    }
    
    /// [MS-OXODOC]2.2.1.17 PidNameSecurity Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameSecurity property ([MS-OXPROPS] section 2.470) specifies the security level of the file
    /// attached to the Document object.
    var security: UInt32? {
        return getProperty(name: .nameSecurity)
    }
    
    /// [MS-OXODOC] 2.2.1.18 PidNameCategory Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCategory property ([MS-OXPROPS] section 2.405) specifies the category of the file
    /// attached to the Document object.
    var category: String? {
        return getProperty(name: .nameCategory)
    }
    
    /// [MS-OXODOC] 2.2.1.19 PidNamePresentationFormat Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNamePresentationFormat property ([MS-OXPROPS] section 2.465) specifies the
    /// presentation format of the file attached to the Document object.
    var presentationFormat: String? {
        return getProperty(name: .namePresentationFormat)
    }
    
    /// [MS-OXODOC] 2.2.1.20 PidNameManager Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameManager property ([MS-OXPROPS] section 2.454) specifies the manager of the file
    /// attached to the Document object.
    var manager: String? {
        return getProperty(name: .nameManager)
    }
    
    /// [MS-OXODOC] 2.2.1.21 PidNameCompany Property
    /// Type: PtypString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameCompany property ([MS-OXPROPS] section 2.408) specifies the company for which the
    /// file was created.
    var company: String? {
        return getProperty(name: .nameCompany)
    }
    
    /// [MS-OXODOC] 2.2.1.22 PidNameByteCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameByteCount property ([MS-OXPROPS] section 2.376) specifies the size, in bytes, of the
    /// file attached to the Document object.
    var byteCount: UInt32? {
        return getProperty(name: .nameByteCount)
    }
    
    /// [MS-OXODOC] 2.2.1.23 PidNameLineCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameLineCount property ([MS-OXPROPS] section 2.451) specifies the number of lines in the
    /// file attached to the Document object.
    var lineCount: UInt32? {
        return getProperty(name: .nameLineCount)
    }
    
    /// [MS-OXODOC] 2.2.1.24 PidNameParagraphCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameParagraphCount property ([MS-OXPROPS] section 2.463) specifies the number of
    /// paragraphs in the file attached to the Document object.
    var paragraphCount: UInt32? {
        return getProperty(name: .nameParagraphCount)
    }
    
    /// [MS-OXODOC] 2.2.1.25 PidNameSlideCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameSlideCount property ([MS-OXPROPS] section 2.471) specifies the number of slides in
    /// the file attached to the Document object.
    var slideCount: UInt32? {
        return getProperty(name: .nameSlideCount)
    }
    
    /// [MS-OXODOC] 2.2.1.26 PidNameNoteCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameNoteCount property ([MS-OXPROPS] section 2.456) specifies the number of notes in
    /// the file attached to the Document object.
    var noteCount: UInt32? {
        return getProperty(name: .nameNoteCount)
    }
    
    /// [MS-OXODOC] 2.2.1.27 PidNameHiddenCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameHiddenCount property ([MS-OXPROPS] section 2.440) specifies the hidden value of the
    /// file attached to the Document object.
    var hiddenCount: UInt32? {
        return getProperty(name: .nameHiddenCount)
    }
    
    /// [MS-OXODOC] 2.2.1.28 PidNameMultimediaClipCount Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidNameMultimediaClipCount property ([MS-OXPROPS] section 2.455) specifies the number of
    /// multimedia clips in the file attached to the Document object.
    var multimediaClipCount: UInt32? {
        return getProperty(name: .nameMultimediaClipCount)
    }
    
    /// [MS-OXODOC]  2.2.1.29 PidNameDocumentParts Property
    /// Type: PtypMultipleString ([MS-OXCDATA] section 2.11.1)
    /// The PidNameDocumentParts property ([MS-OXPROPS] section 2.419) specifies the title of each part
    /// of the file attached to the Document object.
    var documentParts: String? {
        return getProperty(name: .nameDocumentParts)
    }
    
    /// [MS-OXODOC]  2.2.1.30 PidNameHeadingPairs Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidNameHeadingPairs property ([MS-OXPROPS] section 2.439) specifies which group of
    /// headings is indented in the file attached to the Document object.
    var headingsPairs: Data? {
        return getProperty(name: .nameHeadingPairs)
    }
    
    /// [MS-OXODOC]  2.2.1.31 PidNameLinksDirty Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidNameLinksDirty property ([MS-OXPROPS] section 2.452) indicates whether the links are upto-date in the file attached to the Document object. The value TRUE indicates that the links are upto-date; FALSE indicates otherwise.
    var linksDirty: Bool? {
        return getProperty(name: .nameLinksDirty)
    }
    
    /// [MS-OXODOC]  2.2.1.32 PidNameScale Property
    /// Type: PtypBoolean ([MS-OXCDATA] section 2.11.1)
    /// The PidNameScale property ([MS-OXPROPS] section 2.469) indicates whether the image attached to
    /// the Document object is to be scaled or is to be cropped. The value TRUE indicates thumbnail scaling;
    /// FALSE indicates cropping.
    var scale: Bool? {
        return getProperty(name: .nameScale)
    }
    
    /// [MS-OXODOC]  2.2.1.33 PidNameThumbnail Property
    /// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
    /// The PidNameThumbnail property ([MS-OXPROPS] section 2.474) specifies the data representing the
    /// thumbnail image of the file attached to the Document object.
    var thumbnail: Data? {
        return getProperty(name: .nameThumbnail)
    }
    
    /// [MS-OXODOC] 2.2.1.34 PidLidPendingStateForSiteMailboxDocument Property
    /// Type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
    /// The PidLidPendingStateForSiteMailboxDocument property ([MS-OXPROPS] section 2.201) specifies the synchronization state of
    /// the Document object that is in the Document Libraries folder of the site mailbox.<1>
    /// The valid values for this property are shown in the following table.
    var pendingStateForSiteMailboxDocument: PendingStateForSiteMailboxDocument? {
        guard let rawValue: UInt32 = getProperty(name: .lidPendingStateForSiteMailboxDocument) else {
            return nil
        }
        
        return PendingStateForSiteMailboxDocument(rawValue: rawValue)
    }
}
