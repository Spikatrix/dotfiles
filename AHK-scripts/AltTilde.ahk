#Requires AutoHotkey v2.0
; Adapted from https://superuser.com/a/1783158/ (Thanks @EugeneK's & @9cco)

; Alt + Tilde cycles forward, Alt + Shift + Tilde cycles backward
!`::CycleWindows(1)
!+`::CycleWindows(-1)

CycleWindows(direction := 1)
{
    static last_cycle_time := 0
    static original_win_list := []
    static current_index := 0
    
    win_id := WinActive("A")
    win_class := WinGetClass("A")
    active_process_name := WinGetProcessName("A")
    
    ; Get the current window list
    if (active_process_name = "explorer.exe")
        current_win_list := WinGetList("ahk_exe" active_process_name " ahk_class" win_class)
    else
        current_win_list := WinGetList("ahk_exe" active_process_name)
    
    ; Reset if it's been too long, window count changed, or current window isn't in our cycle
    if (A_TickCount - last_cycle_time > 1000 || 
        original_win_list.Length != current_win_list.Length ||
        !HasVal(original_win_list, win_id)) {
        original_win_list := current_win_list.Clone()
        ; Find current window in the list
        current_index := 0
        loop original_win_list.Length {
            if (original_win_list[A_Index] = win_id) {
                current_index := A_Index
                break
            }
        }
        if (current_index = 0)  ; Fallback if window not found
            current_index := 1
    }
    
    ; Update the time
    last_cycle_time := A_TickCount
    
    ; Calculate next index with wraparound
    if (direction > 0)
        current_index := Mod(current_index, original_win_list.Length) + 1
    else {
        current_index := current_index - 1
        if (current_index < 1)
            current_index := original_win_list.Length
    }
    
    ; Activate the next window
    next_window_id := original_win_list[current_index]
    WinActivate("ahk_id" next_window_id)
    
    ; Prevent Alt key from being sent to the application
    Send("{Blind}{vkE8}")
}

; Helper function to check if value exists in array
HasVal(haystack, needle) {
    for index, value in haystack
        if (value = needle)
            return true
    return false
}