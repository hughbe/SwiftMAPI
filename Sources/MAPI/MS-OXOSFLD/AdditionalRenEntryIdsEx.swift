//
//  AdditionalRenEntryIdsEx.swift
//  
//
//  Created by Hugh Bellamy on 30/10/2020.
//

import DataStream

/// [MS-OXOSFLD] 2.2.5 PidTagAdditionalRenEntryIdsEx Property
/// Type: PtypBinary ([MS-OXCDATA] section 2.11.1)
/// The PidTagAdditionalRenEntryIdsEx property ([MS-OXPROPS] section 2.504) of the Store object specifies the identifiers of several special
/// folders. If this property is present, its value is an array of PersistData structures (section 2.2.5.1), each of which pertains to a particular special
/// folder. The last PersistData structure in the array is indicated either by the PERSIST_SENTINEL value in the PersistID field of the PersistData
/// structure or by the end of the data stream.
public struct AdditionalRenEntryIdsEx {
    public let persistData: [PersistData]
    
    public init(dataStream: inout DataStream, size: Int) throws {
        let position = dataStream.position
        var persistData: [PersistData] = []
        while dataStream.position - position < size {
            let persistDataValue = try PersistData(dataStream: &dataStream)
            persistData.append(persistDataValue)
            if persistDataValue.persistID == .sentinel {
                break
            }
        }
        
        self.persistData = persistData
    }
    
    /// [MS-OXOSFLD] 2.2.5.1 PersistData Structure
    /// The PersistData structure contains the entry ID of a special folder and other data related to a special folder. The PersistData structure
    /// has the following format.
    public struct PersistData {
        public let persistID: PersistID
        public let dataElementsSize: UInt16
        public let dataElements: [PersistElement]
        
        public init(dataStream: inout DataStream) throws {
            /// PersistID (2 bytes): An integer that identifies the type of special folder to which the PersistData structure pertains.
            /// The value of the PersistID field SHOULD<2> be one of those listed in the following table. If a PersistData structure is
            /// encountered where the value of the PersistID field is not known to the implementation, the implementation MUST ignore
            /// that PersistData structure.
            let persistIDRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
            if let persistID = PersistID(rawValue: persistIDRaw) {
                self.persistID = persistID
            } else {
                self.persistID = .unknown
            }
            
            /// DataElementsSize (2 bytes): The size, in bytes, of the DataElements field.
            self.dataElementsSize = try dataStream.read(endianess: .littleEndian)
            
            /// DataElements (variable): An array of PersistElement structures (section 2.2.5.2), each of which contains the data about the
            /// special folder. The last PersistElement structure in the array is indicated either by the ELEMENT_SENTINEL value in the
            /// ElementID field of the PersistElement structure or by the end of the data stream.
            let position = dataStream.position
            var dataElements: [PersistElement] = []
            while dataStream.position - position < Int(self.dataElementsSize) {
                let dataElement = try PersistElement(dataStream: &dataStream)
                dataElements.append(dataElement)
                if dataElement.elementID == .sentinel {
                    break
                }
            }
            
            self.dataElements = dataElements
        }
        
        /// PersistID (2 bytes): An integer that identifies the type of special folder to which the PersistData structure pertains.
        /// The value of the PersistID field SHOULD<2> be one of those listed in the following table. If a PersistData structure is
        /// encountered where the value of the PersistID field is not known to the implementation, the implementation MUST ignore
        /// that PersistData structure.
        public enum PersistID: UInt16 {
            /// RSF_PID_RSS_SUBSCRIPTION 0x8001 Indicates that the structure contains data for the RSS Feeds folder.
            case rssSubscription = 0x8001

            /// RSF_PID_SEND_AND_TRACK 0x8002 Indicates that the structure contains data for the Tracked Mail Processing folder.
            case sendAndTrack = 0x8002

            /// RSF_PID_TODO_SEARCH 0x8004 Indicates that the structure contains data for the To-Do folder.
            case todoSearch = 0x8004

            /// RSF_PID_CONV_ACTIONS 0x8006 Indicates that the structure contains data for the Conversation Action Settings folder.
            case convActions = 0x8006

            /// RSF_PID_COMBINED_ACTIONS 0x8007 This value is reserved.
            case combinedActions = 0x8007

            /// RSF_PID_SUGGESTED_CONTACTS 0x8008 Indicates that the structure contains data for the Suggested Contacts folder.
            case suggestedContacts = 0x8008

            /// RSF_PID_CONTACT_SEARCH 0x8009 Indicates that the structure contains data for the Contacts Search folder.
            case contactSearch = 0x8009

            /// RSF_PID_BUDDYLIST_PDLS 0x800A Indicates that the structure contains data for the IM Contacts List folder.
            case buddylistPdls = 0x800A

            /// RSF_PID_BUDDYLIST_CONTACTS 0x800B Indicates that the structure contains data for the Quick Contacts folder.
            case buddylistContacts = 0x800B

            /// PERSIST_SENTINEL 0x0000 Indicates that the PersistData structure is the last one contained in the PidTagAdditionalRenEntryIdsEx
            /// property (section 2.2.5). The PERSIST_SENTINEL is optional; if it is not included, processing continues to the end
            /// of the data stream.
            case sentinel = 0x0000
            
            case unknown = 0xFFFF
        }
    }
    
    /// [MS-OXOSFLD] 2.2.5.2 PersistElement Structure
    /// The PersistElement structure contains either the entry ID of the special folder or other data related to the special folder. The PersistElement
    /// structure has the following format.
    public struct PersistElement {
        public let elementID: ElementID
        public let elementDataSize: UInt16
        public let elementData: Any?
        
        public init(dataStream: inout DataStream) throws {
            /// ElementID (2 bytes): An integer that identifies the type of data contained in the ElementData field. The value of the ElementID field
            /// SHOULD be one of those listed in the following table. If a PersistElement structure is encountered where the value of the ElementID
            /// field is not known to the implementation, the implementation MUST ignore that PersistElement structure.
            let elementIDRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
            if let elementID = ElementID(rawValue: elementIDRaw) {
                self.elementID = elementID
            } else {
                self.elementID = .unknown
            }
            
            /// ElementDataSize (2 bytes): The size, in bytes, of the ElementData field. The value of this field is 0 (zero) if the ElementID field
            /// is set to ELEMENT_SENTINEL.
            self.elementDataSize = try dataStream.read(endianess: .littleEndian)
            
            /// ElementData (variable): The data corresponding to the special folder that is identified by the value of the PersistID field of the
            /// PersistData structure (section 2.2.5.1). The type of data in this field is indicated by the value of the ElementID field. If the value
            /// of the ElementID field is RSF_ELID_HEADER, the ElementData field MUST be set to 0x00000000.
            /// This field is not present if the ElementID field is set to ELEMENT_SENTINEL.
            switch self.elementID {
            case .header:
                if self.elementDataSize != 4 {
                    throw MAPIError.corrupted
                }

                self.elementData = try dataStream.read(endianess: .littleEndian) as UInt32
            case .entryId:
                self.elementData = try getEntryID(dataStream: &dataStream, size: Int(self.elementDataSize))
            case .sentinel:
                self.elementData = nil
            case .unknown:
                self.elementData = try dataStream.readBytes(count: Int(self.elementDataSize))
            }
        }
        
        /// ElementID (2 bytes): An integer that identifies the type of data contained in the ElementData field. The value of the ElementID field
        /// SHOULD be one of those listed in the following table. If a PersistElement structure is encountered where the value of the ElementID
        /// field is not known to the implementation, the implementation MUST ignore that PersistElement structure.
        public enum ElementID: UInt16 {
            /// RSF_ELID_HEADER 0x0002 4 bytes Indicates that the ElementData field contains a 4-byte header value equal to 0x00000000.
            case header = 0x0002
            
            /// RSF_ELID_ENTRYID 0x0001 variable Indicates that the ElementData field contains the entry ID of the special folder that is of
            /// the type indicated by the value of the PersistID field of the PersistData structure.
            case entryId = 0x0001
            
            /// ELEMENT_SENTINEL 0x0000 0 bytes Indicates that the PersistElement structure is the last one contained in the DataElements
            /// field of the PersistData structure.
            case sentinel = 0x0000
            
            case unknown = 0xFFFF
        }
    }
}
