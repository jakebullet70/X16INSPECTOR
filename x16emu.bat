@echo off
setlocal

rem ---------------------------------------------------------------------------
rem  X16 INSPECTOR - emulator launcher
rem
rem  Boots x16emu with the RUN\ directory as its SD card (-fsroot). RUN\ is the
rem  on-emulator dev environment: the MSEDIT editor, the XFMGR file manager, a
rem  working copy of the source in RUN\SRC, RUN\SPRITES, and the build outputs.
rem  Absolute paths in the code (/SRC, /SPRITES, /MSEDIT, /XFMGR) resolve
rem  against this root.
rem
rem      x16emu.bat                 boot into the /SRC source folder (BASIC)
rem      x16emu.bat -prg FOO.PRG -run   load + run a program
rem
rem  Emulator location: override by setting the X16EMU environment variable to
rem  your x16emu.exe before calling; otherwise the default below is used.
rem ---------------------------------------------------------------------------

set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
set "DRIVE=%ROOT%\RUN"

if not defined X16EMU set "X16EMU=C:\8bitProgramming\x16emu\x16emu.exe"

if not exist "%X16EMU%" (
	echo x16emu not found: "%X16EMU%"
	echo Set the X16EMU environment variable to the path of your x16emu.exe.
	exit /b 1
)
if not exist "%DRIVE%" (
	echo RUN directory not found: "%DRIVE%"
	exit /b 1
)

"%X16EMU%" -fsroot "%DRIVE%" -startin "%DRIVE%\SRC" -scale 2 -rtc -joy1 %*

endlocal
