.data
	getInput: .asciiz "Enter n = "
	inValid: .asciiz "Please enter n > 0 !!!\n"
	result: .asciiz "The n first elements of the Fibonacci Sequence: "
.text
	if:	
		li $v0, 4
		la $a0, getInput
		syscall
	
		li $v0, 5
		syscall
		move $s0, $v0
		
		slti $t0, $s0, 1
		bne $t0, $zero, exit 
	
	li $v0, 4
	la $a0, result
	syscall 
	
	addi $t0, $zero, 1
	beq $s0, $t0, print
	
	addi $s1, $zero, 0
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 11
	la $a0, ' '
	syscall 
	j else
	
	print:
		addi $s2, $zero, 0
		li $v0, 1
		move $a0, $s2
		syscall
		
		addi $t0, $zero, 2
		j while
	else:
		addi $s2, $zero, 1
		li $v0, 1
		move $a0, $s2
		syscall
		
		addi $t0, $zero, 2
	
	while:	
		slt $t1, $t0, $s0
		beq $t1, $zero, exit1
		
		add $s3, $s2, $s1
		
		li $v0, 11
		la $a0, ' '
		syscall 
		
		li $v0, 1
		move $a0, $s3
		syscall
		
		move $s1, $s2
		move $s2, $s3
		
		addi $t0, $t0, 1
		j while
	exit:
		li $v0, 4
		la $a0, inValid
		syscall 
		
		j if
	exit1:
