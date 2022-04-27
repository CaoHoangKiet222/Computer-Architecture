.data
	fout: .asciiz "testout.txt" # filename for output
	msg1: .asciiz "Before read: "
	msg2: .asciiz "After read: "
	buffer_read: .asciiz "\n"
.text
	li $v0, 13 # system call for open file
	la $a0, fout # output file name
	li $a1, 0 # Open for writing (flags are 0: read, 1: write)
	li $a2, 0 # mode is ignored
	syscall # open a file (file descriptor returned in $v0)
	move $s6, $v0 # save the file descriptor
	
	# Read from file
	li $v0, 14 # system call for read
	move $a0, $s6 # file descriptor
	la $a1, buffer_read # address of buffer read
	li $a2, 100 # hardcoded buffer length
	syscall # read file
	
	li $v0, 4
	la $a0, buffer_read
	syscall
	
	la $a1, buffer_read
	
	li $v0, 9 # system call code for dynamic allocation
	li $a0, 100 # $a0 contains number of bytes to allocate
	syscall
	move $s0, $v0
	
	addi $t0, $zero, 0
	move $s1, $s0
	move $a2, $a1
	while:
		slti $t1, $t0, 100
		beq $t1, $zero, exit
		
		lb $t1, 0($a2)
		sb $t1, 0($s1)
		
		addi $t0, $t0, 1
		add $s1, $s0, $t0
		add $a2, $a1, $t0
		j while
	exit:
		
	addi $t0, $zero, 0
	move $s1, $s0
	while1:
		slti $t1, $t0, 100
		beq $t1, $zero, exit1
		
		
		lb $a0, 0($s1)
		
		li $v0, 11
		syscall
		
		addi $t0, $t0, 1
		add $s1, $s0, $t0
		j while1
	exit1:
		
		
		
		
	