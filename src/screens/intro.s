.text

press_any_key: 
	.ascii "\n\n"
	.ascii "\033[38;2;100;100;100m"
	.ascii "(Press any key to continue)\n"
	.asciz "\033[38;2;255;255;255m"

msg_1: .asciz "Hey."
msg_2: .asciz "Umm"
msg_3: .asciz "Where are we?"
msg_4: .asciz "Uhh"
msg_5: .asciz "Daedalus has built this place"
msg_6: .asciz "It's a labyrinth"
msg_7: .asciz "I've heard there is a minotaur roaming around"
msg_8: .asciz "It might be a good idea to try to get out of here"

intro:
	movq $1, screen

	# Print messages
	movq $msg_1, %rdi
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
	
	movq $msg_2, %rdi
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

	movq $msg_3, %rdi
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

	movq $msg_4, %rdi
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

	movq $msg_5, %rdi
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
	
	movq $msg_6, %rdi
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

	movq $msg_7, %rdi
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

	movq $msg_8, %rdi
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

	ret
