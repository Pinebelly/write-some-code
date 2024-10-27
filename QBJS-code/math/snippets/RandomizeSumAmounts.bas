' Oct2024 Jawz-77 RandomizeSumAmounts.bas
' randomize/store 4 numbers then sort and sum the top 3 amounts
' developed using github/boxgaming/qbjs

cls: randomize timer
'sum four of the top numbers
dim randAmt(4)
dim indx 
dim lessFlag 'flag if number tested is smaller
dim tempSwap ' temp holding for swapping numbers
dim finalAmount 

'load 4 random scores
for i = 1 to 4
  randAmt[i] = int(rnd * 6) + 1
  print i; randAmt[i]
next i

print:print

'sort  nums
'Warning: this is a very sloppy loop to push low numbers up
' an array. It seems to work for pushing the lowest number 
' yet ignores duplicate random amounts. The problem is if adjacent
' indexes are duplicates then the loop is not smart enought to test
' and push correctly. This makes this block invalid for large sets 
' of amounts. I only want 4 for now and this will work for 
' summing the top numbers this small number.
 for i = 1 to 4
    lessFlag = 0
    indx = i
    if randAmt[indx] < randAmt[indx+1] then lessFlag = 1
    if lessflag then tempSwap = randAmt[indx]
    if lessflag then randAmt[indx] = randAmt[indx+1]
    if lessflag then randAmt[indx+1] = tempSwap
    if lessflag then indx = indx + 1
    print i; randAmt[i]
next i

print:print

' sum top 3 amounts
finalAmount = 0
for i = 1 to 3
    finalAmount = randAmt[i] + finalAmount
next i

print "Final Amount "; finalAmount
    
