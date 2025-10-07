@echo off
chcp 866>nul
setlocal EnableDelayedExpansion

:MENU
cls
echo ===============================
echo    YouTube Player with MPV
echo ===============================
echo.
echo Choose video quality
echo 1 - 360p 
echo 2 - 480p 
echo 3 - 720p
echo 4 - 1080p
echo 5 - Best available
echo 6 - Audio
echo 0 - Exit
echo.
set /p choice="Enter choice:"

if "%choice%"=="1" set "format=best[height<=360]" && goto INPUT
if "%choice%"=="2" set "format=best[height<=480]" && goto INPUT
if "%choice%"=="3" set "format=best[height<=720]" && goto INPUT
if "%choice%"=="4" set "format=best[height<=1080]" && goto INPUT
if "%choice%"=="5" set "format=best" && goto INPUT
if "%choice%"=="6" set "format=bestaudio" && goto INPUT
if "%choice%"=="0" exit /b

echo Wrong choice! Press any button...
pause >nul
goto MENU

:INPUT
cls
echo Quality !format!
echo.
set /p url="Enter YouTube video url: "

if "!url!"=="" (
    echo url missed!
    pause
    goto MENU
)

echo.
echo Launching: mpv --ytdl-format="!format!" "!url!"
echo.
mpv --ytdl-format="!format!" "!url!"

pause
goto MENU