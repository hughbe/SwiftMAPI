//
//  AppointmentTimeZoneDefinitionRecur .swift
//  
//
//  Created by Hugh Bellamy on 17/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.1.41 PidLidAppointmentTimeZoneDefinitionRecur Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidLidAppointmentTimeZoneDefinitionRecur property ([MS-OXPROPS] section 2.33) contains time zone information
/// that specifies how to convert the meeting date and time on a recurring series to and from UTC.
/// The PidLidAppointmentTimeZoneDefinitionRecur property contains one TZRule structure, as specified in section 2.2.1.41.1, that
/// is marked with the TZRULE_FLAG_EFFECTIVE_TZREG flag, which specifies the effective time zone rule.
/// If the effective TZRule structure's lBias, lStandardBias, lDaylightBias, stStandardDate, and stDaylightDate fields are not equal
/// to the corresponding fields in the PidLidTimeZoneStruct property (section 2.2.1.39), the PidLidAppointmentTimeZoneDefinitionRecur
/// and PidLidTimeZoneStruct properties are considered inconsistent. If the PidLidAppointmentTimeZoneDefinitionRecur property is not
/// set or is inconsistent with the associated PidLidTimeZoneStruct structure, the values in the PidLidTimeZoneStruct property are
/// used to determine the effective time zone rule.<10>
/// The fields in this structure are encoded in little-endian byte order.
public struct AppointmentTimeZoneDefinition {
    public let majorVersion: UInt8
    public let minorVersion: UInt8
    public let cbHeader: UInt16
    public let reserved: UInt16
    public let cchKeyName: UInt16
    public let keyName: String
    public let cRules: UInt16
    public let rules: [TZRule]

    public init(dataStream: inout DataStream) throws {
        /// Major Version (1 byte): This field is set to 0x02.
        self.majorVersion = try dataStream.read()
        if self.majorVersion != 0x02 {
            throw MAPIError.corrupted
        }
        
        /// Minor Version (1 byte): This field is set to 0x01.
        self.minorVersion = try dataStream.read()
        if self.minorVersion != 0x01 {
            throw MAPIError.corrupted
        }

        /// cbHeader (2 bytes): An integer that specifies the number of bytes contained in the Reserved, cchKeyName,
        /// KeyName, and cRules fields.
        self.cbHeader = try dataStream.read(endianess: .littleEndian)
        
        /// Reserved (2 bytes): This field MUST be set to 0x0002.
        self.reserved = try dataStream.read(endianess: .littleEndian)
        if self.reserved != 0x0002 {
            throw MAPIError.corrupted
        }

        /// cchKeyName (2 bytes): An integer that specifies the number of characters in the KeyName field.
        self.cchKeyName = try dataStream.read(endianess: .littleEndian)

        /// KeyName (variable): A Unicode string that identifies the associated time zone. The string is not
        /// localized but instead is set to the unique name of the desired time zone. This string has a
        /// maximum length of 260 characters, and it is not null-terminated.
        self.keyName = try dataStream.readString(count: Int(self.cchKeyName) * 2, encoding: .utf16LittleEndian)!
        
        /// cRules (2 bytes): An integer that specifies the number of TZRule structures in the TZRules field.
        /// The minimum is 1; the maximum is 1024.
        let cRules: UInt16 = try dataStream.read(endianess: .littleEndian)
        if cRules < 1 || cRules > 1024 {
            throw MAPIError.corrupted
        }
        
        self.cRules = cRules
        
        /// TZRules (variable): An array of TZRule structures as specified in section 2.2.1.41.1. Each TZRule
        /// structure contains information that specifies a time zone, including the time zone's offset from
        /// UTC and when and how it observes daylight saving time. If more than one time zone rule (2) is
        /// specified, rules (2) are sorted in ascending order by the wYear field. The TZRule structures are
        /// not aligned to 32-bit boundaries. Each TZRule structure starts at the next byte after the previous
        /// TZRule structure ends. For details on the TZRule structure, see section 2.2.1.41.1 (represented
        /// in little-endian byte order).
        var rules: [TZRule] = []
        rules.reserveCapacity(Int(self.cRules))
        for _ in 0..<self.cRules {
            let rule = try TZRule(dataStream: &dataStream)
            rules.append(rule)
        }
        
        self.rules = rules
        
        assert(dataStream.remainingCount == 0)
    }
}
