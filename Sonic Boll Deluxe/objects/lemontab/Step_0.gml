if keyboard_check_pressed(ord(editmanager.tabshortcut[n])) && !(editcursor.ctrl) && !(editcursor.shift) {
    loadlemontabs(n)
    //if !(settings("nolemonsound")) sound("lemonclick")
}