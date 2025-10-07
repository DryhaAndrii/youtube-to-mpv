' YouTube Player (VBScript, классический интерфейс, без IE)
Option Explicit

Dim sh, url, choice, format, cmd

Set sh = CreateObject("WScript.Shell")

' Ввод ссылки
url = InputBox("Введите ссылку на YouTube видео:", "YouTube Player")
If url = "" Then
    MsgBox "Ссылка не введена.", 48, "Ошибка"
    WScript.Quit
End If

' Выбор качества
choice = MsgBox( _
    "Выберите качество видео:" & vbCrLf & vbCrLf & _
    "Да = 360p" & vbCrLf & _
    "Нет = 480p" & vbCrLf & _
    "Отмена = другие варианты", _
    vbYesNoCancel + vbQuestion, _
    "Выбор качества")

If choice = vbYes Then
    format = "best[height<=360]"
ElseIf choice = vbNo Then
    format = "best[height<=480]"
Else
    ' Если нажал Отмена — ещё одно меню:
    choice = MsgBox( _
        "Выберите вариант:" & vbCrLf & vbCrLf & _
        "Да = 720p" & vbCrLf & _
        "Нет = 1080p" & vbCrLf & _
        "Отмена = Только аудио", _
        vbYesNoCancel + vbQuestion, _
        "Дополнительные варианты")
    If choice = vbYes Then
        format = "best[height<=720]"
    ElseIf choice = vbNo Then
        format = "best[height<=1080]"
    Else
        format = "bestaudio"
    End If
End If

' Запуск mpv
cmd = "mpv --ytdl-format=" & Chr(34) & format & Chr(34) & " " & Chr(34) & url & Chr(34)
MsgBox "Запускаем: " & vbCrLf & cmd, 64, "MPV Player"
sh.Run cmd, 1, True
