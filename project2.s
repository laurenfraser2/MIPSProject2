.data
char_array: .space 90000 #create space for characters
invalid_empty: .asciiz "Input is Empty"
.text
 main:
 	li $v0, 8  # code call to get input from a user
 	la $a0, char_array #loads buffer into address
      	li $a1, 90000 # allocates buffer space for string
      	syscall
      	
      	