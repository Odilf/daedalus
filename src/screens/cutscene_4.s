.text

c4_msg_2: .asciz "."
c4_msg_3: .asciz ".."
c4_msg_4: .asciz "..."
c4_msg_5: .asciz "how?"
c4_msg_6: .asciz "fun fact"
c4_msg_7: .asciz "i genuienly didn't know if that was possible"
c4_msg_8: .asciz "so congrats, i guess"
c4_msg_9: .asciz "the thing is, the lore doesn't make sense if you get here"
c4_msg_10: .asciz "who am i even writing this for?"
c4_msg_11: .asciz "whoops, i think i just broke the fourth wall"
c4_msg_12: .asciz "what do i do now?"
c4_msg_13: .asciz "I don't think there is a better ending than just kicking you out."
c4_msg_14: .asciz "ye"
c4_msg_15: .asciz "bye then"
c4_msg_16: .asciz ""
bye_msg: .asciz "\033[38;2;%d;%d;%dmthis was actually kinda fun...\n"


cutscene_4:
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
	jl cutscene_4

	pop %r15
	pop %r15

	# dialog:
		movq $clear_screen, %rdi
		call printf

		# --- 
		
		movq $c4_msg_2, %rdi
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

		movq $c4_msg_3, %rdi
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

		movq $c4_msg_4, %rdi
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

		movq $c4_msg_5, %rdi
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
		
		movq $c4_msg_6, %rdi
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

		movq $c4_msg_7, %rdi
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

		movq $c4_msg_8, %rdi
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

		movq $c4_msg_9, %rdi
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

		movq $c4_msg_10, %rdi
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

		movq $c4_msg_11, %rdi
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

		movq $c4_msg_12, %rdi
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

		movq $clear_screen, %rdi
		call printf

		movq $c4_msg_13, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $clear_screen, %rdi
		call printf

		movq $c4_msg_14, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $clear_screen, %rdi
		call printf

		movq $c4_msg_15, %rdi
		call printf 

		movq $press_any_key, %rdi
		call printf

		mov $0, %rax		# read (
		mov $1, %rdi		# 	stdin
		mov $last_key, %rsi	# 	store in $last_key
		mov $1, %rdx		# 	read 1 byte
		syscall				# )

		# --- 

		movq $clear_screen, %rdi
		call printf

		movq $c4_msg_16, %rdi
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

	push %r15
	push %r15
	mov $0, %r15
	final_fade_in:
		inc %r15

		mov $clear_screen, %rdi
		call printf

		mov $bye_msg, %rdi
		mov %r15, %rsi
		mov %r15, %rdx
		mov %r15, %rcx
		call printf

		mov $newline, %rdi
		call printf
		mov $newline, %rdi
		call printf

		mov $5000, %rdi
		call usleep

		cmp $127, %r15
		jl final_fade_in

	mov $1, %rdi
	call sleep

	final_fade_out:
		dec %r15

		mov $clear_screen, %rdi
		call printf

		mov $bye_msg, %rdi
		mov %r15, %rsi
		mov %r15, %rdx
		mov %r15, %rcx
		call printf

		mov $newline, %rdi
		call printf
		mov $newline, %rdi
		call printf

		mov $50000, %rdi
		call usleep

		cmp $0, %r15
		jge final_fade_out

	pop %r15
	pop %r15

	mov $3, %rdi
	call sleep

	mov $0, %rdi
	call exit
