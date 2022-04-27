.data
	mes: .asciiz "Enter first integer: "
	mes1: .asciiz "Enter second integer: "
	mes2: .asciiz "Enter third integer: "
	mes3: .asciiz "Enter fourth integer: "
	mes4: .asciiz "Enter fifth integer: "
	result: .asciiz "The reverse is: "
	tab: .asciiz "    "
.text
	#Enter first integer
	li $v0, 4
	la $a0, mes
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	#Enter second integer
	li $v0, 4
	la $a0, mes1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#Enter third integer
	li $v0, 4
	la $a0, mes2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	#Enter fourth integer
	li $v0, 4
	la $a0, mes3
	syscall
	li $v0, 5
	syscall
	move $t3, $v0
	#Enter fifth integer
	li $v0, 4
	la $a0, mes4
	syscall
	li $v0, 5
	syscall
	move $t4, $v0
	#Print reverse
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, tab
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, tab
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, tab
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, tab
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
