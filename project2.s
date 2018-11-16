.data
    emptyInputMessage:	.asciiz "Input is empty."
    tooLongMessage: .asciiz "Input is too long."
    invalidBaseMessage:   .asciiz "Invalid base-34 number."
    userInput:		.space 90000
.text
 main:
	li $v0, 8       #Obtain user's input as text 
	la $a0, userInput
	li $a1, 90000
	syscall
      	