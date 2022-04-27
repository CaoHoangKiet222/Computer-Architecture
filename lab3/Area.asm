.data
	circle: .asciiz "1.Calculate the area of circle\n"
	AofCircle:  .asciiz "The area of circle: "
	triangle: .asciiz "2.Calculate the area of triangle\n"
	AofTriangle: .asciiz "The area of triangle: "
	rectangle: .asciiz "3.Calculate the area of rectangle\n"
	AofRectangle: .asciiz "The area of rectangle: "
	square: .asciiz "4.Calculate the area of square\n"
	AofSquare: .asciiz "The area of square: "
	request: .asciiz "Please enter option from 1 to 4: "
	again: .asciiz "Invalid input!!!\n"
	R: .asciiz "Enter R: "
	pi: .float 3.14
	zero: .float 0.0
	half: .float 0.5
	Bedge: .asciiz "Enter bottom edge: "
	Hight: .asciiz "Enter hight: "
	Long: .asciiz "Enter long: "
	Width: .asciiz "Enter width: "
	angle: .asciiz "Enter square angle: "
.text
	addi $t2, $zero, 4
	while:
		li $v0, 4
		la $a0, circle
		syscall
		
		li $v0, 4
		la $a0, triangle
		syscall
		
		li $v0, 4
		la $a0, rectangle
		syscall
		
		li $v0, 4
		la $a0, square
		syscall
		
		li $v0, 4
		la $a0, request
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		slti $t1, $t0, 0
		bne $t1, $zero, enter_again
		slt $t1, $t2, $t0
		bne $t1, $zero, enter_again
		
		beq $t0, 1, c
		beq $t0, 2, t
		beq $t0, 3, r
		beq $t0, 4, s
		c:
			li $v0, 4
			la $a0, R
			syscall
			
			li $v0, 6
			syscall
			
			lwc1 $f1, pi
			mul.s $f0, $f0, $f0
			mul.s $f12, $f0, $f1
			
			li $v0, 4
			la $a0, AofCircle
			syscall
			li $v0, 2
			syscall
			j e
			
		t:
			li $v0, 4
			la $a0, Bedge
			syscall
			
			li $v0, 6
			syscall
			
			lwc1 $f2, zero
			add.s $f1, $f0, $f2
			
			li $v0, 4
			la $a0, Hight
			syscall
			
			li $v0, 6
			syscall
			lwc1 $f2, half
			
			mul.s $f0, $f0, $f1
			mul.s $f12, $f0, $f2
			
			li $v0, 4
			la $a0, AofTriangle
			syscall
			li $v0, 2
			syscall
			j e
			
		r:
			li $v0, 4
			la $a0, Long
			syscall
			
			li $v0, 6
			syscall
			
			lwc1 $f2, zero
			add.s $f1, $f0, $f2
			
			li $v0, 4
			la $a0, Width
			syscall
			
			li $v0, 6
			syscall
			
			mul.s $f12, $f0, $f1
			
			li $v0, 4
			la $a0, AofRectangle
			syscall
			li $v0, 2
			syscall
			j e
		s: 	
			li $v0, 4
			la $a0, angle
			syscall
			
			li $v0, 6
			syscall
			mul.s $f12, $f0, $f0
			
			li $v0, 4
			la $a0, AofSquare
			syscall
			li $v0, 2
			syscall
			j e
		enter_again:	
				li $v0, 4
				la $a0, again
				syscall
				j while
	e:
		
		
