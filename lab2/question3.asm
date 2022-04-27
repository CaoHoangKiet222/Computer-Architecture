.data
	Array: .space 40
	ask: .asciiz "Please enter 10 element:\n"
	print: .asciiz "Array before sorting is:"
	result: .asciiz "\nArray after sorting is:"
	
.text
	li $v0, 4
	la $a0, ask
	syscall 
	
	addi $t0, $zero, 0
	la $s0, Array
	
	while:
		slti $t1, $t0, 40
		beq $t1, $zero, exit
		li $v0, 5
		syscall
		move $s1, $v0
		
		add $s2, $t0, $s0
		sw $s1, 0($s2)
		
		addi $t0, $t0, 4
		j while
	exit:
	
	li $v0, 4
	la $a0, print
	syscall
	jal print1
	
	addi $t0, $zero, 0	#i = 0
	for:
		slti $t7, $t0, 40	# i < 40
		beq $t7, $zero, exit2
		
		add $t2, $s0, $t0 
		lw $s1, 0($t2)	# a[i]
		
		addi $t1, $t0, 4	
		for1:	
			slti $t5, $t1, 40
			beq $t5, $zero, else2
			
			
			add $t3, $s0, $t1
			lw $s2, 0($t3)	# a[j]
			
			slt $t4, $s1, $s2 # a[i] < a[j]
			beq $t4, $zero, else1
			
			move $t4, $s1
			move $s1, $s2
			move $s2, $t4
			
			sw $s1, 0($t2)
			sw $s2, 0($t3)
			
			else1:
				addi $t1, $t1, 4
				j for1
		
		else2:
			addi $t0, $t0, 4
			j for
			
	exit2:
		
		li $v0, 4
		la $a0, result
		syscall
		jal print1
		li $v0, 10
		syscall 
		
		
		
	############################################################
	print1:
		addi $t0, $zero, 0
		while2:
			slti $t1, $t0, 40
			beq $t1, $zero, exit1
		
			li $v0, 11
			la $a0, ' '
			syscall
		
			add $s2, $t0, $s0
			li $v0, 1
			lw $a0, 0($s2)
			syscall
		
			addi $t0, $t0, 4
			j while2
		exit1:
			jr $ra
		
		
		
