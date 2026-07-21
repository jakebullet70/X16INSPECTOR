# BASLOAD findings

Measured behaviour of the X16 ROM BASLOAD utility (R49) and of BASIC performance, gathered
while building `SRC/PRG2BASLOAD.BASL`. Everything here was tested on the machine, not inferred
from documentation — where a number appears, it came off the jiffy clock or a byte comparison.

Developer reference. This file is not shipped with EDIT; the help files the viewer loads are
`SRC/edit.md`, `SRC/basload.md` and `SRC/hints.md`.

## BASLOAD does not treat DATA as literal

The BASIC cruncher stops tokenizing after `DATA` and copies the rest of the statement byte for
byte. BASLOAD does **not**. It lexes DATA content as identifiers, so

    DATA HELLO WORLD

tokenizes to `DATA HELLOWORLD` — one joined word — and `READ` hands back `"HELLOWORLD"`. No
error, no warning. Quote any DATA item containing a space:

    DATA "HELLO WORLD"

This bites hardest when converting an existing tokenized program back to BASLOAD source,
because the original ran correctly with the space.

## Source line limit: 255

* A source line of 255 characters loads fine and is **not** truncated.
* 256 or more gives `ERROR: LINE TOO LONG` and the whole file fails to load. A hard error, so
  it can never corrupt a program silently.
* `#MAXCOLUMN` caps at 255 as well. `#MAXCOLUMN 256` (or 300, or 999) is rejected outright with
  `ERROR: INVALID PARAMETER` on the directive's own line.
* The default is lower than 255 — a 250-character line passed without the directive, but 254
  did not. Emit `#MAXCOLUMN 255` to get the full width.

This matters when generating BASLOAD source from a crunched program: putting the mandatory
spaces back around keywords grows every line, so a line that was legal at 250 characters
crunched can cross 255 once respaced. Split at a `:` — but only when there is no `IF` on the
line, because splitting moves the trailing statements out of the conditional and changes what
the program does.

## Label-accepting statements

From the ROM's `last_token` test — the statements after which BASLOAD will accept a label in
place of a line number:

| token | statement |
|-------|-----------|
| `$89` | GOTO |
| `$8d` | GOSUB |
| `$8c` | RESTORE |
| `$9b` | LIST |
| `$a7` | THEN |
| `$a4` | TO (only after `$cb` GO) |

`RUN` (`$8a`) is **not** in the set, so `RUN <label>` will not resolve.

## Identifiers

The scanner is greedy over `A-Z`, `0-9`, `_` and `.`. A `$` is not an identifier character, so
`SAVE$` lexes as the `SAVE` keyword plus a stray `$` and fails with `?TYPE MISMATCH`. A longer
run that merely contains a keyword is fine — `LOAD.BANK` works — so the hazard is specifically
a keyword followed by a non-identifier character.

## How fast is BASIC, really

Measured on `PAINT16C.PRG` (17883 bytes, 919 lines) with PRG2BASLOAD. All figures are X16
seconds off the jiffy clock, **not** host wall clock — under emulator warp those differ by
roughly 4x, and `TI` is the one that matches real hardware.

| implementation | task | time |
|---|---|---|
| BASIC, ROM interpreter | plain detokenize | 5:43 |
| BASIC, ROM interpreter | full BASLOAD convert | 12:22 |
| BASIC compiled with GPC | full BASLOAD convert | 1:51 |
| prog8 | plain detokenize | 1.2 s |

GPC is worth about 6.7x over the ROM interpreter, and prog8 another ~40x on top of that. The
prog8 and BASIC detokenizers produce byte-identical output, so this is a fair comparison and
not one of them cutting corners.

Note the two BASIC rows measure different work: the plain detokenize is one walk, the BASLOAD
convert is two (the second resolves labels), which is most of the 5:43 → 12:22 gap.

The practical read: GPC makes BASIC fast enough for a tool you run now and then, and you keep
the ability to edit the source on the machine itself. Reach for prog8 when something has to be
interactive.

## Exporting tokenized BASIC as text (CMD/LIST)

The `OPEN 2,8,2,"@:PROGRAM.BAS"` + `CMD 2` + `LIST` + `CLOSE 2` route works, with caveats found
by measurement on PAINT16C (17883 bytes, 919 lines).

**Trim afterwards.** `CMD` leaves the screen redirected until `CLOSE 2`, so the file catches
more than the listing: two blank lines at the top (the echo of the `OPEN`/`CMD`/`LIST` line
itself) and a trailing `READY.` plus a blank line at the bottom. Delete two lines from each end.

Everything between is exact — all 919 program lines came out byte for byte identical to the
PRG2BASLOAD detokenizer, including 295 graphics characters inside strings. Line ends are bare
CR, not CRLF; EDIT opens either.

**It only works typed in by hand.** `LOAD` inside a running program replaces that program and
restarts it, so these lines cannot be wrapped in a BASIC program of your own — execution never
returns to the next line. Tested: the line after a `LOAD` never runs.

**The listing is crunched**, exactly as typed: `IFL=0THENL=1`. Readable, but the keyword
boundaries are gone, which matters if anything downstream has to re-parse it. A tool walking
the tokenized file itself still knows where every keyword ends.

**Do not feed the result straight back through BASLOAD.** BASLOAD source has no line numbers
and does not strip them — tested, `10 PRINT` came back out as the statement `10PRINT` under a
line number of BASLOAD's own. It reports no error: it tokenizes the garbage happily and you get
`?SYNTAX ERROR` at RUN time. Same for a stray `READY.` line. Going back to BASLOAD needs a real
converter that strips the numbers and turns every GOTO/GOSUB target into a label — which is
what `SRC/PRG2BASLOAD.BASL` is for.
