#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#MaxHotkeysPerInterval 9999

; Multimedia Mappings
; Key Names:
;     Home, End, Insert,
;     PrintScreen, ScrollLock,
;     Pause, Delete, PgUp, PgDn,
;     NumpadMult, NumpadAdd, NumpadSub
;     Media_Play_Pause, Media_Prev, Media_Next,
;     Volume_Up, Volume_Down, Volume_Mute

$WheelUp::
Send {WheelDown}
Return

$WheelDown::
Send {WheelUp}
Return

^!h::Send {Ctrl Down}{LWin Down}{Left}{Ctrl Up}{LWin Up}
^!l::Send {Ctrl Down}{LWin Down}{Right}{Ctrl Up}{LWin Up}
+#h::Send {LWin Down}{Left}{LWin Up}
+#l::Send {LWin Down}{Right}{LWin Up}
+#f::Send {LWin Down}{Up}{LWin Up}

; for eudic
; need to release {LWin} first, otherwise Win+Ctrl+Alt+Shift will trigger office
^#Space::Send {LWin Up}{Ctrl Down}{Shift Down}{Alt Down}{Space}{Ctrl Up}{Shift Up}{Alt Up}

#IfWinActive ahk_exe chrome.exe
!h::Send {Ctrl Down}{PgUp}{Ctrl Up}
!l::Send {Ctrl Down}{PgDn}{Ctrl Up}
!t::Send {Ctrl Down}t{Ctrl Up}
!w::Send {Ctrl Down}w{Ctrl Up}
!u::Send {Ctrl Down}l{Ctrl Up}
!p::Send {Ctrl Down}p{Ctrl Up}
!n::Send {Ctrl Down}n{Ctrl Up}
^p::Send {Up Down}{Up Up}
^n::Send {Down Down}{Down Up}
^h::Send {Left Down}{Left Up}
^l::Send {Right Down}{Right Up}
#w::Send {Alt Down}w{Alt Up}

#IfWinActive ahk_exe SLDWORKS.exe
XButton1::Enter
XButton2::Escape
