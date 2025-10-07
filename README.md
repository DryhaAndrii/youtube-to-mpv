# YouTube → MPV (lightweight launcher for low-end PCs)

A tiny Windows utility: paste a YouTube link, choose quality, and it plays in `mpv`. Useful on low-end PCs where YouTube in the browser stutters.

## What's inside
- `ytPlayer.hta` — simple GUI (HTML Application, ActiveX).
- `ytPlayer.ahk` — GUI written in AutoHotkey v1.
- `batnik.bat` — console menu.
- `mpv.exe`, `mpv.com` — the mpv player (not included in the repo, can be downloaded here https://drive.google.com/drive/folders/1mBnF-koaapXOIHl2rcO7TUM2ARnyol6i?usp=sharing).
- `yt-dlp.exe` — used by mpv to fetch YouTube streams (not included in the repo).
- `url.txt` — stores the last entered URL (git-ignored).

## Requirements
- Windows 7/8/10/11
- Place `mpv.exe` and `yt-dlp.exe` next to the scripts
  - mpv: see the official installation page — [mpv installation](https://mpv.io/installation/)
  - yt-dlp: download the latest release — [yt-dlp releases](https://github.com/yt-dlp/yt-dlp/releases/latest)

## How to run
- HTA: double-click `ytPlayer.hta`, paste URL, choose quality, click Play
- AHK: install AutoHotkey v1 and run `ytPlayer.ahk`
- BAT: run `batnik.bat`, choose quality, paste URL in the console

## Quality profiles
Available: 360p, 480p, 720p, 1080p, Best, Audio. Under the hood this sets mpv's `--ytdl-format`, e.g. `best[height<=720]`.

## Why binaries are excluded
`mpv.exe`, `mpv.com`, `yt-dlp.exe`, `d3dcompiler_43.dll` and other binaries are excluded via `.gitignore` to keep the repo light and avoid redistributing third-party binaries. Please download them yourself and place next to the scripts.

## License
MIT — see `LICENSE`.

