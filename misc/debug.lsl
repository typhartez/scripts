integer debug = FALSE;

DBG(string msg) {
    if (debug) llOwnerSay(msg);
}

DBGLIST(string msg, list r, integer stride) {
    if (!debug) return;
    DBG(msg);
    string obj = llGetObjectName();
    llSetObjectName(" ");
    if (--stride < 1) stride = 0;
    integer i;
    integer c = llGetListLength(r);
    for (i = 0; i < c; i += 1+stride)
        DBG("{"+(string)i+".."+(string)(i+1+stride-1)+"} " + llDumpList2String(llList2List(r, i, i+1+stride-1), ", "));
    llSetObjectName(obj);
}

default {
    state_entry() {
        if (~llSubStringIndex(llGetObjectDesc(), "dbg=1")) debug = TRUE;

        list r = [ 0, 1, 2];
        DBGLIST("list", r, 0);
        r = [ 0, "zero", 1, "one", 2, "two" ];
        DBGLIST("strided", r, 2); 
    }
}
