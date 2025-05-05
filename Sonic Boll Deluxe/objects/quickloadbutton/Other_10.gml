flash=0
if (quick) {
    var doo=show_contextmenu("Load Quicksave|-|Open file...",-1)
    if (doo=-1) exit
    if (doo=0) editload(editmanager.autosave)
    else editload()
} else editload()