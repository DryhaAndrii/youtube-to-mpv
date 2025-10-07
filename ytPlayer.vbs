' YouTube Player (VBScript, ������������ ���������, ��� IE)
Option Explicit

Dim sh, url, choice, format, cmd

Set sh = CreateObject("WScript.Shell")

' ���� ������
url = InputBox("������� ������ �� YouTube �����:", "YouTube Player")
If url = "" Then
    MsgBox "������ �� �������.", 48, "������"
    WScript.Quit
End If

' ����� ��������
choice = MsgBox( _
    "�������� �������� �����:" & vbCrLf & vbCrLf & _
    "�� = 360p" & vbCrLf & _
    "��� = 480p" & vbCrLf & _
    "������ = ������ ��������", _
    vbYesNoCancel + vbQuestion, _
    "����� ��������")

If choice = vbYes Then
    format = "best[height<=360]"
ElseIf choice = vbNo Then
    format = "best[height<=480]"
Else
    ' ���� ����� ������ � ��� ���� ����:
    choice = MsgBox( _
        "�������� �������:" & vbCrLf & vbCrLf & _
        "�� = 720p" & vbCrLf & _
        "��� = 1080p" & vbCrLf & _
        "������ = ������ �����", _
        vbYesNoCancel + vbQuestion, _
        "�������������� ��������")
    If choice = vbYes Then
        format = "best[height<=720]"
    ElseIf choice = vbNo Then
        format = "best[height<=1080]"
    Else
        format = "bestaudio"
    End If
End If

' ������ mpv
cmd = "mpv --ytdl-format=" & Chr(34) & format & Chr(34) & " " & Chr(34) & url & Chr(34)
MsgBox "���������: " & vbCrLf & cmd, 64, "MPV Player"
sh.Run cmd, 1, True
