@echo off
rem ---------------------------------------------------------------------------
rem  X16 INSPECTOR - run the game
rem
rem  For now this just boots the RUN\ environment via x16emu.bat. Once the game
rem  is built into RUN\ (INSPECTOR.PRG), this will load and run it directly.
rem  Any arguments are passed through to x16emu.bat / the emulator.
rem ---------------------------------------------------------------------------
call "%~dp0x16emu.bat" %*
