//
//  VoteOption.swift
//  
//
//  Created by Hugh Bellamy on 16/10/2020.
//

import DataStream

/// [MS-OXOMSG] 2.2.1.74.1 VoteOption Structure
/// The verb stream contains two parallel arrays of VoteOption and VoteOptionExtra structures. Each element in these two arrays,
/// when combined, describes a single voting option that can be taken by the user in response to the message. The format of the
/// VoteOption structure is shown in the following diagram.
/// Note that because the DisplayNameCount field (and the DisplayNameCountRepeat field) is 1 byte
/// long and contains the COUNT of characters in the DisplayName field (and the DisplayNameRepeat
/// field), this implies a length limit of 255 characters in the DisplayName field of any voting option.
public struct VoteOption {
    public let verbType: UInt32
    public let displayNameCount: UInt8
    public let displayName: String
    public let msgClsNameCount: UInt8
    public let msgClsName: String
    public let internal1StringCount: UInt8
    public let internal1String: String
    public let displayNameCountRepeat: UInt8
    public let displayNameRepeat: String
    public let internal2: UInt32
    public let internal3: UInt8
    public let fUseUSHeaders: Bool
    public let internal4: UInt32
    public let sendBehavior: VoteOptionSendBehavior
    public let internal5: UInt32
    public let id: UInt16
    public let internal6: UInt32

    public init(dataStream: inout DataStream) throws {
        /// VerbType (DWORD): The verb used by this structure. Set to 4 (0x00000004).
        self.verbType = try dataStream.read(endianess: .littleEndian)
        
        /// DisplayNameCount (1 byte): The count of characters in the DisplayName field.
        self.displayNameCount = try dataStream.read()
        
        /// DisplayName (variable): The localized display name of the voting option (for example, "Yes") as
        /// an ANSI string, without the null terminating character.
        self.displayName = try dataStream.readString(count: Int(self.displayNameCount), encoding: .ascii)!
        
        /// MsgClsNameCount (1 byte): The count of characters in the MsgClsName field. Set to 8 (0x08).
        self.msgClsNameCount = try dataStream.read()
        if self.msgClsNameCount != 0x08 {
            throw MAPIError.corrupted
        }
        
        /// MsgClsName (variable): Set to "IPM.Note", without the null terminating character.
        self.msgClsName = try dataStream.readString(count: Int(self.msgClsNameCount), encoding: .ascii)!
        
        /// Internal1StringCount (1 byte): The count of characters in the following string. Set to 0x00 for voting options.
        self.internal1StringCount = try dataStream.read()
        
        /// Internal1String (variable): MUST NOT be present, as Internal1StringCount is 0x00 for a voting option.
        self.internal1String = try dataStream.readString(count: Int(self.internal1StringCount), encoding: .ascii)!
        
        /// DisplayNameCountRepeat (1 byte): MUST have the same value as the DisplayNameCount field.
        self.displayNameCountRepeat = try dataStream.read()
        
        /// DisplayNameRepeat (variable): MUST have the same value as the DisplayName field.
        self.displayNameRepeat = try dataStream.readString(count: Int(self.displayNameCountRepeat), encoding: .ascii)!
        
        /// Internal2 (DWORD): Set to 0x00000000.
        self.internal2 = try dataStream.read(endianess: .littleEndian)
        
        /// Internal3 (1 byte): Set to 0x00.
        self.internal3 = try dataStream.read()
        if self.internal3 != 0x00 {
            throw MAPIError.corrupted
        }
        
        /// fUseUSHeaders (DWORD): Indicates that a U.S. style reply header is to be used in the response
        /// message (as opposed to a localized response header). The value is set to either 0x00000001,
        /// using U.S. style reply header, or 0x00000000 otherwise.
        self.fUseUSHeaders = (try dataStream.read(endianess: .littleEndian) as UInt32) != 0x00000000
        
        /// Internal4 (DWORD): Set to 0x00000001.
        self.internal4 = try dataStream.read(endianess: .littleEndian)
        if self.internal4 != 0x00000001 {
            throw MAPIError.corrupted
        }
        
        /// SendBehavior (DWORD): Indicates the behavior on send. When a user chooses a voting option,
        /// SendBehavior specifies whether the user is to be prompted to edit the response mail or whether
        /// the client automatically sends it on behalf of the user. The value of this field is one of the values
        /// defined in the following table.
        let sendBehaviorRaw: UInt32 = try dataStream.read(endianess: .littleEndian)
        guard let sendBehavior = VoteOptionSendBehavior(rawValue: sendBehaviorRaw) else {
            throw MAPIError.corrupted
        }
        
        self.sendBehavior = sendBehavior
        
        /// Internal5 (DWORD): Set to 0x00000002.
        self.internal5 = try dataStream.read(endianess: .littleEndian)
        if self.internal5 != 0x00000002 {
            throw MAPIError.corrupted
        }
        
        /// ID (DWORD): Specifies a numeric identifier for this voting option. The client SHOULD specify 1 for
        /// the first VoteOption structure and monotonically increase this value for each subsequent
        /// VoteOption structure.
        self.id = try dataStream.read(endianess: .littleEndian)
        
        /// Internal6 (DWORD): Set to "-1" (0xFFFFFFFF).
        self.internal6 = try dataStream.read(endianess: .littleEndian)
    }
}
