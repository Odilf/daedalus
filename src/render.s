.data

row: .quad 0
column: .quad 0

.text

clear_screen: .asciz "\033[2J"
reset_cursor_position: .asciz "\033[H"

wall: .ascii "█"
gap:  .ascii " "
newline:  .ascii "\n"

rows: .quad 32
columns: .quad 64
angle_delta: .double 0.3 # in radians
ray_length: .double 0.2

render_start: 
	# Clear screen
	mov $1, %rax 		# write
	mov $0, %rdi		# stdout
	mov $clear_screen, %rsi	# template
	mov $7, %rdx
	syscall

render:
	push %rbp
	mov %rsp, %rbp

	# Reset position
	mov $1, %rax 		# write
	mov $0, %rdi		# stdout
	mov $reset_cursor_position, %rsi	# template
	mov $7, %rdx
	syscall

	# Set initial values
	movsd angle, %xmm3	# Starting angle to %xmm3
	mov $0, %rdi		# Starting column to %rdi
	jmp render_loop


render_loop:
	addsd angle_delta, %xmm3 # Update angle

	# Figure out how big the column is, store it in %rsi
	# Let's just say it's 5
	movq $5, %rsi
	jmp render_column


render_column:
	# Current column is in %rdi (can't overwrite)
	# Column length is in %rsi

	# Store start offset in %rdx ((rows - column_height) / 2)
	mov rows, %rdx
	sub %rsi, %rdx
	shr %rdx

	push %rsi
	push %rdi

	mov %rdx, %rsi
	mov $gap, %rdi

	call render_column_loop

	pop %rdi
	pop %rsi

	jmp render_column_end

# arg1: column length
# arg2: character
render_column_loop:
	mov %rdi, %r8

	# Write block
	mov $1, %rax 		# write
	mov $0, %rdi		# stdout
	mov %r8, %rsi		# template
	mov $1, %rdx
	syscall



	
	# Move cursor down
	# mov $1, %rax 		# write
	# mov $0, %rdi		# stdout
	# mov $move_cursor_down, %rsi	# template
	# mov $7, %rdx
	# syscall

	# Move cursor back
	# mov $1, %rax 		# write
	# mov $0, %rdi		# stdout
	# mov $move_cursor_back, %rsi	# template
	# mov $7, %rdx
	# syscall

	ret

render_column_end:
	# Move cursor back
	mov $1, %rax 		# write
	mov $0, %rdi		# stdout
	mov $newline, %rsi	# template
	mov $1, %rdx
	syscall

	inc %rdi
	cmp columns, %rdi
	jl render_loop

	jmp render_end



render_end:
	mov %rbp, %rsp
	pop %rbp

	ret