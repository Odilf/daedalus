.text

c1_msg_2: .asciz "Ok"
c1_msg_3: .asciz "See?"
c1_msg_4: .asciz "That wasn't too bad"
c1_msg_5: 
	.ascii "\033[38;2;50;50;50m"
	.ascii "right?"
	.asciz "\033[38;2;255;255;255m"
c1_msg_6: .asciz "But there's still more to go"
c1_msg_7: .asciz "I would hurry up if I were you"
c1_msg_8: .asciz "Good luck, then"

cutscene_1:
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
	jl cutscene_1

	pop %r15

	# dialog:
		movq $clear_screen, %rdi
		call printf

		# --- 
		
		movq $c1_msg_2, %rdi
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

		movq $c1_msg_3, %rdi
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

		movq $c1_msg_4, %rdi
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

		movq $c1_msg_5, %rdi
		call printf 

		movq $newline, %rdi
		call printf 
		movq $newline, %rdi
		call printf 

		movq $c1_msg_4, %rdi
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
		
		movq $c1_msg_6, %rdi
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

		movq $c1_msg_7, %rdi
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

		movq $c1_msg_8, %rdi
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

	mov $map_2, %rdi
	mov %rdi, game_map

	mov map_2_size, %rdi
	mov %rdi, map_size

	call place_player

	call fade_in

	jmp advance_screen
