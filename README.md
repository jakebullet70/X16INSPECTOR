# X16 INSPECTOR

**Inspector Clue-Less** — a Clue-style "whodunit" deduction game for the
[Commander X16](https://www.commanderx16.com/).

> **Status:** playable, ~99% complete. Active "refactor and finish" work is
> tracked in [TODO.md](TODO.md).

Mr Kim has been murdered at the Greenfield Mansion. Five house guests —
**John, Stacey, Bill, Suzy** and **Andy** — were all present between 1 and 9
o'clock. As Inspector Clue-Less, question the suspects, take notes, and deduce
**who** did it, at **what time**, and in **which room**. Careful, though: the
guilty party will lie to you some of the time.

The game is written in **[BASLOAD](https://github.com/stefan-b-jakobsson/basload-rom)-format
BASIC** — the X16 ROM's source-level BASIC tokenizer (labels instead of line
numbers, long identifiers, `#`-directives). Source lives in [SRC/](SRC/).

---

## How to play

- **Deduce three things:** the murderer (1 of 5 suspects), the time of the
  murder (1–9 o'clock), and the room (1 of 6: garage, closet, office, kitchen,
  library, basement).
- **Question suspects** about a time or a room. Their answers place them (and
  sometimes others) in a room at a given hour.
- **The murderer lies** part of the time — cross-check answers to find the
  inconsistency, and the room where the host was found dead.
- **Solve the case** when you're confident. Get all three parts right to earn a
  commendation; miss any and the Chief is... disappointed.

**Controls:** arrow keys navigate, **Return / joystick fire** selects. A
joystick is auto-detected. Options (Difficulty · Sound · Theme) are on the
title screen's **Options** menu and persist between sessions.

---

## Building

BASLOAD is a **ROM tool that runs on the X16 itself** (there is no host-side
compiler), so building happens inside the emulator or on real hardware.

### Requirements

- The Commander X16 emulator [`x16emu`](https://github.com/X16Community/x16-emulator)
  **R49 ("Pyrite") or newer** (BASLOAD must be present in the ROM), or real
  hardware with a BASLOAD-capable ROM.

**Steps** (manual for now — a dev build menu, launcher scripts, and an on-X16
batch "master builder" are planned; see [TODO.md](TODO.md)):

1. Launch the emulator with this repository as its filesystem root, so the
   `/SRC` and `/SPRITES` paths resolve:

   ```text
   x16emu -fsroot <path-to-this-repo>
   ```

2. At the BASIC `READY.` prompt, tokenize each program (each source sets its own
   output name via `#SAVEAS`):

   ```basic
   BASLOAD "/SRC/INSPECTOR.BL"     : REM -> INSPECTOR.PRG
   BASLOAD "/SRC/INS-ABOUT.BL"     : REM -> INS-ABOUT.PRG
   BASLOAD "/SRC/INS-OPTIONS.BL"   : REM -> INS-OPTIONS.PRG
   ```

   Each `.BL` pulls in its dependencies via `#INCLUDE`, so these three commands
   build the whole game.

3. `RUN` to play the program you just built, or `LOAD "INSPECTOR.PRG"` then
   `RUN`.

> The three `.PRG`s load one another by name and share the working directory,
> and the game writes scratch files (`MYSCREEN.BIN`, save flags) there at run
> time — so build and run from the same, writable directory. `.SYM` symbol
> files and `MYSCREEN.BIN` are build/runtime artifacts and are git-ignored.

---

## Project layout

| Path | Contents |
| --- | --- |
| [SRC/](SRC/) | BASLOAD BASIC source (`*.BL`) — the game |
| [SPRITES/](SPRITES/) | Suspect mugshot sprites (`SUSPECTS2.SPR`) + editor projects |
| [BUILD/](BUILD/) | Tokenized build output (`*.PRG`) |
| [DOCS/](DOCS/) | X16 reference, BASLOAD docs, notes |
| [RUN/](RUN/) | On-X16 dev tools (XFMGR file manager, MSEDIT editor) |
| [TOOLS/](TOOLS/) | Host-side helper tools |
| [OLD-MISC-VERS/](OLD-MISC-VERS/) | Original C64/+4 sources & the 1979 magazine scan |

---

## History & credits

The original **"Inspector Clew-So"** was published by **Ron Carlson** in
*Creative Computing*, June 1979 (Vol. 5, No. 6). It was ported to the Commodore
16 by **Andreas Zilla** (in German) in 1987, and to the C64 by **KWAYNE** in
2024.

This **Commander X16** version is by **Steven De George SR** and
**Steven De George JR** (sadLogic), 2024.

- 1979 original (Creative Computing scan):
  <https://archive.org/details/creativecomputing-1979-06/page/n105/mode/2up>
- C16 / +4 version:
  <https://plus4world.powweb.com/software/Inspektor>
- C64 version:
  <https://kwayne.itch.io/inspector-commodore-64>

---

## License

Released into the **public domain** under the [Unlicense](LICENSE). Do whatever
you like with it.
