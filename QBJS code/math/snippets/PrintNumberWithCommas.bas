' Oct2024 Jawz-77 PrintNumberWithCommas.bas
' write the expanded notation of a randomized number
' developed using github/boxgaming/qbjs

cls: randomize timer
const maxWNum = 1000000 ' set max workingNumber to one million
Dim workingNumber 'number to express as expanded notation
Dim startPlaceValue

'randomize the working number
workingNumber = int(rnd * maxWNum) + 1


' display results
print "The working number is: "; workingNumber

startPlaceValue = findPVStart(workingNumber)

print "The place value where number starts is: 10 ^"; startPlaceValue
print "The number with commas inserted is: "; numWithComma(workingNumber, startPlaceValue)

''''''''''''''''''
'''''''''FUNCTIONS
''''''''''''''''''

function findPVStart (workingNumber) ' find starting place value of number
    'Variables
    dim rightZero: rightZero = 0 'count down zeros 
    dim extractNumber: extractNumber = 0 'extract digit to examine
    
    ' count the number of zeros to the right to calculate numLength
    ' NOTE: there are a total of 10 place values but start at 0 for ones place
    for rightZero = 6 to 0 step -1
        'extract from right digit to evaluate from the right
        extractNumber = ExtractPVDigit(workingNumber, 10 ^ rightZero)
        if extractNumber > 0 then exit for    
    next rightZero
    
    ' return the place value of the starting number
    findPVStart = rightZero
end function

function numWithComma(workingNumber, placeValueStart) 'print a number with commas
    dim commaNumber 'string to hold the number with commas inserted
    dim catNum: catNum = "" 'concantenated number   
    dim i 'counter
    
    'extract each digit and insert into string
    for i = placeValueStart to 0 step -1       
        if i = 2 then  catNum = catNum + ","
        if i = 6 then  catNum = catNum + ","
        catNum = catNum + ExtractPVDigit(workingNumber, 10 ^ i)
    next i
    numWithComma = catNum
end function


function ExtractPVDigit (wholeNumber, placeValue)
' taken from github/jawz-77/ExtractPlaceDigit.bas
  dim moveDecimal,cFactor, removeWholeNum, answer
  cFactor = .0001 ' float correction factors to compensate for javascript
  moveDecimal = (wholeNumber + cFactor) / (placeValue * 10)
  removeWholeNum = moveDecimal - int(moveDecimal)
  moveDecimal = removeWholeNum * 10
  answer = int(moveDecimal)
  ExtractPVDigit = answer
end function