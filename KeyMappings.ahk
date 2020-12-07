#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force


; Note not all key mappings used on this system is listed here. some are set directly with sharpkeys and were written to registry
Pause::Volume_Up
Home::Media_Play_Pause
End::Delete
Insert::PgUp
Delete::PgDn

$WheelUp::
Send {WheelDown}
Return

$WheelDown::
Send {WheelUp}
Return

^!h::Send {Ctrl Down}{LWin Down}{Left}{Ctrl Up}{LWin Up}
^!l::Send {Ctrl Down}{LWin Down}{Right}{Ctrl Up}{LWin Up}

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
#IfWinActive