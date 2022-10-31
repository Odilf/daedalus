.text

press_any_key: 
	.ascii "\n\n"
	.ascii "\033[38;2;100;100;100m"
	.ascii "(Press any key to continue)\n"
	.asciz "\033[38;2;255;255;255m"

intro_msg_1: .asciz "Hey."
intro_msg_2: .asciz "Umm"
intro_msg_3: .asciz "Where are we?"
intro_msg_4: .asciz "Uhh"
intro_msg_5: .asciz "Daedalus has built this place"
intro_msg_6: .asciz "It's a labyrinth"
intro_msg_7: .asciz "I've heard there is a minotaur roaming around"
intro_msg_8: .asciz "It might be a good idea to try to get out of here"
intro_msg_9: .asciz "Move with WASD, look with JL, pause with P."

intro:
	push %r15

	# dialog:
		movq $intro_msg_1, %rdi
		call printf 

		movq $0, %rax
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
		
		movq $intro_msg_2, %rdi
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

		movq $intro_msg_3, %rdi
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

		movq $intro_msg_4, %rdi
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

		movq $intro_msg_5, %rdi
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
		
		movq $intro_msg_6, %rdi
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

		movq $intro_msg_7, %rdi
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

		movq $intro_msg_8, %rdi
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

		movq $intro_msg_9, %rdi
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

	
	pop %r15
		

	# Move correct map
	mov $map_1, %rdi
	mov %rdi, game_map

	mov map_1_size, %rdi
	mov %rdi, map_size

	call place_player

	call fade_in

	jmp advance_screen
