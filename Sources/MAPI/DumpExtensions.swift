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

private extension OptionSet where RawValue: FixedWidthInteger {
    func elements() -> AnySequence<Self> {
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

    func dump(cases: [(value: Self.Element, name: String)]) -> String {
        var strings: [String] = []
        for enumCase in cases {
            if contains(enumCase.value) {
                strings.append(enumCase.name)
            }
        }
        
        return "[\(strings.joined(separator: ", "))]"
    }
}

extension RawRepresentable where RawValue == UInt32 {
    func dump(cases: [(value: Self, name: String)]) -> String {
        for enumCase in cases {
            if rawValue == enumCase.value.rawValue {
                return enumCase.name
            }
        }
        
        return rawValue.hexString
    }
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
            } else if key == PropertyId.tagReceivedByEntryId.rawValue ||
                    key == PropertyId.tagSenderEntryId.rawValue ||
                    key == PropertyId.tagSentRepresentingEntryId.rawValue ||
                    key == PropertyId.tagReceivedRepresentingEntryId.rawValue {
                let entryId = try! getEntryID(dataStream: &dataStream)
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
                return importance.dump(cases: [
                    (.low, ".low"),
                    (.normal, ".normal"),
                    (.high, ".high")
                ])
            } else if key == PropertyId.tagSensitivity.rawValue, let sensitivity = MessageSensitivity(rawValue: valueAsUInt32) {
                return sensitivity.dump(cases: [
                    (.normal, ".normal"),
                    (.personal, ".personal"),
                    (.`private`, ".`private`"),
                    (.confidential, ".confidential")
                ])
            } else if key == PropertyId.tagValidFolderMask.rawValue {
                let mask = ValidFolderMask(rawValue: valueAsUInt32)
                return mask.dump(cases: [
                    (.ipmSubtreeValid, ".ipmSubtreeValid"),
                    (.ipmInboxValid, ".ipmInboxValid"),
                    (.ipmOutboxValid, ".ipmOutboxValid"),
                    (.ipmWasteBasketValid, ".ipmWasteBasketValid"),
                    (.ipmSentMailValid, ".ipmSentMailValid"),
                    (.viewsValid, ".viewsValid"),
                    (.commonViewsValid, ".commonViewsValid"),
                    (.finderValid, ".finderValid")
                ])
            } else if key == PstPropertyId.tagMessageFlags.rawValue {
                let flags = MessageFlags(rawValue: valueAsUInt32)
                return flags.dump(cases: [
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
                ])
            } else if key == PstPropertyId.tagMessageStatus.rawValue {
                let flags = MessageStatus(rawValue: valueAsUInt32)
                return flags.dump(cases: [
                    (.remoteDownload, ".remoteDownload"),
                    (.inConflict, ".inConflict"),
                    (.remoteDelete, ".remoteDelete")
                ])
            } else if key == PstPropertyId.tagDisplayType.rawValue, let displayType = DisplayType(rawValue: valueAsUInt32) {
                return displayType.dump(cases: [
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
                ])
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
