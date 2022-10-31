.text

c3_msg_2: .asciz "..."
c3_msg_3: .asciz "so."
c3_msg_4: .asciz "Can I tell you something?"
c3_msg_5: .asciz "i didn't think you could\033[1;3m actually\033[0m make it, you know"
c3_msg_6: .asciz "I designed some maps to keep you entratained"
c3_msg_7: .asciz "keep myself entratained, i guess"
c3_msg_8: .asciz "But like"
c3_msg_9: .asciz "Why are you even doing this?"
c3_msg_10: 
	.ascii "\033[38;2;180;180;180m"
	.ascii "Why am\033[1;3m I\033[0m " 
	.ascii "\033[38;2;180;180;180m"
	.ascii "doing this?"
	.asciz "\033[38;2;255;255;255m"
c3_msg_11: .asciz "This is pointless"
c3_msg_12: .asciz "I can't be bothered anymore"
c3_msg_13: .asciz "Welcome to my hell"
c3_msg_14: .asciz "\033[38;2;154;10;10mWelcome to memory."


cutscene_3:
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
	jl cutscene_3

	pop %r15
	pop %r15

	# For stack alignment
	push %r15

	# dialog:
		movq $clear_screen, %rdi
		call printf

		# --- 
		
		movq $c3_msg_2, %rdi
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

		movq $c3_msg_3, %rdi
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

		movq $c3_msg_4, %rdi
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

		movq $c3_msg_5, %rdi
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
		
		movq $c3_msg_6, %rdi
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

		movq $c3_msg_7, %rdi
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

		movq $c3_msg_8, %rdi
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

		movq $c3_msg_9, %rdi
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

		movq $c3_msg_10, %rdi
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

		movq $c3_msg_11, %rdi
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

		movq $c3_msg_12, %rdi
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

		movq $c3_msg_13, %rdi
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

		movq $c3_msg_14, %rdi
		call printf 

		movq $newline, %rdi
		call printf
		movq $newline, %rdi
		call printf
		movq $newline, %rdi
		call printf
		
		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

	# For stack alignment
	pop %r15
	
	# Set that you can't see OOB
	movq $1, oob_collision_mode

	# Move random memory as map
	mov $map, %rdi
	mov %rdi, game_map

	movq $44, map_size

	call place_player

	# Move player back inside map
	movsd pos_y, %xmm14
	subsd three_halves, %xmm14
	movsd %xmm14, pos_y

	call fade_in

	jmp advance_screen

# Pain
map: 
