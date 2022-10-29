.text

pause_text: 
	.ascii "\033[38;2;255;255;255m"
	.ascii "Game is paused. \n"
	.ascii "Press `x` to exit. \n"
	.asciz "Press any key to resume. \n\n"

show_pause:
	mov $clear_screen, %rdi
	call printf

	mov $pause_text, %rdi
	call printf

	mov $0, %rax		# read (
	mov $1, %rdi		# 	stdin
	mov $last_key, %rsi	# 	store in $last_key
	mov $1, %rdx		# 	read 1 byte
	syscall				# )

	cmpq $0x78, last_key
	je quit

	movq last_screen, %rdi
	mov %rdi, screen

	ret

quit:
	mov $0, %rdi
	call exit
