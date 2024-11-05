; #Warn  ; Enable warnings to assist with detecting common errors.
#Requires AutoHotkey >=2.0
#NoTrayIcon
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

#SingleInstance force
A_MaxHotkeysPerInterval := 9999

; Definitions of groups
GroupAdd("Matlab", "ahk_exe MATLAB.exe")
GroupAdd("Matlab", "ahk_exe MATLABWindow.exe")

; Multimedia Mappings
; Key Names:
;     Home, End, Insert,
;     PrintScreen, ScrollLock,
;     Pause, Delete, PgUp, PgDn,
;     NumpadMult, NumpadAdd, NumpadSub
;     Media_Play_Pause, Media_Prev, Media_Next,
;     Volume_Up, Volume_Down, Volume_Mute
;     MButton, XButton1(rear), XButton2(front)
;     WheelUp, WheelDown, WheelLeft, WheelRight

!F1::
{
    ExeName := WinGetProcessName("A")
    TitleName := WinGetTitle("A")
    ClassName := WinGetClass("A")
    MsgBox("ExeName: " ExeName "`nTitle Name: " TitleName "`nClass Name: " ClassName)
}

!F2::
{
    Run("C:\Program Files\AutoHotkey\WindowSpy.ahk")
}

!F3::Reload()

; $WheelUp::
; Send {WheelDown}
; Return

; $WheelDown::
; Send {WheelUp}
; Return

^!h::Send("{Ctrl Down}{LWin Down}{Left}{Ctrl Up}{LWin Up}")
^!l::Send("{Ctrl Down}{LWin Down}{Right}{Ctrl Up}{LWin Up}")
+#h::Send("{LWin Down}{Left}{LWin Up}")
+#l::Send("{LWin Down}{Right}{LWin Up}")
+#f::Send("{LWin Down}{Up}{LWin Up}")

^!Space::WinSetAlwaysontop(-1, "A")

; for eudic
; need to release {LWin} first, otherwise Win+Ctrl+Alt+Shift will trigger office
; ^#e::Send {LWin Up}{Ctrl Down}{Shift Down}{Alt Down}{Space}{Ctrl Up}{Shift Up}{Alt Up}
^#e::Send("{Alt Down}{F12}{Alt Up}")

#HotIf WinActive("ahk_exe chrome.exe")
!h::Send("{Ctrl Down}{PgUp}{Ctrl Up}")
!l::Send("{Ctrl Down}{PgDn}{Ctrl Up}")
!t::Send("{Ctrl Down}t{Ctrl Up}")
!w::Send("{Ctrl Down}w{Ctrl Up}")
!u::Send("{Ctrl Down}l{Ctrl Up}")
!p::Send("{Ctrl Down}p{Ctrl Up}")
!n::Send("{Ctrl Down}n{Ctrl Up}")
!f::Send("{Ctrl Down}f{Ctrl Up}")
^p::Send("{Up Down}{Up Up}")
^n::Send("{Down Down}{Down Up}")
^b::Send("{Left Down}{Left Up}")
^f::Send("{Right Down}{Right Up}")
#w::Send("{Alt Down}w{Alt Up}")
!c::Send("{Ctrl Down}c{Ctrl Up}")
!v::Send("{Ctrl Down}v{Ctrl Up}")
F4::^B
XButton2::MButton

#HotIf WinActive("ahk_exe firefox.exe")
!h::Send("{Ctrl Down}{PgUp}{Ctrl Up}")
!l::Send("{Ctrl Down}{PgDn}{Ctrl Up}")
!t::Send("{Ctrl Down}t{Ctrl Up}")
!w::Send("{Ctrl Down}w{Ctrl Up}")
!u::Send("{Ctrl Down}l{Ctrl Up}")
!p::Send("{Ctrl Down}p{Ctrl Up}")
!n::Send("{Ctrl Down}n{Ctrl Up}")
!f::Send("{Ctrl Down}f{Ctrl Up}")
^p::Send("{Up Down}{Up Up}")
^n::Send("{Down Down}{Down Up}")
^b::Send("{Left Down}{Left Up}")
^f::Send("{Right Down}{Right Up}")
#w::Send("{Alt Down}w{Alt Up}")
!c::Send("{Ctrl Down}c{Ctrl Up}")
!v::Send("{Ctrl Down}v{Ctrl Up}")
XButton2::MButton

#HotIf WinActive("ahk_exe SLDWORKS.exe")
XButton1::Enter
XButton2::Escape

#HotIf WinActive("ahk_exe FoxitReader.exe")
MButton::u
WheelLeft::+u
WheelRight::^z
XButton1::t
XButton2::Esc

#HotIf WinActive("ahk_exe devenv.exe")
!h::Send("{Ctrl Down}{Alt Down}{PgUp}{Ctrl Up}{Alt Up}")
!l::Send("{Ctrl Down}{Alt Down}{PgDn}{Ctrl Up}{Alt Up}")

#HotIf WinActive("ahk_exe WeChat.exe")
^p::Send("{Up Down}{Up Up}")
^n::Send("{Down Down}{Down Up}")

#HotIf WinActive("ahk_exe Acrobat.exe")
!h::Send("{Ctrl Down}{Shift Down}{Tab}{Ctrl Up}{Shift Up}")
!l::Send("{Ctrl Down}{Tab}{Ctrl Up}")

#HotIf WinActive("ahk_exe WindowsTerminal.exe")
#h::Send("{LWin Up}{Alt Down}{Left}{Alt Up}")
#l::Send("{LWin Up}{Alt Down}{Right}{Alt Up}")
#j::Send("{LWin Up}{Alt Down}{Down}{Alt Up}")
#k::Send("{LWin Up}{Alt Down}{Up}{Alt Up}")

#HotIf WinActive("ahk_group Matlab")
^p::Send("{Up Down}{Up Up}")
^n::Send("{Down Down}{Down Up}")
!c::Send("{Ctrl Down}c{Ctrl Up}")
!v::Send("{Ctrl Down}v{Ctrl Up}")
!z::Send("{Ctrl Down}z{Ctrl Up}")

#HotIf WinActive("ahk_exe ONENOTE.exe")
+WheelDown::WheelRight
+WheelUp::WheelLeft

#HotIf WinActive("ahk_exe Overwatch.exe")
LWin::return
