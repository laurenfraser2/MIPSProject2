.data
char_array: .space 90000 #create space for characters
invalid_empty: .asciiz "Input is empty."
invalid_input: .asciiz "Invalid base-32 number."
longInput: .asciiz "Input is too long." 
.text
  main:
 	li $v0, 8  # code call to get input from a user
 	la $a0, char_array #loads buffer into address
      	li $a1, 90000 # allocates buffer space for string
      	syscall
      	
      	li $s2, 0
      	lb $t0, 0($a0)
      	beq $t0, 10, invalid_empty #if the first chat is a new line
      	beq $t0, $0, invalid_empty #if the first char is null
      	syscall 
      	
      	li $t5, 10                                  # load new line char ASCII into $t1
    	li $t6, 32 
    	syscall 
    	
      	loop:
    	lb $t0, 0($a0)		#
    	beq $t0, $t5, exitLoop
    	beq $t0, $t2, skip
      	beq $t0, $t6, exitLoop
      	bne $s2, $zero, TooLong 
      	li $s2, 1                                   # once program reaches this point, 1 is loaded into $s2
    	la $a1, filtered_input                      # load address of filtered_input
    	sb $t0, 0($a1)
    	lb $t0, 1($a0)
    	sb $t0, 1($a1)
    	lb $t0, 2($a0)
    	sb $t0, 2($a1)
    	lb $t0, 3($a0)
    	sb $t0, 3($a1)
    	addi $a0, $a0, 3 
      	
      	TooLong:
      		la $a0, longInput
      		li $v0, 4
      		
      	exitLoop:
      		beqz $s2, InvalidEmpty
      		syscall
      	
      	InvalidEmpty: #error message for empty input
      		la $a0, invalid_empty
      		li $v0, 4
      		syscall
      		
      	InvalidBN:  #error message for invalid base number
 		la $a0, invalid_input
  		li $v0, 4
		syscall
      		li $v0, 10 #exits
      		syscall
      	MakeIntoNumber:
      		sub $t0, $t0, 48 #take away 48 from the ascii value to get to the real number
      		syscall
      	check_string:
      		lb $t0, 0($t1)
      		beqz $t0, convertSet
      		beq $t0, $t2, convertSet
      		beq $t0, $t2, skip
      		#blt $t0, 32, InvalidBN #if space, invalid 
      		blt $t0, 48, InvalidBN #if the ascii value is less than 48 (digit is smaller than 0)
      		blt $t0, 58, convertSet #makes sure value is 0-9
      		blt $t0, 65, InvalidBN #58-64 invalid
      		blt $t0, 87, convertSet #NEXT would be capital -- checks if its A-V
      		blt $t0, 97, InvalidBN #Past scope of A-V
      		blt $t0, 118, convertSet #these are the lowercase a-v
      		blt $t0, 128, InvalidBN #everything else is invalid 
      		
      	skip:
    	addi $a0, $a0, 1
    	jal loop
    	
      	convertSet:

		move $a0, $t4

		addi $t7, $t7, 0

		add $s0, $s0, $t0

		addi $s0, $s0, -1

		li $s3, 3

		li $s2, 2

		li $s1, 1

		li $s5, 0
		
		blt $t0, 48, #WHERE TO JUMP TO HERE EX: translate_number

      		