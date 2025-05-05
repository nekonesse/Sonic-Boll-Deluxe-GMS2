if (sub=0) editnew(1)
//quickload
if (sub=2) editsave()
if (sub=5) editexit()
if (sub=6) edittest(0)
if (sub=7) edittime()
if (sub=8) editname()
if (sub=9) editdesc()
if (sub=11) editwindowsize()
if (sub=12) editskin()
if (sub=13 || sub=18) editfullscreen()
//quicksave
if (sub=15) editundo()
if (sub=22) editbeat() //good news! finally after all these years the one annoying spot in lemon is being filled
if (sub=23) editlightlevel() //dark areas
if (sub=24) editfakesave() //test for save errors
if (sub=25) editlevelskin()
if (sub=26) editmusic()
if (sub=27) {
    i=show_menu("Lemon Settings|-|Toggle Fun Mode|Toggle Lemon Sounds|Toggle Lemon Music",0)
    if (i=1) settings("funmode",!settings("funmode"))
    if (i=2) settings("nolemonsound",!settings("nolemonsound"))
    if (i=3) {mus_stop() settings("nolemonmusic",!settings("nolemonmusic")) menumusic()}

}