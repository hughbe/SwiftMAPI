//
//  ExtendedException.swift
//
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream
import Foundation

/// [MS-OXOCAL] 2.2.1.44.4 ExtendedException Structure
/// There is one ExtendedException structure per ExceptionInfo structure, as specified in section 2.2.1.44.2, and each one
/// MUST be in the same order as its corresponding ExceptionInfo structure.
public struct ExtendedException {
    public let changeHighlight: ChangeHighlightStructure?
    public let reservedBlockEE1Size: UInt32
    public let reservedBlockEE1: [UInt8]
    public let startDateTime: Date?
    public let endDateTime: Date?
    public let originalStartDate: Date?
    public let wideCharSubjectLength: UInt16?
    public let wideCharSubject: String?
    public let wideCharLocationLength: UInt16?
    public let wideCharLocation: String?
    public let reservedBlockEE2Size: UInt32?
    public let reservedBlockEE2: [UInt8]?
    
    public init(dataStream: inout DataStream, writerVersion: UInt32, overrideFlags: ExceptionInfo.OverrideFlags) throws {
        /// ChangeHighlight* (variable): The value of the PidLidChangeHighlight property (section 2.2.6.2)
        /// in the Exception object. *This field is present only when the WriterVersion2 field in the
        /// associated AppointmentRecurrencePattern structure specified in section 2.2.1.44.5 is greater
        /// than or equal to 0x00003009.
        if writerVersion >= 0x00003009 {
            self.changeHighlight = try ChangeHighlightStructure(dataStream: &dataStream)
        } else {
            self.changeHighlight = nil
        }
        
        /// ReservedBlockEE1Size (4 bytes): The size of the ReservedBlockEE1 field. This field MUST be set
        /// to zero.
        self.reservedBlockEE1Size = try dataStream.read(endianess: .littleEndian)
        if self.reservedBlockEE1Size != 0x00000000 {
            throw MAPIError.corrupted
        }
        
        /// ReservedBlockEE1 (variable): This field is reserved.
        self.reservedBlockEE1 = try dataStream.readBytes(count: Int(self.reservedBlockEE1Size))

        /// StartDateTime* (4 bytes): The start time of the exception in local time in minutes since midnight,
        /// January 1, 1601. *This field is present only when the ARO_SUBJECT flag or the
        /// ARO_LOCATION flag is set in the OverrideFlags field of the ExtendedException structure's
        /// associated ExceptionInfo structure. For details, see the description of the OverrideFlags field in
        /// section 2.2.1.44.2.
        if overrideFlags.contains(.subject) || overrideFlags.contains(.location) {
            self.startDateTime = Date(minutesSince1601: try dataStream.read(endianess: .littleEndian))
        } else {
            self.startDateTime = nil
        }
        
        /// EndDateTime* (4 bytes): The end time of the exception in local time in minutes since midnight,
        /// January 1, 1601. *This field is present only when the ARO_SUBJECT flag or the
        /// ARO_LOCATION flag is set in the OverrideFlags field of the ExtendedException structure's
        /// associated ExceptionInfo structure. For details, see the description of the OverrideFlags field in
        /// section 2.2.1.44.2.
        if overrideFlags.contains(.subject) || overrideFlags.contains(.location) {
            self.endDateTime = Date(minutesSince1601: try dataStream.read(endianess: .littleEndian))
        } else {
            self.endDateTime = nil
        }
        
        /// OriginalStartDate* (4 bytes): The original start date of the exception in local time in minutes since
        /// midnight, January 1, 1601. *This field is present only when the ARO_SUBJECT flag or the
        /// ARO_LOCATION flag is set in the OverrideFlags field of the ExtendedException structure's
        /// associated ExceptionInfo structure. For details, see the description of the OverrideFlags field in
        /// section 2.2.1.44.2.
        if overrideFlags.contains(.subject) || overrideFlags.contains(.location) {
            self.originalStartDate = Date(minutesSince1601: try dataStream.read(endianess: .littleEndian))
        } else {
            self.originalStartDate = nil
        }
        
        /// WideCharSubjectLength* (2 bytes): The count of Unicode characters in the WideCharSubject
        /// field. *This field is present only when the ARO_SUBJECT flag is set in the OverrideFlags field of
        /// the ExtendedException structure's associated ExceptionInfo structure. For details, see the
        /// description of the OverrideFlags field in section 2.2.1.44.2.
        if overrideFlags.contains(.subject) {
            self.wideCharSubjectLength = try dataStream.read(endianess: .littleEndian)
        } else {
            self.wideCharSubjectLength = nil
        }
        
        /// WideCharSubject* (variable): The Unicode string value for the exception's
        /// PidTagNormalizedSubject property ([MS-OXCMSG] section 2.2.1.10). Note that the
        /// WideCharSubject field is not null-terminated. *This field is present only when the
        /// ARO_SUBJECT flag is set in the OverrideFlags field of the ExtendedException structure's
        /// associated ExceptionInfo structure. For details, see the description of the OverrideFlags field in
        /// section 2.2.1.44.2.
        if overrideFlags.contains(.subject) {
            self.wideCharSubject = try dataStream.readString(count: Int(self.wideCharSubjectLength!), encoding: .utf16LittleEndian)
        } else {
            self.wideCharSubject = nil
        }
        
        /// WideCharLocationLength* (2 bytes): The number of Unicode characters in the
        /// WideCharLocation field. *This field is present only when the ARO_LOCATION flag is set in the
        /// OverrideFlags field of the ExtendedException structure's associated ExceptionInfo structure.
        /// For details, see the description of the OverrideFlags field in section 2.2.1.44.2.
        if overrideFlags.contains(.subject) {
            self.wideCharLocationLength = try dataStream.read(endianess: .littleEndian)
        } else {
            self.wideCharLocationLength = nil
        }
        
        /// WideCharLocation* (variable): The Unicode string value for the PidLidLocation property (section
        /// 2.2.1.4) in the Exception Embedded Message object. Note that the WideCharLocation field is
        /// not null-terminated. *This field is present only when the ARO_LOCATION flag is set in the
        /// OverrideFlags field of the ExtendedException structure's associated ExceptionInfo structure.
        /// For details, see the description of the OverrideFlags field in section 2.2.1.44.2.
        if overrideFlags.contains(.location) {
            self.wideCharLocation = try dataStream.readString(count: Int(self.wideCharLocationLength!), encoding: .utf16LittleEndian)
        } else {
            self.wideCharLocation = nil
        }
        
        /// ReservedBlockEE2Size (4 bytes): The size of the ReservedBlockEE2 field that follows. *This field
        /// is present only when the ARO_SUBJECT flag or the ARO_LOCATION flag is set in the
        /// OverrideFlags field of the ExtendedException structure's associated ExceptionInfo structure.
        /// For details, see the description of the OverrideFlags field in section 2.2.1.44.2.
        if overrideFlags.contains(.subject) || overrideFlags.contains(.location) {
            self.reservedBlockEE2Size = try dataStream.read(endianess: .littleEndian)
            if self.reservedBlockEE2Size != 0x00000000 {
                throw MAPIError.corrupted
            }
        } else {
            self.reservedBlockEE2Size = nil
        }
        
        /// ReservedBlockEE2 (variable): Reserved. This field MUST NOT be read from or written to. *This
        /// field is present only when the ARO_SUBJECT flag or the ARO_LOCATION flag is set in the
        /// OverrideFlags field of the ExtendedException structure's associated ExceptionInfo structure.
        /// For details, see the description of the OverrideFlags field in section 2.2.1.44.2.
        if overrideFlags.contains(.subject) || overrideFlags.contains(.location) {
            self.reservedBlockEE2 = try dataStream.readBytes(count: Int(self.reservedBlockEE2Size!))
        } else {
            self.reservedBlockEE2 = nil
        }
    }
}
