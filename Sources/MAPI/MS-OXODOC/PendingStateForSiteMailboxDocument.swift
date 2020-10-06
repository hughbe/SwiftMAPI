//
//  PendingStateForSiteMailboxDocument.swift
//  
//
//  Created by Hugh Bellamy on 03/09/2020.
//

public enum PendingStateForSiteMailboxDocument: UInt32 {
    /// The document has been uploaded to a shared location.
    case uploadedToSharedLocation = 0
    
    /// The document has been added to the Document Libraries folder and is waiting to be uploaded to a
    /// shared location.
    case waitingToBeUploadedToSharedLocation = 1
}
