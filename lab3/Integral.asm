.data
	a: .asciiz "Enter a: "
	b: .asciiz "Enter b: "
	c: .asciiz "Enter c: "
	u: .asciiz "Enter u: "
	v: .asciiz "Enter v: "
	result: .asciiz "Integral of ax^2 + bx + c run from u to v is: "
	zero: .float 0.0
	two: .float 2.0
	three: .float 3.0
.text
	lwc1 $f10, zero
	
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 6
	syscall
	add.s $f1, $f0, $f10
	
	li $v0, 4
	la $a0, b
	syscall
	li $v0, 6
	syscall
	add.s $f2, $f0, $f10
	
	li $v0, 4
	la $a0, c
	syscall
	li $v0, 6
	syscall
	add.s $f3, $f0, $f10
	
	li $v0, 4
	la $a0, u
	syscall
	li $v0, 6
	syscall
	add.s $f4, $f0, $f10
	
	li $v0, 4
	la $a0, v
	syscall
	li $v0, 6
	syscall
	add.s $f5, $f0, $f10
	
	sub.s $f6, $f5, $f4 # v - u
	add.s $f7, $f5, $f4 # u + v
	
	lwc1 $f10, three
	div.s $f8, $f1, $f10 # a/3
	
	lwc1 $f10, two
	div.s $f9, $f2, $f10 # b/2
	
	mul.s $f10, $f5, $f5
	mul.s $f11, $f5, $f4
	add.s $f10, $f11, $f10
	mul.s $f11, $f4, $f4
	add.s $f10, $f11, $f10
	mul.s $f10, $f10, $f8
	
	mul.s $f9, $f9, $f7
	
	add.s $f9, $f10, $f9
	
	add.s $f9, $f9, $f3
	
	mul.s $f12, $f9, $f6
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 2
	syscall
	
	
	
	