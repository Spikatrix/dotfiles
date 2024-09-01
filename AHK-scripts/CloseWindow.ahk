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
