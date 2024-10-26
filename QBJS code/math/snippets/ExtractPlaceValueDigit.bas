' Oct2024 Jawz-77 ExtractPlaceDigit.bas
' extracts a digit from the desired place value of a number
' written using github/boxgaming/qbjs
' Note: if placeValue is set above or below the wholeNumber then answer is zero.
cls: randomize timer

dim wholeNumber   'user number
dim placeValue    'desired place value
dim answer        'extracted digit
dim selectExp     'select a place value exponent

' set place value to extract must be 1, 10, 100, 1000, ...
selectExp = int(rnd * 7)
placeValue = 10 ^ selectExp

' randomize a whole number to work with 
do 'loop to make sure number
wholeNumber = int(rnd * placevalue *100 )+1
loop until wholeNumber > (placevalue -1) 

'process digit extraction from whole number
answer = ExtractPVDigit(wholeNumber, placeValue)

'display results
print "The whole number to be used is: "; wholeNumber 
print
print "The place value to extract the digit is: "; placeValue
print
print "The extracted digit corresponding to the place value is: ";answer

function ExtractPVDigit (wholeNumber, placeValue)
  'process wholeNumber and extract desired digit corresponding to placeValue
  '  1. adds in a correction factor to compensate for javascript precision
  '  2. formula moves the decimal point above the desired place value
  '  3. subtract the whole number from the  decimal containing desired place value number
  '  4. move the decimal point to place the desired number in the whole number
  '  5. finally find the whole number value to drop the decimal and store the whole numbe

  dim moveDecimal,cFactor, removeWholeNum, answer
  cFactor = .0001 ' float correction factors to compensate for javascript
  moveDecimal = (wholeNumber + cFactor) / (placeValue * 10)
  removeWholeNum = moveDecimal - int(moveDecimal)
  moveDecimal = removeWholeNum * 10
  answer = int(moveDecimal)
  ExtractPVDigit = answer
end function
