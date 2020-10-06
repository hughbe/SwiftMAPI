//
//  ContainerFlags.swift
//  
//
//  Created by Hugh Bellamy on 06/09/2020.
//

/// [MS-OXOCAL] 2.2.2.1 PidTagContainerFlags
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1)
/// The PidTagContainerFlags property ([MS-OXPROPS] section 2.638) contains a bitmask of flags that ddescribe capabilities of an address
/// book container.
/// The flags listed in the following table are defined for the bitmask of the PidTagContainerFlags property. The PidTagContainerFlags property
/// MUST NOT contain any other flags. Because this property applies to a container in the hierarchy table, it is not present on objects in the
/// offline address book (OAB). An OAB has its own structure for maintaining the hierarchy, using the OAB Retrieval File Format, as specified
/// in [MS-OXWOAB], and the OAB Public Folder Retrieval Protocol, as specified in [MS-OXPFOAB].
public struct ContainerFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// The container holds Address Book objects. This flag does not indicate whether any objects are actually present in the container. This flag
    /// MUST be set for all containers and distribution lists that are returned by the NSPI server.
    public static let recipients = ContainerFlags(rawValue: 0x00000001)
    
    /// The container holds child containers. This flag does not indicate whether any subcontainers are actually present in the container.
    public static let subcontainers = ContainerFlags(rawValue: 0x00000002)
    
    /// It is not possible to add or remove Address Book objects from the container. This flag MUST be set for containers that are returned by the
    /// NSPI server.
    public static let unmodifiable = ContainerFlags(rawValue: 0x00000008)

    public static let all: ContainerFlags = [.recipients, .subcontainers, .unmodifiable]
}
