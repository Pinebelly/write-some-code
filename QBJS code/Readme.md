#### Lessons learned:  
  1. When performing floating point math in qbjs the quirkness of the underlying javascript engine may cause precision issues. Using a correction factor by applying an opposite operation to the numbers and pushing the decimal out can possibly correct for this in some cases.
