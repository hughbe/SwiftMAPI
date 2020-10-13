//
//  DumpExtensions.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream
import Foundation

public extension Sequence where Element: FixedWidthInteger {
    var hexString: String {
        return "[\(map { $0.hexString }.joined(separator: ", "))]"
    }
}

public extension OptionSet where RawValue: FixedWidthInteger {
    private func elements() -> AnySequence<Self> {
        var remainingBits = rawValue
        var bitMask: RawValue = 1
        return AnySequence {
            return AnyIterator {
                while remainingBits != 0 {
                    defer { bitMask = bitMask &* 2 }
                    if remainingBits & bitMask != 0 {
                        remainingBits = remainingBits & ~bitMask
                        return Self(rawValue: bitMask)
                    }
                }

                return nil
            }
        }
    }

    func stringRepresentation(cases: [(value: Self.Element, name: String)]) -> String {
        var strings: [String] = []
        for enumCase in cases {
            if contains(enumCase.value) {
                strings.append(enumCase.name)
            }
        }
        
        return "[\(strings.joined(separator: ", "))]"
    }
}

public extension RawRepresentable where RawValue == UInt32 {
    func stringRepresentation(cases: [(value: Self, name: String)]) -> String {
        for enumCase in cases {
            if rawValue == enumCase.value.rawValue {
                return enumCase.name
            }
        }
        
        return rawValue.hexString
    }
}

public extension RetentionFlags {
    static let caseNames: [(RetentionFlags, String)] = [
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

public extension DisplayType {
    static let caseNames: [(DisplayType, String)] = [
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

public extension MessageStatus {
    static let caseNames: [(MessageStatus, String)] = [
        (.remoteDownload, ".remoteDownload"),
        (.inConflict, ".inConflict"),
        (.remoteDelete, ".remoteDelete")
    ]
}

public extension MessageFlags {
    static let caseNames: [(MessageFlags, String)] = [
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

public extension MessageSensitivity {
    static let caseNames: [(MessageSensitivity, String)] = [
        (.normal, ".normal"),
        (.personal, ".personal"),
        (.`private`, ".`private`"),
        (.confidential, ".confidential")
    ]
}

public extension MessageImportance {
    static let caseNames: [(MessageImportance, String)] = [
        (.low, ".low"),
        (.normal, ".normal"),
        (.high, ".high")
    ]
}

public extension ResolveMethod {
    static let caseNames: [(ResolveMethod, String)] = [
        (.`default`, ".default"),
        (.lastWriterWins, ".lastWriterWins"),
        (.noConflictNotification, ".noConflictNotification")
    ]
}

public extension ObjectType {
    static let caseNames: [(ObjectType, String)] = [
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

public extension OneOffEntryFlags {
    static let caseNames: [(OneOffEntryFlags, String)] = [
        (.noRichInfo, ".noRichInfo"),
        (.unicode, ".unicode")
    ]
}

public extension AddressBookEntryType {
    static let caseNames: [(AddressBookEntryType, String)] = [
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

public extension MessagePriority {
    static let caseNames: [(MessagePriority, String)] = [
        (.urgent, ".urgent"),
        (.normal, ".normal"),
        (.notUrgent, ".notUrgent")
    ]
}

public extension MessageNativeBody {
    static let caseNames: [(MessageNativeBody, String)] = [
        (.undefined, ".undefined"),
        (.plainText, ".plainText"),
        (.rtf, ".rtf"),
        (.html, ".html"),
        (.clearSigned, ".clearSigned")
    ]
}

public extension RecipientFlags {
    static let caseNames: [(RecipientFlags, String)] = [
        (.sendable, ".sendable"),
        (.organizer, ".organizer"),
        (.exceptionalResponse, ".exceptionalResponse"),
        (.exceptionalDeleted, ".exceptionalDeleted"),
        (.original, ".original")
    ]
}

public extension RecipientType {
    static let caseNames: [(RecipientType, String)] = [
        (.originator, ".originator"),
        (.primaryRecipient, ".primaryRecipient"),
        (.ccRecipient, ".ccRecipient"),
        (.bccRecipient, ".bccRecipient")
    ]
}

public extension MessageEditorFormat {
    static let caseNames: [(MessageEditorFormat, String)] = [
        (.dontKnow, ".dontKnow"),
        (.plainText, ".plainText"),
        (.html, ".html"),
        (.rtf, ".rtf")
    ]
}

public extension ValidFolderMask {
    static let caseNames: [(ValidFolderMask, String)] = [
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

public extension ResponseStatus {
    static let caseNames: [(ResponseStatus, String)] = [
        (.none, ".none"),
        (.organized, ".organized"),
        (.tentative, ".tentative"),
        (.accepted, ".accepted"),
        (.declined, ".declined"),
        (.notResponded, ".notResponded")
    ]
}

public func propertiesString(properties: [UInt16: Any?], namedProperties: [NamedProperty: UInt16]?) -> String {
    func keyString(key: UInt16, value: Any?) -> String {
        if key >= 0x8000, let kvp = namedProperties?.first(where: { $0.value == key - 0x8000 })?.key {
            return kvp.description
        }

        if let type = PstPropertyId(rawValue: key) {
            return "\(type)"
        } else if let type = PropertyId(rawValue: key) {
            return "\(type)"
        }

        if key < 0x8000 {
            fatalError("Unknown property ID: \(key.hexString) with value \(valueString(key: key, value: value))")
        }
        return key.hexString
    }
    
    func valueString(key: UInt16, value: Any?) -> String {
        guard let value = value else {
            return "nil"
        }
        
        if let binary = value as? Data {
            var dataStream = DataStream(data: binary)
            if key == PropertyId.tagPredecessorChangeList.rawValue {
                let changeList = try! PredecessorChangeList(dataStream: &dataStream)
                return changeList.description
            } else if key == PropertyId.tagChangeKey.rawValue {
                let changeKey = try! XID(dataStream: &dataStream, size: dataStream.count)
                return changeKey.description
            } else if key == PropertyId.tagEntryId.rawValue ||
                    key == PropertyId.tagReceivedByEntryId.rawValue ||
                    key == PropertyId.tagSenderEntryId.rawValue ||
                    key == PropertyId.tagSentRepresentingEntryId.rawValue ||
                    key == PropertyId.tagReceivedRepresentingEntryId.rawValue ||
                    key == PropertyId.tagRecipientEntryId.rawValue {
                let entryId = try! getEntryID(dataStream: &dataStream)
                return "\(entryId)"
            } else if key == PropertyId.tagRemindersOnlineEntryId.rawValue ||
                key == PropertyId.tagIpmDraftsEntryId.rawValue ||
                key == PropertyId.tagIpmAppointmentEntryId.rawValue ||
                key == PropertyId.tagIpmContactEntryId.rawValue ||
                key == PropertyId.tagIpmJournalEntryId.rawValue ||
                key == PropertyId.tagIpmTaskEntryId.rawValue ||
                key == PropertyId.tagIpmNoteEntryId.rawValue {
                let entryId = try! GeneralEntryID(dataStream: &dataStream)
                return "\(entryId)"
            } else if key == PropertyId.tagStoreEntryId.rawValue || key == PropertyId.tagWlinkStoreEntryId.rawValue {
                let entryId = try! StoreEntryID(dataStream: &dataStream)
                return "\(entryId)"
            }

            return binary.hexString
        } else if let multipleBinary = value as? [[UInt8]] {
            var s = "[\n"
            for entry in multipleBinary.enumerated() {
                s += "\t - [\(entry.offset)] \(valueString(key: key, value: entry.element))\n"
            }
            
            s += "]"
            return s
        } else if let valueAsUInt32 = value as? UInt32 {
            if key == PropertyId.tagImportance.rawValue, let importance = MessageImportance(rawValue: valueAsUInt32) {
                return importance.stringRepresentation(cases: MessageImportance.caseNames)
            } else if key == PropertyId.tagSensitivity.rawValue, let sensitivity = MessageSensitivity(rawValue: valueAsUInt32) {
                return sensitivity.stringRepresentation(cases: MessageSensitivity.caseNames)
            } else if key == PropertyId.tagValidFolderMask.rawValue {
                let mask = ValidFolderMask(rawValue: valueAsUInt32)
                return mask.stringRepresentation(cases: ValidFolderMask.caseNames)
            } else if key == PstPropertyId.tagMessageFlags.rawValue {
                let flags = MessageFlags(rawValue: valueAsUInt32)
                return flags.stringRepresentation(cases: MessageFlags.caseNames)
            } else if key == PstPropertyId.tagMessageStatus.rawValue {
                let flags = MessageStatus(rawValue: valueAsUInt32)
                return flags.stringRepresentation(cases: MessageStatus.caseNames)
            } else if key == PstPropertyId.tagDisplayType.rawValue, let displayType = DisplayType(rawValue: valueAsUInt32) {
                return displayType.stringRepresentation(cases: DisplayType.caseNames)
            } else if key == PstPropertyId.tagRecipientType.rawValue, let recipientType = RecipientType(rawValue: valueAsUInt32) {
                return recipientType.stringRepresentation(cases: RecipientType.caseNames)
            } else if key == PropertyId.tagRecipientFlags.rawValue {
                let recipientFlags = RecipientFlags(rawValue: valueAsUInt32)
                return recipientFlags.stringRepresentation(cases: RecipientFlags.caseNames)
            } else if key == PstPropertyId.tagObjectType.rawValue, let objectType = ObjectType(rawValue: valueAsUInt32) {
                return objectType.stringRepresentation(cases: ObjectType.caseNames)
            } else if key == PropertyId.tagResolveMethod.rawValue, let resolveMethod = ResolveMethod(rawValue: valueAsUInt32) {
                return resolveMethod.stringRepresentation(cases: ResolveMethod.caseNames)
            }
            
            return "\(valueAsUInt32.hexString)"
        } else if let valueAsString = value as? String {
            return "\"\(valueAsString)\""
        } else {
            return "\(value)"
        }
    }
    
    var s = ""
    for entry in properties.enumerated() {
        s += "- \(keyString(key: entry.element.key, value: entry.element.value)): \(valueString(key: entry.element.key, value: entry.element.value))"
        if entry.offset != properties.count - 1 {
            s += "\n"
        }
    }
    
    return s
}
