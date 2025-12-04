;====================
; Hotkeys
;====================

#F6:: {
    curr := GetBrightness()
    new := Min(curr + 1, 100)
    SetBrightness(new)
    ShowOSD(new)
}

#F5:: {
    curr := GetBrightness()
    new := Max(curr - 1, 0)
    SetBrightness(new)
    ShowOSD(new)
}

;====================
; Brightness Helpers
;====================

GetBrightness() {
    for obj in ComObjGet("winmgmts:\\.\root\WMI").ExecQuery("SELECT * FROM WmiMonitorBrightness")
        return obj.CurrentBrightness
}

SetBrightness(level) {
    for obj in ComObjGet("winmgmts:\\.\root\WMI").ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods")
        obj.WmiSetBrightness(1, level)
}

;====================
; On-screen Display (OSD)
;====================

global osdGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
osdGui.BackColor := "000000"
osdGui.SetFont("s16 cWhite", "Segoe UI")

; add padding + fixed width so text never gets cut off
osdText := osdGui.AddText("xm ym w200 Center", "")

ShowOSD(val) {
    global osdGui, osdText

    osdText.Value := "Brightness: " val "%"
    osdGui.Show("Center NoActivate")

    SetTimer(() => osdGui.Hide(), -800) ; hide after 0.8s
}
