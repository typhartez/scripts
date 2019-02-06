// trimF is work of Aine Caoimhe (c. LACM)
// added removal of final "." when no ecimal part
string trimF(float f) {
    integer len;
    string res;
    integer new = llRound(f*10000);
    integer neg = (new < 0);
    if (new < 0) new *= -1;
    if (!new) res = "0";
    else if (new < 10) res = "0.000"+(string)new;
    else if (new < 100) res = "0.00" + (string)new;
    else if (new < 1000) res = "0.0" + (string)new;
    else if (new < 10000) res = "0." + (string)new;
    else {
        res = (string)new;
        len = llStringLength(res);
        res = llGetSubString(res, 0, len-5)+"."+llGetSubString(res, len-4, len-1);
    }
    while (llGetSubString(res, len, len) == "0") res = llGetSubString(res, 0, --len);
    if (llGetSubString(res, len, len) == ".") res = llGetSubString(res, 0, len-1);
    if (neg) res = "-"+res;
    return res;
}

// same for vector
string trimV(vector v) {
    return "<"+trimF(v.x)+","+trimF(v.y)+","+trimF(v.z)+">";
}

// same for rotation
string trimR(rotation r) {
    return "<"+trimF(r.x)+","+trimF(r.y)+","+trimF(r.z)+","+trimF(r.s)+">";
}

///////////////////////////////////////////////////////////////////////////////////////////////
// tests

sayF(float f) {
    llOwnerSay((string)f + ": " + trimF(f));
}
sayV(vector v) {
    llOwnerSay((string)v + ": " + trimV(v));
}
sayR(rotation r) {
    llOwnerSay((string)r + ": " + trimR(r));
}

default {
    state_entry() {
        sayF(1.0); sayF(-1.0); sayF(0.0);
        sayF(0.00001); sayF(-0.00001);
        sayF(0.0001); sayF(-0.0001);
        sayF(100000.0001);

        sayV(ZERO_VECTOR);
        sayV(<1, -1, 0>);

        sayR(<0,0,0,1>);
    }
}
