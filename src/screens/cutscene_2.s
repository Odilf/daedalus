.text

c2_msg_2: .asciz "So the labyrinth is starting to get more complicated, huh?"
c2_msg_3: .asciz "I've heard people can't get through the next one"
c2_msg_4: .asciz "Try to think outside of the box"
c2_msg_5: 
	.ascii "\033[38;2;50;50;50m"
	.ascii "(literally)"
	.asciz "\033[38;2;255;255;255m"
c2_msg_6: .asciz "but what do i know?"
c2_msg_7: .asciz "Go."
c2_msg_8: .asciz "I believe in you."

cutscene_2:
	push %r15
	push %r15

	# Scheme to stall for time
	mov $0, %rdi
	call time
	mov %rax, %r15

	movq $clear_screen, %rdi
	call printf

	movq $press_any_key, %rdi
	call printf
	
	mov $0, %rax		# read (
	mov $1, %rdi		# 	stdin
	mov $last_key, %rsi	# 	store in $last_key
	mov $1, %rdx		# 	read 1 byte
	syscall				# )

	mov $0, %rdi
	call time
	sub %r15, %rax

	cmp $1, %rax
	jl cutscene_2

	pop %r15
	pop %r15

	# For stack alignment
	push %r15
	
	# dialog:
		movq $clear_screen, %rdi
		call printf

		# --- 
		
		movq $c2_msg_2, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $c2_msg_3, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $c2_msg_4, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $c2_msg_5, %rdi
		call printf 

		movq $newline, %rdi
		call printf 
		movq $newline, %rdi
		call printf 

		movq $c2_msg_4, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 
		
		movq $c2_msg_6, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $c2_msg_7, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $c2_msg_8, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		movq $clear_screen, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

	# For stack alignment
	pop %r15

	mov $map_3, %rdi
	mov %rdi, game_map

	mov map_3_size, %rdi
	mov %rdi, map_size

	call place_player

	call fade_in

	jmp advance_screen
