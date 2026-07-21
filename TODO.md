# X16 INSPECTOR — TODO / Roadmap

Working roadmap for the "refactor and finish" push. The game is ~99% playable;
what's left is tooling, cleanup, and a handful of finishing touches.

Legend: `[ ]` open · `[~]` in progress · `[x]` done

---

## P0 — BASLOAD master builder (on-X16 batch build tool)

**Goal:** a builder that runs on the X16 (emulator or hardware) and tokenizes a
**list** of `.BL` source files through the ROM BASLOAD tool in one go, instead of
BASLOAD-ing each program by hand.

**Why it's non-trivial.** `BASLOAD "FILE.BL"` tokenizes the source *into the BASIC
program area* — it replaces the currently running program. So a plain-BASIC loop
that BASLOAD-es file after file clobbers itself on the first build. Any batch
builder has to work around that.

**Reference — how MSEDIT already does it** (`RUN/MSEDIT/`, see `EDIT.MD` Dev menu):
- **F5** = save the file and run it through the ROM BASLOAD tool.
- **F8** = after BASLOAD, at the BASIC `READY.` prompt, return to EDIT.
- It survives the round-trip because EDIT is **prog8** (machine code living
  *outside* the BASIC program RAM), and it calls BASLOAD through the documented
  API at **`$C000`** (filename buffer `$00:BF00`, len in `$02`, device in `$03`,
  return code in `$04`; full spec in `DOCS/BASLOAD/basload.md` "API" section).

**Two implementation paths (pick one):**

- [ ] **A. ML / prog8 host using the `$C000` API.** Loop over the list, set up the
  filename buffer, `SYS $C000`, read the return code, report per-file OK/err,
  continue. Robust — the host is never clobbered. Most like EDIT. Heaviest to
  write (needs the prog8 toolchain, already on this machine at
  `C:\8bitProgramming\prog8`).

- [ ] **B. Self-hosting BASLOAD-BASIC builder (keyboard-buffer + self-reload).**
  Extends the old `AUTOBOOT` trick (print `BASLOAD"file"`, stuff the keyboard
  buffer via `SYS $FEC3` to execute it, then chain). To batch, the builder must
  **re-load itself** after each build and advance an index kept in a **durable**
  spot (a 1-byte `BUILD.IDX` file is safest — zero page is clobbered by BASLOAD).
  Reads the target list from a text file (e.g. `BUILD.LST`).

**Open questions to resolve before building:**
- [ ] Keyboard buffer is ~16 bytes — too small for `LOAD"BUILDER.PRG":RUN`. Use a
  short 1-line loader stub (like the existing `RUN/ED`, `RUN/XT` loaders) or a
  remapped function key (AUTOBOOT already remaps F-keys) to re-enter the builder.
- [ ] Stop-on-error vs. continue-and-report; where the error line/message goes.
- [ ] Output location: builder `CD`s into the output dir first so each program's
  `#SAVEAS "@:NAME.PRG"` lands there (includes use absolute `/SRC/...`, so they
  still resolve regardless of the working directory).
- [ ] List format: bare source paths (output names already live in each file's
  `#SAVEAS`), or `source -> output` pairs for flexibility.

**Build list for this project** (the batch the tool must handle):
| Source | Output |
|---|---|
| `/SRC/INSPECTOR.BL`   | `INSPECTOR.PRG`   |
| `/SRC/INS-ABOUT.BL`   | `INS-ABOUT.PRG`   |
| `/SRC/INS-OPTIONS.BL` | `INS-OPTIONS.PRG` |
| `AUTOBOOT.BL`         | `AUTOBOOT.X16`    |

---

## P1 — Build system & launchers

- [ ] Restore **`AUTOBOOT.BL`** dev menu (deleted in the "re-org" commit) for the
  current `/SRC` layout — interim single-file build entry point until the master
  builder lands. Old version is in git history (`git show HEAD~1:AUTOBOOT.BL`).
- [ ] **`build.bat`** — launch x16emu with `-fsroot` = project root, boot into the
  build menu. Emulator path configurable (env var / one place to edit), not
  hard-coded like the old `LOCAL.BAT`.
- [ ] **`run.bat`** — launch straight into the built game.
- [ ] Decide the release/dist layout: a dedicated, self-contained runnable folder
  (the 3 `.PRG`s + a `SPRITES/` copy). Note `RUN/` is already taken by the dev
  tools (XFMGR, MSEDIT), so use a different name (e.g. `DIST/` or `RELEASE/`).
- [ ] Remove stale **`x16emu.bat`** — it's copied from another project (talks about
  a "GPC compiler", a `testing/` dir and `bin/x16emu/` that don't exist here).
- [ ] (stretch) Headless build via `x16emu -testbench` so `build.bat` can produce
  PRGs unattended.

## Runtime file map (for dist / .gitignore)

- Reads: `/SPRITES/SUSPECTS2.SPR` (absolute), sibling `*.PRG` by bare name.
- Writes at runtime: `MYSCREEN.BIN` (screen save/restore scratch — **never ship**,
  already gitignored) → the working dir must be writable.
- Debug artifacts: `*.SYM` (gitignored).

---

## P2 — Cleanup

- [ ] Delete `SRC/new 2.txt` — a prog8 `history_prompt` module with unresolved
  `<<<<<<< / >>>>>>>` merge-conflict markers; not part of this game.
- [ ] Reconcile sprite files: `SUSPECTS.SPR` vs `SUSPECTS2.SPR` (game loads `2`),
  and the two `.spriteproject` files. Keep the live one, archive the rest.
- [ ] `STR-REPLACE.BL` is included-out (commented) and unused — remove or revive.
- [ ] `OPTIONS.KB.JOY` is flagged "NOT USED ANYMORE" (`INSPECTOR.BL:20`) — remove.

---

## P3 — Refactor targets

- [ ] Replace leftover line-number labels (`LINE580`, `LINE870`, `LINE940`,
  `LINE1020`, `LINE1110`…) with meaningful names — porting scars from the C64
  source.
- [ ] `NOTES.BL:68` — menu colour vars need refactor (noted in code).
- [ ] Swap `#DEFINE` constants for `#CONST` once BASLOAD supports it
  (`INS-OPTIONS.BL:26` TODO).
- [ ] Document the `BUGLINE` workaround (`INSPECTOR.BL:191+`) — the extra-LF-between-
  PRINTs issue — or find a cleaner fix.

## P4 — Finish the game (from in-code TODOs)

- [ ] `INS-ABOUT.BL` — "needs work / something flashy" (currently a plain text card).
- [ ] Success/failure endings — add sound cues if sound is on
  (`INSPECTOR.BL:383,400`).
- [ ] Optional "blink" sound when changing the time (`INSPECTOR.BL:150`).
- [ ] Confirm difficulty tuning (easy `.3` vs hard `.2`, `INSPECTOR.BL:181-182`).

---

## Housekeeping

- [ ] Rewrite `README.md` for GitHub (build/run instructions, credits, layout).
- [ ] Keep a short review/findings note in `DOCS/`.
