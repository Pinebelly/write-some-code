#### Order in which source code snippets was added

- Goal to write a program that creates place value tables for whole numbers.
1. ExtractPlaceValueDigit.bas
2. PrintNumberWithCommas.bas

#### Lessons learned:  
  1. When performing floating point math in qbjs the quirkness of the underlying javascript engine may cause precision issues. Using a correction factor by applying an opposite operation to the numbers and pushing the decimal out can possibly correct for this in some cases.
  2. QBJS function parameters do not need a dim statement it seems the underlying javascript handles this. Javascript function paramaters are passed with no type specified or any checks.
