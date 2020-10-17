//
//  DumpExtensions.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream
import Foundation


public func propertiesString(properties: [UInt16: Any?], namedProperties: [UInt16: NamedProperty]?) -> String {
    func keyString(key: UInt16, value: Any?) -> String {
        if key >= 0x8000, let kvp = namedProperties?[key - 0x8000] {
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
                let entryId = try! getEntryID(dataStream: &dataStream, size: dataStream.count)
                return "\(entryId)"
            } else if key == PropertyId.tagRemindersOnlineEntryId.rawValue ||
                key == PropertyId.tagIpmDraftsEntryId.rawValue ||
                key == PropertyId.tagIpmAppointmentEntryId.rawValue ||
                key == PropertyId.tagIpmContactEntryId.rawValue ||
                key == PropertyId.tagIpmJournalEntryId.rawValue ||
                key == PropertyId.tagIpmTaskEntryId.rawValue ||
                key == PropertyId.tagIpmNoteEntryId.rawValue {
                let entryId = try! FolderEntryID(dataStream: &dataStream)
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
                return importance.stringRepresentation
            } else if key == PropertyId.tagSensitivity.rawValue, let sensitivity = MessageSensitivity(rawValue: valueAsUInt32) {
                return sensitivity.stringRepresentation
            } else if key == PropertyId.tagStoreSupportMask.rawValue {
                let mask = StoreSupportMask(rawValue: valueAsUInt32)
                return mask.stringRepresentation
            } else if key == PropertyId.tagValidFolderMask.rawValue {
                let mask = ValidFolderMask(rawValue: valueAsUInt32)
                return mask.stringRepresentation
            } else if key == PstPropertyId.tagMessageFlags.rawValue {
                let flags = MessageFlags(rawValue: valueAsUInt32)
                return flags.stringRepresentation
            } else if key == PstPropertyId.tagMessageStatus.rawValue {
                let flags = MessageStatus(rawValue: valueAsUInt32)
                return flags.stringRepresentation
            } else if key == PstPropertyId.tagDisplayType.rawValue, let displayType = DisplayType(rawValue: valueAsUInt32) {
                return displayType.stringRepresentation
            } else if key == PstPropertyId.tagRecipientType.rawValue, let recipientType = RecipientType(rawValue: valueAsUInt32) {
                return recipientType.stringRepresentation
            } else if key == PropertyId.tagRecipientFlags.rawValue {
                let recipientFlags = RecipientFlags(rawValue: valueAsUInt32)
                return recipientFlags.stringRepresentation
            } else if key == PstPropertyId.tagObjectType.rawValue, let objectType = ObjectType(rawValue: valueAsUInt32) {
                return objectType.stringRepresentation
            } else if key == PropertyId.tagResolveMethod.rawValue, let resolveMethod = ResolveMethod(rawValue: valueAsUInt32) {
                return resolveMethod.stringRepresentation
            } else if key == PropertyId.tagAccessLevel.rawValue, let accessLevel = MessageAccessLevel(rawValue: valueAsUInt32) {
                return accessLevel.stringRepresentation
            } else if key == PropertyId.tagAccess.rawValue {
                let access = MessageAccess(rawValue: valueAsUInt32)
                return access.stringRepresentation
            } else if key == PropertyId.tagAttachMethod.rawValue, let attachMethod = AttachMethod(rawValue: valueAsUInt32) {
                return attachMethod.stringRepresentation
            } else if key == PropertyId.tagAttachFlags.rawValue {
                let flags = AttachFlags(rawValue: valueAsUInt32)
                return flags.stringRepresentation
            } else if key == PropertyId.tagDisplayTypeEx.rawValue {
                let flags = DisplayTypeEx(rawValue: valueAsUInt32)
                return flags.stringRepresentation
            } else if key == PropertyId.tagToDoItemFlags.rawValue {
                let flags = ToDoItemFlags(rawValue: valueAsUInt32)
                return flags.stringRepresentation
            }  else if key == PropertyId.tagFlagStatus.rawValue, let flagStatus = FlagStatus(rawValue: valueAsUInt32) {
                return flagStatus.stringRepresentation
            }  else if key == PropertyId.tagFollowupIcon.rawValue, let followupIcon = FollowupIcon(rawValue: valueAsUInt32) {
                return followupIcon.stringRepresentation
            } else if key == PropertyId.tagSubmitFlags.rawValue {
                let flags = SubmitFlags(rawValue: valueAsUInt32)
                return flags.stringRepresentation
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
