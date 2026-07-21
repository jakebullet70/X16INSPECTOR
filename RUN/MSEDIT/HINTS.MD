
# HINTS - A place for generic tips and tricks

 You can add tips and tricks here, just load this up in the editor and
 add what you want

 Keep lines under 79 characters - the viewer wraps at the second-to-last
 column, and a line that runs one character past it leaves that single
 character stranded on the next row.

## EXPORT TOKENIZED BASIC PROGRAMS TO TEXT
 Ancient arcane knowledge of Kelli:

 To export tokenized basic programs back out as text files, do the
 following:

 OPEN 2,8,2,"PROGRAM.BAS,S,W":CMD2:LIST
 PRINT#2:CLOSE2

 Replace program.bas as the desired filename. Replace "2" with desired
 File number if 2 is already in use.

 Use "@:PROGRAM.BAS" to overwrite existing file if it exists.

### TRIM THE FILE AFTERWARDS

 CMD leaves the screen redirected until CLOSE2, so the file catches more
 than the listing. Measured on PAINT16C.PRG (17883 bytes, 919 lines):

* TWO BLANK LINES at the top - the echo of the OPEN/CMD/LIST line itself.
* A trailing "READY." and a blank line at the bottom.

 So delete two lines from the top and two from the bottom.

 Do NOT expect to feed the result straight back through BASLOAD. BASLOAD
 source has NO line numbers, and it does not strip them - tested,
 "10 PRINT" came back out as the statement 10PRINT under a line number of
 BASLOAD's own. It reports no error either: it tokenizes the garbage
 happily and you get ?SYNTAX ERROR at RUN time. Same for a stray READY.
 line. Going back to BASLOAD needs a real converter that strips the
 numbers and turns every GOTO/GOSUB target into a label.

 Everything between those is exact: the 919 program lines came out byte
 for byte identical to the PRG2BASLOAD detokenizer, including all 295
 graphics characters inside strings. Line ends are bare CR, not CRLF -
 EDIT opens either.
