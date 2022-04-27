.data
	request: .asciiz "Please enter an integer number: "
	request1: .asciiz "Please enter another integer number: "
	result: .asciiz "Sum is: "


.text
	#print the request
	li $v0, 4
	la $a0, request
	syscall
	#Enter an integer
	li $v0, 5
	syscall
	move $t0, $v0
	#print the request
	li $v0, 4
	la $a0, request1
	syscall
	#Enter an integer
	li $v0, 5
	syscall
	move $t1, $v0
	#Add two integer
	li $v0, 4
	la $a0, result
	syscall
	add $a0, $t0, $t1
	li $v0, 1
	syscall
	
	