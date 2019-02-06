// comment this to disable debug processing
#define _DEBUG 1

#ifdef _DEBUG
#define DBG(_msg)           llOwnerSay(_msg)
#define DBGLIST(_m, _r, _s) _dbglist(_m, _r, _s)

_dbglist(string msg, list r, integer stride) {
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
#else
#define DBG(_msg)
#define DBGLIST(_m, _r, _s)
#endif

default {
    state_entry() {
        list r = [ 0, 1, 2];
        DBGLIST("list", r, 0);
        r = [ 0, "zero", 1, "one", 2, "two" ];
        DBGLIST("strided", r, 2); 
    }
}
