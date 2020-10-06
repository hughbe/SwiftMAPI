//
//  CalendarTimeZoneId.swift
//  
//
//  Created by Hugh Bellamy on 11/09/2020.
//

/// [MS-XWDCAL] 2.2.2.31 PidNameCalendarTimeZoneId
/// DAV property name: urn:schemas:calendar:timezoneid
/// Data type: PtypInteger32 ([MS-OXCDATA] section 2.11.1.6)
/// The PidNameCalendarTimeZoneId property ([MS-OXPROPS] section 2.398) gets or sets the time zone identifier of an appointment or meeting.
/// This property SHOULD be ignored if the PidNameCalendarTimeZone property ([MS-OXPROPS] section 2.397) is specified.
/// The following table lists the valid values of the PidNameCalendarTimeZoneId property.
public enum CalendarTimeZoneId: UInt32 {
    /// Coordinated Universal Time (UTC)
    case utc = 0
    
    /// Greenwich Mean Time (same as UTC)
    case gmt = 1
    
    /// Dublin, Edinburgh, Lisbon, London (UTC + 0:00)
    case lisbon = 2
    
    /// Brussels, Copenhagen, Madrid, Paris, Vilnius (UTC + 1:00)
    case paris = 3
    
    /// Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna (UTC + 1:00)
    case berlin = 4
    
    /// Eastern Europe (UTC + 2:00)
    case easternEurope = 5
    
    /// Belgrade, Pozsony, Budapest, Ljubljana, Prague (UTC + 1:00)
    case prague = 6
    
    /// Athens, Istanbul, Minsk (UTC + 2:00)
    case athens = 7
    
    /// Brasilia (UTC - 3:00)
    case brasilia = 8
    
    /// Atlantic time (UTC - 4:00)
    case atlanticCanada = 9
    
    /// Eastern time (UTC - 5:00)
    case eastern = 10
    
    /// Central time (UTC - 6:00)
    case central = 11
    
    /// Mountain time (UTC - 7:00)
    case mountain = 12
    
    /// Pacific time (UTC - 8:00)
    case pacific = 13
    
    /// Alaska (UTC - 9:00)
    case alaska = 14
    
    /// Hawaii (UTC - 10:00)
    case hawaii = 15
    
    /// Midway Island, Samoa (UTC - 11:00)
    case midwayIsland = 16
    
    /// Auckland, Wellington (UTC + 12:00)
    case wellington = 17

    ///  Brisbane (UTC + 10:00)
    case brisbane = 18

    ///  Adelaide (UTC + 9:30)
    case adelaide = 19

    ///  Osaka, Sapporo, Tokyo (UTC + 9:00)
    case tokyo = 20

    ///  Hong Kong SAR (UTC + 8:00)
    case hongKong = 21

    ///  Bangkok, Hanoi, Jakarta (UTC + 7:00)
    case bangkok = 22

    ///  Mumbai, Kolkata, Chennai, New Delhi (UTC + 5:30)
    case bombay = 23

    ///  Abu Dhabi, Muscat (UTC + 4:00)
    case abuDhabi = 24

    ///  Tehran (UTC + 3:30)
    case tehran = 25

    ///  Baghdad, Kuwait, Riyadh (UTC + 3:00)
    case baghdad = 26

    ///  Israel (UTC + 2:00)
    case israel = 27

    ///  Newfoundland (UTC - 3:30)
    case newfoundland = 28

    ///  Azores, Cape Verde Islands (UTC - 1:00)
    case azores = 29

    ///  Mid Atlantic (UTC - 2:00)
    case midAtlantic = 30

    ///  Casablanca, Monrovia (UTC + 0:00)
    case monrovia = 31

    ///  Buenos Aires, Georgetown (UTC - 3:00)
    case buenosAires = 32

    ///  Caracas, La Paz (UTC - 4:00)
    case caracas = 33

    ///  Indiana (UTC - 5:00)
    case indiana = 34

    ///  Bogota, Lima, Quito (UTC - 5:00)
    case bogota = 35

    ///  Saskatchewan (UTC - 6:00)
    case saskatchewan = 36

    ///  Mexico City, Tegucigalpa (UTC - 6:00)
    case mexicoCity = 37

    ///  Arizona (UTC - 7:00)
    case arizona = 38

    ///  Eniwetok, Kwajalein (UTC - 12:00)
    case eniwetok = 39

    ///  Fiji Islands, Kamchatka, Marshall Islands (UTC + 12:00)
    case fiji = 40

    ///  Magadan, Solomon Islands, New Caledonia (UTC + 11:00)
    case magadan = 41

    ///  Hobart (UTC + 10:00)
    case hobart = 42

    ///  Guam, Port Moresby (UTC + 10:00)
    case guam = 43

    ///  Darwin (UTC + 9:30)
    case darwin = 44

    ///  Beijing, Chongqing, Urumqi (UTC + 8:00)
    case beijing = 45

    ///  Akmola, Almaty, Dhaka (UTC + 6:00)
    case almaty = 46

    ///  Islamabad, Karachi, Tashkent (UTC + 5:00)
    case islamabad = 47

    ///  Kabul (UTC + 4:30)
    case kabul = 48
    
    ///  Cairo (UTC + 2:00)
    case cairo = 49
    
    /// Harare, Pretoria (UTC + 2:00)
    case harare = 50
    
    /// Moscow, St. Petersburg, Volgograd (UTC + 3:00)
    case moscow = 51
    
    /// Non-valid time zone
    case invalidTimeZone = 52
}
