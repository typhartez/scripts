// work of Aine Caoimhe (c. LACM)
// modified to make more concise

list region2Local(vector regionPos,rotation regionRot) {
    rotation rot = llGetRot();
    return [ pos(regionPos - llGetPos()) / rot, regionRot / rot ];
}

list local2region(vector localPos, rotation localRot) {
    rotation rot = llGetRot();
    return [ localPos*rot+llGetPos(), localRot*rot ];
}
