//
//  MAPI_E.swift
//  
//
//  Created by Hugh Bellamy on 28/10/2020.
//

public enum MAPI_E: UInt32 {
    case CALL_FAILED = 0x80004005
    case NOT_ENOUGH_MEMORY = 0x8007000E
    case INVALID_PARAMETER = 0x80070057
    case INTERFACE_NOT_SUPPORTED = 0x80004002
    case NO_ACCESS = 0x80070005

    case NO_SUPPORT = 0x80040102
    case BAD_CHARWIDTH = 0x80040103
    case STRING_TOO_LONG = 0x80040105
    case UNKNOWN_FLAGS = 0x80040106
    case INVALID_ENTRYID = 0x80040107
    case INVALID_OBJECT = 0x80040108
    case OBJECT_CHANGED = 0x80040109
    case OBJECT_DELETED = 0x8004010A
    case BUSY = 0x8004010B
    case NOT_ENOUGH_DISK = 0x8004010D
    case NOT_ENOUGH_RESOURCES = 0x8004010E
    case NOT_FOUND = 0x8004010F
    case VERSION = 0x80040110
    case LOGON_FAILED = 0x80040111
    case SESSION_LIMIT = 0x80040112
    case USER_CANCEL = 0x80040113
    case UNABLE_TO_ABORT = 0x80040114
    case NETWORK_ERROR = 0x80040115
    case DISK_ERROR = 0x80040116
    case TOO_COMPLEX = 0x80040117
    case BAD_COLUMN = 0x80040118
    case EXTENDED_ERROR = 0x80040119
    case COMPUTED = 0x8004011A
    case CORRUPT_DATA = 0x8004011B
    case UNCONFIGURED = 0x8004011C
    case FAILONEPROVIDER = 0x8004011D
    case UNKNOWN_CPID = 0x8004011E
    case UNKNOWN_LCID = 0x8004011F
    
    /* Flavors of E_ACCESSDENIED, used at logon */
    case PASSWORD_CHANGE_REQUIRED = 0x80040120
    case PASSWORD_EXPIRED = 0x80040121
    case INVALID_WORKSTATION_ACCOUNT = 0x80040122
    case INVALID_ACCESS_TIME = 0x80040123
    case ACCOUNT_DISABLED = 0x80040124
    
    /* MAPI base function and status object specific errors and warnings */
    case END_OF_SESSION = 0x80040200
    case UNKNOWN_ENTRYID = 0x80040201
    case MISSING_REQUIRED_COLUMN = 0x80040202

    /* Property specific errors and warnings */
    case BAD_VALUE = 0x80040301
    case INVALID_TYPE = 0x80040302
    case TYPE_NO_SUPPORT = 0x80040303
    case UNEXPECTED_TYPE = 0x80040304
    case TOO_BIG = 0x80040305
    case DECLINE_COPY = 0x80040306
    case UNEXPECTED_ID = 0x80040307

    /* Table specific errors and warnings */
    case UNABLE_TO_COMPLETE = 0x80040400
    case TIMEOUT = 0x80040401
    case TABLE_EMPTY = 0x80040402
    case TABLE_TOO_BIG = 0x80040403
    case INVALID_BOOKMARK = 0x80040405

    /* Transport specific errors and warnings */
    case WAIT = 0x80040500
    case CANCEL = 0x80040501
    case NOT_ME = 0x80040502

    /* Message Store, Folder, and Message specific errors and warnings */
    case CORRUPT_STORE = 0x80040600
    case NOT_IN_QUEUE = 0x80040601
    case NO_SUPPRESS = 0x80040602
    case COLLISION = 0x80040604
    case NOT_INITIALIZED = 0x80040605
    case NON_STANDARD = 0x80040606
    case NO_RECIPIENTS = 0x80040607
    case SUBMITTED = 0x80040608
    case HAS_FOLDERS = 0x80040609
    case HAS_MESSAGES = 0x8004060A
    case FOLDER_CYCLE = 0x8004060B

    /* Address Book specific errors and warnings */
    case AMBIGUOUS_RECIP = 0x80040700
}
