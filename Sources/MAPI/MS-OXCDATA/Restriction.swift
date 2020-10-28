//
//  Restriction.swift
//  
//
//  Created by Hugh Bellamy on 24/10/2020.
//

import DataStream

/// [MS-OXCDATA] 2.12 Restrictions
/// Restrictions describe a filter for limiting the view of a table to a particular set of rows. This filter represents a Boolean expression
/// that is evaluated against each item of the table. The item will be included as a row of the restricted table if and only if the value
/// of the Boolean expression evaluates to TRUE.
/// Restrictions are sent to the server with the RopFindRow ([MS-OXCROPS] section 2.2.5.13), RopRestrict ([MS-OXCROPS]
/// section 2.2.5.3), RopSetSearchCriteria ([MS-OXCROPS] section 2.2.4.4), and RopSynchronizationConfigure ([MS-OXCROPS]
/// section 2.2.13.1) ROP requests, and they are returned from the RopGetSearchCriteria ROP request ([MS-OXCROPS] section
/// 2.2.4.5).
/// There are 12 different restriction (2) packet formats: Six of them (AndRestriction, OrRestriction, NotRestriction,
/// SubObjectRestriction, CommentRestriction, and CountRestriction) are used to construct more complicated restrictions (2) from
/// one or more simpler ones. The other six types (ContentRestriction, PropertyRestriction, ComparePropertiesRestriction, BitMaskRestriction,
/// SizeRestriction, and ExistRestriction) specify specific tests based on the properties of an item.
/// Although the packet formats differ, the first 8 bits always store RestrictType, an unsigned byte value specifying the type of restriction (2),
/// in the first 8 bits. The possible values for RestrictType are presented in the following table.
/// The subsections that follow describe each packet format.
/// There is one variation in the way restriction structures are serialized. In the context of ROP buffers, such as the RopRestrict ROP or the
/// RopSetSearchCriteria ROP, all count fields (such as the number of subrestrictions of an AndRestriction) are 16 bits wide. However, in
/// the context of extended rules, as specified in [MS-OXORULE] section 2.2.4, or search folder definition messages, as specified in
/// [MS-OXOSRCH] section 2.2.1, these counts are 32 bits wide. Such fields are identified as COUNT fields throughout section 2.12.
public struct Restriction: RestrictionPacket {
    public let restrictType: RestrictType
    public let packet: Any
    
    public init(dataStream: inout DataStream, standard: Bool) throws {
        let restrictTypeRaw: UInt8 = try dataStream.read()
        guard let restrictType = RestrictType(rawValue: restrictTypeRaw) else {
            throw MAPIError.corrupted
        }
        
        self.restrictType = restrictType
        
        switch self.restrictType {
        case .and:
            self.packet = try AndRestriction(dataStream: &dataStream, standard: standard)
        case .or:
            self.packet = try OrRestriction(dataStream: &dataStream, standard: standard)
        case .not:
            self.packet = try NotRestriction(dataStream: &dataStream, standard: standard)
        case .content:
            self.packet = try ContentRestriction(dataStream: &dataStream, standard: standard)
        case .property:
            self.packet = try PropertyRestriction(dataStream: &dataStream, standard: standard)
        case .compareProperties:
            self.packet = try ComparePropertiesRestriction(dataStream: &dataStream, standard: standard)
        case .bitMask:
            self.packet = try BitMaskRestriction(dataStream: &dataStream, standard: standard)
        case .size:
            self.packet = try SizeRestriction(dataStream: &dataStream, standard: standard)
        case .exist:
            self.packet = try ExistRestriction(dataStream: &dataStream, standard: standard)
        case .subObject:
            self.packet = try SubObjectRestriction(dataStream: &dataStream, standard: standard)
        case .comment:
            self.packet = try CommentRestriction(dataStream: &dataStream, standard: standard)
        case .count:
            self.packet = try CountRestriction(dataStream: &dataStream, standard: standard)
        }
    }
    
    public enum RestrictType: UInt8 {
        /// AndRestriction AndRestriction_r 0x00 Logical AND operation applied to a list of subrestrictions. RES_AND
        case and = 0x00
        
        /// OrRestriction OrRestriction_r 0x01 Logical OR operation applied to a list of subrestrictions. RES_OR
        case or = 0x01
        
        /// NotRestriction NotRestriction_r 0x02 Logical NOT operation applied to a subrestriction. RES_NOT
        case not = 0x02

        /// ContentRestriction ContentRestriction_r 0x03 Search a property value for specific content. RES_CONTENT
        case content = 0x03
        
        /// PropertyRestriction PropertyRestriction_r 0x04 Compare a property value with a particular value. RES_PROPERTY
        case property = 0x04

        /// ComparePropertiesRestriction ComparePropertiesRestriction_r 0x05 Compare the values of two properties. RES_COMPAREPROPS
        case compareProperties = 0x05
        
        /// BitMaskRestriction BitMaskRestriction_r 0x06 Perform a bitwise AND operation on a property value with a mask and compare that with 0 (zero). RES_BITMASK
        case bitMask = 0x06
        
        /// SizeRestriction SizeRestriction_r 0x07 Compare the size of a property value to a particular figure. RES_SIZE
        case size = 0x07
        
        /// ExistRestriction ExistRestriction_r 0x08 Test whether a property has a value. RES_EXIST
        case exist = 0x08
        
        /// SubObjectRestriction SubRestriction_r 0x09 Test whether any row of a message's attachment or recipient table satisfies a subrestriction. RES_SUBRESTRICTION
        case subObject = 0x09

        /// CommentRestriction 0x0A Associates a comment with a subrestriction. RES_COMMENT
        case comment = 0x0A
        
        /// CountRestriction 0x0B Limits the number of matches returned from a subrestriction. RES_COUNT
        case count = 0x0B
    }
    
    /// [MS-OXCDATA] 2.12.1 And Restriction Structures
    /// The AndRestriction structure, as specified in section 2.12.1.1 describes an AND restriction (2), which is used to join a group of
    /// restrictions (2) using a logical AND operation.
    /// The AndRestriction_r structure, as specified in [MS-NSPI], is an encoding of the AndRestriction data structure. The permissible
    /// number of restriction structures in the AndRestriction_r data structure exceeds that for the AndRestriction structure. The semantic
    /// meaning is otherwise unchanged from the AndRestriction data structure.
    /// [MS-OXCDATA] 2.12.1.1 AndRestriction Structure
    /// The result of an AndRestriction is TRUE if all of its child restrictions (2) evaluate to TRUE, and it is FALSE if any child restriction (2)
    /// evaluates to FALSE.
    public struct AndRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x00.
        public let restrictType: RestrictType = .and
        
        public let restrictCount: UInt32
        public let restricts: [Restriction]
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RestrictCount (variable): This value specifies how many restriction structures are present in the Restricts field.
            /// The width of this field is 16 bits in the context of ROPs and 32 bits in the context of extended rules.
            self.restrictCount = try dataStream.readCOUNT(standard: standard)
            
            /// Restricts (variable): An array of restriction structures. This field MUST contain the number of
            /// structures indicated in the RestrictCount field.
            var restricts: [Restriction] = []
            restricts.reserveCapacity(Int(self.restrictCount))
            for _ in 0..<self.restrictCount {
                let restrict = try Restriction(dataStream: &dataStream, standard: standard)
                restricts.append(restrict)
            }

            self.restricts = restricts
        }
    }
    
    /// [MS-OXCDATA] 2.12.1 And Restriction Structures
    /// The AndRestriction structure, as specified in section 2.12.1.1 describes an AND restriction (2), which is used to join a group of
    /// restrictions (2) using a logical AND operation.
    /// The AndRestriction_r structure, as specified in [MS-NSPI], is an encoding of the AndRestriction data structure. The permissible
    /// number of restriction structures in the AndRestriction_r data structure exceeds that for the AndRestriction structure. The semantic
    /// meaning is otherwise unchanged from the AndRestriction data structure.
    /// [MS-OXCDATA] 2.12.1.2 AndRestriction_r Structure
    public struct AndRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x00.
        public let restrictType: RestrictType = .and
        
        public let restrictCount: UInt32
        public let restricts: [Restriction]
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RestrictCount (4 bytes): Encodes the RestrictCount field of the AndRestriction structure, as specified in section 2.12.1.1.
            /// This value MUST NOT exceed 100,000.
            self.restrictCount = try dataStream.read(endianess: .littleEndian)
            if self.restrictCount > 100000 {
                throw MAPIError.corrupted
            }
            
            /// Restricts (variable): Encodes the Restricts field of the AndRestriction structure. For more details, see section 2.12.1.
            var restricts: [Restriction] = []
            restricts.reserveCapacity(Int(self.restrictCount))
            for _ in 0..<self.restrictCount {
                let restrict = try Restriction(dataStream: &dataStream, standard: standard)
                restricts.append(restrict)
            }

            self.restricts = restricts
        }
    }
    
    /// [MS-OXCDATA] 2.12.2 Or Restriction Structures
    /// The OrRestriction structure, as specified in section 2.12.2.1, describes an OR restriction (2), which is used to join a group of
    /// restrictions (2) by using a logical OR operation.
    /// The OrRestriction_r structure, as specified in [MS-NSPI], is an encoding of the OrRestriction data structure. The permissible
    /// number of restriction structures in the OrRestriction_r data structure exceeds that of the OrRestriction structure. The semantic
    /// meaning is otherwise unchanged from the OrRestriction data structure.
    /// [MS-OXCDATA] 2.12.2.1 OrRestriction Structure
    /// The result of an OrRestriction is TRUE if at least one of its child restrictions (2) evaluates to TRUE, and it is FALSE if all child
    /// restrictions (2) evaluate to FALSE.
    public struct OrRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x01.
        public let restrictType: RestrictType = .or
        
        public let restrictCount: UInt32
        public let restricts: [Restriction]
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RestrictCount (variable): This value specifies how many restriction structures are present in the Restricts field.
            /// The width of this field is 16 bits in the context of ROPs and 32 bits in the context of extended rules.
            self.restrictCount = try dataStream.readCOUNT(standard: standard)
            
            /// Restricts (variable): An array of restriction structures. This field MUST contain the number of structures indicated by the
            /// RestrictCount field.
            var restricts: [Restriction] = []
            restricts.reserveCapacity(Int(self.restrictCount))
            for _ in 0..<self.restrictCount {
                let restrict = try Restriction(dataStream: &dataStream, standard: standard)
                restricts.append(restrict)
            }

            self.restricts = restricts
        }
    }
    /// [MS-OXCDATA] 2.12.2 Or Restriction Structures
    /// The OrRestriction structure, as specified in section 2.12.2.1, describes an OR restriction (2), which is used to join a group of
    /// restrictions (2) by using a logical OR operation.
    /// The OrRestriction_r structure, as specified in [MS-NSPI], is an encoding of the OrRestriction data structure. The permissible
    /// number of restriction structures in the OrRestriction_r data structure exceeds that of the OrRestriction structure. The semantic
    /// meaning is otherwise unchanged from the OrRestriction data structure.
    /// [MS-OXCDATA] 2.12.2.1 OrRestriction Structure
    /// The result of an OrRestriction is TRUE if at least one of its child restrictions (2) evaluates to TRUE, and it is FALSE if all child
    /// restrictions (2) evaluate to FALSE.
    public struct OrRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x01.
        public let restrictType: RestrictType = .or
        
        public let restrictCount: UInt32
        public let restricts: [Restriction]
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RestrictCount (4 bytes): This value encodes the RestrictCount field of the OrRestriction structure, as specified in section
            /// 2.12.2.1. This value MUST NOT exceed 100,000.
            self.restrictCount = try dataStream.read(endianess: .littleEndian)
            if self.restrictCount > 100000 {
                throw MAPIError.corrupted
            }
            
            /// Restricts (variable): This value encodes the Restricts field of the OrRestriction structure. For more details, see section 2.12.1.
            var restricts: [Restriction] = []
            restricts.reserveCapacity(Int(self.restrictCount))
            for _ in 0..<self.restrictCount {
                let restrict = try Restriction(dataStream: &dataStream, standard: standard)
                restricts.append(restrict)
            }

            self.restricts = restricts
        }
    }
    
    /// [MS-OXCDATA] 2.12.3 Not Restriction Structures
    /// The NotRestriction structure, as specified in section 2.12.3.1, describes a NOT restriction (2), which is used to apply a logical NOT
    /// operation to a single restriction (2).
    /// The NotRestriction_r structure, as specified in [MS-NSPI], is an encoding of the NotRestriction data structure. The semantic
    /// meaning is unchanged from the NotRestriction data structure.
    /// [MS-OXCDATA] 2.12.3.1 NotRestriction Structure
    /// The result of a NotRestriction structure is TRUE if the child restriction (2) evaluates to FALSE, and it is FALSE if the child restriction (2)
    /// evaluates to TRUE.
    public struct NotRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x02.
        public let restrictType: RestrictType = .not

        public let restriction: Restriction
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Restriction (variable): A restriction structure. This value specifies the restriction (2) that the logical NOT operation applies to.
            self.restriction = try Restriction(dataStream: &dataStream, standard: standard)
        }
    }

    /// [MS-OXCDATA] 2.12.3 Not Restriction Structures
    /// The NotRestriction structure, as specified in section 2.12.3.1, describes a NOT restriction (2), which is used to apply a logical NOT
    /// operation to a single restriction (2).
    /// The NotRestriction_r structure, as specified in [MS-NSPI], is an encoding of the NotRestriction data structure. The semantic
    /// meaning is unchanged from the NotRestriction data structure.
    /// [MS-OXCDATA] 2.12.3.2 NotRestriction_r Structure
    public struct NotRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x02.
        public let restrictType: RestrictType = .not

        public let restriction: Restriction
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Restriction (variable): This value encodes the Restriction field of the NotRestriction structure, as specified in section 2.12.3.1.
            self.restriction = try Restriction(dataStream: &dataStream, standard: standard)
        }
    }
    
    /// [MS-OXCDATA] 2.12.4 Content Restriction Structures
    /// The ContentRestriction structure, as specified in section 2.12.4.1, describes a content restriction, which is used to limit a table
    /// view to only those rows that include a column with contents matching a search string.
    /// The ContentRestriction_r structure, as specified in [MS-NSPI], is an encoding of the ContentRestriction data structure. The
    /// semantic meaning is unchanged from the ContentRestriction data structure.
    /// [MS-OXCDATA] 2.12.4.1 ContentRestriction Structure
    public struct ContentRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x03.
        public let restrictType: RestrictType = .content

        public let fuzzyLevelLow: FuzzyLevelLow
        public let fuzzyLevelHigh: FuzzyLevelHigh
        public let propertyTag: PropertyTag
        public let taggedValue: TaggedPropertyValue
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// FuzzyLevelLow (2 bytes): An unsigned integer. This field specifies the level of precision that the server enforces when
            /// checking for a match against a ContentRestriction structure. The value of the FuzzyLevelLow field applies to both
            /// binary and string properties and MUST be set to one of the values in the following table.
            let fuzzyLevelLowRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
            guard let fuzzyLevelLow = FuzzyLevelLow(rawValue: fuzzyLevelLowRaw) else {
                throw MAPIError.corrupted
            }
            
            self.fuzzyLevelLow = fuzzyLevelLow
            
            /// FuzzyLevelHigh (2 bytes): This field applies only to string-value properties and can be set to the bit values listed in the
            /// following table, in any combination. The values of the FuzzyLevelHigh field can be combined by using the bitwise
            /// OR operation.
            let fuzzyLevelHighRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
            self.fuzzyLevelHigh = FuzzyLevelHigh(rawValue: fuzzyLevelHighRaw)
            
            /// PropertyTag (4 bytes): An unsigned integer. This value indicates the property tag of the column whose value MUST
            /// be matched against the value specified in the TaggedValue field.
            self.propertyTag = try PropertyTag(dataStream: &dataStream)
            
            /// TaggedValue (variable): A TaggedPropertyValue structure, as specified in section 2.11.4. This
            /// structure contains the value to be matched.
            /// The property ID portion of the PropertyTag field in the TaggedValue field is ignored.
            /// The result of a content restriction (2) imposed against a property is undefined when the property
            /// does not exist. When a client requires well-defined behavior for such a restriction (2) and is not
            /// sure whether the property exists, the client can create an AndRestriction to join the
            /// ContentRestriction with an ExistRestriction.
            /// Multivalue properties (when the MultivalueFlag bit is set) are supported for this type of
            /// restriction (2), but the property types (obtained by masking off the MultivalueFlag bit) of both
            /// the PropertyTag field and the property tag subfield of the TaggedValue subfield MUST be the
            /// same in all cases.
            /// The cases supported for multivalue properties are described in the following table.
            /// PropertyTag value TaggedValue value Support Details
            /// Single-valued Single-valued All RelOp values are supported. Simple comparison.
            /// Single-valued Multivalued Not supported.
            /// Multivalued and the same as the MultivalueInstance column in the table Single-valued All RelOp values are supported.
            /// Each value of the property tag is compared with the value in the TaggedValue field. One successful match means that
            /// the restriction (2) is satisfied.
            /// Multivalued and the same as the MultivalueInstance column in the table Multivalued Not supported.
            /// Multivalued but not the same as the MultivalueInstance column in the table Single-valued All RelOp values are supported.
            /// Each value of the property tag is compared with the value in the TaggedValue field. One successful match means that the
            /// restriction (2) is satisfied.
            /// Multivalued but not the same as the MultivalueInstance column in the table Multivalued Not supported.
            self.taggedValue = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
        }
        
        /// FuzzyLevelLow (2 bytes): An unsigned integer. This field specifies the level of precision that the server enforces when
        /// checking for a match against a ContentRestriction structure. The value of the FuzzyLevelLow field applies to both
        /// binary and string properties and MUST be set to one of the values in the following table.
        public enum FuzzyLevelLow: UInt16 {
            /// 0x0000 FL_FULLSTRING The value stored in the TaggedValue field and the value of the column property tag match one
            /// another in their entirety.
            case fullstring = 0x0000
            
            /// 0x0001 FL_SUBSTRING The value stored in the TaggedValue field matches some portion of the value of the column
            /// property tag.
            case substring = 0x0001
            
            /// 0x0002 FL_PREFIX The value stored in the TaggedValue field matches a starting portion of the value of the column
            /// property tag.
            case prefix = 0x0002
        }
        
        /// FuzzyLevelHigh (2 bytes): This field applies only to string-value properties and can be set to the bit values listed in the
        /// following table, in any combination. The values of the FuzzyLevelHigh field can be combined by using the bitwise
        /// OR operation.
        public struct FuzzyLevelHigh: OptionSet {
            public let rawValue: UInt16
            
            public init(rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            /// 0x0001 FL_IGNORECASE The comparison does not consider case.
            public static let ignoreCase = FuzzyLevelHigh(rawValue: 0x0001)
            
            /// 0x0002 FL_IGNORENONSPACE The comparison ignores Unicode-defined nonspacing characters such as diacritical marks.
            public static let ignoreNonSpace = FuzzyLevelHigh(rawValue: 0x0002)
            
            /// 0x0004 FL_LOOSE The comparison results in a match whenever possible, ignoring case and nonspacing characters.
            public static let loose = FuzzyLevelHigh(rawValue: 0x0004)

            public static let all: FuzzyLevelHigh = [.ignoreCase, .ignoreNonSpace, .loose]
        }
    }
    
    /// [MS-OXCDATA] 2.12.4 Content Restriction Structures
    /// The ContentRestriction structure, as specified in section 2.12.4.1, describes a content restriction, which is used to limit a table
    /// view to only those rows that include a column with contents matching a search string.
    /// The ContentRestriction_r structure, as specified in [MS-NSPI], is an encoding of the ContentRestriction data structure. The
    /// semantic meaning is unchanged from the ContentRestriction data structure.
    /// [MS-OXCDATA] 2.12.4.2 ContentRestriction_r Structure
    public struct ContentRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x03.
        public let restrictType: RestrictType = .content

        public let fuzzyLevelLow: ContentRestriction.FuzzyLevelLow
        public let fuzzyLevelHigh: ContentRestriction.FuzzyLevelHigh
        public let propertyTag: PropertyTag
        public let taggedValue: TaggedPropertyValue
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// FuzzyLevelLow (2 bytes): This value encodes the FuzzyLevelLow field of the ContentRestriction structure, as specified
            /// in section 2.12.4.1.
            let fuzzyLevelLowRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
            guard let fuzzyLevelLow = ContentRestriction.FuzzyLevelLow(rawValue: fuzzyLevelLowRaw) else {
                throw MAPIError.corrupted
            }
            
            self.fuzzyLevelLow = fuzzyLevelLow
            
            /// FuzzyLevelHigh (2 bytes): This value encodes the FuzzyLevelHigh field of the ContentRestriction structure.
            let fuzzyLevelHighRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
            self.fuzzyLevelHigh = ContentRestriction.FuzzyLevelHigh(rawValue: fuzzyLevelHighRaw)
            
            /// PropertyTag (4 bytes): This value encodes the PropertyTag field of the ContentRestriction structure.
            self.propertyTag = try PropertyTag(dataStream: &dataStream)
            
            /// TaggedValue (variable): This value encodes the TaggedValue field of the ContentRestriction structure.
            self.taggedValue = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
        }
    }
    
    /// [MS-OXCDATA] 2.12.5 Property Restriction Structures
    /// The PropertyRestriction structure, as specified in section 2.12.5.1, describes a property restriction
    /// that is used to match a constant with the value of a property.
    /// The PropertyRestriction_r structure, as specified in [MS-NSPI], is an encoding of the
    /// PropertyRestriction data structure. The semantic meaning is unchanged from that of the
    /// PropertyRestriction data structure.
    /// [MS-OXCDATA] 2.12.5.1 PropertyRestriction Structure
    public struct PropertyRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x04.
        public let restrictType: RestrictType = .property

        public let relOp: RelationalOperator
        public let propTag: PropertyTag
        public let taggedValue: TaggedPropertyValue
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RelOp (1 byte): An unsigned integer. This value indicates the relational operator that is used to compare the property
            /// on the object with the value of the TaggedValue field. The value MUST be one of the values listed in the following table.
            let relOpRaw: UInt8 = try dataStream.read()
            guard let relOp = RelationalOperator(rawValue: relOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.relOp = relOp
            
            /// PropTag (4 bytes): An unsigned integer. This value indicates the property tag of the property that MUST be compared.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            
            /// TaggedValue (variable): A TaggedValue structure, as specified in section 2.11.4. This structure
            /// describes the property value to be compared with. The TaggedValue field contains a property tag
            /// subfield that is distinct from the PropTag field of this structure. Only the property type portion of
            /// the TaggedValue structure's property tag subfield is used; the property ID is ignored.
            self.taggedValue = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
        }
    }
    
    public enum RelationalOperator: UInt8 {
        /// RelationalOperatorLessThan 0x00 TRUE if the value of the object's property is less than the specified value. RELOP_LT
        case lessThan = 0x00
        
        /// RelationalOperatorLessThanOrEqual 0x01 TRUE if the value of the object's property is less than or equal to the specified
        /// value. RELOP_LE
        case lessThanOrEqual = 0x01
        
        /// RelationalOperatorGreaterThan 0x02 TRUE if the value of the object's property value is greater than the specified value.
        /// RELOP_GT
        case greaterThan = 0x02
        
        /// RelationalOperatorGreaterThanOrEqual 0x03 TRUE if the value of the object's property value is greater than or equal
        /// to the specified value. RELOP_GE
        case greaterThanOrEqualTo = 0x03
        
        /// RelationalOperatorEqual 0x04 TRUE if the object's property value equals the specified value. RELOP_EQ
        case equalTo = 0x04
        
        /// RelationalOperatorNotEqual 0x05 TRUE if the object's property value does not equal the specified value. RELOP_NE
        case notEqualTo = 0x05
        
        /// RelationalOperatorMemberOfDL 0x64 TRUE if the value of the object's property is in the DL membership of the specified
        /// property value. The value of the object's property MUST be an EntryID of a mail-enabled object in the address book.
        /// The specified property value MUST be an EntryID of a Distribution List object in the address book.
        /// RELOP_MEMBER_OF_DL
        case memberOfDistributionList = 0x64
    }
    
    /// [MS-OXCDATA] 2.12.5 Property Restriction Structures
    /// The PropertyRestriction structure, as specified in section 2.12.5.1, describes a property restriction
    /// that is used to match a constant with the value of a property.
    /// The PropertyRestriction_r structure, as specified in [MS-NSPI], is an encoding of the
    /// PropertyRestriction data structure. The semantic meaning is unchanged from that of the
    /// PropertyRestriction data structure.
    /// [MS-OXCDATA] 2.12.5.2 PropertyRestriction_r Structure
    public struct PropertyRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x04.
        public let restrictType: RestrictType = .property

        public let relOp: RelationalOperator
        public let propTag: PropertyTag
        public let taggedValue: TaggedPropertyValue
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Relop (1 byte): This value encodes the Relop field of the PropertyRestriction structure, as specified in section 2.12.5.1.
            let relOpRaw: UInt8 = try dataStream.read()
            guard let relOp = RelationalOperator(rawValue: relOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.relOp = relOp
            
            /// PropTag (4 bytes): This value encodes the PropTag field of the PropertyRestriction structure.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            
            /// TaggedValue (variable): This value encodes the TaggedValue field of the PropertyRestriction structure.
            self.taggedValue = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
        }
    }
    
    /// [MS-OXCDATA] 2.12.6 Compare Properties Restriction Structures
    /// The ComparePropertiesRestriction structure, as specified in section 2.12.6.1, specifies a comparison between the values of two
    /// properties by using a relational operator.
    /// The ComparePropsRestriction_r structure, as specified in [MS-NSPI], is an encoding of the ComparePropertiesRestriction data
    /// structure. The semantic meaning is unchanged from that of the ComparePropertiesRestriction data structure.
    /// [MS-OXCDATA] 2.12.6.1 ComparePropertiesRestriction Structure
    public struct ComparePropertiesRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x05.
        public let restrictType: RestrictType = .compareProperties

        public let relOp: RelationalOperator
        public let propTag1: PropertyTag
        public let propTag2: PropertyTag
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RelOp (1 byte): An unsigned integer. This value indicates the relational operator used to compare the two properties.
            /// The value MUST be one the values listed in the following table.
            let relOpRaw: UInt8 = try dataStream.read()
            guard let relOp = RelationalOperator(rawValue: relOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.relOp = relOp
            
            /// PropTag1 (4 bytes): An unsigned integer. This value is the property tag of the first property that MUST be compared.
            self.propTag1 = try PropertyTag(dataStream: &dataStream)
            
            /// PropTag2 (4 bytes): An unsigned integer. This value is the property tag of the second property that MUST be compared.
            /// The comparison order is (property tag 1) (relational operator) (property tag 2).
            /// The properties to be compared MUST both be of the same type.
            /// The result of a compare property value restriction (2) is undefined when one or both of the properties do not exist.
            /// When a client requires well-defined behavior for such a restriction (2) and is not sure whether the property exists
            /// (for example, it is not a required column in a table), the client can create an AndRestriction to join the compare
            /// property restriction with an Exist restriction.
            /// The properties specified by the PropTag1 and PropTag2 fields MUST be single-valued.
            /// Only Equal and NotEqual operators are allowed fields when the types of the PropTag1 and PropTag2 fields are PtypBoolean.
            self.propTag2 = try PropertyTag(dataStream: &dataStream)
        }
    }

    /// [MS-OXCDATA] 2.12.6 Compare Properties Restriction Structures
    /// The ComparePropertiesRestriction structure, as specified in section 2.12.6.1, specifies a comparison between the values of two
    /// properties by using a relational operator.
    /// The ComparePropsRestriction_r structure, as specified in [MS-NSPI], is an encoding of the ComparePropertiesRestriction data
    /// structure. The semantic meaning is unchanged from that of the ComparePropertiesRestriction data structure.
    /// [MS-OXCDATA] 2.12.6.2 ComparePropertiesRestriction_r Structure
    public struct ComparePropertiesRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x05.
        public let restrictType: RestrictType = .compareProperties

        public let relOp: RelationalOperator
        public let propTag1: PropertyTag
        public let propTag2: PropertyTag
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Relop (1 byte): This value encodes the Relop field of the ComparePropertiesRestriction structure, as specified in section 2.12.6.1.
            let relOpRaw: UInt8 = try dataStream.read()
            guard let relOp = RelationalOperator(rawValue: relOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.relOp = relOp
            
            /// PropTag1 (4 bytes): This value encodes the PropTag1 field of the ComparePropertiesRestriction structure.
            self.propTag1 = try PropertyTag(dataStream: &dataStream)
            
            /// PropTag2 (4 bytes): This value encodes the PropTag2 field of the ComparePropertiesRestriction structure.
            self.propTag2 = try PropertyTag(dataStream: &dataStream)
        }
    }
    
    /// [MS-OXCDATA] 2.12.7 Bitmask Restriction Structures
    /// The BitMaskRestriction structure, as specified in section 2.12.7.1, describes a bitmask restriction, which performs a bitwise
    /// AND operation and compares the result with 0 (zero).
    /// The BitMaskRestriction_r structure, as specified in [MS-NSPI], is an encoding of the BitMaskRestriction data structure. The
    /// semantic meaning is unchanged from that of the BitMaskRestriction data structure.
    /// [MS-OXCDATA] 2.12.7.1 BitMaskRestriction Structure
    /// The BitMaskRestriction structure performs a bitwise AND operation by using the bitmask from the Mask field and the value of
    /// the property PropTag field. If the result is 0 (zero), the BMR_EQZ operator is satisfied. If the result is not 0 (zero) — that is, if the
    /// property value has at least one of the same bits set as the Mask field — the BMR_NEZ operator is satisfied.
    public struct BitMaskRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x06.
        public let restrictType: RestrictType = .bitMask

        public let bitmapRelOp: BitmapRelationalOperator
        public let propTag: PropertyTag
        public let mask: UInt32
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// BitmapRelOp (1 byte): An unsigned integer. This value specifies how the server MUST perform the masking operation.
            /// The value MUST be one of the values listed in the following table.
            let bitmapRelOpRaw: UInt8 = try dataStream.read()
            guard let bitmapRelOp = BitmapRelationalOperator(rawValue: bitmapRelOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.bitmapRelOp = bitmapRelOp
            
            /// PropTag (4 bytes): An unsigned integer. This value is the property tag of the property to be tested.
            /// Its property type MUST be single-valued Int32, as specified in section 2.11.1.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            if self.propTag.type != .integer32 {
                throw MAPIError.corrupted
            }
            
            /// Mask (4 bytes): An unsigned integer. The bitmask to be used for the AND operation.
            self.mask = try dataStream.read(endianess: .littleEndian)
        }
        
        /// BitmapRelOp (1 byte): An unsigned integer. This value specifies how the server MUST perform the masking operation.
        /// The value MUST be one of the values listed in the following table.
        public enum BitmapRelationalOperator: UInt8 {
            /// BMR_EQZ 0x00 Perform a bitwise AND operation on the value of the Mask field with the value of the property
            /// PropTag field, and test for being equal to 0 (zero).
            case eqz = 0x00

            /// 1. BMR_NEZ 0x01 Perform a bitwise AND operation on the value of the Mask field with the value of the property
            /// PropTag field, and test for not being equal to 0 (zero).
            case nez = 0x01
        }
    }
    
    /// [MS-OXCDATA] 2.12.7 Bitmask Restriction Structures
    /// The BitMaskRestriction structure, as specified in section 2.12.7.1, describes a bitmask restriction, which performs a bitwise
    /// AND operation and compares the result with 0 (zero).
    /// The BitMaskRestriction_r structure, as specified in [MS-NSPI], is an encoding of the BitMaskRestriction data structure. The
    /// semantic meaning is unchanged from that of the BitMaskRestriction data structure.
    /// [MS-OXCDATA] 2.12.7.2 BitMaskRestriction_r Structure
    public struct BitMaskRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x06.
        public let restrictType: RestrictType = .bitMask

        public let bitmapRelOp: BitMaskRestriction.BitmapRelationalOperator
        public let propTag: PropertyTag
        public let mask: UInt32
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// BitmapRelOp (1 byte): This value encodes the BitmapRelop field of the BitMaskRestriction structure, as specified in section 2.12.7.1.
            let bitmapRelOpRaw: UInt8 = try dataStream.read()
            guard let bitmapRelOp = BitMaskRestriction.BitmapRelationalOperator(rawValue: bitmapRelOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.bitmapRelOp = bitmapRelOp
            
            /// PropTag (4 bytes): This value encodes the PropTag field of the BitMaskRestriction structure.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            if self.propTag.type != .integer32 {
                throw MAPIError.corrupted
            }
            
            /// Mask (4 bytes): This value encodes the Mask field of the BitMaskRestriction structure.
            self.mask = try dataStream.read(endianess: .littleEndian)
        }
    }
    
    /// [MS-OXCDATA] 2.12.8 Size Restriction Structures
    /// The SizeRestriction structure, as specified in section 2.12.8.1, describes a size restriction that compares the size (in bytes) of a
    /// property value with a specified size.
    /// The SizeRestriction_r structure, as specified in [MS-NSPI], is an encoding of the SizeRestriction data structure. The semantic
    /// meaning is unchanged from that of the SizeRestriction data structure.
    /// [MS-OXCDATA] 2.12.8.1 SizeRestriction Structure
    /// If the value of the PropTag field is multivalued, there are two cases. If it was specified as a MultivalueInstance column in the table,
    /// the size restriction is evaluated for each row by using the size of the single instance value of the row. If the value of the PropTag
    /// field was not specified as a MultivalueInstance column in the table, the size restriction is evaluated for each multivalue. If one of
    /// the size restrictions succeeds, the restriction (2) is satisfied.
    public struct SizeRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x07.
        public let restrictType: RestrictType = .size

        public let relOp: RelationalOperator
        public let propTag: PropertyTag
        public let size: UInt32
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// RelOp (1 byte): An unsigned integer. This value indicates the relational operator used in the size comparison.
            /// The value MUST be one the value listed in the following table.
            let relOpRaw: UInt8 = try dataStream.read()
            guard let relOp = RelationalOperator(rawValue: relOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.relOp = relOp
            
            /// PropTag (4 bytes): An unsigned integer. This value indicates the property tag of the property whose value size is being tested.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            
            /// Size (4 bytes): An unsigned integer. This value indicates the size, in bytes, that is to be used in the comparison.
            self.size = try dataStream.read(endianess: .littleEndian)
        }
    }
    
    /// [MS-OXCDATA] 2.12.8 Size Restriction Structures
    /// The SizeRestriction structure, as specified in section 2.12.8.1, describes a size restriction that compares the size (in bytes) of a
    /// property value with a specified size.
    /// The SizeRestriction_r structure, as specified in [MS-NSPI], is an encoding of the SizeRestriction data structure. The semantic
    /// meaning is unchanged from that of the SizeRestriction data structure.
    /// [MS-OXCDATA] 2.12.8.2 SizeRestriction_r Structure
    public struct SizeRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x07.
        public let restrictType: RestrictType = .size

        public let relOp: RelationalOperator
        public let propTag: PropertyTag
        public let size: UInt32
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Relop (1 byte): This value encodes the Relop field of the SizeRestriction structure, as specified in section 2.12.8.1.
            let relOpRaw: UInt8 = try dataStream.read()
            guard let relOp = RelationalOperator(rawValue: relOpRaw) else {
                throw MAPIError.corrupted
            }
            
            self.relOp = relOp
            
            /// PropTag (4 bytes): This value encodes the PropTag field of the SizeRestriction structure.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            
            /// Size (4 bytes): This value encodes the Size field of the SizeRestriction structure.
            self.size = try dataStream.read(endianess: .littleEndian)
        }
    }
    
    /// [MS-OXCDATA] 2.12.9 Exist Restriction Structures
    /// The ExistRestriction structure, as specified in section 2.12.9.1, tests whether a particular property value exists on a row in the table.
    /// The ExistRestriction_r structure, as specified in [MS-NSPI], is an encoding of the ExistRestriction data structure. The semantic
    /// meaning is unchanged from that of the ExistRestriction data structure.
    /// [MS-OXCDATA] 2.12.9.1 ExistRestriction Structure
    /// The ExistRestriction structure is used to guarantee meaningful results for other types of restrictions (2) that involve properties, such
    /// as property and content restrictions. The result of a restriction (2) that involves a property that does not exist on a row is undefined.
    /// By creating an AndRestriction structure that joins the property restriction with an ExistRestriction structure, a client can be guaranteed
    /// accurate results.
    public struct ExistRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x08.
        public let restrictType: RestrictType = .exist

        public let propTag: PropertyTag
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// PropTag (4 bytes): An unsigned integer. This value is the property tag of the column to be tested for existence in each row.
            self.propTag = try PropertyTag(dataStream: &dataStream)
        }
    }
    
    /// [MS-OXCDATA] 2.12.9 Exist Restriction Structures
    /// The ExistRestriction structure, as specified in section 2.12.9.1, tests whether a particular property value exists on a row in the table.
    /// The ExistRestriction_r structure, as specified in [MS-NSPI], is an encoding of the ExistRestriction data structure. The semantic
    /// meaning is unchanged from that of the ExistRestriction data structure.
    /// [MS-OXCDATA] 2.12.9.2 ExistRestriction_r Structure
    public struct ExistRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x08.
        public let restrictType: RestrictType = .exist

        public let reserved1: UInt32
        public let propTag: PropertyTag
        public let reserved2: UInt32
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Reserved1 (4 bytes): All clients and servers MUST set this value to 0x00000000.
            self.reserved1 = try dataStream.read(endianess: .littleEndian)
            if self.reserved1 != 0x00000000 {
                throw MAPIError.corrupted
            }
            
            /// PropTag (4 bytes): An unsigned integer. This value is the property tag of the column to be tested for existence in each row.
            self.propTag = try PropertyTag(dataStream: &dataStream)
            
            /// Reserved2 (4 bytes): All clients and servers MUST set this value to 0x00000000.
            self.reserved2 = try dataStream.read(endianess: .littleEndian)
            if self.reserved2 != 0x00000000 {
                throw MAPIError.corrupted
            }
        }
    }
    
    /// [MS-OXCDATA] 2.12.10 Subobject Restriction Structures
    /// The SubObjectRestriction structure, as specified in section 2.12.10.1, applies its subrestriction to a Message object's attachments
    /// table or recipient table. If any row of the subobject satisfies the subrestriction, the message satisfies the SubObjectRestriction
    /// structure.
    /// The SubRestriction_r structure, as specified in [MS-NSPI], is an encoding of the SubObjectRestriction data structure. The semantic
    /// meaning is unchanged from that of the SubObjectRestriction data structure.
    /// [MS-OXCDATA] 2.12.10.1 SubObjectRestriction Structure
    public struct SubObjectRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x09.
        public let restrictType: RestrictType = .subObject

        public let subobject: PropertyTag
        public let restriction: Restriction
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Subobject (4 bytes): An unsigned integer. This value is a property tag that designates the target of the subrestriction.
            /// Only the two values listed and described in the following table are supported.
            /// Value                                        | Meaning
            /// -----------------------------------------------------------------------------------------
            /// PidTagMessageRecipients ([MS-OXCMSG] section 2.2.1.47)  | Apply the subrestriction to a message's recipient table.
            /// PidTagMessageAttachments ([MS-OXPROPS] section 2.776) | Apply the subrestriction to a message's attachments table.
            let subobject = try PropertyTag(dataStream: &dataStream)
            if (subobject.id != PropertyId.tagMessageRecipients.rawValue && subobject.id == PropertyId.tagMessageAttachments.rawValue) ||
                subobject.type != .objectOrEmbeddedTable {
                throw MAPIError.corrupted
            }
            
            self.subobject = subobject
            
            /// Restriction (variable): A Restriction structure. This subrestriction is applied to the rows in the subobject.
            self.restriction = try Restriction(dataStream: &dataStream, standard: standard)
        }
    }
    
    /// [MS-OXCDATA] 2.12.10 Subobject Restriction Structures
    /// The SubObjectRestriction structure, as specified in section 2.12.10.1, applies its subrestriction to a Message object's attachments
    /// table or recipient table. If any row of the subobject satisfies the subrestriction, the message satisfies the SubObjectRestriction
    /// structure.
    /// The SubRestriction_r structure, as specified in [MS-NSPI], is an encoding of the SubObjectRestriction data structure. The semantic
    /// meaning is unchanged from that of the SubObjectRestriction data structure.
    /// [MS-OXCDATA] 2.12.10.2 SubObjectRestriction_r Structure
    public struct SubObjectRestriction_r: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x09.
        public let restrictType: RestrictType = .subObject

        public let subobject: PropertyTag
        public let restriction: Restriction
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Subobject (4 bytes): This value encodes the Subobject field of the SubObjectRestriction structure, as specified in section 2.12.10.1.
            let subobject = try PropertyTag(dataStream: &dataStream)
            if (subobject.id != PropertyId.tagMessageRecipients.rawValue && subobject.id == PropertyId.tagMessageAttachments.rawValue) ||
                subobject.type != .objectOrEmbeddedTable {
                throw MAPIError.corrupted
            }
            
            self.subobject = subobject
            
            /// Restriction (variable): This value encodes the Restriction field of the SubObjectRestriction structure.
            self.restriction = try Restriction(dataStream: &dataStream, standard: standard)
        }
    }
    
    /// [MS-OXCDATA] 2.12.11 CommentRestriction Structure
    /// Clients can use a CommentRestriction structure to save associated comments together with a restriction (2) that they pertain to.
    /// The comments are formatted as an arbitrary array of TaggedPropValue structures, and servers MUST store and retrieve this
    /// information for the client. If the Restriction field is present, servers MUST evaluate it; if it is not present, the CommentRestriction
    /// node will effectively evaluate as TRUE. In either case, the comments have no effect on the evaluation of the restriction (2).
    public struct CommentRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x0A.
        public let restrictType: RestrictType = .comment

        public let taggedValuesCount: UInt8
        public let taggedValues: [TaggedPropertyValue]
        public let restrictionPresent: UInt8
        public let restriction: Restriction?
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// TaggedValuesCount (1 byte): An unsigned integer. This value specifies how many TaggedValue structures are present in
            /// the TaggedValues field.
            self.taggedValuesCount = try dataStream.read()
            
            /// TaggedValues (variable): An array of TaggedPropertyValue structures, as specified in section 2.11.4. This field MUST
            /// contain the number of structures indicated by the value of the TaggedValuesCount field. The TaggedPropertyValue
            /// structures MUST NOT include any multivalue properties.
            var taggedValues: [TaggedPropertyValue] = []
            taggedValues.reserveCapacity(Int(self.taggedValuesCount))
            for _ in 0..<self.taggedValuesCount {
                let taggedValue = try TaggedPropertyValue(dataStream: &dataStream, standard: standard)
                if taggedValue.propertyTag.type.isMultiValued {
                    throw MAPIError.corrupted
                }

                taggedValues.append(taggedValue)
            }
            
            self.taggedValues = taggedValues
    
            /// RestrictionPresent (1 byte): An unsigned integer. This field MUST contain either TRUE (0x01) or FALSE (0x00). A TRUE
            /// value means that the Restriction field is present, whereas a FALSE value indicates that the Restriction field is not present.
            self.restrictionPresent = try dataStream.read()
            
            /// Restriction (optional) (variable): A Restriction structure. This field is present only if RestrictionPresent is TRUE.
            if self.restrictionPresent != 0x00 {
                self.restriction = try Restriction(dataStream: &dataStream, standard: standard)
            } else {
                self.restriction = nil
            }
        }
    }
    
    /// [MS-OXCDATA] 2.12.12 CountRestriction Structure
    public struct CountRestriction: RestrictionPacket {
        /// RestrictType (1 byte): An unsigned integer. This value indicates the type of restriction (2) and MUST be set to 0x0B.
        public let restrictType: RestrictType = .count

        public let count: UInt32
        public let subRestriction: Restriction
        
        public init(dataStream: inout DataStream, standard: Bool) throws {
            /// Count (4 bytes): An unsigned integer. This value specifies the limit on the number of matches to be returned when the
            /// value of the SubRestriction field is evaluated.
            self.count = try dataStream.read(endianess: .littleEndian)
            
            /// SubRestriction (variable): A restriction structure. This field specifies the restriction (2) to be limited.
            self.subRestriction = try Restriction(dataStream: &dataStream, standard: standard)
        }
    }
}

public protocol RestrictionPacket {
    var restrictType: Restriction.RestrictType { get }
}

fileprivate extension DataStream {
    mutating func readCOUNT(standard: Bool) throws -> UInt32 {
        if standard {
            return UInt32(try read(endianess: .littleEndian) as UInt16)
        } else {
            return try read(endianess: .littleEndian)
        }
    }
}
