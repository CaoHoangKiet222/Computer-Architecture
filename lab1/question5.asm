.data
	Array: .space 40
	result: .asciiz "Sum of elements in array is: "
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
	
	#Load 10 elements
	addi $s0, $zero, 0
	addi $t0, $zero, 0
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	addi $t0, $t0, 4
	lw $t1, Array($t0)
	add $s0, $s0, $t1
	
	#Print sum
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	