//
//  EnumCaseRepresentable.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import Foundation

public protocol EnumCaseRepresentable {
    associatedtype Element
    static var caseNames: [(element: Element, name: String)] { get }
}

public extension OptionSet where Self: EnumCaseRepresentable, Self.RawValue: FixedWidthInteger {
    var stringRepresentation: String {
        var strings: [String] = []
        var remaining = self
        for enumCase in Self.caseNames {
            if self.contains(enumCase.element) {
                strings.append(enumCase.name)
                remaining.remove(enumCase.element)
            }
        }
        
        if !remaining.isEmpty {
            strings.append("\(Self.self)(rawValue: \(remaining.rawValue.hexString))")
        }
        
        return "[\(strings.joined(separator: ", "))]"
    }
}

public extension RawRepresentable where Self: EnumCaseRepresentable, Self.RawValue: FixedWidthInteger, Element: RawRepresentable, Element.RawValue == Self.RawValue {
    var stringRepresentation: String {
        for enumCase in Self.caseNames {
            if rawValue == enumCase.element.rawValue {
                return enumCase.name
            }
        }
        
        return rawValue.hexString
    }
}

extension RetentionFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: RetentionFlags, name: String)] = [
        (.explicitTag, ".explicitTag"),
        (.userOverride, ".userOverride"),
        (.autoTag, ".autoTag"),
        (.personalTag, ".personalTag"),
        (.explicitArchiveTag, ".explicitArchiveTag"),
        (.keepInPlace, ".keepInPlace"),
        (.systemData, ".systemData"),
        (.needsRescan, ".needsRescan"),
        (.pendingRescan, ".pendingRescan")
    ]
}

extension DisplayType: EnumCaseRepresentable {
    public static let caseNames: [(element: DisplayType, name: String)] = [
        (.mailUser, ".mailUser"),
        (.distributionList, ".distributionList"),
        (.forum, ".forum"),
        (.agent, ".agent"),
        (.organization, ".organization"),
        (.privateDistributionList, ".privateDistributionList"),
        (.remoteMailUser, ".remoteMailUser"),
        (.container, ".container"),
        (.template, ".template"),
        (.addressTemplate, ".addressTemplate"),
        (.searchTemplate, ".searchTemplate")
    ]
}

extension MessageStatus: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageStatus, name: String)] = [
        (.remoteDownload, ".remoteDownload"),
        (.inConflict, ".inConflict"),
        (.remoteDelete, ".remoteDelete")
    ]
}

extension MessageFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageFlags, name: String)] = [
        (.read, ".read"),
        (.unsent, ".unsent"),
        (.resend, ".resend"),
        (.unmodified, ".unmodified"),
        (.submitted, ".submitted"),
        (.hasAttachment, ".hasAttachment"),
        (.fromMe, ".fromMe"),
        (.fai, ".fai"),
        (.notifyRead, ".notifyRead"),
        (.notifyUnread, ".notifyUnread"),
        (.notifyEverRead, ".notifyEverRead"),
        (.internet, ".internet"),
        (.untrusted, ".untrusted")
    ]
}

extension MessageSensitivity: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageSensitivity, name: String)] = [
        (.normal, ".normal"),
        (.personal, ".personal"),
        (.`private`, ".`private`"),
        (.confidential, ".confidential")
    ]
}

extension MessageImportance: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageImportance, name: String)] = [
        (.low, ".low"),
        (.normal, ".normal"),
        (.high, ".high")
    ]
}

extension ResolveMethod: EnumCaseRepresentable {
    public static let caseNames: [(element: ResolveMethod, name: String)] = [
        (.`default`, ".default"),
        (.lastWriterWins, ".lastWriterWins"),
        (.noConflictNotification, ".noConflictNotification")
    ]
}

extension ObjectType: EnumCaseRepresentable {
    public static let caseNames: [(element: ObjectType, name: String)] = [
        (.storeObject, ".storeObject"),
        (.addressBookObject, ".addressBookObject"),
        (.folder, ".folder"),
        (.addressBookContainer, ".addressBookContainer"),
        (.message, ".message"),
        (.mailUser, ".mailUser"),
        (.attachment, ".attachment"),
        (.distributionList, ".distributionList")
    ]
}

extension OneOffEntryFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: OneOffEntryFlags, name: String)] = [
        (.noRichInfo, ".noRichInfo"),
        (.unicode, ".unicode")
    ]
}

extension AddressBookEntryType: EnumCaseRepresentable {
    public static let caseNames: [(element: AddressBookEntryType, name: String)] = [
        (.localMailUser, ".localMailUser"),
        (.distributionList, ".distributionList"),
        (.bulletinBoardOrPublicFolder, ".bulletinBoardOrPublicFolder"),
        (.automatedMailbox, ".automatedMailbox"),
        (.organizationalMailbox, ".organizationalMailbox"),
        (.privateDistributionList, ".privateDistributionList"),
        (.remoteMailUser, ".remoteMailUser"),
        (.container, ".container"),
        (.template, ".template"),
        (.oneOffUser, ".oneOffUser"),
        (.search, ".search")
    ]
}

extension MessagePriority: EnumCaseRepresentable {
    public static let caseNames: [(element: MessagePriority, name: String)] = [
        (.urgent, ".urgent"),
        (.normal, ".normal"),
        (.notUrgent, ".notUrgent")
    ]
}

extension MessageNativeBody: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageNativeBody, name: String)] = [
        (.undefined, ".undefined"),
        (.plainText, ".plainText"),
        (.rtf, ".rtf"),
        (.html, ".html"),
        (.clearSigned, ".clearSigned")
    ]
}

extension RecipientFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: RecipientFlags, name: String)] = [
        (.sendable, ".sendable"),
        (.organizer, ".organizer"),
        (.exceptionalResponse, ".exceptionalResponse"),
        (.exceptionalDeleted, ".exceptionalDeleted"),
        (.original, ".original")
    ]
}

extension RecipientType: EnumCaseRepresentable {
    public static let caseNames: [(element: RecipientType, name: String)] = [
        (.originator, ".originator"),
        (.primaryRecipient, ".primaryRecipient"),
        (.ccRecipient, ".ccRecipient"),
        (.bccRecipient, ".bccRecipient")
    ]
}

extension MessageEditorFormat: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageEditorFormat, name: String)] = [
        (.dontKnow, ".dontKnow"),
        (.plainText, ".plainText"),
        (.html, ".html"),
        (.rtf, ".rtf")
    ]
}

extension ValidFolderMask: EnumCaseRepresentable {
    public static let caseNames: [(element: ValidFolderMask, name: String)] = [
        (.ipmSubtreeValid, ".ipmSubtreeValid"),
        (.ipmInboxValid, ".ipmInboxValid"),
        (.ipmOutboxValid, ".ipmOutboxValid"),
        (.ipmWasteBasketValid, ".ipmWasteBasketValid"),
        (.ipmSentMailValid, ".ipmSentMailValid"),
        (.viewsValid, ".viewsValid"),
        (.commonViewsValid, ".commonViewsValid"),
        (.finderValid, ".finderValid")
    ]
}

extension ResponseStatus: EnumCaseRepresentable {
    public static let caseNames: [(element: ResponseStatus, name: String)] = [
        (.none, ".none"),
        (.organized, ".organized"),
        (.tentative, ".tentative"),
        (.accepted, ".accepted"),
        (.declined, ".declined"),
        (.notResponded, ".notResponded")
    ]
}

extension StoreSupportMask: EnumCaseRepresentable {
    public static let caseNames: [(element: StoreSupportMask, name: String)] = [
        (.unicodeOk, ".unicodeOk")
    ]
}

extension MessageAccessLevel: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageAccessLevel, name: String)] = [
        (.readOnly, ".readOnly"),
        (.modify, ".modify")
    ]
}

extension MessageAccess: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageAccess, name: String)] = [
        (.modify, ".modify"),
        (.read, ".read"),
        (.delete, ".delete"),
        (.createHierachyTable, ".createHierachyTable"),
        (.createContentsTable, ".createContentsTable"),
        (.createAssociatedContentsTable, ".createAssociatedContentsTable")
    ]
}

extension AttachMethod: EnumCaseRepresentable {
    public static let caseNames: [(element: AttachMethod, name: String)] = [
        (.none, ".none"),
        (.byValue, ".byValue"),
        (.byReference, ".byReference"),
        (.byReferenceOnly, ".byReferenceOnly"),
        (.embeddedMessage, ".embeddedMessage"),
        (.storage, ".storage"),
        (.byWebReference, ".byWebReference"),
    ]
}

extension AttachFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: AttachFlags, name: String)] = [
        (.invisibleInHtml, ".invisibleInHtml"),
        (.invisibleInRtf, ".invisibleInRtf"),
        (.renderedInBody, ".renderedInBody")
    ]
}

extension TaskMode: EnumCaseRepresentable {
    public static let caseNames: [(element: TaskMode, name: String)] = [
        (.notAssigned, ".notAssigned"),
        (.embeddedInTaskRequest, ".embeddedInTaskRequest"),
        (.acceptedByAssignee, ".acceptedByAssignee"),
        (.rejectedByAssignee, ".rejectedByAssignee"),
        (.embeddedInTaskUpdate, ".embeddedInTaskUpdate"),
        (.assignedToTaskAssigner, ".assignedToTaskAssigner")
    ]
}

extension MessageSideEffects: EnumCaseRepresentable {
    public static let caseNames: [(element: MessageSideEffects, name: String)] = [
        (.openToDelete, ".openToDelete"),
        (.noFrame, ".noFrame"),
        (.coerceToInbox, ".coerceToInbox"),
        (.openToCopy, ".openToCopy"),
        (.openToMove, ".openToMove"),
        (.openForContextMenu, ".openForContextMenu"),
        (.cannotUndoDelete, ".cannotUndoDelete"),
        (.cannotUndoCopy, ".cannotUndoCopy"),
        (.cannotUndoMove, ".cannotUndoMove"),
        (.hasScript, ".hasScript"),
        (.openToPermanentlyDelete, ".openToPermanentlyDelete")
    ]
}

extension DisplayTypeEx: EnumCaseRepresentable {
    public static let caseNames: [(element: DisplayTypeEx, name: String)] = [
        (.remote, ".remote"),
        (.serverSupportsSharing, ".serverSupportsSharing"),
        (.remoteForest, ".remoteForest"),
        (.local, ".local")
    ]
}

extension TaskAcceptanceState: EnumCaseRepresentable {
    public static let caseNames: [(element: TaskAcceptanceState, name: String)] = [
        (.notAssigned, ".notAssigned"),
        (.unknown, ".unknown"),
        (.assigneeAccepted, ".assigneeAccepted"),
        (.assigneeRejected, ".assigneeRejected")
    ]
}

extension TaskStatus: EnumCaseRepresentable {
    public static let caseNames: [(element: TaskStatus, name: String)] = [
        (.notStarted, ".notStarted"),
        (.inProgress, ".inProgress"),
        (.complete, ".complete"),
        (.waitingOnSomeoneElse, ".waitingOnSomeoneElse"),
        (.userDeferredWork, ".userDeferredWork")
    ]
}

extension TaskState: EnumCaseRepresentable {
    public static let caseNames: [(element: TaskState, name: String)] = [
        (.notAssigned, ".notAssigned"),
        (.taskAssigneesCopyOfAssignedTask, ".taskAssigneesCopyOfAssignedTask"),
        (.taskAssignersCopyOfAssignedTask, ".taskAssignersCopyOfAssignedTask"),
        (.taskAssignersCopyOfRejectedTask, ".taskAssignersCopyOfRejectedTask"),
        (.couldNotBeFoundLocally, ".couldNotBeFoundLocally")
    ]
}

extension TaskOwnership: EnumCaseRepresentable {
    public static let caseNames: [(element: TaskOwnership, name: String)] = [
        (.notAssigned, ".notAssigned"),
        (.assignersCopy, ".assignersCopy"),
        (.asssigneesCopy, ".asssigneesCopy")
    ]
}

extension ToDoItemFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: ToDoItemFlags, name: String)] = [
        (.timeFlagged, ".timeFlagged"),
        (.recipientFlagged, ".recipientFlagged")
    ]
}

extension FlagStatus: EnumCaseRepresentable {
    public static let caseNames: [(element: FlagStatus, name: String)] = [
        (.complete, ".complete"),
        (.flagged, ".flagged")
    ]
}

extension ClientIntent: EnumCaseRepresentable {
    public static let caseNames: [(element: ClientIntent, name: String)] = [
        (.manager, ".manager"),
        (.delegate, ".delegate"),
        (.deletedWithNoResponse, ".deletedWithNoResponse"),
        (.deletedExceptionWithNoResponse, ".deletedExceptionWithNoResponse"),
        (.respondedTentative, ".respondedTentative"),
        (.respondedAccept, ".respondedAccept"),
        (.respondedDecline, ".respondedDecline"),
        (.modifiedStartTime, ".modifiedStartTime"),
        (.modifiedEndTime, ".modifiedEndTime"),
        (.modifiedLocation, ".modifiedLocation"),
        (.respondedExceptionDecline, ".respondedExceptionDecline"),
        (.canceled, ".canceled"),
        (.exceptionCanceled, ".exceptionCanceled")
    ]
}

extension FollowupIcon: EnumCaseRepresentable {
    public static let caseNames: [(element: FollowupIcon, name: String)] = [
        (.purple, ".purple"),
        (.orange, ".orange"),
        (.green, ".green"),
        (.yellow, ".yellow"),
        (.blue, ".blue"),
        (.red, ".red")
    ]
}

extension SubmitFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: SubmitFlags, name: String)] = [
        (.locked, ".locked"),
        (.preprocess, ".preprocess")
    ]
}

extension StoreObjectType: EnumCaseRepresentable {
    public static let caseNames: [(element: StoreObjectType, name: String)] = [
        (.privateFolder, ".privateFolder"),
        (.publicFolder, ".publicFolder"),
        (.mappedPublicFolder, ".mappedPublicFolder"),
        (.privateMessage, ".privateMessage"),
        (.publicMessage, ".publicMessage"),
        (.mappedPublicMessage, ".mappedPublicMessage"),
        (.publicNewsgroupFolder, ".publicNewsgroupFolder")
    ]
}

extension AutoProcessState: EnumCaseRepresentable {
    public static let caseNames: [(element: AutoProcessState, name: String)] = [
        (.dontProcess, ".dontProcess"),
        (.processWhenReceivedOrOpened, ".processWhenReceivedOrOpened"),
        (.processWhenOpened, ".processWhenOpened")
    ]
}

extension AddressBookProviderArrayType: EnumCaseRepresentable {
    public static let caseNames: [(element: AddressBookProviderArrayType, name: String)] = [
        (.email1Defined, ".email1Defined"),
        (.email2Defined, ".email2Defined"),
        (.email3Defined, ".email3Defined"),
        (.businessFaxDefined, ".businessFaxDefined"),
        (.homeFaxDefined, ".homeFaxDefined"),
        (.primaryFaxDefined, ".primaryFaxDefined")
    ]
}

extension PostalAddressId: EnumCaseRepresentable {
    public static let caseNames: [(element: PostalAddressId, name: String)] = [
        (.noMailingAddress, ".noMailingAddress"),
        (.homeAddressIsMailingAddress, ".homeAddressIsMailingAddress"),
        (.workAddressIsMailingAddress, ".workAddressIsMailingAddress"),
        (.otherAddressIsMailingAddress, ".otherAddressIsMailingAddress")
    ]
}

extension VoteOptionSendBehavior: EnumCaseRepresentable {
    public static let caseNames: [(element: VoteOptionSendBehavior, name: String)] = [
        (.unknown, ".unknown"),
        (.automaticallySend, ".automaticallySend"),
        (.promptUser, ".promptUser")
    ]
}

extension ConferencingType: EnumCaseRepresentable {
    public static let caseNames: [(element: ConferencingType, name: String)] = [
        (.windowsNetmeeting, ".windowsNetmeeting"),
        (.windowsMediaServices, ".windowsMediaServices"),
        (.exchangeConferencing, ".exchangeConferencing")
    ]
}

extension BusyStatus: EnumCaseRepresentable {
    public static let caseNames: [(element: BusyStatus, name: String)] = [
        (.free, ".free"),
        (.tentative, ".tentative"),
        (.busy, ".busy"),
        (.outOfOffice, ".outOfOffice"),
        (.workingElsewhere, ".workingElsewhere")
    ]
}

extension AppointmentColor: EnumCaseRepresentable {
    public static let caseNames: [(element: AppointmentColor, name: String)] = [
        (.none, ".none"),
        (.red, ".red"),
        (.blue, ".blue"),
        (.green, ".green"),
        (.grey, ".grey"),
        (.orange, ".orange"),
        (.cyan, ".cyan"),
        (.olive, ".olive"),
        (.purple, ".purple"),
        (.teal, ".teal"),
        (.yellow, ".yellow")
    ]
}

extension AppointmentAuxiliaryFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: AppointmentAuxiliaryFlags, name: String)] = [
        (.copied, ".copied"),
        (.forceMtfResponse, ".forceMtfResponse"),
        (.forwarded, ".forwarded"),
        (.repairUpdateMessage, ".repairUpdateMessage")
    ]
}

extension AppointmentStateFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: AppointmentStateFlags, name: String)] = [
        (.meeting, ".meeting"),
        (.received, ".received"),
        (.canceled, ".canceled")
    ]
}

extension TZRuleFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: TZRuleFlags, name: String)] = [
        (.recurCurrentTzReg, ".recurCurrentTzReg"),
        (.effectiveTzReg, ".effectiveTzReg")
    ]
}

extension LogFlags: EnumCaseRepresentable {
    public static let caseNames: [(element: LogFlags, name: String)] = [
        (.noAssociatedAttachment, ".noAssociatedAttachment"),
        (.hasAssociatedAttachment, ".hasAssociatedAttachment")
    ]
}

extension NoteColor: EnumCaseRepresentable {
    public static let caseNames: [(element: NoteColor, name: String)] = [
        (.blue, ".blue"),
        (.green, ".green"),
        (.pink, ".pink"),
        (.yellow, ".yellow"),
        (.white, ".white")
    ]
}
