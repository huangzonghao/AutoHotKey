; #Warn  ; Enable warnings to assist with detecting common errors.
#Requires AutoHotkey >=2.0
#SingleInstance force
#NoTrayIcon
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

!F10::Suspend(-1)

!e::ToggleTerminal()

ShowAndPositionTerminal()
{
    WinShow("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
    WinActivate("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")

    ;SysGet, WorkArea, MonitorWorkArea
    ;TerminalWidth := A_ScreenWidth * 0.9
    ;if (A_ScreenWidth / A_ScreenHeight) > 1.5 {
    ;    TerminalWidth := A_ScreenWidth * 0.6
    ;}
    ;WinMove, ahk_class CASCADIA_HOSTING_WINDOW_CLASS,, (A_ScreenWidth - TerminalWidth) / 2, WorkAreaTop - 2, TerminalWidth, A_ScreenHeight * 0.5,
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    DetectHiddenWindows(true)

    if WinExist(WinMatcher)
    ; Window Exists
    {
        DetectHiddenWindows(false)

        ; Check if its hidden
        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinMatcher)
        {
            ; Script sees it without detecting hidden windows, so..
            WinHide("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
            Send("!{Esc}")
        }
    }
    else
    {
        Run("c:\Users\huangzonghao\AppData\Local\Microsoft\WindowsApps\wt.exe")
        ;Sleep, 10
        ShowAndPositionTerminal()
    }
}
