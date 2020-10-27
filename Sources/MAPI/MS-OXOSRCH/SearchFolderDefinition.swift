//
//  SearchFolderDefinition.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

import DataStream
import Foundation
import WindowsDataTypes

/// [MS-OXOSEARCH] 2.2.1.2.8 PidTagSearchFolderDefinition
/// Type: PtypBinary
/// The PidTagSearchFolderDefinition property ([MS-OXPROPS] section 2.982) contains data that specifies the search criteria and search options.
/// The structure of this property is specified as follows. The presence and specific content of some fields are dependent upon the template that is
/// used for the search. The template ID, specified in the PidTagSearchFolderTemplateId property (section 2.2.1.2.2), identifies the template to be
/// used. For details about the templates and how they affect the fields of the PidTagSearchFolderDefinition property, see section 2.2.3.
public struct SearchFolderDefinition {
    public let version: UInt32
    public let flags: SearchFolderStorageType
    public let numericalSearch: UInt32
    public let textSearchLength: UInt8
    public let textSearchExtendedLength: UInt16?
    public let textSearch: String?
    public let skipBlock1Count: UInt32
    public let skipBlock1: [UInt32]
    public let deepSearch: UInt32
    public let folderList1Length: UInt8
    public let folderList1ExtendedLength: UInt16?
    public let folderList1: String?
    public let folderList2Length: UInt32
    public let folderList2: EntryList?
    public let addresses: AddressList?
    public let skipBlock2Count: UInt32
    public let skipBlock2: [UInt32]
    public let searchRestriction: Restriction?
    public let advancedSearchLow: UInt32?
    public let advancedSearchHigh: UInt32?
    public let advancedSearch: [UInt8]?
    public let skipBlock3Count: UInt32
    public let skipBlock3: [UInt32]
    
    public init(dataStream: inout DataStream) throws {
        /// Version (4 bytes): A 4-byte value that specifies the version of the data. The value SHOULD be 0x04100000 (network byte order).
        self.version = try dataStream.read(endianess: .bigEndian)
        if self.version != 0x04100000 {
            throw MAPIError.corrupted
        }
        
        
        let flagsRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.flags = SearchFolderStorageType(rawValue: flagsRaw)
 
        /// NumericalSearch (4 bytes): An integer that specifies either the size or the age of the messages to be searched.
        /// If the H field is set to zero (0), this field MUST be set to 0x00000000 when sent and MUST be ignored on receipt.
        /// The value of this field has the following format (in big-endian order) for specifying age:
        ///  The upper two bytes specify the units as follows:
        ///  0x0000: Days
        ///  0x0001: Weeks
        ///  0x0002: Months
        ///  The lower two bytes specify the amount.
        /// For example, the value 0x0001002A specifies an age of 42 weeks.
        let numericalSearch: UInt32 = try dataStream.read(endianess: .bigEndian)
        if !self.flags.contains(.H) && numericalSearch != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        self.numericalSearch = numericalSearch
        
        /// TextSearchLength (1 byte): An integer that specifies the size, in characters, of the TextSearch field. If the TextSearch field is longer
        /// than 254 characters, this field MUST be set to 255. If the G field is set to zero (0), this field MUST be set to zero (0).
        let textSearchLength: UInt8 = try dataStream.read()
        if !self.flags.contains(.G) && textSearchLength != 0 {
            throw MAPIError.corrupted
        }
        
        self.textSearchLength = textSearchLength
        
        /// TextSearchExtendedLength (2 bytes): An integer that specifies the size of the TextSearch field when its size is greater than 254
        /// characters. This field MUST NOT be present if the value of the TextSearchLength field is less than 255.
        if self.textSearchLength == 0xFF {
            self.textSearchExtendedLength = try dataStream.read(endianess: .littleEndian)
        } else {
            self.textSearchExtendedLength = nil
        }
        
        /// TextSearch (variable): A string that specifies search criteria. The particular criteria specified depend on the template used. The size
        /// of the string, in characters, is specified by the TextSearchLength field or the TextSearchExtendedLength field. The string MUST NOT
        /// be longer than 65,535 characters. If the G field is set to zero (0), this field MUST NOT be present.
        if self.flags.contains(.G) {
            if let textSearchExtendedLength = self.textSearchExtendedLength {
                self.textSearch = try dataStream.readString(count: Int(textSearchExtendedLength), encoding: .utf16LittleEndian)
            } else {
                self.textSearch = try dataStream.readString(count: Int(self.textSearchLength), encoding: .utf16LittleEndian)
            }
        } else {
            self.textSearch = nil
        }
        
        /// SkipBlock1 (variable): A skip block that specifies the number of bytes to skip ahead. This is for future versions to insert new data.
        /// If there is no data to skip, the value of this field MUST be zero
        self.skipBlock1Count = try dataStream.read(endianess: .littleEndian)
        if self.skipBlock1Count > 0 {
            var skipBlock1: [UInt32] = []
            skipBlock1.reserveCapacity(Int(self.skipBlock1Count))
            for _ in 0..<self.skipBlock1Count {
                skipBlock1.append(try dataStream.read(endianess: .littleEndian))
            }
            
            self.skipBlock1 = skipBlock1
        } else {
            self.skipBlock1 = []
        }
        
        /// DeepSearch (4 bytes): A Boolean value that specifies whether the search includes subfolders. If the search includes subfolders,
        /// this field is set to TRUE (0x00000001); otherwise, this field is set to FALSE (0x00000000).
        self.deepSearch = try dataStream.read(endianess: .littleEndian)
        
        /// FolderList1Length (1 byte): An integer that specifies the size, in characters, of the FolderList1 field. If the FolderList1 field is longer
        /// than 254 characters, this field MUST be set to 255. If the C field is set to zero (0), this field MUST be set to zero (0).
        let folderList1Length: UInt8 = try dataStream.read()
        if !self.flags.contains(.C) && folderList1Length != 0 {
            throw MAPIError.corrupted
        }
        
        self.folderList1Length = folderList1Length
        
        /// FolderList1ExtendedLength (2 bytes): An integer that specifies the size of the FolderList1 field when its size is greater than 254
        /// characters. This field MUST NOT be present if the value of the FolderList1Length field is less than 255.
        if self.folderList1Length == 0xFF {
            self.folderList1ExtendedLength = try dataStream.read(endianess: .littleEndian)
        } else {
            self.folderList1ExtendedLength = nil
        }
        
        /// FolderList1 (variable): A string that contains the names of the folders to be searched. The size of the string, in characters, is specified
        /// by the FolderList1Length field or the FolderList1ExtendedLength field. The string MUST NOT be longer than 65,535 characters. If
        /// the C field is set to zero (0), this field MUST NOT be present.
        if self.flags.contains(.C) {
            if let folderList1ExtendedLength = self.folderList1ExtendedLength {
                self.folderList1 = try dataStream.readString(count: Int(folderList1ExtendedLength), encoding: .utf16LittleEndian)
            } else {
                self.folderList1 = try dataStream.readString(count: Int(self.folderList1Length), encoding: .utf16LittleEndian)
            }
        } else {
            self.folderList1 = nil
        }
        
        /// FolderList2Length (4 bytes): An integer that specifies the size, in bytes, of the FolderList2 field. If the B field is set to zero (0),
        /// this field MUST be set to zero (0).
        let folderList2Length: UInt32 = try dataStream.read(endianess: .littleEndian)
        if !self.flags.contains(.B) && folderList2Length != 0 {
            throw MAPIError.corrupted
        }
        
        self.folderList2Length = folderList2Length
        
        /// FolderList2 (variable): An EntryList structure, as specified in [MS-OXCDATA] section 2.3.1, that contains a list of the folders to be
        /// searched. If the B field is set to zero (0), this field MUST NOT be present.
        if self.flags.contains(.B) {
            self.folderList2 = try EntryList(dataStream: &dataStream)
        } else {
            self.folderList2 = nil
        }
        
        /// Addresses (variable): An AddressList structure, as specified in section 2.2.1.2.8.1, that contains a list of addresses to be included in
        /// the search. If the F field is set to zero (0), this field MUST NOT be present.
        if self.flags.contains(.F) {
            self.addresses = try AddressList(dataStream: &dataStream)
        } else {
            self.addresses = nil
        }
        
        /// SkipBlock2 (variable): A skip block that specifies the number of bytes to skip ahead. This is for future versions to insert new data.
        /// If there is no data to skip, the value of this field MUST be zero (0), and its size is 4 bytes. If there is data to skip, the size of this field
        /// MUST be 4 bytes plus the size of the data to be skipped.
        self.skipBlock2Count = try dataStream.read(endianess: .littleEndian)
        if self.skipBlock2Count > 0 {
            var skipBlock2: [UInt32] = []
            skipBlock2.reserveCapacity(Int(self.skipBlock2Count))
            for _ in 0..<self.skipBlock2Count {
                skipBlock2.append(try dataStream.read(endianess: .littleEndian))
            }
            
            self.skipBlock2 = skipBlock2
        } else {
            self.skipBlock2 = []
        }
        
        /// SearchRestriction (variable): A Restriction structure, as specified in section 2.2.1.2.8.2, that explicitly defines the search criteria.
        /// If the E field is set to zero (0), this field MUST NOT be present.
        if self.flags.contains(.E) {
            self.searchRestriction = try Restriction(dataStream: &dataStream)
        } else {
            self.searchRestriction = nil
        }
        
        /// AdvancedSearch (variable): A low-order 4-byte integer followed by a high-order 4-byte integer, forming a 64-bit value that specifies
        /// the number of data bytes contained in this field. The total length of this field is 8 plus the length of the data. The data is
        /// implementation-specific. If the D field is set to zero (0), this field MUST NOT be present.
        if self.flags.contains(.D) {
            self.advancedSearchLow = try dataStream.read(endianess: .littleEndian)
            self.advancedSearchHigh = try dataStream.read(endianess: .littleEndian)
            
            let count = UInt64(advancedSearchHigh!) << 32 | UInt64(advancedSearchLow!)
            self.advancedSearch = try dataStream.readBytes(count: Int(count))
        } else {
            self.advancedSearchLow = nil
            self.advancedSearchHigh = nil
            self.advancedSearch = nil
        }
        
        /// SkipBlock3 (variable): A skip block that specifies the number of bytes to skip ahead. This is for future versions to insert new data.
        /// If there is no data to skip, the value of this field MUST be zero (0), and its size will be 4 bytes. If there is data to skip, the size of this
        /// field MUST be 4 bytes plus the size of the data to be skipped.
        self.skipBlock3Count = try dataStream.read(endianess: .littleEndian)
        if self.skipBlock3Count > 0 {
            var skipBlock3: [UInt32] = []
            skipBlock3.reserveCapacity(Int(self.skipBlock3Count))
            for _ in 0..<self.skipBlock3Count {
                skipBlock3.append(try dataStream.read(endianess: .littleEndian))
            }
            
            self.skipBlock3 = skipBlock3
        } else {
            self.skipBlock3 = []
        }
        
        assert(dataStream.remainingCount == 0)
    }
    
    /// [MS-OXOSRCH] 2.2.1.2.8.1 AddressList
    /// The AddressList structure contains a list of addresses.
    public struct AddressList {
        public let addressCount: UInt32
        public let addresses: [AddressEntry]
        
        public init(dataStream: inout DataStream) throws {
            /// AddressCount (4 bytes): An unsigned integer that indicates the number of AddressEntry structures in the Addresses field.
            self.addressCount = try dataStream.read(endianess: .littleEndian)
            
            /// Addresses (variable): An array of AddressEntry structures, as specified in section 2.2.1.2.8.1.1.
            var addresses: [AddressEntry] = []
            addresses.reserveCapacity(Int(self.addressCount))
            for _ in 0..<self.addressCount {
                let address = try AddressEntry(dataStream: &dataStream)
                addresses.append(address)
            }

            self.addresses = addresses
        }
        
        /// [MS-OXOSRCH] 2.2.1.2.8.1.1 AddressEntry
        /// The AddressEntry structure contains properties that represent an addressee.
        public struct AddressEntry {
            public let propertyCount: UInt32
            public let pad: UInt32
            public let values: [PropertyValue]
            
            public init(dataStream: inout DataStream) throws {
                /// PropertyCount (4 bytes): An unsigned integer that indicates the number of PropertyValue structures in the Values field.
                self.propertyCount = try dataStream.read(endianess: .littleEndian)
                
                /// Pad (4 bytes): Ignored. This field can be any value.
                self.pad = try dataStream.read(endianess: .littleEndian)
                
                /// Values (variable): This field contains an array of PropertyValue structures (section 2.2.1.2.8.1.1.1). This field MUST include the
                /// properties in the following list. Other properties can be included.
                ///  PidTagDisplayName ([MS-OXCFOLD] section 2.2.2.2.2.5)
                ///  PidTagAddressType ([MS-OXOABK] section 2.2.3.13)
                ///  PidTagEntryId ([MS-OXCPERM] section 2.2.4)
                ///  PidTagObjectType ([MS-OXCPRPT] section 2.2.1.7)
                ///  PidTagDisplayType ([MS-OXOABK] section 2.2.3.11)
                ///  PidTagDisplayTypeEx ([MS-OXOABK] section 2.2.3.12)
                ///  PidTagEmailAddress ([MS-OXOABK] section 2.2.3.14)
                ///  PidTagRecipientType ([MS-OXOMSG] section 2.2.3.1)
                var values: [PropertyValue] = []
                values.reserveCapacity(Int(self.propertyCount))
                for _ in 0..<self.propertyCount {
                    let value = try PropertyValue(dataStream: &dataStream)
                    values.append(value)
                }
                
                self.values = values
            }
        }
    }
    
    public struct PropertyValue {
        public let tag: PropertyTag
        public let value: Any
        
        public init(dataStream: inout DataStream) throws {
            /// PropertyType (2 bytes): An integer that specifies the type of data in the Value field. The data can be any of the following types.
            /// For details about these types, see [MS-OXCDATA] section 2.11.1.
            ///  PtypInteger32
            ///  PtypErrorCode
            ///  PtypBoolean
            ///  PtypString
            ///  PtypString8
            ///  PtypTime
            ///  PtypBinary
            ///  PtypMultipleString8
            ///  PtypMultipleBinary
            /// PropertyId (2 bytes): An integer that identifies the data in the Value field.
            self.tag = try PropertyTag(dataStream: &dataStream)
            
            /// Value (variable): The data that is the value of the property. The format of the data depends on the type that is specified in the
            /// PropertyType field.
            switch self.tag.type {
            case .integer32:
                self.value = try dataStream.read(endianess: .littleEndian) as UInt32
            case .errorCode:
                self.value = try dataStream.read(endianess: .littleEndian) as UInt32
            case .boolean:
                self.value = (try dataStream.read() as UInt8) != 0
            case .string:
                let count: UInt16 = try dataStream.read(endianess: .littleEndian)
                self.value = try dataStream.readString(count: Int(count) - 2, encoding: .utf16LittleEndian)!
                dataStream.position += 2 // Skip null terminator
            case .string8:
                let count: UInt16 = try dataStream.read(endianess: .littleEndian)
                self.value = try dataStream.readString(count: Int(count) - 1, encoding: .ascii)!
                dataStream.position += 1 // Skip null terminator
            case .time:
                self.value = try FILETIME(dataStream: &dataStream).date
            case .binary:
                let count: UInt16 = try dataStream.read(endianess: .littleEndian)
                self.value = Data(try dataStream.readBytes(count: Int(count)))
            case .multipleString8:
                let count: UInt16 = try dataStream.read(endianess: .littleEndian)
                var results: [String] = []
                results.reserveCapacity(Int(count))
                for _ in 0..<count {
                    let result = try dataStream.readAsciiString()!
                    results.append(result)
                }
                
                self.value = results
            case .multipleBinary:
                let count: UInt16 = try dataStream.read(endianess: .littleEndian)
                var results: [Data] = []
                results.reserveCapacity(Int(count))
                for _ in 0..<count {
                    let count: UInt8 = try dataStream.read(endianess: .littleEndian)
                    let result = Data(try dataStream.readBytes(count: Int(count)))
                    results.append(result)
                }
                
                self.value = results
            default:
                throw MAPIError.corrupted
            }
        }
    }
    
    /// [MS-OXOSRCH] 2.2.1.2.8.2 Restriction
    /// The Restriction structure represents a filter that defines the search criteria in a search folder.
    public struct Restriction {
        public let restrictionType: RestrictionType
        public let restrictionData: SearchRestrictionData
        
        public init(dataStream: inout DataStream) throws {
            /// RestrictionType (4 bytes): An integer that specifies the type of structure in the RestrictionData field. It can have one of the
            /// following values.
            let restrictionTypeRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
            guard let restrictionType = RestrictionType(rawValue: restrictionTypeRaw) else {
                throw MAPIError.corrupted
            }
            
            self.restrictionType = restrictionType
            
            /// RestrictionData (variable): The contents of this field depend on the value of the RestrictionType field. It contains data that is
            /// formatted as specified in the table in the description of RestrictionType field in this section.
            switch self.restrictionType {
            case .and:
                self.restrictionData = try AndRestriction(dataStream: &dataStream)
            case .or:
                self.restrictionData = try OrRestriction(dataStream: &dataStream)
            case .not:
                self.restrictionData = try NotRestriction(dataStream: &dataStream)
            case .content:
                self.restrictionData = try ContentRestriction(dataStream: &dataStream)
            case .property:
                self.restrictionData = try PropertyRestriction(dataStream: &dataStream)
            case .compare:
                self.restrictionData = try CompareRestriction(dataStream: &dataStream)
            case .bitMask:
                self.restrictionData = try BitMaskRestriction(dataStream: &dataStream)
            case .exist:
                self.restrictionData = try ExistRestriction(dataStream: &dataStream)
            case .comment:
                self.restrictionData = try CommentRestriction(dataStream: &dataStream)
            case .count:
                self.restrictionData = try CountRestriction(dataStream: &dataStream)
            }
        }

        /// Variable size, a 32-bit count of subrestrictions, followed by the subrestrictions in Restriction format.
        /// An object satisfies this filter if and only if all subrestrictions are satisfied.
        public struct AndRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .and
            
            public let count: UInt32
            public let restrictions: [Restriction]
            
            public init(dataStream: inout DataStream) throws {
                self.count = try dataStream.read(endianess: .littleEndian)
                
                var restrictions: [Restriction] = []
                restrictions.reserveCapacity(Int(self.count))
                for _ in 0..<self.count {
                    let restriction = try Restriction(dataStream: &dataStream)
                    restrictions.append(restriction)
                }
                
                self.restrictions = restrictions
            }
        }
        
        /// Variable size, a 32-bit count of subrestrictions, followed by the subrestrictions in Restriction format.
        /// An object satisfies this filter if at least one subrestriction is satisfied.
        public struct OrRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .or
            
            public let count: UInt32
            public let restrictions: [Restriction]
            
            public init(dataStream: inout DataStream) throws {
                self.count = try dataStream.read(endianess: .littleEndian)
                
                var restrictions: [Restriction] = []
                restrictions.reserveCapacity(Int(self.count))
                for _ in 0..<Int(self.count) {
                    let restriction = try Restriction(dataStream: &dataStream)
                    restrictions.append(restriction)
                }
                
                self.restrictions = restrictions
            }
        }
        
        /// Variable size, a subrestriction in Restriction format. An object satisfies this filter if and only if the subrestriction is not satisfied.
        public struct NotRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .not

            public let subrestriction: Restriction
            
            public init(dataStream: inout DataStream) throws {
                self.subrestriction = try Restriction(dataStream: &dataStream)
            }
        }
        
        /// Variable size, a 32-bit ulFuzzyLevel field, a specified in [MS-NSPI], followed by a 32-bit PropertyTag structure ([MS-OXCDATA]
        /// section 2.9), followed by the comparand in PropertyValue format (section 2.2.1.2.8.1.1.1). An object satisfies this filter if and only
        /// if the given property is equivalent to the given comparand at the specified value of the ulFuzzyLevel field.
        public struct ContentRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .content

            public let ulFuzzyLevel: UInt32
            public let tag: PropertyTag
            public let value: PropertyValue
            
            public init(dataStream: inout DataStream) throws {
                self.ulFuzzyLevel = try dataStream.read(endianess: .littleEndian)
                self.tag = try PropertyTag(dataStream: &dataStream)
                self.value = try PropertyValue(dataStream: &dataStream)
            }
        }
        
        /// Variable size, a 32-bit RelOp field, with the three highorder bytes set to zeroes, followed by a 32-bit PropertyTag structure, followed
        /// by the comparand in PropertyValue format. An object satisfies this filter if and only if the RelOp value describes the given property's
        /// relationship to the comparand, as specified in [MS-OXCDATA] section 2.12.5.1.
        public struct PropertyRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .property

            public let relOp: UInt32
            public let tag: PropertyTag
            public let value: PropertyValue
            
            public init(dataStream: inout DataStream) throws {
                self.relOp = try dataStream.read(endianess: .littleEndian)
                self.tag = try PropertyTag(dataStream: &dataStream)
                self.value = try PropertyValue(dataStream: &dataStream)
            }
        }
        
        /// 12 bytes, a 32-bit RelOp field, with the three high-order bytes set to zeroes, followed by two 32-bit PropertyTag structures. An
        /// object satisfies this filter if and only if the RelOp value describes the first property's relationship to the second property, as
        /// specified in [MS-OXCDATA] section 2.12.6.1.
        public struct CompareRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .compare

            public let relOp: UInt32
            public let tag1: PropertyTag
            public let tag2: PropertyTag
            
            public init(dataStream: inout DataStream) throws {
                self.relOp = try dataStream.read(endianess: .littleEndian)
                self.tag1 = try PropertyTag(dataStream: &dataStream)
                self.tag2 = try PropertyTag(dataStream: &dataStream)
            }
        }
        
        /// 12 bytes, a 32-bit BitmapRelOp field, with the three high-order bytes set to zeroes, followed by a 32-bit PropertyTag structure,
        /// followed by the comparand as a 32-bit mask. An object satisfies this filter if and only if the bitwise AND of the property with the
        /// comparand satisfies the BitmapRelOp value, as specified in [MSOXCDATA] section 2.12.7.1.
        public struct BitMaskRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .bitMask

            public let bitmapRelOp: UInt32
            public let tag: PropertyTag
            public let comparand: UInt32
            
            public init(dataStream: inout DataStream) throws {
                self.bitmapRelOp = try dataStream.read(endianess: .littleEndian)
                self.tag = try PropertyTag(dataStream: &dataStream)
                self.comparand = try dataStream.read(endianess: .littleEndian)
            }
        }
        
        /// 4 bytes, a 32-bit PropertyTag structure. An object satisfies this filter if and only if the given property is set on the object.
        public struct ExistRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .exist

            public let tag: PropertyTag
            
            public init(dataStream: inout DataStream) throws {
                self.tag = try PropertyTag(dataStream: &dataStream)
            }
        }
        
        /// Variable size, a 32-bit count of annotations, followed by a subrestriction in Restriction format, followed by the annotations in
        /// PropertyValue format. An object satisfies this filter if and only if the object satisfies the subrestriction. The annotations
        /// SHOULD be left intact and ignored.
        public struct CommentRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .comment

            public let annotationsCount: UInt32
            public let subrestriction: Restriction
            public let annotations: [PropertyValue]
            
            public init(dataStream: inout DataStream) throws {
                self.annotationsCount = try dataStream.read(endianess: .littleEndian)
                
                self.subrestriction = try Restriction(dataStream: &dataStream)
                
                var annotations: [PropertyValue] = []
                annotations.reserveCapacity(Int(self.annotationsCount))
                for _ in 0..<annotationsCount {
                    let annotation = try PropertyValue(dataStream: &dataStream)
                    annotations.append(annotation)
                }
                
                self.annotations = annotations
            }
        }
        
        /// Variable size, a subrestriction in Restriction format. An object satisfies this filter if and only if the object satisfies the subrestriction.
        public struct CountRestriction: SearchRestrictionData {
            public let restrictionType: RestrictionType = .count

            public let subrestriction: Restriction
            
            public init(dataStream: inout DataStream) throws {
                self.subrestriction = try Restriction(dataStream: &dataStream)
            }
        }
        
        /// RestrictionType (4 bytes): An integer that specifies the type of structure in the RestrictionData field. It can have one of the
        /// following values.
        public enum RestrictionType: UInt32 {
            /// AndRestriction 0x00000000 Variable size, a 32-bit count of subrestrictions, followed by the subrestrictions in Restriction format.
            /// An object satisfies this filter if and only if all subrestrictions are satisfied.
            case and = 0x00000000

            /// OrRestriction 0x00000001 Variable size, a 32-bit count of subrestrictions, followed by the subrestrictions in Restriction format.
            /// An object satisfies this filter if at least one subrestriction is satisfied.
            case or = 0x00000001
            
            /// NotRestriction 0x00000002 Variable size, a subrestriction in Restriction format. An object satisfies this filter if and only if the
            /// subrestriction is not satisfied.
            case not = 0x00000002

            /// ContentRestriction 0x00000003 Variable size, a 32-bit ulFuzzyLevel field, a specified in [MS-NSPI], followed by a 32-bit
            /// PropertyTag structure ([MS-OXCDATA] section 2.9), followed by the comparand in PropertyValue format (section
            /// 2.2.1.2.8.1.1.1). An object satisfies this filter if and only if the given property is equivalent to the given comparand at the specified
            /// value of the ulFuzzyLevel field.
            case content = 0x00000003
            
            /// PropertyRestriction 0x00000004 Variable size, a 32-bit RelOp field, with the three highorder bytes set to zeroes, followed by a
            /// 32-bit PropertyTag structure, followed by the comparand in PropertyValue format. An object satisfies this filter if and only if the
            /// RelOp value describes the given property's relationship to the comparand, as specified in [MS-OXCDATA] section 2.12.5.1.
            case property = 0x00000004

            /// ComparePropertiesRestriction 0x00000005 12 bytes, a 32-bit RelOp field, with the three high-order bytes set to zeroes, followed
            /// by two 32-bit PropertyTag structures. An object satisfies this filter if and only if the RelOp value describes the first property's
            /// relationship to the second property, as specified in [MS-OXCDATA] section 2.12.6.1.
            case compare = 0x00000005
            
            /// BitMaskRestriction 0x00000006 12 bytes, a 32-bit BitmapRelOp field, with the three high-order bytes set to zeroes, followed by
            /// a 32-bit PropertyTag structure, followed by the comparand as a 32-bit mask. An object satisfies this filter if and only if the bitwise
            /// AND of the property with the comparand satisfies the BitmapRelOp value, as specified in [MSOXCDATA] section 2.12.7.1.
            case bitMask = 0x00000006

            /// ExistRestriction 0x00000008 4 bytes, a 32-bit PropertyTag structure. An object satisfies this filter if and only if the given property
            /// is set on the object.
            case exist = 0x00000008

            /// CommentRestriction 0x0000000A Variable size, a 32-bit count of annotations, followed by a subrestriction in Restriction format,
            /// followed by the annotations in PropertyValue format. An object satisfies this filter if and only if the object satisfies the
            /// subrestriction. The annotations SHOULD be left intact and ignored.
            case comment = 0x0000000A
            
            /// CountRestriction 0x0000000B Variable size, a subrestriction in Restriction format. An object satisfies this filter if and only if the
            /// object satisfies the subrestriction.
            case count = 0x0000000B
        }
    }
}

public protocol SearchRestrictionData {
    var restrictionType: SearchFolderDefinition.Restriction.RestrictionType { get }
}
