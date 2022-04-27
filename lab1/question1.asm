.data
	request: .asciiz "Please enter an integer number: "
	result: .asciiz "Result is: "

.text
	#print the request
	li $v0, 4
	la $a0, request
	syscall
	#Enter an integer
	li $v0, 5
	syscall
	move $t0, $v0
	#collect the number and increase it by 1
	addi $t0, $t0, 1
	#print the result
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	