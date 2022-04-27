.data
	Array: .space 40
	result: .asciiz "Reverse array is: "
	tab: .asciiz "  "
	
.text
	#Store 10 elements in Array
	addi $t0, $zero, 0
	addi $t1, $zero, 1
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 3
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 5
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 7
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 9
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 11
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 13
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 15
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 17
	sw $t1, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $zero, 19
	sw $t1, Array($t0)
	
	#Reverse array
	addi $t0, $zero, 0
	addi $t1, $zero, 36
	while:
		beq $t0, 16, exit
		lw $s0, Array($t0)
		lw $s1, Array($t1)
		
		sw $s0, Array($t1)
		sw $s1, Array($t0)
		
		addi $t0, $t0, 4
		addi $t1, $t1, -4
		
		j while
	exit: 
	
	#Print reverse array
	li $v0, 4
	la $a0, result
	syscall
	addi $t0, $zero, 0
	while1:
		beq $t0, 40, exit1
		lw $a0, Array($t0)
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, tab
		syscall
		addi $t0, $t0, 4
		j while1
	exit1:
	
		
		
		
		
		