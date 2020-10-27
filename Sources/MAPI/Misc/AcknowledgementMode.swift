//
//  AcknowledgementMode.swift
//  
//
//  Created by Hugh Bellamy on 26/10/2020.
//

/// Contains the identifier of the mode for message acknowledgment.
/// This property can have exactly one of the following values:
/// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagacknowledgementmode-canonical-property
public enum AcknowledgementMode: UInt32 {
    /// 0 Manual acknowledgment.
    case manualAcknowledgement = 0

    /// 1 Automatic acknowledgment.
    case automaticAcknowledgement = 1
}
