.data
	mes: .asciiz "Enter integer a = "
	mes1: .asciiz "Enter integer b = "
	mes2: .asciiz "Enter integer c = "
	mes3: .asciiz "Enter integer d = "
	result: .asciiz "f = (a+b)-(c-d-2) = "
	result1: .asciiz "\ng = (a+b)*3-(c+d)*2 = "
.text
	#Enter integer a
	li $v0, 4
	la $a0, mes
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	#Enter integer b
	li $v0, 4
	la $a0, mes1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#Enter integer c
	li $v0, 4
	la $a0, mes2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	#Enter integer d
	li $v0, 4
	la $a0, mes3
	syscall
	li $v0, 5
	syscall
	move $t3, $v0
	#Calculate f = (a+b)-(c-d-2)
	li $v0, 4
	la $a0, result
	syscall
	add $s0, $t0, $t1
	sub $s1, $t2, $t3
	addi $s1, $s1, -2
	sub $a0, $s0, $s1
	li $v0, 1
	syscall
	#Calculate g = (a+b)*3-(c+d)*2
	li $v0, 4
	la $a0, result1
	syscall
	add $s0, $t0, $t1
	mul $s0, $s0, 3
	add $s1, $t2, $t3
	mul $s1, $s1, 2
	sub $a0, $s0, $s1
	li $v0, 1
	syscall
	
	