//
//  AppointmentRecurrencePattern.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// [MS-OXOCAL] 2.2.1.44.5 AppointmentRecurrencePattern Structure
/// The AppointmentRecurrencePattern structure specifies a recurrence pattern for a Calendar object, including information about exception property values.
/// The fields of this structure are stored in little-endian byte order.
public struct AppointmentRecurrencePattern {
    public let recurrencePattern: RecurrencePattern
    public let readerVersion2: UInt32
    public let writerVersion2: UInt32
    public let startTimeOffset: UInt32
    public let endTimeOffset: UInt32
    public let exceptionCount: UInt16
    public let exceptionInfo: [ExceptionInfo]
    public let reservedBlock1Size: UInt32
    public let reservedBlock1: [UInt8]
    public let extendedException: [ExtendedException]
    public let reservedBlock2Size: UInt32
    public let reservedBlock2: [UInt8]
    
    public init(dataStream: inout DataStream) throws {
        /// RecurrencePattern (variable): This field is a RecurrencePattern structure, as specified in section 2.2.1.44.1,
        /// that defines the recurrences.
        self.recurrencePattern = try RecurrencePattern(dataStream: &dataStream)
        
        /// ReaderVersion2 (4 bytes): This value MUST be set to 0x00003006.
        self.readerVersion2 = try dataStream.read(endianess: .littleEndian)
        if self.readerVersion2 != 0x00003006 {
            throw MAPIError.corrupted
        }
        
        /// WriterVersion2 (4 bytes): This value SHOULD<16> be set to 0x00003009 but can be set to
        /// 0x00003008. The value of this field affects the format of the ExtendedException field, as
        /// specified in section 2.2.1.44.4.
        let writerVersion2: UInt32 = try dataStream.read(endianess: .littleEndian)
        if writerVersion2 != 0x00003009 && writerVersion2 != 0x00003008 {
            throw MAPIError.corrupted
        }
        
        self.writerVersion2 = writerVersion2
        
        /// StartTimeOffset (4 bytes): The number of minutes, since midnight, after which each occurrence
        /// starts. For example, the value for midnight is 0 (zero) and the value for 12:00 P.M. is 720.
        self.startTimeOffset = try dataStream.read(endianess: .littleEndian)
        
        /// EndTimeOffset (4 bytes): The number of minutes, since midnight, after which each occurrence
        /// ends. For example, the value for midnight is 0 (zero) and the value for 12:00 P.M. is 720.
        self.endTimeOffset = try dataStream.read(endianess: .littleEndian)

        /// ExceptionCount (2 bytes): An integer that specifies the number of ExceptionInfo structures
        /// contained in the ExceptionInfo field and the number of ExtendedException structures
        /// contained in the ExtendedException field. The value of this field MUST be the same as the value
        /// of the ModifiedInstanceCount field in the associated ReccurencePattern structure, as
        /// specified in section 2.2.1.44.1.
        self.exceptionCount = try dataStream.read(endianess: .littleEndian)
        if self.exceptionCount != self.recurrencePattern.modifiedInstanceCount {
            throw MAPIError.corrupted
        }
        
        /// ExceptionInfo (variable): An array of ExceptionInfo structures. The number of structures in this
        /// field is specified by the ExceptionCount field. For details about the ExceptionInfo structure, see
        /// section 2.2.1.44.2.
        var exceptionInfo: [ExceptionInfo] = []
        exceptionInfo.reserveCapacity(Int(self.exceptionCount))
        for _ in 0..<self.exceptionCount {
            let info = try ExceptionInfo(dataStream: &dataStream)
            exceptionInfo.append(info)
        }
        
        self.exceptionInfo = exceptionInfo
        
        /// ReservedBlock1Size (4 bytes): The size, in bytes, of the ReservedBlock1 field. MUST be zero.
        self.reservedBlock1Size = try dataStream.read(endianess: .littleEndian)
        if self.reservedBlock1Size != 0x00000000 {
            throw MAPIError.corrupted
        }

        /// ReservedBlock1 (variable): This field is reserved and MUST be zero-length.
        self.reservedBlock1 = try dataStream.readBytes(count: Int(self.reservedBlock1Size))
        
        /// ExtendedException (variable): An array of ExtendedException structures. The number of
        /// structures in this field is specified by the ExceptionCount field. For details about the
        /// ExtendedException structure, see section 2.2.1.44.4.
        var extendedException: [ExtendedException] = []
        extendedException.reserveCapacity(Int(self.exceptionCount))
        for i in 0..<self.exceptionCount {
            let exception = try ExtendedException(dataStream: &dataStream, writerVersion: self.writerVersion2, overrideFlags: exceptionInfo[Int(i)].overrideFlags)
            extendedException.append(exception)
        }
        
        self.extendedException = extendedException
        
        /// ReservedBlock2Size (4 bytes): The size, in bytes, of the ReservedBlock2 field. MUST be zero..
        self.reservedBlock2Size = try dataStream.read(endianess: .littleEndian)
        if self.reservedBlock2Size != 0x00000000 {
            throw MAPIError.corrupted
        }

        /// ReservedBlock2 (variable): This field is reserved and MUST be zero-length.
        self.reservedBlock2 = try dataStream.readBytes(count: Int(self.reservedBlock2Size))
        
        assert(dataStream.remainingCount == 0)
    }
}
