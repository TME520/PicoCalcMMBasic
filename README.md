# PicoCalcMMBasic
My experiments using PicoMite MMBasic on the almighty PicoCalc

## About PicoCalc

The PicoCalc is a pocket-sized calculator-style computer powered by a Raspberry Pi Pico, designed for standalone programming, retro-style applications and everyday tinkering.

[Official website](https://www.clockworkpi.com/picocalc)

## About PicoMite MMBasic

MMBasic is a full featured implementation of the BASIC language with floating point, integer and string variables, arrays, long variable names, a built in program editor and many other features.

[Official website](https://geoffg.net/picomite.html)

## Disclaimer

This software is provided "as is", without warranty of any kind. The author assumes no responsibility for any damages, data loss, financial loss, or catastrophic events (including but not limited to nuclear war) resulting from its use.

## What you will find here

Mostly BAS files that can be copied directly to your PicoCalc.

## Cheat Sheet

### BASIC

```
' Print text on the screen
PRINT "FooBar"
? "BarFoo"
?"BarFoo

' Use the SD card as current drive
DRIVE "B:"
DRIVE"B:

' List files in current folder
FILES

' Go to folder ASSETS
CHDIR "ASSETS"
CHDIR"ASSETS

' Edit file GAME.BAS
EDIT "GAME.BAS"
EDIT"GAME.BAS
```

### The editor

#### Basic usage

F1: Console

F2: RUN

F3: LIST

F4: EDIT

You can start the editor by typing `EDIT "MYFILE.BAS"`

#### Copy/paste

1. Press F4
2. Use the arrows to select text
3. Press F4 to Cut or F5 to Copy
4. Use the arrows again to position the cursor
5. Press F5 to Paste

#### About long lines

The editor supports 40 columns; lines longer than that cannot be edited in one go.

Here is how to deal with lines longer than 40 characters:

```
PRINT "Use at your own risk; I am not _
 liable for anything."
```

Insert `" _"` at the end of the line, leaving 38 characters effectively usable for your code, and write the rest on another line.
