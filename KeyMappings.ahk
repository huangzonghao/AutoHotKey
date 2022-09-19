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

!F1::
WinGet, AppName, ProcessName, A
MsgBox,% AppName
Return

!F2::
WinGetTitle, TitleName, A
MsgBox, % TitleName
Return
; $WheelUp::
; Send {WheelDown}
; Return

; $WheelDown::
; Send {WheelUp}
; Return

^!h::Send {Ctrl Down}{LWin Down}{Left}{Ctrl Up}{LWin Up}
^!l::Send {Ctrl Down}{LWin Down}{Right}{Ctrl Up}{LWin Up}
+#h::Send {LWin Down}{Left}{LWin Up}
+#l::Send {LWin Down}{Right}{LWin Up}
+#f::Send {LWin Down}{Up}{LWin Up}

^!Space::  Winset, Alwaysontop, , A

; for eudic
; Map eudic hotkey to Ctrl + Shift + Space
^#e::Send {Ctrl Down}{Shift Down}{Space}{Ctrl Up}{Shift Up}

#IfWinActive ahk_exe chrome.exe
!h::Send {Ctrl Down}{PgUp}{Ctrl Up}
!l::Send {Ctrl Down}{PgDn}{Ctrl Up}
!t::Send {Ctrl Down}t{Ctrl Up}
!w::Send {Ctrl Down}w{Ctrl Up}
!u::Send {Ctrl Down}l{Ctrl Up}
!p::Send {Ctrl Down}p{Ctrl Up}
!n::Send {Ctrl Down}n{Ctrl Up}
!f::Send {Ctrl Down}f{Ctrl Up}
^p::Send {Up Down}{Up Up}
^n::Send {Down Down}{Down Up}
^b::Send {Left Down}{Left Up}
^f::Send {Right Down}{Right Up}
#w::Send {Alt Down}w{Alt Up}

#IfWinActive ahk_exe firefox.exe
!h::Send {Ctrl Down}{PgUp}{Ctrl Up}
!l::Send {Ctrl Down}{PgDn}{Ctrl Up}
!t::Send {Ctrl Down}t{Ctrl Up}
!w::Send {Ctrl Down}w{Ctrl Up}
!u::Send {Ctrl Down}l{Ctrl Up}
!p::Send {Ctrl Down}p{Ctrl Up}
!n::Send {Ctrl Down}n{Ctrl Up}
!f::Send {Ctrl Down}f{Ctrl Up}
^p::Send {Up Down}{Up Up}
^n::Send {Down Down}{Down Up}
^b::Send {Left Down}{Left Up}
^f::Send {Right Down}{Right Up}
#w::Send {Alt Down}w{Alt Up}

#IfWinActive ahk_exe SLDWORKS.exe
XButton1::Enter
XButton2::Escape

#IfWinActive ahk_exe FoxitReader.exe
MButton::u
WheelLeft::+u
WheelRight::^z
XButton1::t
XButton2::Esc

#IfWinActive ahk_exe devenv.exe
!h::Send {Ctrl Down}{Alt Down}{PgUp}{Ctrl Up}{Alt Up}
!l::Send {Ctrl Down}{Alt Down}{PgDn}{Ctrl Up}{Alt Up}

#IfWinActive ahk_exe WeChat.exe
^p::Send {Up Down}{Up Up}
^n::Send {Down Down}{Down Up}

#IfWinActive ahk_exe MATLAB.exe
^p::Send {Up Down}{Up Up}
^n::Send {Down Down}{Down Up}

#IfWinActive ahk_exe Acrobat.exe
!h::Send {Ctrl Down}{Shift Down}{Tab}{Ctrl Up}{Shift Up}
!l::Send {Ctrl Down}{Tab}{Ctrl Up}
