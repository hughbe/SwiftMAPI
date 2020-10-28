//
//  MAPI_W.swift
//  
//
//  Created by Hugh Bellamy on 28/10/2020.
//

public enum MAPI_W: UInt32 {
    /* MAPI base function and status object specific errors and warnings */
    case NO_SERVICE = 0x00040203
    
    /* Property specific errors and warnings */
    case ERRORS_RETURNED = 0x00040380
    
    /* Table specific errors and warnings */
    case POSITION_CHANGED = 0x00040481
    case APPROX_COUNT = 0x00040482
    
    /* Transport specific errors and warnings */
    case CANCEL_MESSAGE = 0x00040580
    
    /* Message Store, Folder, and Message specific errors and warnings */
    case PARTIAL_COMPLETION = 0x00040680
}
