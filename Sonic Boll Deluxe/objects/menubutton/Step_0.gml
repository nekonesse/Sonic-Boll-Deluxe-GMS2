event_inherited()
if (sub==11) {
    if (settings("fullscreen")) y=-100
    else y=ystart
}
if (sub==13 || sub==18) {
    if (settings("fullscreen")) sub=18
    else sub=13
}