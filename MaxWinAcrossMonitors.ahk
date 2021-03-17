#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;----------------------------------------------------------------------------
; From the Sysget docs: https://autohotkey.com/docs/commands/SysGet.htm
; The virtual screen is the bounding rectangle of all display monitors.
SysGet, vsX, 76 ; SM_XVIRTUALSCREEN := 76   ; Coordinate for the left side of the virtual screen
SysGet, vsY, 77 ; SM_YVIRTUALSCREEN := 77   ; Coordinate for the top of the virtual screen
SysGet, vsW, 78 ; SM_CXVIRTUALSCREEN := 78  ; Width of the virtual screen
SysGet, vsH, 79 ; SM_CYVIRTUALSCREEN := 79  ; Height of the virtual screen

; Uncomment the following line to show the points captured by Sysget
;~ MsgBox, % "Virtual screen: (" vsX ", " vsY ") to (" vsW ", " vsH ")

MyCoords := new Coords ; This will hold the original coordinates of the windows so they can be restored later
return
;----------------------------------------------------------------------------
^+Space::
ActiveWindow := WinExist("A")

; If the active window is in the window list, return it to the orinal position
if (Coord := MyCoords.GetCoord(ActiveWindow)) {
    WinMove, ahk_id %ActiveWindow%,, % Coord.X, % Coord.Y, % Coord.W, % Coord.H
    MyCoords.DeleteCoord(ActiveWindow)
}
else {
    WinGetPos, WinX, WinY, WinW, WinH, ahk_id %ActiveWindow%
    MyCoords.AddCoord(ActiveWindow, WinX, WinY, WinW, WinH)
    WinMove, ahk_id %ActiveWindow%,, %vsX%, %vsY%, %vsW%, %vsH%
}
return
;----------------------------------------------------------------------------
class Coords
{
    __New()
    {
        this.CoordList := []
    }
    AddCoord(ID, X, Y, W, H)
    {
        this.CoordList[ID] := new this.Coord(X, Y, W, H)
    }
    DeleteCoord(ID)
    {
        this.CoordList.Delete(ID)
    }
    GetCoord(ID)
    {
        return this.CoordList[ID]
    }
    class Coord
    {
        __New(X, Y, W, H)
        {
            this.X := X
            this.Y := Y
            this.W := W
            this.H := H
        }
    }
}
;----------------------------------------------------------------------------