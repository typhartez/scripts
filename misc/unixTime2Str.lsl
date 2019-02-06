// adapted from http://wiki.secondlife.com/wiki/Unix2PST_PDT
// made simplier, removing the day of week and PST/PDT suffix
// format is shorter too: YYYYMMDD-hhmm

// This leap year test is correct for all years from 1901 to 2099 and hence is quite adequate for Unix Time computations
integer LeapYear(integer year) {
    return !(year & 3);
}
 
integer DaysPerMonth(integer year, integer month) {
    if (month == 2)      return 28 + LeapYear(year);
    return 30 + ( (month + (month > 7) ) & 1);           // Odd months up to July, and even months after July, have 31 days
}
 
string unixTime2Str(integer insecs) {
    integer daysinyear;
    integer mins = insecs / 60;
    integer secs = insecs % 60;
    integer hours = mins / 60;
    mins = mins % 60;
    integer days = hours / 24;
    hours = hours % 24;
 
    integer years = 1970 +  4 * (days / 1461);
    days = days % 1461; // number of days into a 4-year cycle
 
@loop;
    daysinyear = 365 + LeapYear(years);
    if (days >= daysinyear) {
        days -= daysinyear;
        ++years;
        jump loop;
    }
    ++days;
    
    integer month = 0;
    integer w = 0;
    while (days > w) {
        days -= w;
        w = DaysPerMonth(years, ++month);
    }
    return ((string) years + llGetSubString ("0" + (string) month, -2, -1) + llGetSubString ("0" + (string) days, -2, -1) +
        "-" + llGetSubString ("0" + (string) hours, -2, -1) + llGetSubString ("0" + (string) mins, -2, -1));
}

///////////////////////////////////////////////////////////////////////////////////////////////
// tests

default {
    state_entry() {
        llOwnerSay(unixTime2Str(llGetUnixTime()));
    }
}
