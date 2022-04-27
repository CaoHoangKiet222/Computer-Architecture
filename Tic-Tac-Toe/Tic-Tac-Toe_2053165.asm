.data
	characterArray: .space 9
	input: .asciiz "Select X or O for the first player: "
	playgame: .asciiz "Now let start our game !!!!\n"
	wrongInput: .asciiz "\nJust 2 characters X or O (upper case of x and o). Please enter again!!!"
	message: .asciiz "It's turn for player "
	message1: .asciiz ". Enter your slot: "
	inValid: .asciiz "Invalid input, please enter number from 1 to 9 !!!!\n"
	slotExist: .asciiz "The slot has already existed, please enter another slot !!!!\n"
	draw: .asciiz "\nThe game is draw !!!!\n"
	win: .asciiz "\nPlayer "
	win1: .asciiz " wins the game. Congratulation !!!!"
.text
	main:
		# Declare characterArray[9] = {'1', '2', '3', '4', '5', '6', '7', '8', '9'}
		addi $t0, $zero, 0
		la $t1, '1'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '2'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '3'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '4'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '5'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '6'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '7'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '8'
		sb $t1, characterArray($t0)
		
		addi $t0, $t0, 1
		la $t1, '9'
		sb $t1, characterArray($t0)
		
		##################################################
		# Call function chooseX_O and save result to $t9
		# Ex: user input = 'X'
		# $t9 = 'X'
		jal chooseX_O
		move $t9, $v1 
		
		li $v0, 4
		la $a0, playgame
		syscall
		
		addi $t0, $zero, 0	# index i = $t0
		for:
			slti $t1, $t0, 9 	# if (i < 9) false go to exit
			beq $t1, $zero, exit	
			
			jal printArray
			jal getSlot
			jal Winner	# return $v1
			
			bne $v1, $zero, endGame		# if there is a winner, go to endGame
			addi $t0, $t0, 1		# i = i + 1
			j for
		exit:
			jal printArray		# For loop ends so there is no winner
			li $v0, 4
			la $a0, draw		
			syscall
			
			li $v0, 10		# Exit program
			syscall
		endGame:
			# Print who wins
			# Ex: index i can be 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
			# if (i % 2 == 0), then that is player 1 plays else another position is player 2 
			jal printArray		
			li $v0, 4
			la $a0, win
			syscall
			
			addi $t1, $zero, 2	# $t1 = 2
			div $t0, $t1		# i % 2
			mfhi $t3		# save remainder of i % 2 to $t3
			
			beq $t3, $zero, if2
			
			li $v0, 11		# print '2'
			la $a0, '2'
			syscall
			
			j end
		if2: 	
			li $v0, 11		# print '1'
			la $a0, '1'
			syscall
		end:	
			li $v0, 4
			la $a0, win1
			syscall
			
			li $v0, 10		# Exit program
			syscall
	###################################################################
	# Function to print characterArray[9]
	printArray:
		addi $sp, $sp, -8
		sw $t0, 4($sp)
		sw $t1, 0($sp)
		
		addi $t0, $zero, 0 	# $t0 = 0 (i = 0)
		addi $t1, $zero, 3 	# $t1 = 3
		while:
			beq $t0, 9, exit1 	# if (i == 9) go to exit
			beq $t0, $zero, else 	# if (i == 0) go to else
			
			div $t0, $t1 	# get remainder when i % 3
			mfhi $t2
			beq $t2, $zero, if 	# if (i % 3 == 0) go to if
			j else
			
			if: 	
				la $a0, '\n' # print new line
				li $v0, 11
				syscall
				
				la $a0, '\n' # print new line
				li $v0, 11
				syscall
				
				la $a0, '\t' # print tab
				li $v0, 11
				syscall
			
				lb $a0, characterArray($t0) # print chacracterArray[i]
				li $v0, 11
				syscall
			
				addi $t0, $t0, 1 # i = i + 1
				j while
			
			else:
				la $a0, '\t' # print tab
				li $v0, 11
				syscall
			
				lb $a0, characterArray($t0) # print chacracterArray[i]
				li $v0, 11
				syscall
			
				addi $t0, $t0, 1 # i = i + 1
				j while
		exit1:
			lw $t1, 0($sp)
			lw $t0, 4($sp)
			addi $sp, $sp, 8
			jr $ra
	########################################################################		
	# chooseX_O function to get user input (X or Y) for first player
	# if user input enters instead of X or Y (upper case) then throw error
	chooseX_O:
		while1:		
			li $v0, 4
			la $a0, input
			syscall	
			
			li $v0, 12
			syscall
			move $v1, $v0
			beq $v1, 'X', accept
			beq $v1, 'O', accept
			
			li $v0, 4
			la $a0, wrongInput
			syscall
			
			li $v0, 11
			la $a0, '\n'
			syscall
			
			j while1
			
		
		accept: 	
			
			li $v0, 11
			la $a0, '\n'
			syscall
			jr $ra
	########################################################################
	# this function gets slot from user from 1 - 9 , another slot throws error
	getSlot:
		addi $sp, $sp, -8	# adjust stack to make room for 1 items
		sw $t0, 4($sp) 		# save register $t0 for use afterwards
		sw $t1, 0($sp)		# save register $t1 for use afterwards
		
		la $a0, '\n' 
		li $v0, 11
		syscall
		# print "It's turn for player "
		li $v0, 4 
		la $a0, message
		syscall
		
		addi $t1, $zero, 2
		div $t0, $t1
		mfhi $t3
		
		beq $t3, $zero, if1
			# print '2'
			li $v0, 11
			la $a0, '2'
			syscall
			j exit2
		if1: 	
			# print '1'
			li $v0, 11
			la $a0, '1'
			syscall
		exit2:
			# print ". Enter your slot: "
			li $v0, 4
			la $a0, message1
			syscall
		
			# enter slot(type integer)
			li $v0, 5
			syscall
			move $s0, $v0 		# slot = $s0
		
			slti $s1, $s0, 10   	# if (0 < slot < 10) is false, throw error
			beq $s1, $zero, else2
			slt $s1, $zero, $s0
			beq $s1, $zero, else2
		
			addi $s0, $s0, -1	# index i = slot
		
			lb $s1, characterArray($s0)	# if (characterArray[i] = 'X' or characterArray[i] = 'O') exists throw error
			beq $s1, 'X', else3
			beq $s1, 'O', else3
		
			bne $t3, $zero, else1 
			
			la $t2, ($t9)		# $t2 = character from user input ($t9)
			sb $t2, characterArray($s0) 	# characterArray[i] = $t2
			j exit3
		
		else1: 	
			# change user input from X to O and vice versa
			beq $t9, 'O', if3	
			la $t2, 'O' 		# $t2 = 'O'
			sb $t2, characterArray($s0) 	# characterArray[i] = 'O'
			j exit3
		if3: 	
			la $t2, 'X'
			sb $t2, characterArray($s0)
		exit3: 
			lw $t1, 0($sp)		# restore register $t1 for caller
			lw $t0, 4($sp) 		# restore register $t0 for caller
			addi $sp, $sp, 8	# adjust stack to delete 2 items
			jr $ra
		
		else2:
			li $v0, 4
			la $a0, inValid
			syscall
			j exit4
		
		else3:
			li $v0, 4
			la $a0, slotExist
			syscall
		exit4:
			lw $t1, 0($sp)
			lw $t0, 4($sp)
			addi $sp, $sp, 8
			addi $t0, $t0, -1	# i = i - 1
			jr $ra
	##################################################################
	# First, for1 loop will check column
	# Second, for2 loop will check row
	# Last, check diagonally
	Winner:	
		addi $sp, $sp, -8
		sw $t0, 4($sp)
		sw $t1, 0($sp)
		
		addi $t0, $zero, 0 	# index i = 0
		for1:
			slti $t1, $t0, 3	# loop for 3 times (i < 3)
			beq $t1, $zero, exit5
			
			move $t2, $t0		
			lb $s0, characterArray($t2)	# $s0 = characterArray[i]
			addi $t2, $t2, 3
			lb $s1, characterArray($t2)	# $s1 = characterArray[i + 3]
			addi $t2, $t2, 3
			lb $s2, characterArray($t2)	# $s2 = characterArray[i + 6]
			
			bne $s0, $s1, else4		# characterArray[i] = characterArray[i + 3] = characterArray[i + 6] return true
			bne $s0, $s2, else4
			bne $s1, $s2, else4
			
			j exit7
		else4:
			addi $t0, $t0, 1	# i = i + 1
			j for1
			
			
		exit5:
			addi $t0, $zero, 0	# i = 0
			
		for2:	
			slti $t1, $t0, 9	# loop for 3 times (i < 9)
			beq $t1, $zero, exit6
			
			move $t2, $t0
			lb $s0, characterArray($t2) 	# $s0 = characterArray[i]
			addi $t2, $t2, 1
			lb $s1, characterArray($t2)	# $s1 = characterArray[i + 1]
			addi $t2, $t2, 1
			lb $s2, characterArray($t2)	# $s2 = characterArray[i + 2]
			
			bne $s0, $s1, else5	# characterArray[i] = characterArray[i + 1] = characterArray[i + 2] return true
			bne $s0, $s2, else5
			bne $s1, $s2, else5
			
			j exit7
		else5: 
			addi $t0, $t0, 3 	# i = i + 3
			j for2
			
		exit6:	
			addi $t0, $zero, 0	# check characterArray[0] = characterArray[4] = characterArray[8], if true then return
			lb $s0, characterArray($t0)
			addi $t0, $t0, 4
			lb $s1, characterArray($t0)
			addi $t0, $t0, 4
			lb $s2, characterArray($t0)
			
			bne $s0, $s1, else6
			bne $s0, $s2, else6
			bne $s1, $s2, else6
			
			j exit7
			
			
		else6:
			addi $t0, $zero, 2	# check characterArray[2] = characterArray[4] = characterArray[6], if true then return
			lb $s0, characterArray($t0)
			addi $t0, $t0, 2
			lb $s1, characterArray($t0)
			addi $t0, $t0, 2
			lb $s2, characterArray($t0)
			
			bne $s0, $s1, else7
			bne $s0, $s2, else7
			bne $s1, $s2, else7
			
			j exit7
			
		else7:
			addi $v1, $zero, 0 # return false
			lw $t1, 0($sp)
			lw $t0, 4($sp)
			addi $sp, $sp, 8
			
			jr $ra
		exit7:
			lw $t1, 0($sp)
			lw $t0, 4($sp)
			addi $sp, $sp, 8
			addi $v1, $zero, 1 # return true
			
			jr $ra
