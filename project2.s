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
      leadingSpaces:  #Remove leading spaces
	li $t8, 32      #Save space character to t8
	lb $t9, 0($a0)
	beq $t8, $t9, deleteSpace
	move $t9, $a0
	j checkLength