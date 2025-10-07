; YouTube → MPV launcher (AutoHotkey v1)
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Read last URL if available
lastUrl := ""
if FileExist("url.txt") {
	FileRead, lastUrl, url.txt
	StringReplace, lastUrl, lastUrl, `r,, All
	StringReplace, lastUrl, lastUrl, `n,, All
}

Gui, Margin, 14, 14
Gui, Font, s9, Segoe UI
Gui, Add, Text, w70, URL
Gui, Add, Edit, vUrl w460, %lastUrl%
Gui, Add, Text, xm w70 Section, Quality
Gui, Add, DropDownList, vQuality w160 Choose3, 360p|480p|720p|1080p|Best|Audio
Gui, Add, Button, xm w100 gPlay Default, Play
Gui, Add, Button, x+8 w90 gClose, Close
Gui, Show, AutoSize, YouTube Player -> MPV
return

Play:
Gui, Submit, NoHide
if (Url = "") {
	MsgBox, 48, Error, Please enter a video URL.
	return
}

; Map quality to ytdl format
format := "best"
if (Quality = "360p")
	format := "best[height<=360]"
else if (Quality = "480p")
	format := "best[height<=480]"
else if (Quality = "720p")
	format := "best[height<=720]"
else if (Quality = "1080p")
	format := "best[height<=1080]"
else if (Quality = "Audio")
	format := "bestaudio"

mpv := A_ScriptDir . "\\mpv.exe"
if !FileExist(mpv) {
	MsgBox, 48, Error, mpv.exe not found in folder:`n%A_ScriptDir%
	return
}

; Save last url
FileDelete, url.txt
FileAppend, %Url%, url.txt

; Run mpv with yt-dlp in current directory
cmd := "\"" . mpv . "\" --ytdl-format=\"" . format . "\" \"" . Url . "\""
Run, %cmd%, %A_ScriptDir%, UseErrorLevel
if (ErrorLevel) {
	MsgBox, 48, Error, Failed to launch MPV.`nCode: %ErrorLevel%
}
return

Close:
GuiClose:
ExitApp


