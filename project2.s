.data
char_array: .space 90000 #create space for characters
invalid_empty: .asciiz "Input is Empty"
.text
 main:
 	li $v0, 8  # code call to get input from a user
 	la $a0, char_array #loads buffer into address
      	li $a1, 90000 # allocates buffer space for string
      	syscall
      	
      	lb $t0, 0($a0)
      	beq $t0, 10, Invalid #if the first chat is a new line
      	beq $t0, $0, Invalid #if the first char is null
      	
      	
      	Invalid:
      		la $a0, invalid_empty
      		li $v0, 4
      		syscall
      		
      		li $v0, 10 #exits
      		syscall
      		
      		