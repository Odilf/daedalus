.text

pause_text: 
	.ascii "\033[0m"
	.ascii "\033[1;3m"
	.ascii "Game is paused. \n\n"
	.ascii "\033[0m"
	.ascii "Wove with `WASD`, rotate with `J` and `L`, pause with `P`. \n"
	.ascii "Press `X` to exit. \n\n"
	.asciz "Press `P` again to resume game. \n\n"

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

	cmpq $0x70, last_key
	je resume

	jmp show_pause

resume: 
	movq last_screen, %rdi
	mov %rdi, screen

	ret

quit:
	mov $0, %rdi
	call exit
