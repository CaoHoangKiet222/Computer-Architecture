.data
	Array: .space 40
	request: .asciiz "Enter an integer number that is greater than 0 and less than 10: "
	result: .asciiz "The value of the element at index collected from user is: "
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
	
	#Enter an integer
	li $v0, 4
	la $a0, request
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, result
	syscall
	sll $s0, $s0, 2
	add $t0, $zero, $s0
	lw $a0, Array($t0)
	li $v0, 1
	syscall