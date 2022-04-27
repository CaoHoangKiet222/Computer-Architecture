.data
	message: .asciiz "Before reverse: "
	cArray: .asciiz "Ho Chi Minh City - University of Technology"
	result: .asciiz "\nAfter reverse:  "
.text
	main:
		li $v0, 4
		la $a0, message
		syscall
		
		la $a0, cArray
		li $v0, 4
		syscall
		addi $a1, $zero, 43
		
		jal reverse
		
		li $v0, 4
		la $a0, result
		syscall
		
		li $v0, 4
		la $a0, cArray
		syscall
		
		li $v0, 10
		syscall
#----------------------------------------------------------------------------------------
	reverse:
		addi $sp, $sp, -4
		sw $a1, 0($sp)
		addi $t0, $zero, 0
		addi $t1, $zero, 2 
		div $a1, $t1
		mflo $s0
		subi $a1, $a1, 1
		for:
			slt $t2, $t0, $s0
			beq $t2, $zero, exit
			
			add $s1, $a0, $t0	
			lb $s2, 0($s1)
			
			sub $s1, $a1, $t0
			add $s1, $a0, $s1
			lb $t1, 0($s1)
			add $s1, $a0, $t0
			sb $t1, 0($s1)
			
			sub $s1, $a1, $t0
			add $s1, $a0, $s1
			sb $s2, 0($s1)
			
			addi $t0, $t0, 1
			j for
		exit:	
			lw $a1, 0($sp)
			addi $sp, $sp, 4
			jr $ra
			
