.data

row: .byte 0
column: .byte 0

.text

clear_screen: .asciz "\033[2J"
reset_cursor_position: .asciz "\033[0;0H"
move_cursor_up: .asciz "\033[1A"
move_cursor_back: .asciz "\033[1D"

# cursor_position: .ascii "\033["
# cursor_position: .ascii "\033[%d;%dH"
cursor_position: .ascii "lol %d %d"
semicolon: .ascii ";"
cursor_position_end: .asciz "H"

rows: .quad 32
columns: .quad 64
angle_delta: .double 0.3 # in radians
ray_length: .double 0.2

render:
	push %rbp
	mov %rsp, %rbp

	
	# Clear screen
	# mov $1, %rax 		# write
	# mov $0, %rdi		# stdout
	# mov $clear_screen, %rsi	# template
	# mov $7, %rdx
	# syscall

	# Move cursor to 0, 0
	# mov $1, %rax 		# write
	# mov $0, %rdi		# stdout
	# mov $reset_cursor_position, %rsi	# template
	# mov $9, %rdx
	# syscall

	mov $5, row
	mov $10, column
	call move_cursor

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
	# Column length is in %rsi

	# Store start offset in %rdx ((rows - column_height) / 2)
	mov rows, %rdx
	sub %rsi, %rdx
	shr %rdx

render_column_loop:
	# Move cursor to 0, 0
	mov $1, %rax 		# write
	mov $0, %rdi		# stdout
	mov $reset_cursor_position, %rsi	# template
	mov $9, %rdx
	syscall

render_column_loop_end:
	inc %rdi
	cmp columns, %rdi
	jl render_loop

	jmp render_end

render_end:
	mov %rbp, %rsp
	pop %rbp

	ret



move_cursor:
	# Inputs:
	# %rdi: x position (column)
	# %rdi: y position (row)

	mov $cursor_position, %rdi
	mov column, %rsi
	mov row, %rdx
	mov $0, %rax
	call printf

	# Output boilerplate
	# mov $1, %rax 		# write
	# mov $0, %rdi		# stdout

	# Escape code start
	# mov $cursor_position, %rsi	# template
	# mov $5, %rdx
	# syscall

	# Row
	# mov $row, %rsi	# template
	# mov $1, %rdx
	# syscall

	# # Semicolon
	# mov $semicolon, %rsi	# template
	# mov $1, %rdx
	# syscall

	# # Column
	# mov $column, %rsi	# template
	# mov $1, %rdx
	# syscall

	# # Escape code end
	# mov $cursor_position_end, %rsi	# template
	# mov $1, %rdx
	# syscall

	ret