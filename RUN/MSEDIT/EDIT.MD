# EDIT - an MS-DOS-EDIT-style text editor / IDE for the Commander X16

 A full-screen text editor & BASLOAD IDE with a menu bar, dropdown menus and a status line. The document lives in banked RAM, so files are not capped by low memory. It has selection and clipboard, undo / redo, find / replace, optional BASIC
 syntax colouring and line numbers, soft word wrap, colour themes, and can
 hand a file to the ROM BASLOAD tool to tokenize and run it.

 Open the menus with ESC or ALT (the Commodore key); the highlighted red
 letter is each menu's accelerator (e.g. ALT+F = File). Everything on the
 menus also has a shortcut key, listed below.

## MOVEMENT
   Arrows        Move the cursor
   Ctrl+Lt/Rt    Jump a word left / right
   Home / End    Start / end of the line
   PgUp / PgDn   Page up / down
   Ctrl+PgUp/Dn  Top / bottom of the file
   Ctrl+J        Go to a line number

## SELECTING TEXT
   Shift+arrows  Extend the selection as the cursor moves
   Shift+Home    Select to the start of the line
   Shift+End     Select to the end of the line
   (Any un-shifted cursor move clears the selection.)

## EDITING
   Tab           Insert 4 spaces
   Insert        Toggle insert / overwrite (INS / OVR on the status bar)
   Caps Lock     Toggle CAPS - types letters as capitals (CAPS shows on
                 the status bar). It is a software toggle, so unlike the
                 real Caps Lock it never breaks the ALT menus. Shift is
                 unaffected: to type one lowercase letter, turn CAPS off.
   Enter         Split the line (auto-indents to match the line above)
   Backspace     Delete the character to the left / join lines
   Ctrl+K        Delete the current line
   Ctrl+Up/Dn    Move the current line up / down
   Ctrl+Z        Undo            Ctrl+U   Redo
                 (12 levels each, kept per document - every open
                 window keeps its own undo / redo history)

## CLIPBOARD
   Ctrl+C        Copy the selection, or the whole line if nothing is selected
   Ctrl+X        Cut  the selection, or the whole line if nothing is selected
   Shift+Del     Cut  (the same as Ctrl+X)
   Ctrl+V / F4   Paste

## FILES
   Ctrl+N        New document
   Ctrl+O        Open a file (file picker)
   F2            Save   (Save As... on the File menu prompts for a name)
   File > View   Show any file read-only in the viewer, without opening it
                 into the document (handy for files too big to edit)

## AT THE FIND / REPLACE PROMPTS
   Up / Down     Recall the last 8 terms you typed ("^Hist" on the bar
                 marks a prompt that has history). Find and Replace
                 each keep their own list; Down past the newest one
                 blanks the field. Find opens EMPTY unless you had
                 text selected - the old term is one Up away.

## SEARCH
   Ctrl+F / F6   Find (wraps around; Cmdr+W toggles whole-word on the bar)
   Ctrl+G / F3   Find next
   Ctrl+R / F8   Replace - interactive: Y replace, N skip, A all, Esc stop

## DEV  (the Dev menu)
   F5            Save the file and run it through the ROM BASLOAD tool
   F8            After BASLOAD, at the BASIC READY prompt, return to EDIT
   Make Backup   Write a .bak copy of the current file
   Delete SYM    Erase every *.SYM file in the current folder (BASLOAD
                 symbol files) - all at once, no prompt
   Session file  Create / delete this folder's session (see below)
   Syntax Color  Toggle BASIC syntax colouring
   Line Numbers  Toggle the line-number gutter
   Colours       Config... (Help menu) opens the theme picker, EDCFG

## SESSION FILE  (Dev menu: Create / Delete Session file)
   A session remembers the documents you had open in one folder. Choosing
   "Create Session file" writes a hidden .EDIT.SESSION in the current
   folder that records the files loaded in slots A / B / C, each file's
   cursor position, and which slot was active.

   Next time EDIT starts in that folder it reopens those files and drops
   you back exactly where you left off. While the session is on, every
   exit updates the file automatically - no prompt - so it always reflects
   the files you currently have open. "Delete Session file" removes it and
   turns the feature off for that folder.

   It is a Dev-menu feature: with the Dev menu hidden the session is
   ignored. A pending BASLOAD / Config reload takes precedence over it,
   and a file that has been moved or deleted just leaves its slot empty.

## IN THE FILE VIEWER  (File > View, and Help > Keyboard which shows this file)
   PgDn / PgUp   Page down / up        T  Top        B  Bottom
   H             Toggle hex / text (hex needs an 80-column screen)
   F             Find a string
   N / Space     Repeat the search (find next)
   Q / Esc       Quit back to the editor

## EMULATOR vs REAL HARDWARE
   The x16emu emulator window intercepts a few Ctrl chords before they reach
   the program, so those actions also have function-key aliases that work in
   both places:

     Action     Ctrl key      Alias
     Find       Ctrl+F        F6
     Replace    Ctrl+R        F8
     Paste      Ctrl+V        F4

   ALT is the left Alt key in the emulator, the Commodore (C=) key on real
   hardware. Arrows, function keys and the plain keys behave identically.

 EDIT  -  (c) sadLogic 2026  -  written in Prog8 with help from AI
 Press Q or Esc to return to the editor.
