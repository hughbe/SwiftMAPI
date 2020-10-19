//
//  FolderFlags.swift
//  
//
//  Created by Hugh Bellamy on 18/10/2020.
//

import DataStream

/// 2.2.7 Folder Flags
/// Folder flags consist of a collection of small properties packed into a single binary property on a folder. The primary purpose of the folder flags is to store Boolean flags that
/// affect the folder's display options. The folder flags can also be used to store additional properties, such as a unique identifier for the folder that can be used to associate it
/// with a specific feature or with a description of that folder that has been saved elsewhere.
/// The PidTagExtendedFolderFlags property ([MS-OXOSRCH] section 2.2.2.1.2) can be set on a folder. If the property is set, the value of this property MUST be a binary stream
/// that contains encoded subproperties for the folder. The format of the binary stream MUST be as follows.
/// The binary stream is divided into variable-length subproperty fields. The subproperty fields are bytealigned within the binary stream. Each subproperty MUST be encoded as
/// specified in section 2.2.7.1.
public struct ExtendedFolderFlags {
    public let subProperties: [SubProperty]
    
    public init(dataStream: inout DataStream) throws {
        var subProperties: [SubProperty] = []
        while dataStream.remainingCount > 0 {
            let subProperty = try SubProperty(dataStream: &dataStream)
            subProperties.append(subProperty)
        }
        
        self.subProperties = subProperties
    }
    
    /// [MS-OXOCFG] 2.2.7.1 Sub-property
    /// The sub-property fields for folder flags specified in section 2.2.7.1 have the following format.
    public struct SubProperty {
        public let id: UInt8
        public let cb: UInt8
        public let data: [UInt8]
        
        public init(dataStream: inout DataStream) throws {
            /// Id (1 byte): The subproperty ID value. The value of this field SHOULD be one of the following. All other values of the Id field are reserved and MUST be ignored by the
            /// application. If the application needs to rewrite the PidTagExtendedFolderFlags property ([MS-OXOSRCH] section 2.2.2.1.2) with different values for the subproperties
            /// that it does understand, it MUST preserve the values of any subproperties that it did not understand. Each valid subproperty ID MUST appear 0 to 1 times
            /// in the PidTagExtendedFolderFlags property. The subproperties can appear in any order within the PidTagExtendedFolderFlags property stream.
            /// Flag name Value Data format
            /// Invalid 0x00 As specified in section 2.2.7.1.1.
            /// ExtendedFlags 0x01 As specified in section 2.2.7.1.2.
            /// SearchFolderID 0x02 As specified in section 2.2.7.1.3.
            /// SearchFolderTag 0x03 As specified in [MS-OXOSRCH].
            /// Reserved 0x04 N/A
            /// ToDoFolderVersion 0x05 As specified in section 2.2.7.1.4.
            /// Reserved 0x06 N/A
            self.id = try dataStream.read()
            
            /// Cb (1 byte): This field specifies the unsigned size, in bytes, of the Data field of the subproperty.
            self.cb = try dataStream.read()
            
            /// Data (variable): This field contains the value of the subproperty. This field MUST be a variablelength buffer. Because the size is specified in a single unsigned byte in
            /// the Cb field, the minimum size of the buffer is 0 bytes and the maximum size is 255 bytes. The interpretation of this field is specified in the table earlier in this section.
            self.data = try dataStream.readBytes(count: Int(self.cb))
        }
    }
}
