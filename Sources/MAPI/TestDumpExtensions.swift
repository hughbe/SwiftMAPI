//
//  TestDumpExtensions.swift
//  
//
//  Created by Hugh Bellamy on 15/10/2020.
//

import DataStream
import Foundation

private func boolAssert(value: Any?, accessor: String, name: String) -> String {
    let actual: Bool
    if let value = value as? UInt32 {
        actual = value != 0
    } else {
        actual = value as! Bool
    }

    if actual {
        return "XCTAssertTrue(\(accessor).\(name)!)\n"
    } else {
        return "XCTAssertFalse(\(accessor).\(name)!)\n"
    }
}

private func escapeString(string: String) -> String {
    let escaped = string
    var s = ""
    for char in escaped {
        if char == "\u{00}" {
            s += "\\u{00}"
        } else if char == "\u{01}" {
            s += "\\u{01}"
        } else if char == "\"" {
            s += "\\\""
        } else if char == "\\" {
            s += "\\\\"
        } else if char == "\r\n" {
            s.append("\\r\\n")
        } else if char.isLetter || char.isNumber || char.isSymbol || char.isWhitespace || char.isPunctuation || char == "\t" {
            s.append(char)
        } else {
            s.append(char)
        }
    }

    return "\"\(s)\""
}

private func stringAssert(value: Any?, accessor: String, name: String, encoding: String.Encoding? = nil) -> String {
    let actual: String
    if let value = value as? Data {
        guard let encoding = encoding else {
            return "XCTAssertNil(\(accessor).\(name))\n"
        }
        
        actual = String(bytes: value, encoding: encoding)!
    } else if let value = value as? UInt32, value == MAPI_E.NOT_FOUND.rawValue {
        return "XCTAssertNil(\(accessor).\(name))\n"
    } else {
        actual = value! as! String
    }

    if actual.count > 750 {
        return "XCTAssertNotNil(\(accessor).\(name))\n"
    }

    return "XCTAssertEqual(\(escapeString(string: actual)), \(accessor).\(name)!)\n"
}

private func multipleStringAssert(value: Any?, accessor: String, name: String) -> String {
    let actual = value! as! [String]
    return "XCTAssertEqual([\(actual.map(escapeString).joined(separator: ", "))], \(accessor).\(name)!)\n"
}

private func guidAssert(value: Any?, accessor: String, name: String) -> String {
    let actual: UUID
    if let value = value as? Data {
        var dataStream = DataStream(data: value)
        actual = try! dataStream.readGUID(endianess: .littleEndian)
    } else {
        actual = value! as! UUID
    }

    switch actual {
    case CLSID_MailFolder:
        return "XCTAssertEqual(CLSID_MailFolder, \(accessor).\(name)!)\n"
    case CLSID_ContactFolder:
        return "XCTAssertEqual(CLSID_ContactFolder, \(accessor).\(name)!)\n"
    case CLSID_CalendarFolder:
        return "XCTAssertEqual(CLSID_CalendarFolder, \(accessor).\(name)!)\n"
    case CLSID_TaskFolder:
        return "XCTAssertEqual(CLSID_TaskFolder, \(accessor).\(name)!)\n"
    case CLSID_NoteFolder:
        return "XCTAssertEqual(CLSID_NoteFolder, \(accessor).\(name)!)\n"
    case CLSID_JournalFolder:
        return "XCTAssertEqual(CLSID_JournalFolder, \(accessor).\(name)!)\n"
    default:
        return "XCTAssertEqual(UUID(uuidString: \"\(actual)\"), \(accessor).\(name)!)\n"
    }
}

private func multipleGuidAssert(value: Any?, accessor: String, name: String) -> String {
    let actual: [UUID]
    if let value = value as? Data {
        var dataStream = DataStream(data: value)
        var results: [UUID] = []
        for _ in 0..<dataStream.count / 16 {
            results.append(try! dataStream.read(type: UUID.self))
        }
        
        actual = results
    } else {
        actual = value! as! [UUID]
    }

    return "XCTAssertEqual([\(actual.map { "UUID(uuidString: \"\($0)\"" }.joined(separator: ", "))], \(accessor).\(name)!)\n"
}

private func int16Assert(value: Any?, accessor: String, name: String, hexString: Bool = false) -> String {
    let actual = value! as! UInt16
    if hexString {
        return "XCTAssertEqual(\(actual.hexString), \(accessor).\(name)!)\n"
    }

    return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
}

private func multipleInt16Assert(value: Any?, accessor: String, name: String) -> String {
    let actual = value! as! [UInt16]
    return "XCTAssertEqual([\(actual.map { $0.hexString }.joined(separator: ", "))], \(accessor).\(name)!)\n"
}

private func uint32Assert(value: Any?, accessor: String, name: String, hexString: Bool = false) -> String {
    let actual = value! as! UInt32
    if hexString {
        return "XCTAssertEqual(\(actual.hexString), \(accessor).\(name)!)\n"
    }

    return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
}

private func multipleUInt32Assert(value: Any?, accessor: String, name: String) -> String {
    let actual = value! as! [UInt32]
    return "XCTAssertEqual([\(actual.map { $0.hexString }.joined(separator: ", "))], \(accessor).\(name)!)\n"
}

private func int32Assert(value: Any?, accessor: String, name: String) -> String {
    let actual = Int32(bitPattern: value! as! UInt32)
    return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
}

private func int64Assert(value: Any?, accessor: String, name: String, hexString: Bool = false) -> String {
    let actual = value! as! UInt64
    if hexString {
        return "XCTAssertEqual(\(actual.hexString), \(accessor).\(name)!)\n"
    }

    return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
}

private func doubleAssert(value: Any?, accessor: String, name: String) -> String {
    let actual = value! as! Double
    return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
}

private func dataAssert(value: Any?, accessor: String, name: String) -> String {
    if let value = value as? UInt32, value == MAPI_E.NOT_FOUND.rawValue {
        return "XCTAssertNil(\(accessor).\(name))\n"
    }
    
    let actual = value! as! Data
    if actual.count > 750 {
        return "XCTAssertNotNil(\(accessor).\(name))\n"
    }

    return "XCTAssertEqual(\(actual.hexString), [UInt8](\(accessor).\(name)!))\n"
}

private func multipleDataAssert(value: Any?, accessor: String, name: String) -> String {
    let actual = value! as! [Data]

    var s = ""

    s += "XCTAssertEqual(\(actual.count), \(accessor).\(name)!.count)\n"
    if actual.count > 0 {
        for (offset, value) in actual.enumerated() {
            s += "XCTAssertEqual(\(value.hexString), [UInt8](\(accessor).\(name)![\(offset)]))\n"
        }
    }

    return s
}

private func dateAssert(value: Any?, accessor: String, name: String) -> String {
    let actual: Date
    if let rawValue = value as? UInt32 {
        actual = Date(minutesSince1601: rawValue)
    } else {
        actual = value! as! Date
    }

    return "XCTAssertEqual(\(actual.timeIntervalSince1970), \(accessor).\(name)!.timeIntervalSince1970)\n"
}

private func xidAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! XID(dataStream: &dataStream, size: dataStream.count)

    var s = ""

    s += "XCTAssertEqual(UUID(uuidString: \"\(actual.namespaceGuid)\"), \(accessor).\(name)!.namespaceGuid)\n"
    s += "XCTAssertEqual(\(actual.localId.hexString), \(accessor).\(name)!.localId)\n"

    return s
}

private func enumAssert<T>(value: Any?, accessor: String, name: String, type: T.Type) -> String where T: RawRepresentable, T: EnumCaseRepresentable, T.RawValue: FixedWidthInteger, T.Element: RawRepresentable, T.Element.RawValue == T.RawValue {
    let rawValue: T.RawValue
    if let value = value as? UInt32, T.RawValue.self == Int32.self {
        rawValue = Int32(bitPattern: value) as! T.RawValue
    } else {
        rawValue = value as! T.RawValue
    }

    guard let actual = T(rawValue: rawValue) else {
        return "XCTAssertNil(\(accessor).\(name))\n"
    }

    return "XCTAssertEqual(\(actual.stringRepresentation), \(accessor).\(name)!)\n"
}

private func multipleEnumAssert<T>(value: Any?, accessor: String, name: String, type: T.Type) -> String where T: RawRepresentable, T: EnumCaseRepresentable, T.RawValue: FixedWidthInteger, T.Element: RawRepresentable, T.Element.RawValue == T.RawValue {
    let actual = value as! [T.RawValue]
    return "XCTAssertEqual([\(actual.compactMap(T.init).map { $0.stringRepresentation }.joined(separator: ","))], \(accessor).\(name)!)\n"
}

private func optionSetAssert<T>(value: Any?, accessor: String, name: String, type: T.Type) -> String where T: OptionSet, T: EnumCaseRepresentable, T.RawValue: FixedWidthInteger {
    let actual = T(rawValue: value as! T.RawValue)!
    let caseNames = actual.stringRepresentation
    return "XCTAssertEqual(\(caseNames), \(accessor).\(name))\n"
}

private func predecessorChangeListAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! PredecessorChangeList(dataStream: &dataStream)
    var s = ""

    s += "XCTAssertEqual(\(actual.values.count), \(accessor).\(name)!.values.count)\n"

    if actual.values.count > 0 {
        for (offset, value) in actual.values.enumerated() {
            s += "XCTAssertEqual(UUID(uuidString: \"\(value.namespaceGuid)\"), \(accessor).\(name)!.values[\(offset)].namespaceGuid)\n"
            s += "XCTAssertEqual(\(value.localId.hexString), \(accessor).\(name)!.values[\(offset)].localId)\n"
        }
    }

    return s
}

private func folderEntryIdAssert(value: Any?, accessor: String) -> String {
    let actual: FolderEntryID
    if let value = value as? FolderEntryID {
        actual = value
    } else {
        var dataStream = DataStream(data: value as! Data)
        actual = try! FolderEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    var s = ""

    s += "XCTAssertEqual(\(actual.flags.hexString), \(accessor).flags)\n"
    s += "XCTAssertEqual(UUID(uuidString: \"\(actual.providerUid)\"), \(accessor).providerUid)\n"
    s += "XCTAssertEqual(\(actual.folderType.stringRepresentation), \(accessor).folderType)\n"
    s += "XCTAssertEqual(UUID(uuidString: \"\(actual.databaseGuid)\"), \(accessor).databaseGuid)\n"
    s += "XCTAssertEqual(\(actual.globalCounter), \(accessor).globalCounter)\n"
    s += "XCTAssertEqual(\(actual.pad.hexString), \(accessor).pad)\n"

    return s
}

private func entryIdAssert(value: Any?, accessor: String, name: String) -> String {
    let actual: EntryID
    if let value = value as? EntryID {
        actual = value
    } else {
        var dataStream = DataStream(data: value as! Data)
        if dataStream.count == 0 {
            return "XCTAssertNil(\(accessor).\(name))\n"
        }

        actual = try! getEntryID(dataStream: &dataStream, size: dataStream.count)
    }

    if let oneOffEntryId = actual as? OneOffEntryID {
        var s = ""

        s += "XCTAssertEqual(\(oneOffEntryId.flags.hexString), (\(accessor).\(name) as? OneOffEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(oneOffEntryId.providerUid)\"), (\(accessor).\(name) as? OneOffEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(oneOffEntryId.version.hexString), (\(accessor).\(name) as? OneOffEntryID)!.version)\n"
        s += "XCTAssertEqual(\(oneOffEntryId.entryFlags.stringRepresentation), (\(accessor).\(name) as? OneOffEntryID)!.entryFlags)\n"
        s += "XCTAssertEqual(\(escapeString(string: oneOffEntryId.displayName)), (\(accessor).\(name) as? OneOffEntryID)!.displayName)\n"
        s += "XCTAssertEqual(\(escapeString(string: oneOffEntryId.addressType)), (\(accessor).\(name) as? OneOffEntryID)!.addressType)\n"
        s += "XCTAssertEqual(\(escapeString(string: oneOffEntryId.emailAddress)), (\(accessor).\(name) as? OneOffEntryID)!.emailAddress)\n"

        return s
    } else if let addressBookEntryID = actual as? AddressBookEntryID {
        var s = ""

        s += "XCTAssertEqual(\(addressBookEntryID.flags.hexString), (\(accessor).\(name) as? AddressBookEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(addressBookEntryID.providerUid)\"), (\(accessor).\(name) as? AddressBookEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(addressBookEntryID.version.hexString), (\(accessor).\(name) as? AddressBookEntryID)!.version)\n"
        s += "XCTAssertEqual(\(addressBookEntryID.type.stringRepresentation), (\(accessor).\(name) as? AddressBookEntryID)!.type)\n"
        s += "XCTAssertEqual(\(escapeString(string: addressBookEntryID.x500DN)), (\(accessor).\(name) as? AddressBookEntryID)!.x500DN)\n"

        return s
    } else if let folderEntryID = actual as? FolderEntryID {
        return folderEntryIdAssert(value: folderEntryID, accessor: "(\(accessor).\(name) as? FolderEntryID)!")
    } else if let generalEntryID = actual as? GeneralEntryID {
        var s = ""

        s += "XCTAssertEqual(\(generalEntryID.flags.hexString), (\(accessor).\(name) as? GeneralEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(generalEntryID.providerUid)\"), (\(accessor).\(name) as? GeneralEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(generalEntryID.providerData.hexString), (\(accessor).\(name) as? GeneralEntryID)!.providerData)\n"

        return s
    } else if let contactAddressEntryID = actual as? ContactAddressEntryID {
        var s = ""

        s += "XCTAssertEqual(\(contactAddressEntryID.flags.hexString), (\(accessor).\(name) as? ContactAddressEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(contactAddressEntryID.providerUid)\"), (\(accessor).\(name) as? ContactAddressEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(contactAddressEntryID.version.hexString), (\(accessor).\(name) as? ContactAddressEntryID)!.version)\n"
        s += "XCTAssertEqual(\(contactAddressEntryID.type.hexString), (\(accessor).\(name) as? ContactAddressEntryID)!.type)\n"
        s += "XCTAssertEqual(\(contactAddressEntryID.index.hexString), (\(accessor).\(name) as? ContactAddressEntryID)!.index)\n"
        s += "XCTAssertEqual(\(contactAddressEntryID.entryIdCount.hexString), (\(accessor).\(name) as? ContactAddressEntryID)!.entryIdCount)\n"
        s += entryIdAssert(value: contactAddressEntryID.entryIdBytes, accessor: "(\(accessor).\(name) as? ContactAddressEntryID)!", name: "entryIdBytes")

        return s
    } else if let wrappedEntryID = actual as? WrappedEntryId {
        var s = ""

        s += "XCTAssertEqual(\(wrappedEntryID.flags.hexString), (\(accessor).\(name) as? WrappedEntryId)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(wrappedEntryID.providerUid)\"), (\(accessor).\(name) as? WrappedEntryId)!.providerUid)\n"
        s += "XCTAssertEqual(\(wrappedEntryID.type.hexString), (\(accessor).\(name) as? WrappedEntryId)!.type)\n"
        s += entryIdAssert(value: wrappedEntryID.embeddedEntryID, accessor: "(\(accessor).\(name) as? WrappedEntryId)!", name: "embeddedEntryID")

        return s
    } else if let messageEntryID = actual as? MessageEntryID {
        var s = ""

        s += "XCTAssertEqual(\(messageEntryID.flags.hexString), (\(accessor).\(name) as? MessageEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(messageEntryID.providerUid)\"), (\(accessor).\(name) as? MessageEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(messageEntryID.messageType.stringRepresentation), (\(accessor).\(name) as? MessageEntryID)!.messageType)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(messageEntryID.folderDatabaseGuid)\"), (\(accessor).\(name) as? MessageEntryID)!.folderDatabaseGuid)\n"
        s += "XCTAssertEqual(\(messageEntryID.folderGlobalCounter), (\(accessor).\(name) as? MessageEntryID)!.folderGlobalCounter)\n"
        s += "XCTAssertEqual(\(messageEntryID.pad1.hexString), (\(accessor).\(name) as? MessageEntryID)!.pad1)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(messageEntryID.messageDatabaseGuid)\"), (\(accessor).\(name) as? MessageEntryID)!.messageDatabaseGuid)\n"
        s += "XCTAssertEqual(\(messageEntryID.messageGlobalCounter), (\(accessor).\(name) as? MessageEntryID)!.messageGlobalCounter)\n"
        s += "XCTAssertEqual(\(messageEntryID.pad2.hexString), (\(accessor).\(name) as? MessageEntryID)!.pad2)\n"

        return s
    } else if let storeEntryID = actual as? StoreEntryID {
        var s = ""

        s += "XCTAssertEqual(\(storeEntryID.flags.hexString), (\(accessor).\(name) as? StoreEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(storeEntryID.providerUid)\"), (\(accessor).\(name) as? StoreEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(storeEntryID.version.hexString), (\(accessor).\(name) as? StoreEntryID)!.version)\n"
        s += "XCTAssertEqual(\(storeEntryID.flag.hexString), (\(accessor).\(name) as? StoreEntryID)!.flag)\n"
        s += "XCTAssertEqual(\(escapeString(string: storeEntryID.dllFileName)), (\(accessor).\(name) as? StoreEntryID)!.dllFileName)\n"
        s += "XCTAssertEqual(\(storeEntryID.wrappedFlags.hexString), (\(accessor).\(name) as? StoreEntryID)!.wrappedFlags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(storeEntryID.wrappedProviderUid)\"), (\(accessor).\(name) as? StoreEntryID)!.wrappedProviderUid)\n"
        s += "XCTAssertEqual(\(storeEntryID.wrappedType.stringRepresentation), (\(accessor).\(name) as? StoreEntryID)!.wrappedType)\n"
        s += "XCTAssertEqual(\(escapeString(string: storeEntryID.path)), (\(accessor).\(name) as? StoreEntryID)!.path)\n"

        return s
    } else if let storeObjectEntryID = actual as? StoreObjectEntryID {
        var s = ""

        s += "XCTAssertEqual(\(storeObjectEntryID.flags.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.flags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(storeObjectEntryID.providerUid)\"), (\(accessor).\(name) as? StoreObjectEntryID)!.providerUid)\n"
        s += "XCTAssertEqual(\(storeObjectEntryID.version.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.version)\n"
        s += "XCTAssertEqual(\(storeObjectEntryID.flag.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.flag)\n"
        s += "XCTAssertEqual(\(escapeString(string: storeObjectEntryID.dllFileName)), (\(accessor).\(name) as? StoreObjectEntryID)!.dllFileName)\n"
        s += "XCTAssertEqual(\(storeObjectEntryID.wrappedFlags.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.wrappedFlags)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(storeObjectEntryID.wrappedProviderUid)\"), (\(accessor).\(name) as? StoreObjectEntryID)!.wrappedProviderUid)\n"
        s += "XCTAssertEqual(\(storeObjectEntryID.wrappedType.stringRepresentation), (\(accessor).\(name) as? StoreObjectEntryID)!.wrappedType)\n"
        s += "XCTAssertEqual(\(escapeString(string: storeObjectEntryID.serverShortName)), (\(accessor).\(name) as? StoreObjectEntryID)!.serverShortName)\n"
        if let mailboxDN = storeObjectEntryID.mailboxDN {
            s += "XCTAssertEqual(\(escapeString(string: mailboxDN)), (\(accessor).\(name) as? StoreObjectEntryID)!.mailboxDN)\n"
        } else {
            s += "XCTAssertNil((\(accessor).\(name) as? StoreObjectEntryID)!.mailboxDN)\n"
        }

        if let entryIdV2 = storeObjectEntryID.entryIdV2 {
            s += "XCTAssertEqual(\(entryIdV2.magic.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.magic)\n"
            s += "XCTAssertEqual(\(entryIdV2.size.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.size)\n"
            s += "XCTAssertEqual(\(entryIdV2.version.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.version)\n"
            s += "XCTAssertEqual(\(entryIdV2.offsetDN.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.offsetDN)\n"
            s += "XCTAssertEqual(\(entryIdV2.offsetFQDN.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.offsetFQDN)\n"
            if let serverDN = entryIdV2.serverDN {
                s += "XCTAssertEqual(\(escapeString(string: serverDN)), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.serverDN)\n"
            } else {
                s += "XCTAssertNil((\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.serverDN)\n"
            }
            if let serverFQDN = entryIdV2.serverFQDN {
                s += "XCTAssertEqual(\(escapeString(string: serverFQDN)), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.serverFQDN)\n"
            } else {
                s += "XCTAssertNil((\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.serverFQDN)\n"
            }
            s += "XCTAssertEqual(\(entryIdV2.reserved.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2!.reserved)\n"
        } else {
            s += "XCTAssertNil((\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV2)\n"
        }

        if let entryIdV3 = storeObjectEntryID.entryIdV3 {
            s += "XCTAssertEqual(\(entryIdV3.magic.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.magic)\n"
            s += "XCTAssertEqual(\(entryIdV3.size.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.size)\n"
            s += "XCTAssertEqual(\(entryIdV3.version.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.version)\n"
            s += "XCTAssertEqual(\(entryIdV3.offsetSmtpAddress.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.offsetSmtpAddress)\n"
            if let smtpAddress = entryIdV3.smtpAddress {
                s += "XCTAssertEqual(\(escapeString(string: smtpAddress)), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.smtpAddress)\n"
            } else {
                s += "XCTAssertNil((\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.smtpAddress)\n"
            }
            s += "XCTAssertEqual(\(entryIdV3.reserved.hexString), (\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3!.reserved)\n"
        } else {
            s += "XCTAssertNil((\(accessor).\(name) as? StoreObjectEntryID)!.entryIdV3)\n"
        }
        
        return s
    }
    
    fatalError("NYI: \(type(of: actual))")
}

private func multipleEntryIdAssert(value: Any?, accessor: String, name: String) -> String {
    let actual = (value as! [Data]).map { data -> EntryID in
        var dataStream = DataStream(data: data)
        return try! getEntryID(dataStream: &dataStream, size: dataStream.count)
    }
    
    var s = ""

    s += "XCTAssertEqual(\(actual.count), \(accessor).\(name)!.count)\n"
    for (offset, element) in actual.enumerated() {
        s += entryIdAssert(value: element, accessor: accessor, name: "\(name)![\(offset)]")
    }
    
    return s
}

private func conversationIndexAssert(value: Any?, accessor: String, name: String) -> String {
    var actual: ConversationIndex
    if let value = value as? Data {
        if value.count <= 16 {
            return "XCTAssertNil(\(accessor).\(name))\n"
        }

        var dataStream = DataStream(data: value)
        actual = try! ConversationIndex(dataStream: &dataStream, size: dataStream.count)
    } else {
        actual = value as! ConversationIndex
    }

    var s = ""

    s += "XCTAssertEqual(\(actual.header.reserved.hexString), \(accessor).\(name)!.header.reserved)\n"
    s += "XCTAssertEqual(\(actual.header.currentFileTime.timeIntervalSince1970), \(accessor).\(name)!.header.timeIntervalSince1970)\n"
    s += "XCTAssertEqual(UUID(uuidString: \"\(actual.header.guid)\"), \(accessor).\(name)!.header.guid)\n"
    s += "XCTAssertEqual(\(actual.responseLevels.count), \(accessor).\(name)!.responseLevels.count)\n"
    for (offset, element) in actual.responseLevels.enumerated() {
        s += "XCTAssertEqual(\(element.deltaTime), \(accessor).\(name)!.responseLevels[\(offset)].deltaTime)\n"
        if element.deltaCode {
            s += "XCTAssertTrue(\(accessor).\(name)!.responseLevels[\(offset)].deltaCode!)\n"
        } else {
            s += "XCTAssertFalse(\(accessor).\(name)!.responseLevels[\(offset)].deltaCode!)\n"
        }
        s += "XCTAssertEqual(\(element.random.hexString), \(accessor).\(name)!.responseLevels[\(offset)].random)\n"
        s += "XCTAssertEqual(\(element.level.hexString), \(accessor).\(name)!.responseLevels[\(offset)].level)\n"
    }

    return s
}

private func optionalAssert(value: Any?, accessor: String, name: String) -> String {
    if value == nil {
        return "XCTAssertNil(\(accessor).\(name))\n"
    }
    
    return "XCTAssertNotNil(\(accessor).\(name))\n"
}

private func flatEntryListAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! FlatEntryList(dataStream: &dataStream)

    var s = ""

    s += "XCTAssertEqual(\(actual.count), \(accessor).\(name)!.count)\n"
    s += "XCTAssertEqual(\(actual.size.hexString), \(accessor).\(name)!.size)\n"
    
    for (offset, element) in actual.flatEntries.enumerated() {
        s += "XCTAssertEqual(\(element.size), \(accessor).\(name)!.flatEntries[\(offset)].size)\n"
        s += entryIdAssert(value: element.entryID, accessor: accessor, name: "\(name)!.flatEntries[\(offset)].entryID")
    }
    
    return s
}

private func reportTagAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! ReportTag(dataStream: &dataStream)
    
    var s = ""

    s += "XCTAssertEqual(\(escapeString(string: actual.cookie)), \(accessor).\(name)!.cookie)\n"
    s += "XCTAssertEqual(\(actual.version.hexString), \(accessor).\(name)!.version)\n"
    
    s += "XCTAssertEqual(\(actual.storeEntryIdSize.hexString), \(accessor).\(name)!.storeEntryIdSize)\n"
    if let storeEntryId = actual.storeEntryId {
        s += entryIdAssert(value: storeEntryId, accessor: accessor, name: "\(name)!.storeEntryId")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.storeEntryId)\n"
    }

    s += "XCTAssertEqual(\(actual.folderEntryIdSize.hexString), \(accessor).\(name)!.folderEntryIdSize)\n"
    if let folderEntryId = actual.folderEntryId {
        s += entryIdAssert(value: folderEntryId, accessor: accessor, name: "\(name)!.folderEntryId")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.folderEntryId)\n"
    }
    
    s += "XCTAssertEqual(\(actual.messageEntryIdSize.hexString), \(accessor).\(name)!.messageEntryIdSize)\n"
    if let messageEntryId = actual.messageEntryId {
        s += entryIdAssert(value: messageEntryId, accessor: accessor, name: "\(name)!.messageEntryId")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.messageEntryId)\n"
    }
    
    s += "XCTAssertEqual(\(actual.searchFolderEntryIdSize.hexString), \(accessor).\(name)!.searchFolderEntryIdSize)\n"
    if let searchFolderEntryId = actual.searchFolderEntryId {
        s += entryIdAssert(value: searchFolderEntryId, accessor: accessor, name: "\(name)!.searchFolderEntryId")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.searchFolderEntryId)\n"
    }
    
    s += "XCTAssertEqual(\(actual.messageSearchKeySize.hexString), \(accessor).\(name)!.messageSearchKeySize)\n"
    if let messageSearchKey = actual.messageSearchKey {
        s += dataAssert(value: Data(messageSearchKey), accessor: accessor, name: "\(name)!.messageSearchKey")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.messageSearchKey)\n"
    }
    
    s += "XCTAssertEqual(\(actual.ansiTextSize.hexString), \(accessor).\(name)!.ansiTextSize)\n"
    if let ansiText = actual.ansiText {
        s += stringAssert(value: ansiText, accessor: accessor, name: "\(name)!.ansiText")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.ansiText)\n"
    }
    
    return s
}

private func appointmentTimeZoneDefinitionAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! AppointmentTimeZoneDefinition(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.majorVersion.hexString), \(accessor).\(name)!.majorVersion)\n"
    s += "XCTAssertEqual(\(actual.minorVersion.hexString), \(accessor).\(name)!.minorVersion)\n"
    s += "XCTAssertEqual(\(actual.cbHeader.hexString), \(accessor).\(name)!.cbHeader)\n"
    s += "XCTAssertEqual(\(actual.reserved.hexString), \(accessor).\(name)!.reserved)\n"
    s += "XCTAssertEqual(\(actual.cchKeyName.hexString), \(accessor).\(name)!.cchKeyName)\n"
    s += "XCTAssertEqual(\(escapeString(string: actual.keyName)), \(accessor).\(name)!.keyName)\n"
    s += "XCTAssertEqual(\(actual.cRules), \(accessor).\(name)!.cRules)\n"
    
    for (offset, element) in actual.rules.enumerated() {
        s += "XCTAssertEqual(\(element.majorVersion.hexString), \(accessor).\(name)!.rules[\(offset)].majorVersion)\n"
        s += "XCTAssertEqual(\(element.minorVersion.hexString), \(accessor).\(name)!.rules[\(offset)].minorVersion)\n"
        s += "XCTAssertEqual(\(element.reserved.hexString), \(accessor).\(name)!.rules[\(offset)].reserved)\n"
        s += "XCTAssertEqual(\(element.flags.stringRepresentation), \(accessor).\(name)!.rules[\(offset)].flags)\n"
        s += "XCTAssertEqual(\(element.wYear), \(accessor).\(name)!.rules[\(offset)].wYear)\n"
        s += "XCTAssertEqual(\(element.x.hexString), \(accessor).\(name)!.rules[\(offset)].x)\n"
        s += "XCTAssertEqual(\(element.lBias), \(accessor).\(name)!.rules[\(offset)].lBias)\n"
        s += "XCTAssertEqual(\(element.lStandardBias), \(accessor).\(name)!.rules[\(offset)].lStandardBias)\n"
        s += "XCTAssertEqual(\(element.lDaylightBias), \(accessor).\(name)!.rules[\(offset)].lDaylightBias)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wYear), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wYear)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wMonth), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wMonth)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wDayOfWeek), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wDayOfWeek)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wDay), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wDay)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wHour), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wHour)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wMinute), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wMinute)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wSecond), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wSecond)\n"
        s += "XCTAssertEqual(\(element.stStandardDate.wMilliseconds), \(accessor).\(name)!.rules[\(offset)].stStandardDate.wMilliseconds)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wYear), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wYear)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wMonth), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wMonth)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wDayOfWeek), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wDayOfWeek)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wDay), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wDay)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wHour), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wHour)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wMinute), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wMinute)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wSecond), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wSecond)\n"
        s += "XCTAssertEqual(\(element.stDaylightDate.wMilliseconds), \(accessor).\(name)!.rules[\(offset)].stDaylightDate.wMilliseconds)\n"
    }
    
    return s
}


private func contactLinkEntryAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! ContactLinkEntry(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.addrBookEntryIdCount), \(accessor).\(name)!.addrBookEntryIdCount)\n"
    s += "XCTAssertEqual(\(actual.fieldSize.hexString), \(accessor).\(name)!.fieldSize)\n"
    s += "XCTAssertEqual(\(actual.addrBookEntryIdData.count), \(accessor).\(name)!.addrBookEntryIdData.count)\n"
    
    for (offset, element) in actual.addrBookEntryIdData.enumerated() {
        s += entryIdAssert(value: element, accessor: accessor, name: "\(name)!.addrBookEntryIdData[\(offset)]")
    }
    
    return s
}

private func verbStreamAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! VerbStream(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.version.hexString), \(accessor).\(name)!.version)\n"
    s += "XCTAssertEqual(\(actual.count), \(accessor).\(name)!.count)\n"
    
    s += "XCTAssertEqual(\(actual.voteOptions.count), \(accessor).\(name)!.voteOptions.count)\n"
    for (offset, element) in actual.voteOptions.enumerated() {
        s += "XCTAssertEqual(\(element.verbType), \(accessor).\(name)!.voteOptions[\(offset)].verbType)\n"
        s += "XCTAssertEqual(\(element.displayNameCount), \(accessor).\(name)!.voteOptions[\(offset)].displayNameCount)\n"
        s += "XCTAssertEqual(\"\(element.displayName)\", \(accessor).\(name)!.voteOptions[\(offset)].displayName)\n"
        s += "XCTAssertEqual(\(element.msgClsNameCount), \(accessor).\(name)!.voteOptions[\(offset)].msgClsNameCount)\n"
        s += "XCTAssertEqual(\"\(element.msgClsName)\", \(accessor).\(name)!.voteOptions[\(offset)].msgClsName)\n"
        s += "XCTAssertEqual(\(element.internal1StringCount), \(accessor).\(name)!.voteOptions[\(offset)].internal1StringCount)\n"
        s += "XCTAssertEqual(\"\(element.internal1String)\", \(accessor).\(name)!.voteOptions[\(offset)].internal1String)\n"
        s += "XCTAssertEqual(\(element.displayNameCountRepeat), \(accessor).\(name)!.voteOptions[\(offset)].displayNameCountRepeat)\n"
        s += "XCTAssertEqual(\"\(element.displayNameRepeat)\", \(accessor).\(name)!.voteOptions[\(offset)].displayNameRepeat)\n"
        s += "XCTAssertEqual(\(element.internal2.hexString), \(accessor).\(name)!.voteOptions[\(offset)].internal2)\n"
        s += "XCTAssertEqual(\(element.internal3.hexString), \(accessor).\(name)!.voteOptions[\(offset)].internal3)\n"
        if element.fUseUSHeaders {
            s += "XCTAssertTrue(\(accessor).\(name)!.voteOptions[\(offset)].fUseUSHeaders)\n"
        } else {
            s += "XCTAssertFalse(\(accessor).\(name)!.voteOptions[\(offset)].fUseUSHeaders)\n"
        }
        s += "XCTAssertEqual(\(element.internal4.hexString), \(accessor).\(name)!.voteOptions[\(offset)].internal4)\n"
        s += "XCTAssertEqual(\(element.sendBehavior.stringRepresentation), \(accessor).\(name)!.voteOptions[\(offset)].sendBehavior)\n"
        s += "XCTAssertEqual(\(element.internal5.hexString), \(accessor).\(name)!.voteOptions[\(offset)].internal5)\n"
        s += "XCTAssertEqual(\(element.id.hexString), \(accessor).\(name)!.voteOptions[\(offset)].id)\n"
        s += "XCTAssertEqual(\(element.internal6.hexString), \(accessor).\(name)!.voteOptions[\(offset)].internal6)\n"
    }
    
    s += "XCTAssertEqual(\(actual.version2.hexString), \(accessor).\(name)!.version2)\n"
    s += "XCTAssertEqual(\(actual.voteOptionsExtras.count), \(accessor).\(name)!.voteOptionsExtras.count)\n"
    for (offset, element) in actual.voteOptionsExtras.enumerated() {
        s += "XCTAssertEqual(\(element.displayNameCount), \(accessor).\(name)!.voteOptionsExtras[\(offset)].displayNameCount)\n"
        s += "XCTAssertEqual(\"\(element.displayName)\", \(accessor).\(name)!.voteOptionsExtras[\(offset)].displayName)\n"
        s += "XCTAssertEqual(\(element.displayNameCountRepeat), \(accessor).\(name)!.voteOptionsExtras[\(offset)].displayNameCountRepeat)\n"
        s += "XCTAssertEqual(\"\(element.displayNameRepeat)\", \(accessor).\(name)!.voteOptionsExtras[\(offset)].displayNameRepeat)\n"
    }
    
    return s
}

private func businessCardDisplayDefinitionAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! BusinessCardDisplayDefinition(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.majorVersion.hexString), \(accessor).\(name)!.majorVersion)\n"
    s += "XCTAssertEqual(\(actual.minorVersion.hexString), \(accessor).\(name)!.minorVersion)\n"
    s += "XCTAssertEqual(\(actual.templateID.stringRepresentation), \(accessor).\(name)!.templateID)\n"
    s += "XCTAssertEqual(\(actual.countOfFields), \(accessor).\(name)!.countOfFields)\n"
    s += "XCTAssertEqual(\(actual.fieldInfoSize.hexString), \(accessor).\(name)!.fieldInfoSize)\n"
    s += "XCTAssertEqual(\(actual.extraInfoSize.hexString), \(accessor).\(name)!.extraInfoSize)\n"
    s += "XCTAssertEqual(\(actual.imageAlignment.stringRepresentation), \(accessor).\(name)!.imageAlignment)\n"
    s += "XCTAssertEqual(\(actual.imageSource.hexString), \(accessor).\(name)!.imageSource)\n"
    s += "XCTAssertEqual(\(actual.backgroundColor.hexString), \(accessor).\(name)!.backgroundColor)\n"
    s += "XCTAssertEqual(\(actual.imageArea.hexString), \(accessor).\(name)!.imageArea)\n"
    s += "XCTAssertEqual(\(actual.reserved.hexString), \(accessor).\(name)!.reserved)\n"
    
    s += "XCTAssertEqual(\(actual.fieldInfoN.count), \(accessor).\(name)!.fieldInfoN.count)\n"
    for (offset, element) in actual.fieldInfoN.enumerated() {
        s += "XCTAssertEqual(\(element.textPropertyID.hexString), \(accessor).\(name)!.fieldInfoN[\(offset)].textPropertyID)\n"
        s += "XCTAssertEqual(\(element.textFormat.stringRepresentation), \(accessor).\(name)!.fieldInfoN[\(offset)].textFormat)\n"
        s += "XCTAssertEqual(\(element.labelFormat.stringRepresentation), \(accessor).\(name)!.fieldInfoN[\(offset)].labelFormat)\n"
        s += "XCTAssertEqual(\(element.fontSize.hexString), \(accessor).\(name)!.fieldInfoN[\(offset)].fontSize)\n"
        s += "XCTAssertEqual(\(element.reserved.hexString), \(accessor).\(name)!.fieldInfoN[\(offset)].reserved)\n"
        s += "XCTAssertEqual(\(element.labelOffset.hexString), \(accessor).\(name)!.fieldInfoN[\(offset)].labelOffset)\n"
        s += "XCTAssertEqual(\(element.valueFontColor.hexString), \(accessor).\(name)!.fieldInfoN[\(offset)].valueFontColor)\n"
        s += "XCTAssertEqual(\(element.labelFontColor.hexString), \(accessor).\(name)!.fieldInfoN[\(offset)].labelFontColor)\n"
    }
    
    s += "XCTAssertEqual(\(actual.extraInfo.count), \(accessor).\(name)!.extraInfo.count)\n"
    for (offset, element) in actual.extraInfo.enumerated() {
        s += "XCTAssertEqual(\(escapeString(string: element)), \(accessor).\(name)!.extraInfo[\(offset)])\n"
    }
    
    return s
}

private func scheduleInfoAppointmentTombstoneAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! ScheduleInfoAppointmentTombstone(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.identifier.hexString), \(accessor).\(name)!.identifier)\n"
    s += "XCTAssertEqual(\(actual.headerSize.hexString), \(accessor).\(name)!.headerSize)\n"
    s += "XCTAssertEqual(\(actual.version.hexString), \(accessor).\(name)!.version)\n"
    s += "XCTAssertEqual(\(actual.recordsCount), \(accessor).\(name)!.recordsCount)\n"
    s += "XCTAssertEqual(\(actual.recordsSize.hexString), \(accessor).\(name)!.recordsSize)\n"
    
    s += "XCTAssertEqual(\(actual.records.count), \(accessor).\(name)!.records.count)\n"
    for (offset, element) in actual.records.enumerated() {
        s += "XCTAssertEqual(\(element.startTime.timeIntervalSince1970), \(accessor).\(name)!.records[\(offset)].startTime.timeIntervalSince1970)\n"
        s += "XCTAssertEqual(\(element.endTime.timeIntervalSince1970), \(accessor).\(name)!.records[\(offset)].endTime.timeIntervalSince1970)\n"
        s += "XCTAssertEqual(\(element.globalObjectIdSize.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectIdSize)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.byteArrayID.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.byteArrayID)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.yh.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.yh)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.yl.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.yl)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.m.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.m)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.d.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.d)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.creationTime.timeIntervalSince1970), \(accessor).\(name)!.records[\(offset)].globalObjectId.creationTime.timeIntervalSince1970)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.x.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.x)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.size.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.size)\n"
        s += "XCTAssertEqual(\(element.globalObjectId.data.hexString), \(accessor).\(name)!.records[\(offset)].globalObjectId.data)\n"
        s += "XCTAssertEqual(\(element.usernameSize.hexString), \(accessor).\(name)!.records[\(offset)].usernameSize)\n"
        s += "XCTAssertEqual(\(escapeString(string: element.username)), \(accessor).\(name)!.records[\(offset)].username)\n"
    }
    
    return s
}

private func extendedFolderFlagsAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! ExtendedFolderFlags(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.subProperties.count), \(accessor).\(name)!.subProperties.count)\n"
    for (offset, element) in actual.subProperties.enumerated() {
        s += "XCTAssertEqual(\(element.id.hexString), \(accessor).\(name)!.subProperties[\(offset)].id)\n"
        s += "XCTAssertEqual(\(element.cb.hexString), \(accessor).\(name)!.subProperties[\(offset)].cb)\n"
        s += "XCTAssertEqual(\(element.data.hexString), \(accessor).\(name)!.subProperties[\(offset)].data)\n"
    }

    return s
}

private func globalObjectIdAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! GlobalObjectId(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.byteArrayID.hexString), \(accessor).\(name)!.byteArrayID)\n"
    s += "XCTAssertEqual(\(actual.yh.hexString), \(accessor).\(name)!.yh)\n"
    s += "XCTAssertEqual(\(actual.yl.hexString), \(accessor).\(name)!.yl)\n"
    s += "XCTAssertEqual(\(actual.m.hexString), \(accessor).\(name)!.m)\n"
    s += "XCTAssertEqual(\(actual.d.hexString), \(accessor).\(name)!.d)\n"
    s += "XCTAssertEqual(\(actual.creationTime.timeIntervalSince1970), \(accessor).\(name)!.creationTime.timeIntervalSince1970)\n"
    s += "XCTAssertEqual(\(actual.x.hexString), \(accessor).\(name)!.x)\n"
    s += "XCTAssertEqual(\(actual.size.hexString), \(accessor).\(name)!.size)\n"
    s += "XCTAssertEqual(\(actual.data.hexString), \(accessor).\(name)!.data)\n"

    return s
}

private func timeZoneStructAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! TimeZoneStruct(dataStream: &dataStream)
    
    var s = ""

    s += "XCTAssertEqual(\(actual.lBias), \(accessor).\(name)!.lBias)\n"
    s += "XCTAssertEqual(\(actual.lStandardBias), \(accessor).\(name)!.lStandardBias)\n"
    s += "XCTAssertEqual(\(actual.lDaylightBias), \(accessor).\(name)!.lDaylightBias)\n"
    s += "XCTAssertEqual(\(actual.wStandardYear), \(accessor).\(name)!.wStandardYear)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wYear), \(accessor).\(name)!.stStandardDate.wYear)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wMonth), \(accessor).\(name)!.stStandardDate.wMonth)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wDayOfWeek), \(accessor).\(name)!.stStandardDate.wDayOfWeek)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wDay), \(accessor).\(name)!.stStandardDate.wDay)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wHour), \(accessor).\(name)!.stStandardDate.wHour)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wMinute), \(accessor).\(name)!.stStandardDate.wMinute)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wSecond), \(accessor).\(name)!.stStandardDate.wSecond)\n"
    s += "XCTAssertEqual(\(actual.stStandardDate.wMilliseconds), \(accessor).\(name)!.stStandardDate.wMilliseconds)\n"
    s += "XCTAssertEqual(\(actual.wDaylightYear), \(accessor).\(name)!.wDaylightYear)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wYear), \(accessor).\(name)!.stDaylightDate.wYear)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wMonth), \(accessor).\(name)!.stDaylightDate.wMonth)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wDayOfWeek), \(accessor).\(name)!.stDaylightDate.wDayOfWeek)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wDay), \(accessor).\(name)!.stDaylightDate.wDay)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wHour), \(accessor).\(name)!.stDaylightDate.wHour)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wMinute), \(accessor).\(name)!.stDaylightDate.wMinute)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wSecond), \(accessor).\(name)!.stDaylightDate.wSecond)\n"
    s += "XCTAssertEqual(\(actual.stDaylightDate.wMilliseconds), \(accessor).\(name)!.stDaylightDate.wMilliseconds)\n"
    
    return s
}


private func appointmentRecurrencePatternAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! AppointmentRecurrencePattern(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.recurrencePattern.readerVersion.hexString), \(accessor).\(name)!.recurrencePattern.readerVersion)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.writerVersion.hexString), \(accessor).\(name)!.recurrencePattern.writerVersion)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.recurFrequency.stringRepresentation), \(accessor).\(name)!.recurrencePattern.recurFrequency)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.patternType.stringRepresentation), \(accessor).\(name)!.recurrencePattern.patternType)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.calendarType.stringRepresentation), \(accessor).\(name)!.recurrencePattern.calendarType)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.firstDateTime.hexString), \(accessor).\(name)!.recurrencePattern.firstDateTime)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.period.hexString), \(accessor).\(name)!.recurrencePattern.period)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.slidingFlag.hexString), \(accessor).\(name)!.recurrencePattern.slidingFlag)\n"
    
    if let week = actual.recurrencePattern.patternTypeSpecific as? PatternTypeSpecificWeek {
        s += "XCTAssertEqual(\(week.stringRepresentation), (\(accessor).\(name)!.recurrencePattern.patternTypeSpecific as! PatternTypeSpecificWeek))\n"
    } else if let month = actual.recurrencePattern.patternTypeSpecific as? PatternTypeSpecificMonth {
        s += "XCTAssertEqual(\(month.day), (\(accessor).\(name)!.recurrencePattern.patternTypeSpecific as! PatternTypeSpecificMonth).day)\n"
    } else if let monthNth = actual.recurrencePattern.patternTypeSpecific as? PatternTypeSpecificMonthNth {
        s += "XCTAssertEqual(\(monthNth.flags.stringRepresentation), (\(accessor).\(name)!.recurrencePattern.patternTypeSpecific as! PatternTypeSpecificMonthNth).flags)\n"
        s += "XCTAssertEqual(\(monthNth.n.stringRepresentation), (\(accessor).\(name)!.recurrencePattern.patternTypeSpecific as! PatternTypeSpecificMonthNth).n)\n"
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.recurrencePattern.patternTypeSpecific)\n"
    }
    
    s += "XCTAssertEqual(\(actual.recurrencePattern.occurrenceCount), \(accessor).\(name)!.recurrencePattern.occurrenceCount)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.firstDOW.stringRepresentation), \(accessor).\(name)!.recurrencePattern.firstDOW)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.deletedInstanceCount), \(accessor).\(name)!.recurrencePattern.deletedInstanceCount)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.deletedInstanceDates.count), \(accessor).\(name)!.recurrencePattern.deletedInstanceDates.count)\n"
    for (offset, element) in actual.recurrencePattern.deletedInstanceDates.enumerated() {
        s += "XCTAssertEqual(\(element.timeIntervalSince1970), \(accessor).\(name)!.deletedInstanceDates[\(offset)].timeIntervalSince1970\n"
    }

    s += "XCTAssertEqual(\(actual.recurrencePattern.modifiedInstanceCount), \(accessor).\(name)!.recurrencePattern.modifiedInstanceCount)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.modifiedInstanceDates.count), \(accessor).\(name)!.recurrencePattern.modifiedInstanceDates.count)\n"
    for (offset, element) in actual.recurrencePattern.modifiedInstanceDates.enumerated() {
        s += "XCTAssertEqual(\(element.timeIntervalSince1970), \(accessor).\(name)!.modifiedInstanceDates[\(offset)].timeIntervalSince1970\n"
    }
    
    s += "XCTAssertEqual(\(actual.recurrencePattern.startDate.timeIntervalSince1970), \(accessor).\(name)!.recurrencePattern.startDate.timeIntervalSince1970)\n"
    s += "XCTAssertEqual(\(actual.recurrencePattern.endDate.timeIntervalSince1970), \(accessor).\(name)!.recurrencePattern.endDate.timeIntervalSince1970)\n"
    
    s += "XCTAssertEqual(\(actual.readerVersion2.hexString), \(accessor).\(name)!.readerVersion2)\n"
    s += "XCTAssertEqual(\(actual.writerVersion2.hexString), \(accessor).\(name)!.writerVersion2)\n"
    s += "XCTAssertEqual(\(actual.startTimeOffset.hexString), \(accessor).\(name)!.startTimeOffset)\n"
    s += "XCTAssertEqual(\(actual.endTimeOffset.hexString), \(accessor).\(name)!.endTimeOffset)\n"
    s += "XCTAssertEqual(\(actual.exceptionCount), \(accessor).\(name)!.exceptionCount)\n"
    
    s += "XCTAssertEqual(\(actual.exceptionInfo.count), \(accessor).\(name)!.exceptionInfo.count)\n"
    for (offset, element) in actual.exceptionInfo.enumerated() {
        s += "XCTAssertEqual(\(element.startDateTime.timeIntervalSince1970), \(accessor).\(name)!.exceptionInfo[\(offset)].startDateTime.timeIntervalSince1970)\n"
        s += "XCTAssertEqual(\(element.endDateTime.timeIntervalSince1970), \(accessor).\(name)!.exceptionInfo[\(offset)].endDateTime.timeIntervalSince1970)\n"
        s += "XCTAssertEqual(\(element.originalStartTime.timeIntervalSince1970), \(accessor).\(name)!.exceptionInfo[\(offset)].originalStartTime.timeIntervalSince1970)\n"
        s += "XCTAssertEqual(\(element.overrideFlags.stringRepresentation), \(accessor).\(name)!.exceptionInfo[\(offset)].overrideFlags)\n"
        
        if element.overrideFlags.contains(.subject) {
            s += "XCTAssertEqual(\(element.subjectLength!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].subjectLength!)\n"
            s += "XCTAssertEqual(\(element.subjectLength2!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].subjectLength2!)\n"
            s += "XCTAssertEqual(\(escapeString(string: element.subject!)), \(accessor).\(name)!.exceptionInfo[\(offset)].subject!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].subjectLength)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].subjectLength2)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].subject)\n"
        }
        
        if element.overrideFlags.contains(.meetingType) {
            s += "XCTAssertEqual(\(element.meetingType!.stringRepresentation), \(accessor).\(name)!.exceptionInfo[\(offset)].meetingType!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].meetingType)\n"
        }
        
        if element.overrideFlags.contains(.reminderDelta) {
            s += "XCTAssertEqual(\(element.reminderDelta!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].reminderDelta!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].reminderDelta)\n"
        }
        
        if element.overrideFlags.contains(.reminder) {
            s += "XCTAssertEqual(\(element.reminderSet!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].reminderSet!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].reminderSet)\n"
        }

        if element.overrideFlags.contains(.location) {
            s += "XCTAssertEqual(\(element.locationLength!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].locationLength!)\n"
            s += "XCTAssertEqual(\(element.locationLength2!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].locationLength2!)\n"
            s += "XCTAssertEqual(\(escapeString(string: element.location!)), \(accessor).\(name)!.exceptionInfo[\(offset)].location!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].locationLength)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].locationLength2)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].location)\n"
        }
        
        if element.overrideFlags.contains(.busyStatus) {
            s += "XCTAssertEqual(\(element.busyStatus!.stringRepresentation), \(accessor).\(name)!.exceptionInfo[\(offset)].busyStatus!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].busyStatus)\n"
        }
        
        if element.overrideFlags.contains(.attachment) {
            s += "XCTAssertEqual(\(element.attachment!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].attachment!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].attachment)\n"
        }
        
        if element.overrideFlags.contains(.subType) {
            s += "XCTAssertEqual(\(element.subType!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].subType!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].subType)\n"
        }
        
        if element.overrideFlags.contains(.apptColor) {
            s += "XCTAssertEqual(\(element.appointmentColor!.hexString), \(accessor).\(name)!.exceptionInfo[\(offset)].appointmentColor!)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.exceptionInfo[\(offset)].appointmentColor)\n"
        }
    }
    
    s += "XCTAssertEqual(\(actual.reservedBlock1Size.hexString), \(accessor).\(name)!.reservedBlock1Size)\n"
    s += "XCTAssertEqual(\(actual.reservedBlock1.hexString), \(accessor).\(name)!.reservedBlock1)\n"
    
    s += "XCTAssertEqual(\(actual.extendedException.count), \(accessor).\(name)!.extendedException.count)\n"
    for (offset, element) in actual.extendedException.enumerated() {
        s += "XCTAssertEqual(\(element.reservedBlockEE1Size.hexString), \(accessor).\(name)!.extendedException[\(offset)].reservedBlockEE1Size)\n"
        s += "XCTAssertEqual(\(element.reservedBlockEE1.hexString), \(accessor).\(name)!.extendedException[\(offset)].reservedBlockEE1)\n"
        
        if actual.exceptionInfo[Int(offset)].overrideFlags.contains(.subject) || actual.exceptionInfo[Int(offset)].overrideFlags.contains(.location) {
            s += "XCTAssertEqual(\(element.startDateTime!.timeIntervalSince1970), \(accessor).\(name)!.extendedException[\(offset)].startDateTime!.timeIntervalSince1970)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].startDateTime)\n"
        }

        if actual.exceptionInfo[Int(offset)].overrideFlags.contains(.subject) || actual.exceptionInfo[Int(offset)].overrideFlags.contains(.location) {
            s += "XCTAssertEqual(\(element.endDateTime!.timeIntervalSince1970), \(accessor).\(name)!.extendedException[\(offset)].endDateTime!.timeIntervalSince1970)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].endDateTime)\n"
        }

        if actual.exceptionInfo[Int(offset)].overrideFlags.contains(.subject) || actual.exceptionInfo[Int(offset)].overrideFlags.contains(.location) {
            s += "XCTAssertEqual(\(element.originalStartDate!.timeIntervalSince1970), \(accessor).\(name)!.extendedException[\(offset)].originalStartDate!.timeIntervalSince1970)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].originalStartDate)\n"
        }
        
        if actual.exceptionInfo[Int(offset)].overrideFlags.contains(.subject) {
            s += "XCTAssertEqual(\(element.wideCharSubjectLength!.hexString), \(accessor).\(name)!.extendedException[\(offset)].wideCharSubjectLength)\n"
            s += "XCTAssertEqual(\(escapeString(string: element.wideCharSubject!)), \(accessor).\(name)!.extendedException[\(offset)].wideCharSubject)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].wideCharSubjectLength)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].wideCharSubject)\n"
        }
        
        if actual.exceptionInfo[Int(offset)].overrideFlags.contains(.location) {
            s += "XCTAssertEqual(\(element.wideCharLocationLength!.hexString), \(accessor).\(name)!.extendedException[\(offset)].wideCharLocationLength)\n"
            s += "XCTAssertEqual(\(escapeString(string: element.wideCharLocation!)), \(accessor).\(name)!.extendedException[\(offset)].wideCharLocation)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].wideCharLocationLength)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.extendedException[\(offset)].wideCharLocation)\n"
        }
    }
    
    s += "XCTAssertEqual(\(actual.reservedBlock2Size.hexString), \(accessor).\(name)!.reservedBlock2Size)\n"
    s += "XCTAssertEqual(\(actual.reservedBlock2.hexString), \(accessor).\(name)!.reservedBlock2)\n"

    return s
}

private func serializedReplidGuidMapAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! SerializedReplidGuidMap(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.values.count), \(accessor).\(name)!.recurrencePattern.values.count)\n"
    for (offset, element) in actual.values.enumerated() {
        s += "XCTAssertEqual(\(element.id.hexString), \(accessor).\(name)!.values[\(offset)].id)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(element.guid)\"), \(accessor).\(name)!.values[\(offset)].guid)\n"
    }
    
    return s
}

private func startDateEtcAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! StartDateEtc(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.defaultRetentionPeriod), \(accessor).\(name)!.defaultRetentionPeriod)\n"
    s += "XCTAssertEqual(\(actual.startDate.timeIntervalSince1970), \(accessor).\(name)!.startDate.timeIntervalSince1970)\n"
    
    return s
}

private func propertyValueAssert(value: Any?, accessor: String) -> String {
    var s = ""

    if let value = value {
        if type(of: value) == UInt32.self {
            s += "XCTAssertEqual(\((value as! UInt32).hexString), (\(accessor) as! UInt32))\n"
        } else if type(of: value) == Data.self {
            s += "XCTAssertEqual(\((value as! Data).hexString), [UInt8](\(accessor) as! Data))\n"
        } else if type(of: value) == String.self {
            s += "XCTAssertEqual(\(escapeString(string: value as! String)), \(accessor) as! String)\n"
        } else {
            fatalError("NYI: \(type(of: value))")
        }
    } else {
        s += "XCTAssertNil(\(accessor))\n"
    }
    
    return s
}

private func taggedPropertyAssert(value: TaggedPropertyValue, accessor: String) -> String {
    var s = ""
    
    s += "XCTAssertEqual(\(value.propertyTag.type.stringRepresentation), \(accessor).propertyTag.type)\n"
    s += "XCTAssertEqual(\(value.propertyTag.id.hexString), \(accessor).propertyTag.id)\n"
    s += propertyValueAssert(value: value.propertyValue.propertyValue, accessor: "\(accessor).propertyValue.propertyValue");
    
    return s
}

private func extendedRuleMessageConditionAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! ExtendedRuleMessageCondition(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.noOfNamedProps.hexString), \(accessor).\(name)!.namedPropertyInformation.noOfNamedProps)\n"
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.propIds.count), \(accessor).\(name)!.namedPropertyInformation.propIds.count)\n"
    for (offset, element) in actual.namedPropertyInformation.propIds.enumerated() {
        s += "XCTAssertEqual(\(element.hexString), \(accessor).\(name)!.namedPropertyInformation.propIds[\(offset)])\n"
    }

    s += "XCTAssertEqual(\(actual.namedPropertyInformation.namedPropertiesSize.hexString), \(accessor).\(name)!.namedPropertyInformation.namedPropertiesSize)\n"
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.namedProperties.count), \(accessor).\(name)!.namedPropertyInformation.namedProperties.count)\n"
    for (offset, element) in actual.namedPropertyInformation.namedProperties.enumerated() {
        s += "XCTAssertEqual(\(element.kind.stringRepresentation), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].guid)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(element.guid)\"), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].guid)\n"
        if let lid = element.lid {
            s += "XCTAssertEqual(\(lid.hexString), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].nameSize)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].lid)\n"
        }
        if let name = element.name {
            s += "XCTAssertEqual(\(element.nameSize!.hexString), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].nameSize)\n"
            s += "XCTAssertEqual(\(escapeString(string: element.name!)), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].name)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].nameSize)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].name)\n"
        }
    }

    func restrictionAssert(value: Restriction, accessor: String) -> String {
        var s = ""
        
        s += "XCTAssertEqual(\(value.restrictType.stringRepresentation), \(accessor).restrictType)\n"
        
        if let packet = value.packet as? Restriction.AndRestriction {
            s += "XCTAssertEqual(\(packet.restrictCount), (\(accessor).packet as? Restriction.AndRestriction)!.restrictCount)\n"
            s += "XCTAssertEqual(\(packet.restricts.count), (\(accessor).packet as? Restriction.AndRestriction)!.restricts.count)\n"
            for (offset, element) in packet.restricts.enumerated() {
                s += restrictionAssert(value: element, accessor: "(\(accessor).packet as? Restriction.AndRestriction)!.restricts[\(offset)]")
            }
        } else if let packet = value.packet as? Restriction.OrRestriction {
            s += "XCTAssertEqual(\(packet.restrictCount), (\(accessor).packet as? Restriction.OrRestriction)!.restrictCount)\n"
            s += "XCTAssertEqual(\(packet.restricts.count), (\(accessor).packet as? Restriction.OrRestriction)!.restricts.count)\n"
            for (offset, element) in packet.restricts.enumerated() {
                s += restrictionAssert(value: element, accessor: "(\(accessor).packet as? Restriction.OrRestriction)!.restricts[\(offset)]")
            }
        } else if let packet = value.packet as? Restriction.ExistRestriction {
            s += "XCTAssertEqual(\(packet.propTag.type.stringRepresentation), (\(accessor).packet as? Restriction.ExistRestriction)!.propTag.type)\n"
            s += "XCTAssertEqual(\(packet.propTag.id.hexString), (\(accessor).packet as? Restriction.ExistRestriction)!.propTag.id)\n"
        } else if let packet = value.packet as? Restriction.PropertyRestriction {
            s += "XCTAssertEqual(\(packet.relOp.stringRepresentation), (\(accessor).packet as? Restriction.PropertyRestriction)!.relOp)\n"
            s += "XCTAssertEqual(\(packet.propTag.type.stringRepresentation), (\(accessor).packet as? Restriction.PropertyRestriction)!.propTag.type)\n"
            s += "XCTAssertEqual(\(packet.propTag.id.hexString), (\(accessor).packet as? Restriction.PropertyRestriction)!.propTag.id)\n"
            s += taggedPropertyAssert(value: packet.taggedValue, accessor: "(\(accessor).packet as? Restriction.PropertyRestriction)!.taggedValue")
        } else if let packet = value.packet as? Restriction.NotRestriction {
            s += restrictionAssert(value: packet.restriction, accessor: "(\(accessor).packet as? Restriction.NotRestriction)!.restriction")
        } else if let packet = value.packet as? Restriction.SubObjectRestriction {
            s += "XCTAssertEqual(\(packet.subobject.type.stringRepresentation), (\(accessor).packet as? Restriction.SubObjectRestriction)!.subobject.type)\n"
            s += "XCTAssertEqual(\(packet.subobject.id.hexString), (\(accessor).packet as? Restriction.SubObjectRestriction)!.subobject.id)\n"
            s += restrictionAssert(value: packet.restriction, accessor: "(\(accessor).packet as? Restriction.SubObjectRestriction)!.restriction")
        } else if let packet = value.packet as? Restriction.CommentRestriction {
            s += "XCTAssertEqual(\(packet.taggedValuesCount), (\(accessor).packet as? Restriction.CommentRestriction)!.taggedValuesCount)\n"
            s += "XCTAssertEqual(\(packet.taggedValues.count), (\(accessor).packet as? Restriction.CommentRestriction)!.taggedValues.count)\n"
            for (offset, element) in packet.taggedValues.enumerated() {
                s += taggedPropertyAssert(value: element, accessor: "(\(accessor).packet as? Restriction.CommentRestriction)!.taggedValues[\(offset)]")
            }
            s += "XCTAssertEqual(\(packet.restrictionPresent.hexString), (\(accessor).packet as? Restriction.CommentRestriction)!.restrictionPresent)\n"
            if let restriction = packet.restriction {
                s += restrictionAssert(value: restriction, accessor: "(\(accessor).packet as? Restriction.CommentRestriction)!.restriction")
            } else {
                s += "XCTAssertNil(\(accessor).packet as? Restriction.CommentRestriction)!.restriction)\n"
            }
        } else {
            fatalError("NYI: \(type(of: value.packet))")
        }

        return s
    }
    
    s += restrictionAssert(value: actual.ruleRestriction, accessor: "\(accessor).\(name)!.ruleRestriction")
    
    return s
}

private func extendedRuleMessageActionsAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! ExtendedRuleMessageActions(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.noOfNamedProps), \(accessor).\(name)!.namedPropertyInformation.noOfNamedProps)\n"
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.propIds.count), \(accessor).\(name)!.namedPropertyInformation.propIds.count)\n"
    for (offset, element) in actual.namedPropertyInformation.propIds.enumerated() {
        s += "XCTAssertEqual(\(element.hexString), \(accessor).\(name)!.namedPropertyInformation.propIds[\(offset)])\n"
    }
    
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.namedPropertiesSize.hexString), \(accessor).\(name)!.namedPropertyInformation.namedPropertiesSize)\n"
    s += "XCTAssertEqual(\(actual.namedPropertyInformation.namedProperties.count), \(accessor).\(name)!.namedPropertyInformation.namedProperties.count)\n"
    for (offset, element) in actual.namedPropertyInformation.namedProperties.enumerated() {
        s += "XCTAssertEqual(\(element.kind.stringRepresentation), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].guid)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(element.guid)\"), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].guid)\n"
        if let lid = element.lid {
            s += "XCTAssertEqual(\(lid.hexString), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].nameSize)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].lid)\n"
        }
        if let name = element.name {
            s += "XCTAssertEqual(\(element.nameSize!.hexString), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].nameSize)\n"
            s += "XCTAssertEqual(\(escapeString(string: element.name!)), \(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].name)\n"
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].nameSize)\n"
            s += "XCTAssertNil(\(accessor).\(name)!.namedPropertyInformation.namedProperties[\(offset)].name)\n"
        }
    }
    
    s += "XCTAssertEqual(\(actual.ruleVersion.hexString), \(accessor).\(name)!.ruleVersion)\n"
    s += "XCTAssertEqual(\(actual.ruleActionsBuffer.noOfActions), \(accessor).\(name)!.ruleActionsBuffer.noOfActions)\n"
    s += "XCTAssertEqual(\(actual.ruleActionsBuffer.actionBlocks.count), \(accessor).\(name)!.ruleActionsBuffer.actionBlocks.count)\n"
    for (offset, element) in actual.ruleActionsBuffer.actionBlocks.enumerated() {
        s += "XCTAssertEqual(\(element.actionLength.hexString), \(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionLength)\n"
        s += "XCTAssertEqual(\(element.actionType.stringRepresentation), \(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionType)\n"
        s += "XCTAssertEqual(\(element.actionFlavor.stringRepresentation), \(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionFlavor)\n"
        s += "XCTAssertEqual(\(element.actionFlags.hexString), \(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionFlags)\n"
        
        if let actionData = element.actionData {
            if let actionData = actionData as? ActionBlock.MoveCopyActionDataExtended {
                s += "XCTAssertEqual(\(actionData.storeEIDSize.hexString), (\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? ActionBlock.MoveCopyActionDataExtended).storeEIDSize)\n"
                if let storeEID = actionData.storeEID {
                    s += entryIdAssert(value: storeEID, accessor: "(\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? ActionBlock.MoveCopyActionDataExtended)", name: "storeEID")
                } else {
                    s += "XCTAssertNil((\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? ActionBlock.MoveCopyActionDataExtended).storeEID)\n"
                }
                s += "XCTAssertEqual(\(actionData.folderEIDSize.hexString), (\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? ActionBlock.MoveCopyActionDataExtended).folderEIDSize)\n"
                if let folderEID = actionData.folderEID {
                    s += entryIdAssert(value: folderEID, accessor: "(\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? ActionBlock.MoveCopyActionDataExtended)", name: "folderEID")
                } else {
                    s += "XCTAssertNil((\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? ActionBlock.MoveCopyActionDataExtended).folderEID)\n"
                }
            } else if let actionData = actionData as? TaggedPropertyValue {
                s += taggedPropertyAssert(value: actionData, accessor: "(\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData as? TaggedPropertyValue)!")
            } else {
                fatalError("NYI: \(type(of: actionData))")
            }
        } else {
            s += "XCTAssertNil(\(accessor).\(name)!.ruleActionsBuffer.actionBlocks[\(offset)].actionData)\n"
        }
    }
    
    return s
}

private func searchFolderDefinitionAssert(value: Any?, accessor: String, name: String) -> String {
    var dataStream = DataStream(data: value as! Data)
    let actual = try! SearchFolderDefinition(dataStream: &dataStream)
    
    var s = ""
    
    s += "XCTAssertEqual(\(actual.version.hexString), \(accessor).\(name)!.version)\n"
    s += "XCTAssertEqual(\(actual.flags.stringRepresentation), \(accessor).\(name)!.flags)\n"
    s += "XCTAssertEqual(\(actual.numericalSearch.hexString), \(accessor).\(name)!.numericalSearch)\n"
    s += "XCTAssertEqual(\(actual.textSearchLength.hexString), \(accessor).\(name)!.textSearchLength)\n"
    if let textSearchExtendedLength = actual.textSearchExtendedLength {
        s += "XCTAssertEqual(\(textSearchExtendedLength.hexString), \(accessor).\(name)!.textSearchExtendedLength!)\n"
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.textSearchExtendedLength)\n"
    }
    if let textSearch = actual.textSearch {
        s += "XCTAssertEqual(\(escapeString(string: textSearch)), \(accessor).\(name)!.textSearch!)\n"
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.textSearch)\n"
    }
    s += "XCTAssertEqual(\(actual.skipBlock1Count.hexString), \(accessor).\(name)!.skipBlock1Count)\n"
    s += "XCTAssertEqual(\(actual.skipBlock1.hexString), \(accessor).\(name)!.skipBlock1)\n"
    s += "XCTAssertEqual(\(actual.deepSearch.hexString), \(accessor).\(name)!.deepSearch)\n"
    s += "XCTAssertEqual(\(actual.folderList1Length.hexString), \(accessor).\(name)!.folderList1Length)\n"
    if let folderList1ExtendedLength = actual.folderList1ExtendedLength {
        s += "XCTAssertEqual(\(folderList1ExtendedLength.hexString), \(accessor).\(name)!.folderList1ExtendedLength!)\n"
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.folderList1ExtendedLength)\n"
    }
    if let folderList1 = actual.folderList1 {
        s += "XCTAssertEqual(\(escapeString(string: folderList1)), \(accessor).\(name)!.folderList1!)\n"
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.folderList1)\n"
    }
    s += "XCTAssertEqual(\(actual.folderList2Length.hexString), \(accessor).\(name)!.folderList2Length)\n"
    if let folderList2 = actual.folderList2 {
        s += "XCTAssertEqual(\(folderList2.entryCount), \(accessor).\(name)!.folderList2!.entryCount)\n"
        s += "XCTAssertEqual(\(folderList2.pad.hexString), \(accessor).\(name)!.folderList2!.pad)\n"
        s += "XCTAssertEqual(\(folderList2.entryLengths.count), \(accessor).\(name)!.folderList2!.entryLengths.count)\n"
        for (offset, element) in folderList2.entryLengths.enumerated() {
            s += "XCTAssertEqual(\(element.length), \(accessor).\(name)!.folderList2!.entryLengths[\(offset)].length)\n"
            s += "XCTAssertEqual(\(element.pad.hexString), \(accessor).\(name)!.folderList2!.entryLengths[\(offset)].pad)\n"
        }
        s += "XCTAssertEqual(\(folderList2.entryIDs.count), \(accessor).\(name)!.folderList2!.entryIDs.count)\n"
        for (offset, element) in folderList2.entryIDs.enumerated() {
            s += entryIdAssert(value: element, accessor: "\(accessor).\(name)!.folderList2?", name: "entryIDs[\(offset)]")
        }
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.folderList2)\n"
    }
    if let addresses = actual.addresses {
        s += "XCTAssertEqual(\(addresses.addressCount), \(accessor).\(name)!.addresses!.addressCount)\n"
        s += "XCTAssertEqual(\(addresses.addresses.count), \(accessor).\(name)!.addresses!.addresses.count)\n"
        for (offset, element) in addresses.addresses.enumerated() {
            s += "XCTAssertEqual(\(element.propertyCount), \(accessor).\(name)!.addresses!.addresses[\(offset)].propertyCount)\n"
            s += "XCTAssertEqual(\(element.pad.hexString), \(accessor).\(name)!.addresses!.addresses[\(offset)].pad)\n"
            for (offset2, element2) in element.values.enumerated() {
                s += "XCTAssertEqual(\(element2.tag.type.stringRepresentation), \(accessor).\(name)!.addresses!.addresses[\(offset)].values[\(offset2)].tag.type)\n"
                s += "XCTAssertEqual(\(element2.tag.id.hexString), \(accessor).\(name)!.addresses!.addresses[\(offset)].values[\(offset2)].tag.id)\n"
                s += propertyValueAssert(value: element2.value, accessor: "\(accessor).\(name)!.addresses!.addresses[\(offset)].values[\(offset2)].propertyValue")
            }
        }
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.addresses)\n"
    }
    s += "XCTAssertEqual(\(actual.skipBlock2Count.hexString), \(accessor).\(name)!.skipBlock2Count)\n"
    s += "XCTAssertEqual(\(actual.skipBlock2.hexString), \(accessor).\(name)!.skipBlock2)\n"
    if let searchRestriction = actual.searchRestriction {
        func restrictionAssert(value: SearchFolderDefinition.Restriction, accessor: String) -> String {
            var s = ""
            
            s += "XCTAssertEqual(\(value.restrictionType.stringRepresentation), \(accessor).restrictType)\n"

            if let restrictionData = value.restrictionData as? SearchFolderDefinition.Restriction.AndRestriction {
                s += "XCTAssertEqual(\(restrictionData.count), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.AndRestriction)!.count)\n"
                s += "XCTAssertEqual(\(restrictionData.restrictions.count), (\(accessor)restrictionData as? SearchFolderDefinition.Restriction.AndRestriction)!.restrictions.count)\n"
                for (offset, element) in restrictionData.restrictions.enumerated() {
                    s += restrictionAssert(value: element, accessor: "(\(accessor).restrictionData as? SearchFolderDefinition.Restriction.AndRestriction)!.restrictions[\(offset)]")
                }
            } else if let restrictionData = value.restrictionData as? SearchFolderDefinition.Restriction.NotRestriction {
                s += "XCTAssertEqual(\(restrictionData.subrestriction), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.NotRestriction)!.subrestriction)\n"
            } else if let restrictionData = value.restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction {
                s += "XCTAssertEqual(\(restrictionData.relOp.hexString), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction)!.relOp)\n"
                s += "XCTAssertEqual(\(restrictionData.tag.type.stringRepresentation), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction)!.tag.type)\n"
                s += "XCTAssertEqual(\(restrictionData.tag.id.hexString), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction)!.tag.id)\n"
                s += "XCTAssertEqual(\(restrictionData.value.tag.type.stringRepresentation), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction)!.value.tag.type)\n"
                s += "XCTAssertEqual(\(restrictionData.value.tag.id.hexString), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction)!.value.tag.id)\n"
                s += propertyValueAssert(value: restrictionData.value.value, accessor: "(\(accessor).restrictionData as? SearchFolderDefinition.Restriction.PropertyRestriction)!.value.value")
            } else if let restrictionData = value.restrictionData as? SearchFolderDefinition.Restriction.OrRestriction {
                s += "XCTAssertEqual(\(restrictionData.count), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.OrRestriction)!.count)\n"
                s += "XCTAssertEqual(\(restrictionData.restrictions.count), (\(accessor)restrictionData as? SearchFolderDefinition.Restriction.OrRestriction)!.restrictions.count)\n"
                for (offset, element) in restrictionData.restrictions.enumerated() {
                    s += restrictionAssert(value: element, accessor: "(\(accessor).restrictionData as? SearchFolderDefinition.Restriction.OrRestriction)!.restrictions[\(offset)]")
                }
            } else if let restrictionData = value.restrictionData as? SearchFolderDefinition.Restriction.BitMaskRestriction {
                s += "XCTAssertEqual(\(restrictionData.bitmapRelOp.hexString), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.BitMaskRestriction)!.bitmapRelOp)\n"
                s += "XCTAssertEqual(\(restrictionData.tag.type.stringRepresentation), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.BitMaskRestriction)!.tag.type)\n"
                s += "XCTAssertEqual(\(restrictionData.tag.id.hexString), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.BitMaskRestriction)!.tag.id)\n"
                s += "XCTAssertEqual(\(restrictionData.comparand.hexString), (\(accessor).restrictionData as? SearchFolderDefinition.Restriction.BitMaskRestriction)!.value.comparand)\n"
            } else {
                fatalError("NYI: \(type(of: value.restrictionData))")
            }
            
            return s
        }
        
        s += restrictionAssert(value: searchRestriction, accessor: "\(accessor).\(name)!.searchRestriction!)")
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.searchRestriction)\n"
    }
    if let advancedSearchLow = actual.advancedSearchLow,
       let advancedSearchHigh = actual.advancedSearchHigh,
       let advancedSearch = actual.advancedSearch {
        s += "XCTAssertEqual(\(advancedSearchLow.hexString), \(accessor).\(name)!.advancedSearchLow!)\n"
        s += "XCTAssertEqual(\(advancedSearchHigh.hexString), \(accessor).\(name)!.advancedSearchHigh!)\n"
        s += "XCTAssertEqual(\(advancedSearch.hexString), \(accessor).\(name)!.advancedSearch!)\n"
    } else {
        s += "XCTAssertNil(\(accessor).\(name)!.advancedSearchLow)\n"
        s += "XCTAssertNil(\(accessor).\(name)!.advancedSearchHigh)\n"
        s += "XCTAssertNil(\(accessor).\(name)!.advancedSearch)\n"

    }
    s += "XCTAssertEqual(\(actual.skipBlock3Count.hexString), \(accessor).\(name)!.skipBlock3Count)\n"
    s += "XCTAssertEqual(\(actual.skipBlock3.hexString), \(accessor).\(name)!.skipBlock3)\n"

    return s
}

private func unknownAssert(value: Any?, accessor: String, fullName: String) -> String {
    guard let value = value else {
        return "XCTAssertNil(\(accessor).\(fullName)!)\n"
    }
    
    if type(of: value) == String.self {
        return stringAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as String?)")
    } else if type(of: value) == Bool.self {
        return boolAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Bool?)")
    } else if type(of: value) == UInt16.self {
        return int16Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt16?)")
    } else if type(of: value) == UInt32.self {
        return uint32Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt32?)")
    } else if type(of: value) == UInt64.self {
        return int64Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt64?)")
    } else if type(of: value) == Data.self {
        return dataAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Data?)")
    } else if type(of: value) == Date.self {
        return dateAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Date?)")
    } else if type(of: value) == UUID.self {
        return guidAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UUID?)")
    } else if type(of: value) == [UUID].self {
        return multipleGuidAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UUID?)")
    } else if type(of: value) == [String].self {
        return multipleStringAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as [String]?)")
    } else if type(of: value) == [UInt32].self {
        return multipleUInt32Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as [UInt32]?)")
    } else if type(of: value) == [UInt16].self {
        return multipleInt16Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as [UInt32]?)")
    } else if type(of: value) == UInt64.self {
        return int64Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt64?)")
    } else if type(of: value) == Double.self {
        return doubleAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Double?)")
    }

    fatalError("NYI: \(type(of: value))")
}

private func unknownAssert(value: Any?, accessor: String, name: String) -> String {
    let fullName = "getProperty(id: .\(name))"
    return unknownAssert(value: value, accessor: accessor, fullName: fullName)
}

private func unknownAssert(value: Any?, accessor: String, namedPropertyName: String) -> String {
    let fullName = "getProperty(name: .\(namedPropertyName))"
    return unknownAssert(value: value, accessor: accessor, fullName: fullName)
}

private func unknownAssert(value: Any?, accessor: String, name: NamedProperty) -> String {
    let fullName: String
    if let propSet = CommonlyUsedPropertySet(uuid: name.guid) {
        let setString: String
        switch propSet {
        case .publicStrings:
            setString = ".publicStrings"
        case .common:
            setString = ".common"
        case .address:
            setString = ".address"
        case .internetHeaders:
            setString = ".internetHeaders"
        case .appointment:
            setString = ".appointment"
        case .meeting:
            setString = ".meeting"
        case .log:
            setString = ".log"
        case .messaging:
            setString = ".messaging"
        case .note:
            setString = ".note"
        case .postRss:
            setString = ".postRss"
        case .task:
            setString = ".task"
        case .unifiedMessaging:
            setString = ".unifiedMessaging"
        case .mapi:
            setString = ".mapi"
        case .airSync:
            setString = ".airSync"
        case .sharing:
            setString = ".sharing"
        case .xmlExtractedEntities:
            setString = ".xmlExtractedEntities"
        case .attachment:
            setString = ".attachment"
        case .calendarAssistant:
            setString = ".calendarAssistant"
        case .remote:
            setString = ".remote"
        }
        
        switch name.kind {
        case .stringNamed:
            fullName = "getProperty(set: \(setString), name: \"\(name.name!)\")"
        case .numericalNamed:
            fullName = "getProperty(set: \(setString), lid: \(name.lid!.hexString))"
        }
    } else {
        let guidString = "UUID(uuidString: \"\(name.guid)\")!"
        switch name.kind {
        case .stringNamed:
            fullName = "getProperty(guid: \(guidString), name: \"\(name.name!)\")"
        case .numericalNamed:
            fullName = "getProperty(guid: \(guidString), lid: \(name.lid!.hexString))"
        }
    }
    

    return unknownAssert(value: value, accessor: accessor, fullName: fullName)
}

public func propertiesTestString(accessor: String, properties: [UInt16: Any?], namedProperties: [UInt16: NamedProperty]?) -> String {
    var s = ""
    
    var failures: [String] = []

    for prop in properties {
        if prop.key >= 0x8000, let kvp = namedProperties?[prop.key - 0x8000] {
            switch kvp.kind {
            case .stringNamed:
                switch (kvp.guid, kvp.name) {
                case (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "XmlExtractedMeetings"):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "extractedMeetings")
                case (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "XmlExtractedContacts"):
                    if prop.value is Bool {
                        s += "XCTAssertNil(\(accessor).extractedContacts)\n"
                    } else {
                        s += stringAssert(value: prop.value, accessor: accessor, name: "extractedContacts")
                    }
                case (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "XmlExtractedUrls"):
                    if prop.value is Bool {
                        s += "XCTAssertNil(\(accessor).extractedUrls)\n"
                    } else {
                        s += stringAssert(value: prop.value, accessor: accessor, name: "extractedUrls")
                    }
                case (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "Keywords"):
                    if prop.value is UInt32 {
                        s += "XCTAssertNil(\(accessor).keywords)\n"
                    } else {
                        s += multipleStringAssert(value: prop.value, accessor: accessor, name: "keywords")
                    }
                case (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "http://schemas.microsoft.com/exchange/junkemailmovestamp"):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "exchangeJunkEmailMoveStamp")
                case (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "urn:schemas:calendar:transparent"):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "nameCalendarTransparent")
                case (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "DoNotForward"):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "meetingDoNotForward")
                case (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "GriffinInferenceClassificationResult"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "InferenceClassificationResult"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "OriginalInferenceClassification"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "LatestMessageWordCount"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "InferenceClassificationTrackingEx"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "InferenceMessageIdentifier"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "ClutterProbability"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "ClutterThreshold"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "ConversationContributions"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "ConversationWasFocused"),
                     (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "TriageFeatureVector"),
                     (CommonlyUsedPropertySet.PSETID_Common, "CurrentMessageSafetyFlags"),
                     (CommonlyUsedPropertySet.PSETID_Common, "ComposeType"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityDocument"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityDocumentDelayed"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtractionSuccess"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtractionSuccessDelayed"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtractionServiceDiagnosticContextDelayed"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtractionServiceDiagnosticContext"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityNames"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityNamesDelayed"),
                     (CommonlyUsedPropertySet.PSETID_Common, "ExchangeApplicationFlags"),
                     (CommonlyUsedPropertySet.PSETID_Common, "InTransitMessageCorrelator"),
                     (CommonlyUsedPropertySet.PSETID_Common, "PropertyExistenceTracker"),
                     (CommonlyUsedPropertySet.PSETID_Common, "TeeNextPayload"),
                     (CommonlyUsedPropertySet.PSETID_Common, "TeeVersion"),
                     (CommonlyUsedPropertySet.PSETID_Common, "DirectDeliveryRequestor"),
                     (CommonlyUsedPropertySet.PSETID_Common, "TeeInferResult"),
                     (CommonlyUsedPropertySet.PSETID_Common, "ItemExchangeDiagnostics"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/IRankerScore1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/IRankerScoreDev1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/ExtractLanguage1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/KeyPhraseExtraction2.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/SubjectTermFrequency1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/TermFrequency1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/OOFDetection2.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/EmbeddedUrl1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/Subscription1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/M2HClassifier1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/SubscriptionInferred1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "EntityExtraction/ExtractQuotedTextLanguages1.0"),
                     (CommonlyUsedPropertySet.PSETID_Common, "ItemCurrentFolderReason"),
                     (CommonlyUsedPropertySet.PSETID_Common, "MessageCardExtractionDiagnosticContext"),
                     (CommonlyUsedPropertySet.PSETID_Common, "NetworkMessageId"),
                     (CommonlyUsedPropertySet.PSETID_Common, "TeeNextScenario"),
                     (CommonlyUsedPropertySet.PSETID_Common, "X-Message-Delivery"),
                     (CommonlyUsedPropertySet.PSETID_Common, "X-Message-Info"),
                     (CommonlyUsedPropertySet.PSETID_Common, "X-Microsoft-Antispam-Mailbox-Delivery"),
                     (CommonlyUsedPropertySet.PSETID_Common, "X-Microsoft-Antispam-Message-Info"),
                     (CommonlyUsedPropertySet.PSETID_Common, "MY_NAMED_PROPERTY_NUMBER_2"),
                     (CommonlyUsedPropertySet.PSETID_Common, "WasclWomsResults"),
                     (CommonlyUsedPropertySet.PSETID_Common, "WasclRuntimeData"),
                     (CommonlyUsedPropertySet.PSETID_Common, "WasclPreSubmissionExecuted"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "ClientInfo"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "ConversationTreeParentRecordKey"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "IsQuotedTextChanged"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "IsReadReceipt"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "IsSigned"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "HasQuotedText"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "HeaderBodyFragmentList"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "X-Message-Info"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "acceptlanguage"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "authentication-results"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "received-spf"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "content-class"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-crosstenant-fromentityheader"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-crosstenant-id"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-crosstenant-originalarrivaltime"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-authmechanism"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-originalserveripaddress"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-originalclientipaddress"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-submissionquotaskipped"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-authas"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-authsource"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-transport-crosstenantheadersstamped"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-dlp-detectedclassifications"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-transport-endtoendlatency"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-traffictypediagnostic"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-crosstenant-network-message-id"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-transporttrafficsubtype"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-transporttraffictype"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-has-attach"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-publictraffictype"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-gmx-html"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-gmx-bulk"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-bounce-key"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-bbexpires"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-gmx-antivirus"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-provags-id"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-gmx-antispam"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-authenticated"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-mimeole"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-amazon-rte-version"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-amazon-mail-relay-type"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-beenthere"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-headers-end"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-spam-report"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-mailman-version"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-spam-flag"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-spam-score"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-spam-level"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-scanned-by"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-scan-signature"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-scan-result"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-forefront-antispam-report"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ironport-anti-spam-filtered"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ironport-anti-spam-result"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ironport-av"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-kse-antivirus-info"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-kse-antivirus-interceptor-info"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-mailer"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-microsoft-antispam"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-originating-ip"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-cr-hashedpuzzle"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-cr-puzzleid"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sid-result"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-originalarrivaltime"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-rim-org-msg-ref-id"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-message-delivery"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sid-pra"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-message-info"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-message-status"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sender"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sa-exim-version"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sa-exim-scanned"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-spam-status"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-virus-scanned"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-spam-checker-version"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sa-exim-connect-ip"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-sa-exim-mail-from"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "content-transfer-encoding"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "content-type"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "probing_ps_internet_headers"),
                     (CommonlyUsedPropertySet.PS_INTERNET_HEADERS, "x-ms-exchange-organization-wascl-properties"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "AttachmentOriginalUrl"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "AttachmentWasSavedToCloud"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "DocumentProcessingCorrelationId"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "ImageNaturalHeight"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "ImageNaturalWidth"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "ImageSmallThumbnailHeight"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "ImageSmallThumbnailWidth"),
                     (CommonlyUsedPropertySet.PSETID_Attachment, "ImageThumbnailError"),
                     (CommonlyUsedPropertySet.PSETID_Address, "RecipientMailboxGuid"),
                     (CommonlyUsedPropertySet.PSETID_Address, "IsDeletedFromActiveDirectory"),
                     (CommonlyUsedPropertySet.PSETID_Address, "IsServiceAccount"),
                     (CommonlyUsedPropertySet.PSETID_Address, "RecipientMailboxType"),
                     (CommonlyUsedPropertySet.PSETID_Address, "ReasonInRecipientCache"),
                     (CommonlyUsedPropertySet.PSETID_Address, "HasPublicCommunicationSignals"),
                     (CommonlyUsedPropertySet.PSETID_Address, "AccountName"),
                     (CommonlyUsedPropertySet.PSETID_Address, "AbchPersonStoreId"),
                     (CommonlyUsedPropertySet.PSETID_Address, "DisplayNameLastFirst"),
                     (CommonlyUsedPropertySet.PSETID_Address, "DisplayNamePriority"),
                     (CommonlyUsedPropertySet.PSETID_Address, "SourceId"),
                     (CommonlyUsedPropertySet.PSETID_Address, "IsHiddenFromAddressList"),
                     (CommonlyUsedPropertySet.PSETID_Address, "IsFavorite"),
                     (CommonlyUsedPropertySet.PSETID_Address, "ContactV3InSync"),
                     (CommonlyUsedPropertySet.PSETID_Address, "ExternalDirectoryObjectId"),
                     (CommonlyUsedPropertySet.PSETID_Address, "ObjectId"),
                     (CommonlyUsedPropertySet.PSETID_Address, "DisplayNameFirstLast"),
                     (CommonlyUsedPropertySet.PSETID_Address, "PersonIdGuid"),
                     (CommonlyUsedPropertySet.PSETID_Address, "SenderRelevanceScore"),
                     (CommonlyUsedPropertySet.PSETID_Address, "MapiEmailAddress"),
                     (CommonlyUsedPropertySet.PSETID_Address, "NoEmailContactId"),
                     (CommonlyUsedPropertySet.PSETID_Address, "MapiAddressType"),
                     (CommonlyUsedPropertySet.PSETID_Address, "MapiEntryId"),
                     (CommonlyUsedPropertySet.PSETID_Address, "AbchPersonUpdateTime"),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "urn:schemas-microsoft-com:office:outlook#fixupfbfolder"),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "http://schemas.microsoft.com/outlook/spoofingstamp"),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "MY_NAMED_PROPERTY"),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, "MY_NAMED_PROPERTY_NUMBER_2"),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, "EstimatedAcceptCount"),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, "EstimatedTentativeCount"),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, "EstimatedDeclineCount"),
                     (CommonlyUsedPropertySet.PSETID_Messaging, "PublishedCalendarItemName"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "IsPartiallyIndexed"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "BigFunnelCorrelationId"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "DetectedLanguage"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "LastIndexingAttemptTime"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "ErrorProperties"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "IndexingAttemptCount"),
                     (UUID(uuidString: "0B63E350-9CCC-11D0-BCDB-00805FCCCE04")!, "ErrorTags"),
                     (UUID(uuidString: "4E3A7680-B77A-11D0-9DA5-00C04FD65685")!, "Internet Charset Body"),
                     (UUID(uuidString: "31805AB8-3E92-11DC-879C-00061B031004")!, "GpgOL Sig Status"),
                     (UUID(uuidString: "1A417774-4779-47C1-9851-E42057495FCA")!, "XrmContactId"),
                     (UUID(uuidString: "1A417774-4779-47C1-9851-E42057495FCA")!, "XrmId"),
                     (UUID(uuidString: "1A417774-4779-47C1-9851-E42057495FCA")!, "AggregatedItemLinkIds"),
                     (UUID(uuidString: "F68DE012-ECEF-4E8E-BEB5-D1DE5B08E2AE")!, "KeyPhrases"),
                     (UUID(uuidString: "F68DE012-ECEF-4E8E-BEB5-D1DE5B08E2AE")!, "KPRelevanceScoresInt32"),
                     (UUID(uuidString: "C2FC5982-E37F-4663-92F7-F17E804779DD")!, "ITEM_ID"),
                     (UUID(uuidString: "F3E7D4B4-C742-4E32-B8A2-B93FE9758C16")!, "ITEM_ID"),
                     (UUID(uuidString: "9B5093E0-5734-4A7F-B88F-B4D0220B5ADA")!, "THIS_WAS_A_COMPLETELY_DIFFERENT_ONE"),
                     (UUID(uuidString: "66666666-6666-6666-C000-000000000046")!, "Name4"),
                     (UUID(uuidString: "55555555-5555-5555-C000-000000000046")!, "Name4"),
                     (UUID(uuidString: "9137A2FD-2FA5-4409-91AA-2C3EE697350A")!, "SourceEntryID"),
                     (UUID(uuidString: "9137A2FD-2FA5-4409-91AA-2C3EE697350A")!, "SourceLastModifiedTimestamp"),
                     (UUID(uuidString: "E550B918-9859-47B9-8095-97E4E72F1926")!, "IOpenTypedFacet.EventLocations"),
                     (UUID(uuidString: "A719E259-2A9A-4FB8-BAB3-3A9F02970E4B")!, "Locations"),
                     (UUID(uuidString: "E550B918-9859-47B9-8095-97E4E72F1926")!, "ExtensionsList"),
                     (UUID(uuidString: "403FC56B-CD30-47C5-86F8-EDE9E35A022B")!, "ComplianceTag"),
                     (UUID(uuidString: "33EBA41F-7AA8-422E-BE7B-79E1A98E54B3")!, "ConversationIndexTrackingEx"),
                     (UUID(uuidString: "C7A4569B-F7AE-4DC2-9279-A8FE2F3CAF89")!, "RetentionTagEntryId"),
                     (UUID(uuidString: "58B6F260-0251-4293-9737-2EF23187F89D")!, "NavigationNodeCalendarArgbColor"):
                    s += unknownAssert(value: prop.value, accessor: accessor, name: kvp)
                case (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "GriffinTriageHeuristicsFeatureSet"):
                    s += "XCTAssertNotNil(\(accessor).getProperty(set: .xmlExtractedEntities, name: \"GriffinTriageHeuristicsFeatureSet\"))\n"
                case (CommonlyUsedPropertySet.PSETID_XmlExtractedEntities, "TriageHeuristicsFeatureSet"):
                    s += "XCTAssertNotNil(\(accessor).getProperty(set: .xmlExtractedEntities, name: \"TriageHeuristicsFeatureSet\"))\n"
                case (CommonlyUsedPropertySet.PSETID_Attachment, "ImageSmallThumbnail"):
                    s += "XCTAssertNotNil(\(accessor).getProperty(set: .attachment, name: \"ImageSmallThumbnail\"))\n"
                default:
                    failures.append("UNKNOWN!!: \(kvp), value: \(String(describing: prop.value))")
                }
            case .numericalNamed:
                switch (kvp.guid, kvp.lid!) {
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008580):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "internetAccountName")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008581):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "internetAccountStamp")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008506):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "`private`")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008514):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "smartNoAttach")
                case (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, 0x0000232A),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085D7):
                    s += unknownAssert(value: prop.value, accessor: accessor, name: kvp)
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008554):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "currentVersionName")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x0000850E):
                    if prop.value is Data {
                        s += "XCTAssertNil(\(accessor).agingDontAgeMe)\n"
                    } else {
                        s += boolAssert(value: prop.value, accessor: accessor, name: "agingDontAgeMe")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008518):
                    if prop.value is Data {
                        s += "XCTAssertNil(\(accessor).taskMode)\n"
                    } else {
                        s += enumAssert(value: prop.value, accessor: accessor, name: "taskMode", type: TaskMode.self)
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008552):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "currentVersion")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008503):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "reminderSet")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008501):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "reminderDelta")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008510):
                    s += optionSetAssert(value: prop.value, accessor: accessor, name: "sideEffects", type: MessageSideEffects.self)
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085BF):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "validFlagStringProof")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008582):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "useTnef")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000811C):
                    if prop.value is String {
                        s += "XCTAssertNil(\(accessor).taskComplete)\n"
                    } else {
                        s += boolAssert(value: prop.value, accessor: accessor, name: "taskComplete")
                    }
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000812A):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "taskAcceptanceState", type: TaskAcceptanceState.self)
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008103):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "teamTask")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008123):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "taskOrdinal")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008124):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskNoCompute")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008110):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "taskActualEffort")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008111):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "taskEstimatedEffort")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000812C):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskFFixOffline")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008126):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskFRecurring")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008101):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "taskStatus", type: TaskStatus.self)
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008102):
                    if prop.value is String {
                        s += "XCTAssertNil(\(accessor).percentComplete)\n"
                    } else {
                        s += doubleAssert(value: prop.value, accessor: accessor, name: "percentComplete")
                    }
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008121):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "taskAssigner")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008112):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "taskVersion")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008113):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "taskState", type: TaskState.self)
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008129):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "taskOwnership", type: TaskOwnership.self)
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008127):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "taskRole")
                case (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000015):
                    s += optionSetAssert(value: prop.value, accessor: accessor, name: "clientIntent", type: ClientIntent.self)
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008520):
                    s += verbStreamAssert(value: prop.value, accessor: accessor, name: "verbStream")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x0000851A):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "autoProcessState", type: AutoProcessState.self)
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008524):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "verbResponse")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080DF):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "weddingAnniversaryLocal")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080C2):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax2AddressType")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080C4):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax2OriginalDisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008093):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email2EmailAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080C3):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax2EmailAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008026):
                    s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "fileUnderList")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008090):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email2DisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008094):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email2OriginalDisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000804E):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "anniversaryEventEntryId")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080D2):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax3AddressType")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080B4):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax1OriginalDisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008025):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "autoLog")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085BD):
                    if prop.value is String {
                        s += "XCTAssertNil(\(accessor).referenceEntryId)\n"
                    } else {
                        s += entryIdAssert(value: prop.value, accessor: accessor, name: "referenceEntryId")
                    }
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080B2):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax1AddressType")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008029):
                    s += optionSetAssert(value: prop.value, accessor: accessor, name: "addressBookProviderArrayType", type: AddressBookProviderArrayType.self)
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008092):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email2AddressType")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008005):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fileUnder")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080B3):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax1EmailAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008023):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "contactCharacterSet")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000804D):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "birthdayEventEntryId")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080D3):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax3EmailAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000801A):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080DA):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddressCountryCode")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080DD):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "addressCountryCode")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008010):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "department")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008062):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "instantMessagingAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008007):
                    s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "contactItemData")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080C5):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "fax2OriginalEntryId")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080DE):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "birthdayLocal")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008022):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "postalAddressId", type: PostalAddressId.self)
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080D8):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "freeBusyLocation")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008028):
                    s += multipleEnumAssert(value: prop.value, accessor: accessor, name: "addressBookProviderEmailList", type: AddressBookProviderEmailList.self)
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080D4):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "fax3OriginalDisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008006):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "fileUnderId")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008119):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskStatusOnComplete")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008539):
                    s += multipleStringAssert(value: prop.value, accessor: accessor, name: "companies")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008502):
                    if prop.value is String {
                        s += "XCTAssertNil(\(accessor).reminderTime)\n"
                    } else {
                        s += dateAssert(value: prop.value, accessor: accessor, name: "reminderTime")
                    }
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008139):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "taskCustomFlags")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085A1):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "toDoSubOrdinal")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000811F):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "taskOwner")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008560):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "reminderSignalTime")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008535):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "billing")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000811B):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskUpdates")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000810F):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "taskDateCompleted")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008105):
                    if prop.value is String {
                        s += "XCTAssertNil(\(accessor).taskDueDate)\n"
                    } else {
                        s += dateAssert(value: prop.value, accessor: accessor, name: "taskDueDate")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085A0):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "toDoOrdinalDate")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085A0):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "toDoOrdinalDate")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008104):
                    if prop.value is String {
                        s += "XCTAssertNil(\(accessor).reminderTime)\n"
                    } else {
                        s += dateAssert(value: prop.value, accessor: accessor, name: "taskStartDate")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008516):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "commonStart")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008517):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "commonEnd")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008584):
                    s += dataAssert(value: prop.value, accessor: accessor, name: "contactLinkSearchKey")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x0000853A):
                    s += multipleStringAssert(value: prop.value, accessor: accessor, name: "contacts")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008243):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "organizerAlias")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008256):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "appointmentProposedDuration")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008218):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "responseStatus", type: ResponseStatus.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008248):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "netShowUrl")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008249):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "onlinePassword")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008242):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "directory")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008228):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "exceptionReplaceTime")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008229):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "fInvited")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008241):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "conferencingType", type: ConferencingType.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008206):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "fExceptionalBody")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008201):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "appointmentSequence")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008247):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "collaborateDoc")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008224):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "intendedBusyStatus", type: BusyStatus.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008208):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "eventLocation")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008259):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "appointmentProposalNumber")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008214):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "appointmentColor", type: AppointmentColor.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008207):
                    s += optionSetAssert(value: prop.value, accessor: accessor, name: "appointmentAuxiliaryFlags", type: AppointmentAuxiliaryFlags.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008223):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "recurring")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000820E):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentEndWhole")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008236):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "clipEnd")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000820D):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentStartWhole")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008205):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "busyStatus", type: BusyStatus.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008215):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "appointmentSubType")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008235):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "clipStart")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008257):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "appointmentCounterProposal")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008213):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "appointmentDuration")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008217):
                    s += optionSetAssert(value: prop.value, accessor: accessor, name: "appointmentStateFlags", type: AppointmentStateFlags.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000825A):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "appointmentNotAllowPropose")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000825E):
                    s += appointmentTimeZoneDefinitionAssert(value: prop.value, accessor: accessor, name: "appointmentTimeZoneDefinitionStartDisplay")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008586):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "contactLinkName")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008260):
                    s += appointmentTimeZoneDefinitionAssert(value: prop.value, accessor: accessor, name: "appointmentTimeZoneDefinitionRecur")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008585):
                    s += contactLinkEntryAssert(value: prop.value, accessor: accessor, name: "contactLinkEntry")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000825F):
                    s += appointmentTimeZoneDefinitionAssert(value: prop.value, accessor: accessor, name: "appointmentTimeZoneDefinitionEndDisplay")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008712):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "logTypeDesc")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x0000870F):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "logDocumentSaved")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x0000870C):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "logFlags", type: LogFlags.self)
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008700):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "logType")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x0000870E):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "logDocumentPrinted")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008707):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "logDuration")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008708):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "logEnd")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008711):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "logDocumentPosted")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008706):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "logStart")
                case (CommonlyUsedPropertySet.PSETID_Log, 0x00008710):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "logDocumentRouted")
                case (CommonlyUsedPropertySet.PSETID_Note, 0x00008B02):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "noteWidth")
                case (CommonlyUsedPropertySet.PSETID_Note, 0x00008B05):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "noteY")
                case (CommonlyUsedPropertySet.PSETID_Note, 0x00008B00):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "noteColor", type: NoteColor.self)
                case (CommonlyUsedPropertySet.PSETID_Note, 0x00008B04):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "noteX")
                case (CommonlyUsedPropertySet.PSETID_Note, 0x00008B03):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "noteHeight")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080DB):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddressCountryCode")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008047):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddressState")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008049):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddressCountry")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000801B):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008045):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddressStreet")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008046):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddressCity")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008048):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "workAddressPostalCode")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008040):
                    s += businessCardDisplayDefinitionAssert(value: prop.value, accessor: accessor, name: "businessCardDisplayDefinition")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008041):
                    s += dataAssert(value: prop.value, accessor: accessor, name: "businessCardCardPicture")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008082):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email1AddressType")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008084):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email1OriginalDisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008083):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email1EmailAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080E3):
                    s += multipleStringAssert(value: prop.value, accessor: accessor, name: "contactLinkSMTPAddressCache")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080E0):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "isContactLinked")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080E6):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "contactLinkGlobalAddressListLinkState", type: ContactLinkGlobalAddressListLinkState.self)
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008085):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "email1OriginalEntryId")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008080):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email1DisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080E8):
                    s += guidAssert(value: prop.value, accessor: accessor, name: "contactLinkGlobalAddressListLinkId")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080E2):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "contactLinkedGlobalAddressListEntryId")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008530):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "flagRequest")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085A4):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "toDoTitle")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000023):
                    s += globalObjectIdAssert(value: prop.value, accessor: accessor, name: "cleanGlobalObjectId")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000003):
                    s += globalObjectIdAssert(value: prop.value, accessor: accessor, name: "globalObjectId")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008232):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "recurrencePattern")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008246):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "allowExternalCheck")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008234):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "timeZoneDescription")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008231):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "recurrenceType", type: RecurrenceType.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000823A):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "autoFillLocation")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000802B):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "businessWebPageUrl")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085C8):
                    if prop.value is Bool {
                        s += "XCTAssertNil(\(accessor).conversationActionMaxDeliveryTime)\n"
                    } else {
                        s += dateAssert(value: prop.value, accessor: accessor, name: "conversationActionMaxDeliveryTime")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085B7):
                    if prop.value is UInt32 {
                        s += "XCTAssertNil(\(accessor).classificationDescription)\n"
                    } else {
                        s += stringAssert(value: prop.value, accessor: accessor, name: "classificationDescription")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085B8):
                    if prop.value is UInt32 {
                        s += "XCTAssertNil(\(accessor).classificationGuid)\n"
                    } else {
                        s += stringAssert(value: prop.value, accessor: accessor, name: "classificationGuid")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085C7):
                    if prop.value is Bool {
                        s += "XCTAssertNil(\(accessor).conversationActionMoveStoreEid)\n"
                    } else {
                        s += entryIdAssert(value: prop.value, accessor: accessor, name: "conversationActionMoveStoreEid")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085CA):
                    if prop.value is UInt32 {
                        s += "XCTAssertNil(\(accessor).conversationActionMoveStoreEid)\n"
                    } else {
                        s += dateAssert(value: prop.value, accessor: accessor, name: "conversationActionLastAppliedTime")
                    }
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085C9):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "conversationProcessed")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085B6):
                    if prop.value is UInt32 {
                        s += "XCTAssertNil(\(accessor).classification)\n"
                    } else {
                        s += stringAssert(value: prop.value, accessor: accessor, name: "classification")
                    }
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008120):
                    if prop.value is Date {
                        s += "XCTAssertNil(\(accessor).taskMultipleRecipients)\n"
                    } else {
                        s += uint32Assert(value: prop.value, accessor: accessor, name: "taskMultipleRecipients")
                    }
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008107):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskResetReminder")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008115):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "taskLastUpdate")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x0000811A):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "taskHistory", type: TaskHistory.self)
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008108):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskAccepted")
                case (CommonlyUsedPropertySet.PSETID_Task, 0x00008109):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "taskDeadOccurrence")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085C0):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "flagString")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008233):
                    s += timeZoneStructAssert(value: prop.value, accessor: accessor, name: "timeZoneStruct")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x000085C0):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "flagString")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008216):
                    s += appointmentRecurrencePatternAssert(value: prop.value, accessor: accessor, name: "appointmentRecur")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000822B):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "fExceptionalAttendees")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000804C):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "distributionListChecksum")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008055):
                    s += multipleEntryIdAssert(value: prop.value, accessor: accessor, name: "distributionListMembers")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008053):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "distributionListName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x00008054):
                    s += multipleEntryIdAssert(value: prop.value, accessor: accessor, name: "distributionListOneOffMembers")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000802E):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "yomiCompanyName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000801C):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000802D):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "yomiLastName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080A3):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email3EmailAddress")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080A4):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email3OriginalDisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080A2):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email3AddressType")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x0000802C):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "yomiFirstName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080A0):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "email3DisplayName")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080A5):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "email3OriginalEntryId")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008210):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentEndTime")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000820F):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentStartTime")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008212):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentStartDate")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008211):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentEndDate")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F01):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteEntryId")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F02):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteMessageClass")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F03):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteTransport")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F04):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteTransportTime")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F05):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteTransferSize")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F06):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteSearchKey")
                case (CommonlyUsedPropertySet.PSETID_Remote, 0x00008F07):
                    s += unknownAssert(value: prop.value, accessor: accessor, namedPropertyName: "lidRemoteSearchKey")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008538):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "nonSendableBcc")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008537):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "nonSendableCc")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008536):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "nonSendableTo")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x00008511):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "remoteStatus", type: RemoteStatus.self)
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x0000000A):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "isException")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000005):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "isRecurring")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x0000001A):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "ownerCriticalChange")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000002):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "where")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008244):
                    s += boolAssert(value: prop.value, accessor: accessor, name: "autoStartCheck")
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008902):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "postRssItemHash", hexString: true)
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008906):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "postRssSubscription")
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008900):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "postRssChannelLink")
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008901):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "postRssItemLink")
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008904):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "postRssChannel")
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008905):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "postRssItemXml")
                case (CommonlyUsedPropertySet.PSETID_PostRss, 0x00008903):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "postRssItemGuid")
                case (CommonlyUsedPropertySet.PSETID_Address, 0x000080DC):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddressCountryCode")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000823C):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "ccAttendeesString")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000823B):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "toAttendeesString")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008202):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "appointmentSequenceTime")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000026):
                    s += enumAssert(value: prop.value, accessor: accessor, name: "meetingType", type: MeetingType.self)
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008238):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "allAttendeesString")
                case (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008203):
                    s += uint32Assert(value: prop.value, accessor: accessor, name: "appointmentLastSequence")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000024):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "appointmentMessageClass")
                case (CommonlyUsedPropertySet.PSETID_Meeting, 0x00000001):
                    s += dateAssert(value: prop.value, accessor: accessor, name: "attendeeCriticalChange")
                case (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A14):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "sharingLocalType")
                case (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A04):
                    s += stringAssert(value: prop.value, accessor: accessor, name: "sharingRemotePath")
                case (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A01):
                    s += guidAssert(value: prop.value, accessor: accessor, name: "sharingProviderGuid")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x0000859C):
                    s += entryIdAssert(value: prop.value, accessor: accessor, name: "spamOriginalFolder")
                case (CommonlyUsedPropertySet.PSETID_Common, 0x000085EB),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085C2),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085C3),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085D8),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008534),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008596),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085B9),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008570),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008578),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008583),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x0000858F),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085DA),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x000085CE),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x0000850F),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x0000851B),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008542),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008513),
                     (CommonlyUsedPropertySet.PSETID_Common, 0x00008540),
                     (CommonlyUsedPropertySet.PSETID_Address, 0x00008063),
                     (CommonlyUsedPropertySet.PSETID_Address, 0x0000800E),
                     (CommonlyUsedPropertySet.PSETID_Address, 0x00008027),
                     (CommonlyUsedPropertySet.PSETID_Address, 0x000080EA),
                     (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008245),
                     (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008200),
                     (CommonlyUsedPropertySet.PSETID_Appointment, 0x00008204),
                     (CommonlyUsedPropertySet.PSETID_Appointment, 0x0000823E),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000007),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000021),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x0000000A),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000012),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000014),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000005),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x0000000F),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x0000000C),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x0000000B),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000013),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000022),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000010),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x0000000E),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x0000000D),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000009),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000005),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000018),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000011),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000016),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000006),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000017),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000008),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000003),
                     (CommonlyUsedPropertySet.PSETID_CalendarAssistant, 0x00000001),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A72),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A77),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A74),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A71),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A73),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A7E),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A75),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A78),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A76),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A70),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A79),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A8F),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A84),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A7B),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A7D),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A7A),
                     (CommonlyUsedPropertySet.PSETID_Sharing, 0x00008A80),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, 0x000080E1),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, 0x000080EC),
                     (CommonlyUsedPropertySet.PS_PUBLIC_STRINGS, 0x000080EA),
                     (UUID(uuidString: "29F3AB56-554D-11D0-A97C-00A0C911F50A")!, 0x0000A000),
                     (UUID(uuidString: "29F3AB52-554D-11D0-A97C-00A0C911F50A")!, 0x0000A025),
                     (UUID(uuidString: "29F3AB52-554D-11D0-A97C-00A0C911F50A")!, 0x0000A024),
                     (UUID(uuidString: "29F3AB52-554D-11D0-A97C-00A0C911F50A")!, 0x0000A022),
                     (UUID(uuidString: "29F3AB52-554D-11D0-A97C-00A0C911F50A")!, 0x0000A021),
                     (UUID(uuidString: "29F3AB53-554D-11D0-A97C-00A0C911F50A")!, 0x0000A041),
                     (UUID(uuidString: "29F3AB53-554D-11D0-A97C-00A0C911F50A")!, 0x0000A040),
                     (UUID(uuidString: "29F3AB53-554D-11D0-A97C-00A0C911F50A")!, 0x0000A043),
                     (UUID(uuidString: "29F3AB53-554D-11D0-A97C-00A0C911F50A")!, 0x0000A044),
                     (UUID(uuidString: "29F3AB53-554D-11D0-A97C-00A0C911F50A")!, 0x0000A045),
                     (UUID(uuidString: "86030200-0000-0000-c000-000000000046")!, 0x00008004),
                     (UUID(uuidString: "29f3ab55-554d-11d0-a97c-00a0c911f50a")!, 0x0000A074):
                   s += unknownAssert(value: prop.value, accessor: accessor, name: kvp)
                default:
                    failures.append("UNKNOWN!!: \(kvp), value: \(String(describing: prop.value))")
                }
            }
            
            continue
        }
        
        switch prop.key {
        case PropertyId.tagDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "displayName")
        case PropertyId.tagSubfolders.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "subfolders")
        case PropertyId.tagContentCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "contentCount")
        case PropertyId.tagContentUnreadCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "contentUnreadCount")
        case PropertyId.tagSearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "searchKey")
        case PropertyId.unknown0x7CF9.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7CF9")
        case PropertyId.tagAttributeReadOnly.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "attributeReadOnly")
        case PropertyId.PR_NTSD_MODIFICATION_TIME.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_NTSD_MODIFICATION_TIME")
        case PropertyId.unknown0x123A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x123A")
        case PropertyId.tagLastModificationTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "lastModificationTime")
        case PropertyId.tagAssociatedContentCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "associatedContentCount")
        case PropertyId.tagChangeKey.rawValue:
            s += xidAssert(value: prop.value, accessor: accessor, name: "changeKey")
        case PropertyId.tagCreationTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "creationTime")
        case PropertyId.tagInternetArticleNumber.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagInternetArticleNumber")
        case PropertyId.tagComment.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "comment")
        case PropertyId.tagHierRev.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "hierRev")
        case PropertyId.PR_SECURE_ORIGINATION.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_SECURE_ORIGINATION")
        case PropertyId.unknown0x7C0E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7C0E")
        case PropertyId.tagAttributeHidden.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "attributeHidden")
        case PropertyId.unknown0x7C0F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7C0F")
        case PropertyId.tagMessageSize.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "messageSize", hexString: true)
        case PropertyId.unknown0x7CF8.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7CF8")
        case PropertyId.tagContainerClass.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "containerClass")
        case PropertyId.tagDisplayType.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "displayType", type: DisplayType.self)
        case PropertyId.tagPredecessorChangeList.rawValue:
            s += predecessorChangeListAssert(value: prop.value, accessor: accessor, name: "predecessorChangeList")
        case PropertyId.tagRetentionFlags.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "retentionFlags", type: RetentionFlags.self)
        case PropertyId.unknown0x68CB.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68CB")
        case PropertyId.tagAttributeSystem.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagAttributeSystem")
        case PropertyId.PR_DESIGN_IN_PROGRESS.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_DESIGN_IN_PROGRESS")
        case PropertyId.unknown0x7C0F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7C0F")
        case PropertyId.unknown0x36F6.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F6")
        case PropertyId.unknown0x365D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x365D")
        case PropertyId.unknown0x35FF.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35FF")
        case PropertyId.unknown0x35EE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35EE")
        case PstPropertyId.tagPstHiddenCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "pstHiddenCount")
        case PstPropertyId.tagPstHiddenUnread.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "pstHiddenUnread")
        case PropertyId.unknown0x35EF.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35EF")
        case PropertyId.unknown0x35FD.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35FD")
        case PropertyId.tagAdditionalRenEntryIdsEx.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "additionalRenEntryIdsEx")
        case PropertyId.unknown0x36F0.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F0")
        case PropertyId.unknown0x35E9.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35E9")
        case PropertyId.tagIpmDraftsEntryId.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "ipmDraftsEntryId")
        case PropertyId.PR_FROM_I_HAVE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_FROM_I_HAVE")
        case PropertyId.tagAdditionalRenEntryIds.rawValue:
            s += multipleDataAssert(value: prop.value, accessor: accessor, name: "additionalRenEntryIds")
        case PropertyId.unknown0x3646.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3646")
        case PropertyId.tagConversationId.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "conversationId")
        case PropertyId.tagClientSubmitTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "clientSubmitTime")
        case PropertyId.tagMessageToMe.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "messageToMe")
        case PropertyId.tagConversationTopic.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "conversationTopic")
        case PropertyId.tagMessageStatus.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "messageStatus", type: MessageStatus.self)
        case PropertyId.tagSensitivity.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "sensitivity", type: MessageSensitivity.self)
        case PropertyId.tagImportance.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "importance", type: MessageImportance.self)
        case PropertyId.tagLtpRowId.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ltpRowId", hexString: true)
        case PropertyId.tagMessageClass.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "messageClass")
        case PropertyId.tagSubject.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "subject")
        case PropertyId.tagMessageCcMe.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "messageCcMe")
        case PropertyId.tagDisplayTo.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "displayTo")
        case PropertyId.tagDisplayCc.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "displayCc")
        case PropertyId.tagDisplayBcc.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "displayBcc")
        case PropertyId.tagConversationIndex.rawValue:
            s += conversationIndexAssert(value: prop.value, accessor: accessor, name: "conversationIndex")
        case PropertyId.tagLtpRowVer.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ltpRowVer")
        case PropertyId.tagSentRepresentingName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingName")
        case PropertyId.tagMessageFlags.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "messageFlags", type: MessageFlags.self)
        case PropertyId.tagMessageDeliveryTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "messageDeliveryTime")
        case PropertyId.tagParentSourceKey.rawValue:
            s += xidAssert(value: prop.value, accessor: accessor, name: "parentSourceKey")
        case PropertyId.unknown0x36DE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36DE")
        case PropertyId.tagSourceKey.rawValue:
            s += xidAssert(value: prop.value, accessor: accessor, name: "sourceKey")
        case PropertyId.unknown0x0F00.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F00")
        case PropertyId.tagSecurityDescriptor.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSecurityDescriptor")
        case PropertyId.tagResolveMethod.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "resolveMethod", type: ResolveMethod.self)
        case PropertyId.unknown0x3668.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3668")
        case PropertyId.tagReceivedRepresentingAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingAddressType")
        case PropertyId.tagMessageRecipientMe.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "messageRecipientMe")
        case PropertyId.unknown0x1213.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1213")
        case PropertyId.tagMessageLocaleId.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "messageLocaleId")
        case PropertyId.tagReceivedByAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedByAddressType")
        case PropertyId.tagReceivedByName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedByName")
        case PropertyId.unknown0x5037.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5037")
        case PropertyId.tagReceivedRepresentingSearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingSearchKey")
        case PropertyId.unknown0x3666.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3666")
        case PropertyId.tagSentRepresentingSmtpAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingSmtpAddress")
        case PropertyId.tagSentRepresentingAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingAddressType")
        case PropertyId.tagSenderEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "senderEntryId")
        case PropertyId.tagCreatorSimpleDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "creatorSimpleDisplayName")
        case PropertyId.tagBodyHtml.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "bodyHtml")
        case PropertyId.tagLastModifierName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "lastModifierName")
        case PropertyId.tagBodyContentId.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "bodyContentId")
        case PropertyId.unknown0x0E2F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E2F")
        case PropertyId.unknown0x4025.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4025")
        case PropertyId.tagTransportMessageHeaders.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "transportMessageHeaders")
        case PropertyId.unknown0x0F02.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F02")
        case PropertyId.unknown0x0E4C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E4C")
        case PropertyId.tagSenderAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "senderAddressType")
        case PropertyId.tagSenderName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "senderName")
        case PropertyId.tagSenderSmtpAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "senderSmtpAddress")
        case PropertyId.tagInternetMessageId.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "internetMessageId")
        case PropertyId.unknown0x3014.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3014")
        case PropertyId.tagContentFilterPhishingConfidenceLevel.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagContentFilterPhishingConfidenceLevel")
        case PropertyId.tagParentDisplay.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagParentDisplay")
        case PropertyId.tagLastModifierEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "lastModifierEntryId")
        case PropertyId.tagCreatorAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "creatorAddressType")
        case PropertyId.tagNonReceiptNotificationRequested.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "nonReceiptNotificationRequested")
        case PropertyId.tagLastModifierSimpleDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "lastModifierSimpleDisplayName")
        case PropertyId.unknown0x4024.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4024")
        case PropertyId.tagReceivedBySearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "receivedBySearchKey")
        case PropertyId.tagConversationIndexTracking.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "conversationIndexTracking")
        case PropertyId.tagSenderEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "senderEmailAddress")
        case PropertyId.tagSentRepresentingEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingEmailAddress")
        case PropertyId.unknown0x5D0A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D0A")
        case PropertyId.tagReceivedRepresentingSmtpAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingSmtpAddress")
        case PropertyId.tagSenderSearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "senderSearchKey")
        case PropertyId.tagReceivedRepresentingEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingEntryId")
        case PropertyId.tagSenderSimpleDisplayName.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSenderSimpleDisplayName")
        case PropertyId.unknown0x365A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x365A")
        case PropertyId.tagCreatorEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "creatorEmailAddress")
        case PropertyId.tagReceivedRepresentingName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingName")
        case PropertyId.unknown0x4034.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4034")
        case PropertyId.PR_LAST_MODIFIER_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_LAST_MODIFIER_SID")
        case PropertyId.tagMessageCodepage.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "messageCodepage")
        case PropertyId.PR_MODIFIER_FLAG.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_MODIFIER_FLAG")
        case PropertyId.tagReceivedByEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "receivedByEntryId")
        case PstPropertyId.tagPstBodyPrefix.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "pstBodyPrefix")
        case PropertyId.tagReceivedRepresentingEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingEmailAddress")
        case PropertyId.unknown0x0F0A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F0A")
        case PropertyId.tagReadReceiptRequested.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "readReceiptRequested")
        case PropertyId.unknown0x120B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x120B")
        case PropertyId.tagReceivedByEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedByEmailAddress")
        case PropertyId.unknown0x36FA.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36FA")
        case PropertyId.tagBody.rawValue:
            if prop.value is String {
                s += stringAssert(value: prop.value, accessor: accessor, name: "body")
            } else {
                s += dataAssert(value: prop.value, accessor: accessor, name: "nameidBucketBase")
            }
        case PropertyId.tagSentRepresentingSimpleDisplayName.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSentRepresentingSimpleDisplayName")
        case PropertyId.unknown0x0F03.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F03")
        case PropertyId.unknown0x0ECD.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0ECD")
        case PropertyId.unknown0x3663.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3663")
        case PropertyId.tagPriority.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "priority", type: MessagePriority.self)
        case PropertyId.tagSentRepresentingSearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "sentRepresentingSearchKey")
        case PropertyId.tagNativeBody.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "nativeBody", type: MessageNativeBody.self)
        case PropertyId.tagSentRepresentingEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "sentRepresentingEntryId")
        case PropertyId.tagInternetCodepage.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "internetCodepage")
        case PropertyId.tagReceivedBySmtpAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "receivedBySmtpAddress")
        case PropertyId.unknown0x5D0B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D0B")
        case PropertyId.unknown0x4035.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4035")
        case PropertyId.tagSendRichInfo.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "sendRichInfo")
        case PropertyId.tagAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "addressType")
        case PropertyId.tagRecordKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "recordKey")
        case PropertyId.tagRecipientEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "recipientEntryId")
        case PropertyId.tagRecipientFlags.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "recipientFlags", type: RecipientFlags.self)
        case PropertyId.tagEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "entryId")
        case PropertyId.tagTransmittableDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "transmittableDisplayName")
        case PropertyId.tagObjectType.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "objectType", type: ObjectType.self)
        case PropertyId.tagResponsibility.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "responsibility")
        case PropertyId.tagRecipientType.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "recipientType", type: RecipientType.self)
        case PropertyId.tagSmtpAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "smtpAddress")
        case PropertyId.tagEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "emailAddress")
        case PropertyId.tagMessageEditorFormat.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "messageEditorFormat", type: MessageEditorFormat.self)
        case PropertyId.unknown0x0E4B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E4B")
        case PropertyId.tagIconIndex.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "iconIndex", hexString: true)
        case PropertyId.tagSentRepresentingEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "sentRepresentingEntryId")
        case PropertyId.unknown0x5D0B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D0B")
        case PropertyId.tagOriginatorDeliveryReportRequested.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "originatorDeliveryReportRequested")
        case PropertyId.PR_CREATOR_FLAG.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_CREATOR_FLAG")
        case PropertyId.tagDeleteAfterSubmit.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "deleteAfterSubmit")
        case PropertyId.tagInternetMailOverrideFormat.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "internetMailOverrideFormat", hexString: true)
        case PropertyId.tagRead.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "read")
        case PropertyId.unknown0x7D0E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7D0E")
        case PropertyId.PR_CREATOR_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_CREATOR_SID")
        case PropertyId.tagAlternateRecipientAllowed.rawValue:
            if prop.value is Bool {
                s += boolAssert(value: prop.value, accessor: accessor, name: "alternateRecipientAllowed")
            } else {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagNameidStreamGuid")
            }
        case PropertyId.tagRecipientOrder.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "recipientOrder")
        case PropertyId.tagRecipientTrackStatus.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "recipientTrackStatus", type: ResponseStatus.self)
        case PropertyId.tagRecipientDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "recipientDisplayName")
        case PropertyId.tagSendInternetEncoding.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "sendInternetEncoding")
        case PropertyId.tagRecipientResourceState.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "recipientResourceState", hexString: true)
        case PropertyId.tagSubjectPrefix.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "subjectPrefix")
        case PropertyId.tagStoreSupportMask.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "storeSupportMask", type: StoreSupportMask.self)
        case PropertyId.tagAccessLevel.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "accessLevel", type: MessageAccessLevel.self)
        case PropertyId.tagHasAttachments.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "hasAttachments")
        case PropertyId.unknown0x3677.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3677")
        case PropertyId.unknown0x0086.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0086")
        case PropertyId.tagNormalizedSubject.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "normalizedSubject")
        case PropertyId.tagRtfInSync.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "rtfInSync")
        case PropertyId.tagAccess.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "access", type: MessageAccess.self)
        case PropertyId.tagInReplyToId.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "inReplyToId")
        case PropertyId.tagInternetReferences.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "internetReferences")
        case PropertyId.tagRtfCompressed.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "rtfCompressed")
        case PropertyId.tagRowid.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "rowid")
        case PropertyId.tagInstanceKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "instanceKey")
        case PropertyId.tagAttachDataBinary.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "attachDataBinary")
        case PropertyId.tagAttachMethod.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "attachMethod", type: AttachMethod.self)
        case PropertyId.tagAttachLongFilename.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachLongFilename")
        case PropertyId.tagAttachLongPathname.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachLongPathname")
        case PropertyId.tagAttachExtension.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachExtension")
        case PropertyId.tagAttachFilename.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachFilename")
        case PropertyId.tagAttachMimeTag.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachMimeTag")
        case PropertyId.tagAttachNumber.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "attachNumber")
        case PropertyId.tagLanguage.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "language")
        case PropertyId.unknown0x371D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x371D")
        case PropertyId.tagRenderingPosition.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "renderingPosition")
        case PropertyId.tagAttachContentId.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachContentId")
        case PropertyId.unknown0x680E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x680E")
        case PropertyId.unknown0x680D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x680D")
        case PropertyId.unknown0x1092.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1092")
        case PropertyId.tagOriginalMessageId.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalMessageId")
        case PropertyId.tagReportOriginalSender.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagReportOriginalSender")
        case PropertyId.tagAttachTag.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "attachTag")
        case PropertyId.tagAttachMimeSequence.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagAttachMimeSequence")
        case PropertyId.tagAttachmentLinkId.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "attachmentLinkId")
        case PropertyId.tagAttachFlags.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "attachFlags", type: AttachFlags.self)
        case PropertyId.tagExceptionStartTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "exceptionStartTime")
        case PropertyId.tagExceptionEndTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "exceptionEndTime")
        case PropertyId.tagExceptionReplaceTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "exceptionReplaceTime")
        case PropertyId.tagAttachSize.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "attachSize")
        case PropertyId.tagAttachmentFlags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "attachmentFlags", hexString: true)
        case PropertyId.tagAttachEncoding.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "attachEncoding")
        case PropertyId.tagCreatorEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "creatorEntryId")
        case PropertyId.tagCreatorName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "creatorName")
        case PropertyId.tagMimeSkeleton.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "mimeSkeleton")
        case PropertyId.tagAttachmentHidden.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "attachmentHidden")
        case PropertyId.tagAttachmentContactPhoto.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "attachmentContactPhoto")
        case PropertyId.tagAttachRendering.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "attachRendering")
        case PropertyId.tagSentRepresentingFlags.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSentRepresentingFlags")
        case PropertyId.tagSenderFlags.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSenderFlags")
        case PropertyId.tagReceivedByFlags.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagReceivedByFlags")
        case PropertyId.tagTargetEntryId.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "targetEntryId")
        case PropertyId.tagReceivedRepresentingFlags.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagReceivedRepresentingFlags")
        case PropertyId.tagTnefCorrelationKey.rawValue:
            s += optionalAssert(value: prop.value, accessor: accessor, name: "tnefCorrelationKey")
        case PropertyId.unknown0x5FE5.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5FE5")
        case PropertyId.tagTrustSender.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "trustSender")
        case PropertyId.tagOwnerAppointmentId.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ownerAppointmentId")
        case PropertyId.tagRecipientReassignmentProhibited.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "recipientReassignmentProhibited")
        case PropertyId.tagOriginalSensitivity.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "originalSensitivity", type: MessageSensitivity.self)
        case PropertyId.tagReplyRequested.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "replyRequested")
        case PropertyId.tagOriginalAuthorName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalAuthorName")
        case PropertyId.tagResponseRequested.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "responseRequested")
        case PropertyId.tagSendingSmtpAddress.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSendingSmtpAddress")
        case PropertyId.PR_RECIPIENT_TRACKSTATUS_RESPONSE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_RECIPIENT_TRACKSTATUS_RESPONSE")
        case PropertyId.PR_RECIPIENT_TRACKSTATUS_RECALL.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_RECIPIENT_TRACKSTATUS_RECALL")
        case PropertyId.tagAccount.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "account")
        case PropertyId.tagDisplayTypeEx.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "displayTypeEx", type: DisplayTypeEx.self)
        case PropertyId.tagAbProviders.rawValue:
            s += multipleGuidAssert(value: prop.value, accessor: accessor, name: "abProviders")
        case PropertyId.PR_RECIPIENT_TRACKSTATUS_DELIVERY.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_RECIPIENT_TRACKSTATUS_DELIVERY")
        case PropertyId.PR_RECIPIENT_TRACKSTATUS_READ.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_RECIPIENT_TRACKSTATUS_READ")
        case PropertyId.PR_SENT_REPRESENTING_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_SENT_REPRESENTING_SID")
        case PropertyId.unknown0x1207.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1207")
        case PropertyId.unknown0x3645.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3645")
        case PropertyId.unknown0x6200.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6200")
        case PropertyId.unknown0x6827.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6827")
        case PropertyId.PR_SENDER_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_SENDER_SID")
        case PropertyId.unknown0x6201.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6201")
        case PropertyId.tagReplyRecipientNames.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "replyRecipientNames")
        case PropertyId.tagReplyRecipientEntries.rawValue:
            s += flatEntryListAssert(value: prop.value, accessor: accessor, name: "replyRecipientEntries")
        case PropertyId.tagProviderSubmitTime.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagProviderSubmitTime")
        case PropertyId.tagNextSendAcct.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "nextSendAcct")
        case PropertyId.unknown0x0C25.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0C25")
        case PropertyId.unknown0x0C24.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0C24")
        case PropertyId.tagAddressBookDisplayNamePrintableOrTag7BitDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "addressBookDisplayNamePrintable")
        case PropertyId.tagPrimarySendAccount.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "primarySendAccount")
        case PropertyId.tagSentMailEntryId.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSentMailEntryId")
        case PropertyId.tagStoreUnicodeMask.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagStoreUnicodeMask")
        case PropertyId.tagHasDeferredActionMessages.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "hasDeferredActionMessages")
        case PropertyId.unknown0x0E9D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E9D")
        case PropertyId.tagInitialDetailsPane.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "initialDetailsPane")
        case PropertyId.tagToDoItemFlags.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "toDoItemFlags", type: ToDoItemFlags.self)
        case PropertyId.tagFlagStatus.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "flagStatus", type: FlagStatus.self)
        case PropertyId.tagReportTag.rawValue:
            s += reportTagAssert(value: prop.value, accessor: accessor, name: "reportTag")
        case PropertyId.tagReportDispositionToNames.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagReportDispositionToNames")
        case PropertyId.tagReadReceiptEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "readReceiptEntryId")
        case PropertyId.tagReportDispositionToEmailAddresses.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagReportDispositionToEmailAddresses")
        case PropertyId.tagSubmitFlags.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "submitFlags", type: SubmitFlags.self)
        case PropertyId.tagFollowupIcon.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "followupIcon", type: FollowupIcon.self)
        case PropertyId.tagAttachPayloadClass.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachPayloadClass")
        case PropertyId.tagProcessed.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "processed")
        case PropertyId.tagAttachPayloadProviderGuidString.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachPayloadProviderGuidString")
        case PropertyId.tagLastVerbExecutionTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "lastVerbExecutionTime")
        case PropertyId.tagLastVerbExecuted.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "lastVerbExecuted")
        case PropertyId.tagHomeAddressCity.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddressCity")
        case PropertyId.tagLocation.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "location")
        case PropertyId.tagMiddleName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "middleName")
        case PropertyId.tagBusinessFaxNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "businessFaxNumber")
        case PropertyId.tagKeyword.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "keyword")
        case PropertyId.tagGeneration.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "generation")
        case PropertyId.tagGivenName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "givenName")
        case PropertyId.tagHomeTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeTelephoneNumber")
        case PropertyId.tagHomeAddressStreet.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddressStreet")
        case PropertyId.tagCountry.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "country")
        case PropertyId.tagMobileTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "mobileTelephoneNumber")
        case PropertyId.tagWeddingAnniversary.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "weddingAnniversary")
        case PropertyId.tagDisplayNamePrefix.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "displayNamePrefix")
        case PropertyId.tagAssistant.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "assistant")
        case PropertyId.tagHomeAddressStateOrProvince.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddressStateOrProvince")
        case PropertyId.tagManagerName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "managerName")
        case PropertyId.tagBusinessTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "businessTelephoneNumber")
        case PropertyId.tagDepartmentName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "departmentName")
        case PropertyId.tagStreetAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "streetAddress")
        case PropertyId.tagTitle.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "title")
        case PropertyId.tagSpouseName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "spouseName")
        case PropertyId.tagSurname.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "surname")
        case PropertyId.tagProfession.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "profession")
        case PropertyId.tagPostalCode.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "postalCode")
        case PropertyId.tagLocality.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "locality")
        case PropertyId.tagInitials.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "initials")
        case PropertyId.tagHomeAddressCountry.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddressCountry")
        case PropertyId.tagPostalAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "postalAddress")
        case PropertyId.tagOfficeLocation.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "officeLocation")
        case PropertyId.tagCompanyName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "companyName")
        case PropertyId.tagNickname.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "nickname")
        case PropertyId.tagStateOrProvince.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "stateOrProvince")
        case PropertyId.tagBirthday.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "birthday")
        case PropertyId.tagHomeAddressPostalCode.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeAddressPostalCode")
        case PropertyId.tagStartDate.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "startDate")
        case PropertyId.tagEndDate.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "endDate")
        case PropertyId.PR_DOTSTUFF_STATE_OR_PR_NICK_NAME_W.rawValue:
            if prop.value is String {
                s += stringAssert(value: prop.value, accessor: accessor, name: "nickName")
            } else {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_DOTSTUFF_STATE_OR_PR_NICK_NAME_W")
            }
        case PropertyId.unknown0x3D16.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3D16")
        case PropertyId.unknown0x36F8.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F8")
        case PropertyId.unknown0x3D15.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3D15")
        case PropertyId.unknown0x36F7.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F7")
        case PropertyId.PR_ATTACHMENT_X400_PARAMETERS.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_ATTACHMENT_X400_PARAMETERS")
        case PropertyId.unknown0x3A76.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3A76")
        case PropertyId.unknown0x3A7B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3A7B")
        case PropertyId.tagFlagCompleteTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "flagCompleteTime")
        case PropertyId.unknown0x34C8.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x34C8")
        case PropertyId.unknown0x3D14.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3D14")
        case PropertyId.unknown0x6873.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6873")
        case PropertyId.unknown0x36F4.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F4")
        case PropertyId.PR_FOLDER_XVIEWINFO_E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_FOLDER_XVIEWINFO_E")
        case PropertyId.tagIpmContactEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "ipmContactEntryId")
        case PropertyId.tagIpmAppointmentEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "ipmAppointmentEntryId")
        case PropertyId.tagIpmJournalEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "ipmJournalEntryId")
        case PropertyId.tagIpmTaskEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "ipmTaskEntryId")
        case PropertyId.tagRemindersOnlineEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "remindersOnlineEntryId")
        case PropertyId.tagIpmNoteEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "ipmNoteEntryId")
        case PropertyId.tagFreeBusyEntryIds.rawValue:
            s += multipleDataAssert(value: prop.value, accessor: accessor, name: "freeBusyEntryIds")
        case PropertyId.tagReplChangenum.rawValue:
            s += int64Assert(value: prop.value, accessor: accessor, name: "replChangenum")
        case PropertyId.tagFreeBusyCountMonths.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "freeBusyCountMonths")
        case PropertyId.tagReplItemid.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "replItemid")
        case PropertyId.tagReplVersionHistory.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "replVersionHistory")
        case PropertyId.tagScheduleInfoAppointmentTombstone.rawValue:
            s += scheduleInfoAppointmentTombstoneAssert(value: prop.value, accessor: accessor, name: "scheduleInfoAppointmentTombstone")
        case PropertyId.tagExtendedFolderFlags.rawValue:
            s += extendedFolderFlagsAssert(value: prop.value, accessor: accessor, name: "extendedFolderFlags")
        case PropertyId.tagBusinessHomePage.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "businessHomePage")
        case PropertyId.PR_FOLDER_VIEWLIST.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_FOLDER_VIEWLIST")
        case PropertyId.PR_ORG_EMAIL_ADDR.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_ORG_EMAIL_ADDR")
        case PropertyId.tagContactAddressBookFolderEntryId.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagContactAddressBookFolderEntryId")
        case PropertyId.PR_PROFILE_CONNECT_FLAGS.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_PROFILE_CONNECT_FLAGS")
        case PropertyId.tagReplFlags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "replFlags")
        case PropertyId.tagRecipientNumber.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "recipientNumber")
        case PropertyId.unknown0x815A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x815A")
        case PropertyId.unknown0x815B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x815B")
        case PropertyId.unknown0x815C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x815C")
        case PropertyId.unknown0x815E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x815E")
        case PropertyId.unknown0x815F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x815F")
        case PropertyId.unknown0x80B6.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B6")
        case PropertyId.unknown0x8167.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8167")
        case PropertyId.unknown0x816C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x816C")
        case PropertyId.unknown0x816F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x816F")
        case PropertyId.unknown0x80BC.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80BC")
        case PropertyId.unknown0x817A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x817A")
        case PropertyId.unknown0x815D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x815D")
        case PropertyId.unknown0x8157.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8157")
        case PropertyId.unknown0x80F3.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80F3")
        case PropertyId.unknown0x816D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x816D")
        case PropertyId.unknown0x80B9.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B9")
        case PropertyId.unknown0x80B4.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B4")
        case PropertyId.unknown0x8101.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8101")
        case PropertyId.unknown0x8171.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8171")
        case PropertyId.unknown0x80B7.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B7")
        case PropertyId.unknown0x80B5.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B5")
        case PropertyId.unknown0x817B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x817B")
        case PropertyId.unknown0x810E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x810E")
        case PropertyId.unknown0x8116.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8116")
        case PropertyId.unknown0x8131.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8131")
        case PropertyId.unknown0x810C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x810C")
        case PropertyId.unknown0x8122.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8122")
        case PropertyId.unknown0x80F1.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80F1")
        case PropertyId.unknown0x810D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x810D")
        case PropertyId.unknown0x810F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x810F")
        case PropertyId.unknown0x8138.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8138")
        case PropertyId.unknown0x813F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x813F")
        case PropertyId.unknown0x8110.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8110")
        case PropertyId.unknown0x8127.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8127")
        case PropertyId.unknown0x8125.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8125")
        case PropertyId.unknown0x80DF.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80DF")
        case PropertyId.unknown0x80B1.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B1")
        case PropertyId.unknown0x80B0.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80B0")
        case PropertyId.unknown0x80FB.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80FB")
        case PropertyId.unknown0x80D2.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80D2")
        case PropertyId.unknown0x80DE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80DE")
        case PropertyId.unknown0x7202.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7202")
        case PropertyId.unknown0x7206.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7206")
        case PropertyId.unknown0x7203.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7203")
        case PropertyId.unknown0x7201.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7201")
        case PropertyId.tagStoreProvider.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagStoreProvider")
        case PropertyId.unknown0x80A9.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80A9")
        case PropertyId.unknown0x80A8.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80A8")
        case PropertyId.unknown0x80A7.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x80A7")
        case PropertyId.tagOriginalDisplayTo.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalDisplayTo")
        case PropertyId.tagOriginalDisplayCc.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalDisplayCc")
        case PropertyId.tagOriginalDisplayBcc.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalDisplayBcc")
        case PropertyId.tagAttachPathname.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachPathname")
        case PropertyId.tagPrimaryTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "primaryTelephoneNumber")
        case PropertyId.tagGender.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "gender", type: Gender.self)
        case PropertyId.tagPersonalHomePage.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "personalHomePage")
        case PropertyId.tagMessageSubmissionId.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "messageSubmissionId")
        case PropertyId.unknown0x3015.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3015")
        case PropertyId.unknown0x6A1D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A1D")
        case PropertyId.unknown0x6A17.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A17")
        case PropertyId.unknown0x6A19.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A19")
        case PropertyId.unknown0x6A18.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A18")
        case PropertyId.unknown0x6A15.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A15")
        case PropertyId.unknown0x6A16.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A16")
        case PropertyId.unknown0x6A1A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6A1A")
        case PropertyId.unknown0x6915.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6915")
        case PropertyId.unknown0x6912.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6912")
        case PropertyId.tagOtherAddressPostalCode.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddressPostalCode")
        case PropertyId.tagCustomerId.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "customerId")
        case PropertyId.tagPagerTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "pagerTelephoneNumber")
        case PropertyId.tagGovernmentIdNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "governmentIdNumber")
        case PropertyId.tagOtherAddressStateOrProvince.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddressStateOrProvince")
        case PropertyId.tagAssistantTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "assistantTelephoneNumber")
        case PropertyId.tagOtherAddressCountry.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddressCountry")
        case PropertyId.tagOtherAddressCity.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddressCity")
        case PropertyId.tagCarTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "carTelephoneNumber")
        case PropertyId.tagRadioTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "radioTelephoneNumber")
        case PropertyId.tagHome2TelephoneNumberOrTagHome2TelephoneNumbers.rawValue:
            if prop.value is [String] {
                s += multipleStringAssert(value: prop.value, accessor: accessor, name: "home2TelephoneNumbers")
            } else {
                s += stringAssert(value: prop.value, accessor: accessor, name: "home2TelephoneNumber")
            }
        case PropertyId.tagBusiness2TelephoneNumberOrTagBusiness2TelephoneNumbers.rawValue:
            if prop.value is [String] {
                s += multipleStringAssert(value: prop.value, accessor: accessor, name: "business2TelephoneNumbers")
            } else {
                s += stringAssert(value: prop.value, accessor: accessor, name: "business2TelephoneNumber")
            }
        case PropertyId.tagOtherAddressStreet.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "otherAddressStreet")
        case PropertyId.tagCompanyMainTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "companyMainTelephoneNumber")
        case PropertyId.tagHomeFaxNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "homeFaxNumber")
        case PropertyId.unknown0x6B20.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6B20")
        case PropertyId.unknown0x6B21.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6B21")
        case PropertyId.tagInternetOrganization.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "internetOrganization")
        case PropertyId.tagListUnsubscribe.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "listUnsubscribe")
        case PropertyId.unknown0x68AC.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68AC")
        case PropertyId.unknown0x68C8.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68C8")
        case PropertyId.unknown0x68AD.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68AD")
        case PropertyId.unknown0x68CE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68CE")
        case PropertyId.tagDefaultViewEntryId.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagDefaultViewEntryId")
        case PropertyId.unknown0x68B1.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68B1")
        case PropertyId.unknown0x688C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x688C")
        case PropertyId.unknown0x6814.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6814")
        case PropertyId.tagBlockStatus.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "blockStatus")
        case PropertyId.tagOfflineAddressBookTruncatedPropertiesOrTagVoiceMessageAttachmentOrder.rawValue:
            if prop.value is [UInt32] {
                s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "offlineAddressBookTruncatedProperties")
            } else if prop.value is String {
                s += stringAssert(value: prop.value, accessor: accessor, name: "voiceMessageAttachmentOrder")
            } else {
                s += "XCTAssertNil(\(accessor).offlineAddressBookTruncatedProperties)\n"
            }
        case PropertyId.tagScheduleInfoFreeBusyBusyOrTagWlinkAddressBookEID.rawValue:
            if prop.value is [Data] {
                s += multipleDataAssert(value: prop.value, accessor: accessor, name: "scheduleInfoFreeBusyBusy")
            } else if prop.value is Data {
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "wlinkAddressBookEID")
            } else {
                s += "XCTAssertNil(\(accessor).scheduleInfoFreeBusyBusy)\n"
            }
        case PropertyId.unknown0x68A1.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68A1")
        case PropertyId.unknown0x68C7.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68C7")
        case PropertyId.unknown0x689E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x689E")
        case PropertyId.tagAttachContentLocation.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "attachContentLocation")
        case PropertyId.tagConversationKey.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagConversationKey")
        case PropertyId.tagRtfSyncBodyCrc.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "rtfSyncBodyCrc", hexString: true)
        case PropertyId.tagRtfSyncBodyCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "rtfSyncBodyCount", hexString: true)
        case PropertyId.tagRtfSyncBodyTag.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "rtfSyncBodyTag")
        case PropertyId.tagRtfSyncTrailingCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "rtfSyncTrailingCount", hexString: true)
        case PropertyId.tagRtfSyncPrefixCount.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "rtfSyncPrefixCount", hexString: true)
        case PropertyId.tagFolderWebViewInfo.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagFolderWebViewInfo")
        case PropertyId.tagRedirectionHistory.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagRedirectionHistory")
        case PropertyId.tagListHelp.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "listHelp")
        case PropertyId.tagListSubscribe.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "listSubscribe")
        case PropertyId.tagContentFilterSpamConfidenceLevel.rawValue:
            s += int32Assert(value: prop.value, accessor: accessor, name: "contentFilterSpamConfidenceLevel")
        case PropertyId.tagAutoResponseSuppress.rawValue:
            s += int32Assert(value: prop.value, accessor: accessor, name: "autoResponseSuppress")
        case PropertyId.tagUrlComponentName.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagUrlComponentName")
        case PropertyId.tagUrlCompNameSet.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagUrlCompNameSet")
        case PropertyId.PR_REPLY_RECIPIENT_SMTP_PROXIES.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_REPLY_RECIPIENT_SMTP_PROXIES")
        case PropertyId.tagDisableFullFidelity.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagDisableFullFidelity")
        case PropertyId.PR_ORG_ADDR_TYPE.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_ORG_ADDR_TYPE")
        case PropertyId.tagLocalCommitTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "localCommitTime")
        case PropertyId.tagLocalCommitTimeMax.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "localCommitTimeMax")
        case PropertyId.tagLocaleId.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "localeId")
        case PropertyId.unknown0x6655.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6655")
        case PropertyId.unknown0x6656.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6656")
        case PropertyId.unknown0x6540.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6540")
        case PropertyId.unknown0x8A5C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x8A5C")
        case PropertyId.unknown0x1205.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1205")
        case PropertyId.tagReportEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "reportEntryId")
        case PropertyId.PR_ORIGINAL_AUTHOR_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_ORIGINAL_AUTHOR_SID")
        case PropertyId.unknown0x405E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x405E")
        case PropertyId.unknown0x405F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x405F")
        case PropertyId.unknown0x4060.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4060")
        case PropertyId.unknown0x4062.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4062")
        case PropertyId.unknown0x4063.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4063")
        case PropertyId.PR_READ_RECEIPT_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_READ_RECEIPT_SID")
        case PropertyId.tagOriginalAuthorEmailAddress.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagOriginalAuthorEmailAddress")
        case PropertyId.tagOriginalAuthorAddressType.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagOriginalAuthorAddressType")
        case PropertyId.tagReadReceiptEmailAddress.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "readReceiptEmailAddress")
        case PropertyId.tagReadReceiptAddressType.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "readReceiptAddressType")
        case PropertyId.tagPreview.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagPreview")
        case PropertyId.PR_REPORT_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_REPORT_SID")
        case PropertyId.PR_REPORT_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_REPORT_SID")
        case PropertyId.tagOriginalAuthorEntryId.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagOriginalAuthorEntryId")
        case PropertyId.PR_REPORT_DESTINATION_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_REPORT_DESTINATION_SID")
        case PropertyId.tagReadReceiptName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "readReceiptName")
        case PropertyId.unknown0x4026.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4026")
        case PropertyId.unknown0x4027.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4027")
        case PropertyId.unknown0x4028.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4028")
        case PropertyId.unknown0x4036.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4036")
        case PropertyId.PR_ORIGINATOR_SID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_ORIGINATOR_SID")
        case PropertyId.unknown0x1206.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1206")
        case PropertyId.unknown0x4037.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4037")
        case PropertyId.tagRights.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "rights", type: MessageRights.self)
        case PropertyId.tagSerializedReplidGuidMapOrPR_FOLDER_CHILD_COUNT.rawValue:
            if prop.value is UInt32 {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSerializedReplidGuidMapOrPR_FOLDER_CHILD_COUNT")
            } else {
                s += serializedReplidGuidMapAssert(value: prop.value, accessor: accessor, name: "serializedReplidGuidMap")
            }
        case PropertyId.unknown0x67F4.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x67F4")
        case PropertyId.tagOfflineAddressBookSequenceOrTagVoiceMessageDuration.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "offlineAddressBookSequence")
        case PropertyId.PR_IPM_DAF_ENTRYID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_IPM_DAF_ENTRYID")
        case PropertyId.tagNonIpmSubtreeEntryId.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagNonIpmSubtreeEntryId")
        case PropertyId.unknown0x6815.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6815")
        case PropertyId.tagFaxNumberOfPagesOrTagOfflineAddressBookDistinguishedName.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "faxNumberOfPages")
        case PropertyId.unknown0x67E2.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x67E2")
        case PropertyId.tagOfflineAddressBookMessageClassOrTagVoiceMessageSenderName.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSendOutlookRecallReport")
        case PropertyId.tagOfflineAddressBookContainerGuidOrTagRwRulesStreamOrTagSenderTelephoneNumber.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagOfflineAddressBookContainerGuidOrTagRwRulesStreamOrTagSenderTelephoneNumber")
        case PropertyId.PR_GW_MTSIN_ENTRYID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_GW_MTSIN_ENTRYID")
        case PropertyId.unknown0x6612.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6612")
        case PropertyId.unknown0x6808.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6808")
        case PropertyId.unknown0x6809.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6809")
        case PropertyId.unknown0x6807.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6807")
        case PropertyId.unknown0x6743.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6743")
        case PropertyId.unknown0x680C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x680C")
        case PropertyId.unknown0x680A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x680A")
        case PropertyId.unknown0x680B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x680B")
        case PropertyId.tagCallId.rawValue:
            if prop.value is String {
                s += stringAssert(value: prop.value, accessor: accessor, name: "callId")
            } else {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagCallId")
            }
        case PropertyId.unknown0x6810.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6810")
        case PropertyId.unknown0x6617.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6617")
        case PropertyId.unknown0x6614.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6614")
        case PropertyId.tagRetentionPeriod.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "retentionPeriod")
        case PropertyId.tagRetentionDate.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "retentionDate")
        case PropertyId.tagPolicyTag.rawValue:
            s += guidAssert(value: prop.value, accessor: accessor, name: "policyTag")
        case PropertyId.tagRpcOverHttpFlags.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "rpcOverHttpFlags", type: RpcOverHttpFlags.self)
        case PropertyId.tagOriginalSubject.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalSubject")
        case PropertyId.tagReportText.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "reportText")
        case PropertyId.unknown0x661A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x661A")
        case PropertyId.tagOriginalSubmitTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "originalSubmitTime")
        case PropertyId.tagStartDateEtc.rawValue:
            s += startDateEtcAssert(value: prop.value, accessor: accessor, name: "startDateEtc")
        case PropertyId.tagOriginatorNonDeliveryReportRequested.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "originatorNonDeliveryReportRequested")
        case PropertyId.tagParentKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "parentKey")
        case PropertyId.tagReportTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "reportTime")
        case PropertyId.tagOriginalDisplayName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "originalDisplayName")
        case PropertyId.tagNonDeliveryReportReasonCode.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "nonDeliveryReportReasonCode", hexString: true)
        case PropertyId.tagNonDeliveryReportDiagCode.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "nonDeliveryReportDiagCode", hexString: true)
        case PropertyId.tagNonDeliveryReportStatusCode.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "nonDeliveryReportStatusCode", hexString: true)
        case PropertyId.tagOriginalEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "originalEntryId")
        case PropertyId.tagOriginalSearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "originalSearchKey")
        case PropertyId.unknown0x348A.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x348A")
        case PropertyId.unknown0x66CA.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x66CA")
        case PropertyId.PR_REMINDERS_OFFLINE_ENTRYID.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_REMINDERS_OFFLINE_ENTRYID")
        case PropertyId.unknown0x120D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x120D")
        case PropertyId.unknown0x3660.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3660")
        case PropertyId.unknown0x1216.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1216")
        case PropertyId.tagSecureSubmitFlags.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSecureSubmitFlags")
        case PropertyId.unknown0x6000.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6000")
        case PropertyId.PR_NEW_NICK_NAME.rawValue:
            s += boolAssert(value: prop.value, accessor: accessor, name: "newNickName")
        case PropertyId.unknown0x681B.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x681B")
        case PropertyId.tagItemTemporaryflags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "itemTemporaryflags", hexString: true)
        case PropertyId.tagOrdinalMost.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ordinalMost")
        case PropertyId.tagTelexNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "telexNumber")
        case PropertyId.tagIsdnNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "isdnNumber")
        case PropertyId.tagCallbackTelephoneNumber.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "callbackTelephoneNumber")
        case PropertyId.unknown0x3A77.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3A77")
        case PropertyId.tagScheduleInfoMonthsMergedOrTagWlinkFolderType.rawValue:
            if prop.value is [UInt32] {
                s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "tagScheduleInfoMonthsMerged")
            } else {
                s += guidAssert(value: prop.value, accessor: accessor, name: "wlinkFolderType")
            }
        case PropertyId.tagSearchFolderIdOrTagScheduleInfoDelegatorWantsCopyOrTagWlinkGroupHeaderID.rawValue:
            if prop.value is Bool {
                s += boolAssert(value: prop.value, accessor: accessor, name: "scheduleInfoDelegatorWantsCopy")
            } else {
                s += guidAssert(value: prop.value, accessor: accessor, name: "wlinkGroupHeaderID")
            }
        case PropertyId.tagScheduleInfoDelegateNamesWOrTagWlinkFlags.rawValue:
            if prop.value is [String] {
                s += multipleStringAssert(value: prop.value, accessor: accessor, name: "scheduleInfoDelegateNamesW")
            } else {
                s += optionSetAssert(value: prop.value, accessor: accessor, name: "wlinkFlags", type: WlinkFlags.self)
            }
        case PropertyId.tagFreeBusyPublishStartOrTagSearchFolderTagOrTagWlinkSaveStamp.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "wlinkSaveStamp", hexString: true)
        case PropertyId.tagScheduleInfoDelegatorWantsInfoOrTagWlinkOrdinal.rawValue:
            if prop.value is Bool {
                s += boolAssert(value: prop.value, accessor: accessor, name: "scheduleInfoDelegatorWantsInfo")
            } else {
                s += dataAssert(value: prop.value, accessor: accessor, name: "wlinkOrdinal")
            }
        case PropertyId.tagFreeBusyMessageEmailAddressOrTagWlinkType.rawValue:
            if prop.value is String {
                s += stringAssert(value: prop.value, accessor: accessor, name: "freeBusyMessageEmailAddress")
            } else {
                s += enumAssert(value: prop.value, accessor: accessor, name: "wlinkType", type: WlinkType.self)
            }
        case PropertyId.tagScheduleInfoFreeBusyTentativeOrTagWlinkSection.rawValue:
            if prop.value is [Data] {
                s += multipleDataAssert(value: prop.value, accessor: accessor, name: "scheduleInfoFreeBusyTentative")
            } else {
                s += enumAssert(value: prop.value, accessor: accessor, name: "wlinkSection", type: WlinkSection.self)
            }
        case PropertyId.tagWlinkRecordKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "wlinkRecordKey")
        case PropertyId.tagScheduleInfoFreeBusyMergedOrTagWlinkGroupClsid.rawValue:
            if prop.value is [Data] {
                s += multipleDataAssert(value: prop.value, accessor: accessor, name: "scheduleInfoFreeBusyMerged")
            } else {
                s += guidAssert(value: prop.value, accessor: accessor, name: "wlinkGroupClsid")
            }
        case PropertyId.tagScheduleInfoMonthsBusyOrTagWlinkCalendarColor.rawValue:
            if prop.value is [UInt32] {
                s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "scheduleInfoMonthsBusy")
            } else {
                s += int32Assert(value: prop.value, accessor: accessor, name: "wlinkCalendarColor")
            }
        case PropertyId.tagWlinkEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "wlinkEntryId")
        case PropertyId.tagScheduleInfoMonthsTentativeOrTagWlinkGroupName.rawValue:
            if prop.value is [UInt32] {
                s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "scheduleInfoMonthsTentative")
            } else {
                s += stringAssert(value: prop.value, accessor: accessor, name: "wlinkGroupName")
            }
        case PropertyId.tagWlinkStoreEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "wlinkStoreEntryId")
        case PropertyId.tagWlinkClientID.rawValue:
            s += guidAssert(value: prop.value, accessor: accessor, name: "wlinkClientID")
        case PropertyId.tagWlinkROGroupType.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "wlinkROGroupType", type: WlinkGroupType.self)
        case PropertyId.tagRoamingDatatypes.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "roamingDatatypes", type: RoamingDatatypes.self)
        case PropertyId.unknown0x685D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x685D")
        case PropertyId.tagRoamingDictionary.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "roamingDictionary", encoding: .utf8)
        case PropertyId.tagRoamingXmlStream.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "roamingXmlStream", encoding: .utf8)
        case PropertyId.tagRoamingBinary.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "roamingBinary")
        case PropertyId.tagRuleMessageState.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "ruleMessageState", type: RuleState.self)
        case PropertyId.tagRuleProvider.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "ruleProvider")
        case PropertyId.tagRuleMessageName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "ruleMessageName")
        case PropertyId.tagRuleName.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "ruleName")
        case PropertyId.tagRuleMessageUserFlags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ruleMessageUserFlags", hexString: true)
        case PropertyId.tagRuleUserFlags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ruleUserFlags", hexString: true)
        case PropertyId.tagJunkIncludeContacts.rawValue:
            if prop.value is String {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "junkIncludeContacts")
            } else {
                s += boolAssert(value: prop.value, accessor: accessor, name: "junkIncludeContacts")
            }
        case PropertyId.tagRuleMessageSequence.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ruleMessageSequence")
        case PropertyId.tagRuleSequence.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ruleSequence")
        case PropertyId.tagExtendedRuleMessageCondition.rawValue:
            s += extendedRuleMessageConditionAssert(value: prop.value, accessor: accessor, name: "extendedRuleMessageCondition")
        case PropertyId.tagRuleMessageProviderData.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "ruleMessageProviderData")
        case PropertyId.tagRuleProviderData.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "ruleProviderData")
        case PropertyId.tagRuleMessageProvider.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "ruleMessageProvider")
        case PropertyId.tagRuleProvider.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "ruleProvider")
        case PropertyId.tagExtendedRuleMessageActions.rawValue:
            s += extendedRuleMessageActionsAssert(value: prop.value, accessor: accessor, name: "extendedRuleMessageActions")
        case PropertyId.tagRuleMessageLevel.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ruleMessageLevel")
        case PropertyId.tagRuleLevel.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "ruleLevel")
        case PropertyId.tagSearchFolderExpiration.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "searchFolderExpiration")
        case PropertyId.tagSearchFolderLastUsed.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "searchFolderLastUsed")
        case PropertyId.tagViewDescriptorFlags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "viewDescriptorFlags", hexString: true)
        case PropertyId.unknown0x6833.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6833")
        case PropertyId.unknown0x683F.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x683F")
        case PropertyId.unknown0x6835.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6835")
        case PropertyId.unknown0x683C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x683C")
        case PropertyId.tagScheduleInfoMonthsAway.rawValue:
            if prop.value is [UInt32] {
                s += multipleUInt32Assert(value: prop.value, accessor: accessor, name: "scheduleInfoMonthsAway")
            } else {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagScheduleInfoMonthsAway")
            }
        case PropertyId.tagScheduleInfoFreeBusyAway.rawValue:
            if prop.value is [Data] {
                s += multipleDataAssert(value: prop.value, accessor: accessor, name: "scheduleInfoFreeBusyAway")
            } else {
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagScheduleInfoFreeBusyAway")
            }
        case PropertyId.unknown0x685E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x685E")
        case PropertyId.unknown0x6857.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6857")
        case PropertyId.unknown0x6859.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6859")
        case PropertyId.PR_AGING_PERIOD.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_AGING_PERIOD")
        case PropertyId.unknown0x683D.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x683D")
        case PropertyId.tagAttachAdditionalInformation.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "attachAdditionalInformation")
        case PropertyId.tagLastModificationTime.rawValue:
            s += dateAssert(value: prop.value, accessor: accessor, name: "lastModificationTime")
        case PropertyId.PR_SECURE_ORIGINATION.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_SECURE_ORIGINATION")
        case PropertyId.tagRights.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "rights", type: MessageRights.self)
        case PropertyId.tagComment.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "comment")
        case PropertyId.tagFreeBusyPublishEndOrTagSearchFolderEfpFlags.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "searchFolderEfpFlags", hexString: true)
        case PropertyId.tagScheduleInfoResourceTypeOrTagSearchFolderTemplateId.rawValue:
            s += enumAssert(value: prop.value, accessor: accessor, name: "searchFolderTemplateId", type: SearchFolderTemplateId.self)
        case PropertyId.tagGatewayNeedsToRefreshOrTagSearchFolderStorageType.rawValue:
            s += optionSetAssert(value: prop.value, accessor: accessor, name: "searchFolderStorageType", type: SearchFolderStorageType.self)
        case PropertyId.tagScheduleInfoDelegateEntryIdsOrTagSearchFolderDefinition.rawValue:
            s += searchFolderDefinitionAssert(value: prop.value, accessor: accessor, name: "searchFolderDefinition")
        case PropertyId.unknown0x681C.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x681C")
        case PropertyId.unknown0x681E.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x681E")
        case PropertyId.tagViewDescriptorViewFolder.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "viewDescriptorViewFolder")
        case PropertyId.unknown0x6837.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x6837")
        case PropertyId.PR_NICK_NAME_WEIGHT.rawValue:
            s += uint32Assert(value: prop.value, accessor: accessor, name: "nickNameWeight", hexString: true)
        case PropertyId.PR_DROPDOWN_DISPLAY_NAME_W.rawValue:
            s += stringAssert(value: prop.value, accessor: accessor, name: "dropDownDisplayName")
        case PropertyId.unknown0x0000.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0000")
        case PropertyId.tagOriginalAuthorSearchKey.rawValue:
            s += dataAssert(value: prop.value, accessor: accessor, name: "originalAuthorSearchKey")
        case PropertyId.PR_ORIGINATOR_SEARCH_KEY.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_ORIGINATOR_SEARCH_KEY")
        case PropertyId.unknown0x5D06.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D06")
        case PropertyId.tagOriginalMessageEntryId.rawValue:
            s += entryIdAssert(value: prop.value, accessor: accessor, name: "originalMessageEntryId")
        case PropertyId.unknown0x3655.rawValue:
            s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3655")
        default:
            if let propId = PstPropertyId(rawValue: prop.key) {
                failures.append("UNKNOWN!!: \(propId), value: \(String(describing: prop.value))")
            } else if let propId = PropertyId(rawValue: prop.key) {
                failures.append("UNKNOWN!!: \(propId), value: \(String(describing: prop.value))")
            } else {
                failures.append("UNKNOWN!!: \(prop.key.hexString), value: \(String(describing: prop.value))")
            }
        }
    }
    
    if failures.count > 0 {
        fatalError("\n" + failures.joined(separator: "\n") + "\n")
    }

    s += "\n"
    return s
}
