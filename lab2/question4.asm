.data
	Array: .space 40
	k: .word 10
	message: .asciiz "Array is:"
	result: .asciiz "\nSum of elements in array is: "
	
.text
	#Store 10 elements in Array
	addi $t0, $zero, 0
	addi $t1, $zero, 32
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 78
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 9
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 12
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 3
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 55
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 88
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 22
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 35
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 23
	sw $t1, Array($t0) 
	
	
	li $v0, 4
	la $a0, message
	syscall
	jal print
#----------------------------------------------------------------------------
	addi $t0, $zero, 40
	la $s1, Array
	addi $s2, $s1, 0
	
	lw $s0, k
	
	li $v0, 4
	la $a0, result
	syscall
	
	jal sum
	move $a0, $v0
	li $v0, 1
	syscall
	
	
	li $v0, 10
	syscall
#----------------------------------------------------------------------------
	sum:
		subu $sp, $sp, 12
		sw $s0, 0($sp)
		sw $ra, 4($sp)
		sw $t1, 8($sp)
		
		if:
			lw $v0, 0($s1)	# v[0]
			beq $s0, 1, sumDone
			
			addi $t0, $t0, -4
			add $s2, $s1, $t0
			lw $t1, 0($s2) 	# v[k-1]	
			
			subi $s0, $s0, 1	# k = k - 1
			jal sum
			
			add $v0, $t1, $v0	# return v[k-1] + sum(v[k-2], k-1)
			
		sumDone:	
			lw $t1, 8($sp)
			lw $ra, 4($sp)
			lw $a0, 0($sp)
			subu $sp, $sp, -12
			jr $ra
#----------------------------------------------------------------------------
	print:
		addi $t0, $zero, 0
		while:
			slti $t1, $t0, 40
			beq $t1, $zero, exit
		
			li $v0, 11
			la $a0, ' '
			syscall
		
			li $v0, 1
			lw $a0, Array($t0)
			syscall
		
			addi $t0, $t0, 4
			j while
		exit:
			jr $ra
			
			