#Requires AutoHotkey v2.0+

; Close the active window when Win + Shift + Q is pressed
#+q:: {
    ; Get the handle of the active window
    win_id := WinActive("A")

    ; Check if the window handle is valid
    if (win_id) {
        activeClassName := WinGetClass(win_id)

        ; Check if it's not the desktop and the show/hide desktop button?
        if (activeClassName != "Progman" && activeClassName != "WorkerW") {
            Send("!{F4}")
        }
    }

}

^!+L:: {
    ; Call the system function to put the computer to sleep
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
}

^!+r:: {
    ; Shuts down the computer (0 = Log off, 1 = Restart, 2 = Shutdown)
    Shutdown 2
}