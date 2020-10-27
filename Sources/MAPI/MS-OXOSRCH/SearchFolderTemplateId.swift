//
//  SearchTemplateId.swift
//  
//
//  Created by Hugh Bellamy on 27/10/2020.
//

import Foundation

/// [MS-OXOSRCH] 2.2.3 Search Templates
/// Search criteria are specified by a template. The PidTagSearchFolderTemplateId property (section 2.2.1.2.2) on the message that defines the
/// search folder identifies its corresponding template. In addition to defining search criteria, a template also defines folders to exclude from the
/// search, defines items to exclude from the search, and specifies the value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6).
/// For more details about the folders that are excluded from the search, see [MS-OXOSFLD]. For more details about the item types that are
/// excluded from the search, see the following:
///  Appointments - [MS-OXOCAL]
///  Contacts - [MS-OXOCNTC]
///  Distribution lists - [MS-OXOABK]
///  Journal items - [MS-OXOJRNL]
///  Sticky notes - [MS-OXONOTE]
///  Tasks - [MS-OXOTASK]
/// The flags set in the PidTagSearchFolderStorageType property and in the PidTagSearchFolderDefinition property (section 2.2.1.2.8) vary according
/// to template. The fields required in the binary data of PidTagSearchFolderDefinition also vary according to template. The following subsections
/// define the templates, including their requirements for PidTagSearchFolderStorageType flags and PidTagSearchFolderDefinition fields.<1><2>
public enum SearchFolderTemplateId: UInt32 {
    /// [MS-OXOSRCH] 2.2.3.1 Unread Messages
    /// The template for a search that finds unread messages has the following characteristics and settings:
    ///  Template ID: 2
    ///  Folders excluded: Sync Issues folder, as defined in [MS-OXOSFLD] section 2.2.1, Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    /// FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This search will include all
    /// mailbox folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes unread messages.
    case unreadMessages = 2
    
    /// [MS-OXOSRCH] 2.2.3.2 Marked for Follow-Up
    /// The template for a search that finds messages marked for follow-up has the following characteristics and settings:
    ///  Template ID: 3
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder<3>
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages marked for follow-up.
    case markedForFollowUp = 3
    
    /// [MS-OXOSRCH] 2.2.3.3 Unread or Marked for Follow-Up
    /// The template for a search that finds both unread messages and messages marked for follow-up has the following characteristics and settings:
    ///  Template ID: 4
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes unread messages and messages marked for follow-up.
    case unreadOrMarkedForFollowUp = 4
    
    /// [MS-OXOSRCH] 2.2.3.4 Important Mail
    /// The template for a search that finds messages marked as important has the following characteristics and settings:
    ///  Template ID: 5
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder<4>
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure, as specified in section 2.2.1.2.8.2, that describes messages marked as important.
    case importantMail = 5
    
    /// [MS-OXOSRCH] 2.2.3.5 Conversations
    /// The template for a search that finds messages sent to and received from specified people has the following characteristics and settings:
    ///  Template ID: 6
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x0000004E (flags B, E, F, and G)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages sent to and received from people who are
    /// specified by the Addresses field.
    ///  Addresses: An AddressList structure (section 2.2.1.2.8.1) that contains the addresses by which to filter conversations.
    ///  TextSearch: A list of the names of the people by which to filter conversations.
    case conversations = 6
    
    /// [MS-OXOSRCH] 2.2.3.6 From a Specific Person
    /// The template for a search that finds messages received from specified people has the following characteristics and settings:
    ///  Template ID: 7
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder, Sent Items folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x0000004E (flags B, E, F, and G)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages received from people who are specified by the Addresses field.
    ///  Addresses: An AddressList structure (section 2.2.1.2.8.1) that contains the addresses by which to filter received messages.
    ///  TextSearch: A list of the names of the people by which to filter received messages.
    case fromASpecificPerson = 7

    /// [MS-OXOSRCH] 2.2.3.7 Sent Directly to Me
    /// The template for a search that finds messages sent to the user has the following characteristics and settings:
    ///  Template ID: 8
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder, Sent Items folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages sent to the user.
    case sentDirectlyToMe = 8
    
    /// [MS-OXOSRCH] 2.2.3.8 Sent to a Specific Distribution List
    /// The template for a search that finds messages sent to specified distribution lists has the following characteristics and settings:
    ///  Template ID: 9
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x0000004E (flags B, E, F, and G)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages sent to the distribution lists specified by the
    /// Addresses field.
    ///  Addresses: An AddressList structure (section 2.2.1.2.8.1) that contains the distribution lists by which to filter sent messages.
    ///  TextSearch: A list of the names of the distribution lists by which to filter sent messages.
    case sentToASpecificDistributionList = 9
    
    /// [MS-OXOSRCH] 2.2.3.9 Large Messages
    /// The template for a search that finds large messages has the following characteristics and settings:
    ///  Template ID: 10
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x0000004B (flags B, E, G, and H)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages larger than the size specified by the
    /// NumericalSearch field.
    ///  TextSearch: A string that specifies search criteria.
    ///  NumericalSearch: An integer that specifies the minimum size, in kilobytes, of the messages to search for.
    case largeMessages = 10
    
    /// [MS-OXOSRCH] 2.2.3.10 Old Mail
    /// The template for a search that finds messages older than a specified age has the following characteristics and settings:
    ///  Template ID: 11
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00004049 (flags B, E, H, and J) to indicate daily refresh,
    /// 0x00002049 (flags B, E, H, and K) to indicate weekly refresh, or 0x00001049 (flags B, E, H, and L) to indicate monthly refresh.
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages older than the age specified by the
    /// NumericalSearch field.
    ///  NumericalSearch: An integer that specifies the age of the messages to search for.
    case oldMail = 11
    
    /// [MS-OXOSRCH] 2.2.3.11 With Attachments
    /// The template for a search that finds messages having attachments has the following characteristics and settings:
    ///  Template ID: 12
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder <5>
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages having file attachments.
    case withAttachments = 12
    
    /// [MS-OXOSRCH] 2.2.3.12 Mail Received This Week
    /// The template for a search that finds messages received during the current week has the following characteristics and settings:
    ///  Template ID: 13
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Drafts folder, Outbox folder, Sent Items folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00002048 (flags B, E, and K)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages received on or after the first day of the current
    /// week but no later than seven days after the first day of the week. The first day of the week is determined by computer locale settings but
    /// can potentially be overridden by the user.
    case mailReceivedThisWeek = 13
    
    /// [MS-OXOSRCH] 2.2.3.13 With Specific Words
    /// The template for a search that finds messages containing certain words has the following characteristics and settings:
    ///  Template ID: 14
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder, Outbox folder, Drafts folder <6>
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x0000004A (flags B, E, and G)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages containing certain words.
    ///  TextSearch: A string that specifies the words for which to search.
    case withSpecificWords = 14
    
    /// [MS-OXOSRCH] 2.2.3.14 Categorized
    /// The template for a search that finds categorized messages has the following characteristics and settings:
    ///  Template ID: 15
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1), Deleted Items folder, Junk E-mail folder
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000048 (flags B and E) to indicate any category or
    /// 0x0000004A (flags B, E, and G) to indicate specific categories.
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  FolderList2: An EntryList structure ([MS-OXCDATA] section 2.3.1) that contains the folders to be searched. This will include all mailbox
    /// folders, except the ones specifically excluded by this template.
    ///  SearchRestriction: A Restriction structure (section 2.2.1.2.8.2) that describes messages having a category. If the G flag is set in the
    /// PidTagSearchFolderStorageType property, the Restriction structure describes messages that have a category matching the string contained
    /// in the TextSearch field.
    ///  TextSearch: A string that specifies the categories for which to search. This field is present only if the G flag is set.
    case categorized = 15
    
    /// [MS-OXOSRCH] 2.2.3.15 Custom
    /// The template for a custom search has the following characteristics and settings:
    ///  Template ID: 1
    ///  Folders excluded: Sync Issues folder ([MS-OXOSFLD] section 2.2.1)
    ///  Items excluded: Appointments, contacts, distribution lists, journal items, sticky notes, tasks
    ///  Value of the PidTagSearchFolderStorageType property (section 2.2.1.2.6): 0x00000010 (flag D)
    ///  The affected fields of the PidTagSearchFolderDefinition property (section 2.2.1.2.8) are as follows:
    ///  AdvancedSearch: Implementation-specific data based on user-specified options.
    case custom = 1
}
