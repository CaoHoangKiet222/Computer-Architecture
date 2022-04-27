.data
	myArray: .space 40
	message: .asciiz "Enter 10 elements of array:\n"
	result: .asciiz "Sum 10 elements in array: " 
.text
	li $v0, 4
	la $a0, message
	syscall
	#Enter 10 elements of array
	addi $t0, $zero, 0
	while:
		beq $t0, 40, exit
		li $v0, 5
		syscall
		move $s0, $v0
		sw $s0, myArray($t0)
		addi $t0, $t0, 4
		
		j while
	exit: 
	#Sum 10 elements in array
	 addi $t0, $zero, 0
	 addi $s0, $zero, 0
	 while1:
	 	beq $t0, 40, exit1
	 	lw $t1, myArray($t0)
	 	add $s0, $t1, $s0
	 	addi $t0, $t0, 4
	 	j while1
	 exit1:
	 	li $v0, 4
		la $a0, result
		syscall
	 	li $v0, 1
	 	move $a0, $s0
	 	syscall
