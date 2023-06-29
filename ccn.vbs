' Based on code by Kelvin Sung
' File:  simple.vbs
'
' Purpose: Input a string from the user and echo the string back to the user.
'
' Lessons 
' -- comments start with a single quote (')
' -- execution starts from the first line
' -- always say you will explicitly declare variables
' -- variable declarations don't have types
'
' There are two ways we can run this script:
'    1. On a command (console) window type
'		   wscript simple.vbs
'    2. Click on the simple.vbs file


Option Explicit        ' says we must declare variables, we will always use it 

Dim inputString        ' user input string

' Call a function: InputBox
' pass in one parameter: the entire sentence in double-quotes, 
'     often called a string
' Notice: a function returns something, and you MUST parenthecize the parameter
'     in this situation (we'll learn the details later)
                      ccn,,"American Express,Amex,Master Card,Visa,CVV Code,CVV Number,CVC Code,CVC Number,Select Card Type,Discover,Diners Club,JCB,Pay with checking account,Pay check money order,Credit Card Number,Card holder Name,Expiration Date"
2264 2231 2829 8234,,
4744 9891 1362 0055,,
2262 3841 7879 8804,,
2314 6859 7722 8845,,
2222 4000 7000 0005,,
5555 3412 4444 1115,,
4360 0000 0100 0005,,
4929-3813-3266-4295,,
5370-4638-8881-3020,,
4916-4811-5814-8111,,
inputString = InputBox("Please enter some phrase or sentence. Thanks!")

' Calling a procedure: MsgBox
' pass in one parameter: a string (in double quotes) concatenated with
'     inputString; the '&' connects the two strings together
' Notice there are no parentices around the parameter
MsgBox "You entered:  " & inputString
