// to generate an appKey, rez an object and copy its UUID
// for example: eec73a61-5e17-4bf1-a4a8-69fcb7b6a0b6
// take the first part (8 characters): eec73a61
// and prefix with 0x: 0xeec73a61

integer APP_KEY = 0xeec73a61;

integer ownerChannel(integer appKey) {
    return 0x80000000 | ((integer)("0x" + llGetSubString(llGetOwner(), 0, 7)) ^ appKey);
}

integer thisChannel(integer appKey) {
    return 0x80000000 | ((integer)("0x" + llGetSubString(llGetKey(), 0, 7)) ^ appKey);
}

integer objectChannel(key id, integer appKey) {
    return 0x80000000 | ((integer)("0x" + llGetSubString(id, 0, 7)) ^ appKey);
}

///////////////////////////////////////////////////////////////////////////////////////////////
// tests

default {
    state_entry() {
        llOwnerSay("channels:"
        + "\nowner: " + (string)ownerChannel(APP_KEY)
        + "\nthis: " + (string)thisChannel(APP_KEY)
        + "\nobject: " + (string)objectChannel(llGetInventoryKey(llGetScriptName()), APP_KEY)
        );
    }
}
