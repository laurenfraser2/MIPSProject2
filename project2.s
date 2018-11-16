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
	deleteSpace: #initialize label to get rid of beginning spaces
	 addi $a0, $a0, 1
	 j leadingSpaces
	checkLength:   #find the length of the input
	 addi $t0, $t0, 0  #start count at zero
	 addi $t1, $t1, 10  #put character into t1
	 add $t4, $t4, $a0  #keep what was originally in a0
	lengthLoop:
	 lb $t2, 0($a0)   #Load the next character to t2
	 beqz $t2, endLoop   #End loop if null character is reached
	 beq $t2, $t1, endLoop   #End loop if end-of-line is detected
	 addi $a0, $a0, 1   #continue the string pointer
	 addi $t0, $t0, 1
	 j lengthLoop
	endLoop:
	 beqz $t0, emptyInput   #print empty input message if length is 0
	 slti $t3, $t0, 5      #check whether or not count is > 4
	 beqz $t3, tooLong #print out too long message if count > 4
	 move $a0, $t4
	 
	 
	 