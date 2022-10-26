.data

row: .quad 0
column: .quad 0

.text

clear_screen: .asciz "\033[2J"
reset_cursor_position: .asciz "\033[H"

wall: .ascii "█"
gap:  .ascii " "
newline:  .ascii "\n"

# Maybe these could be defined as macros?
rows: .quad 32
columns: .quad 64

angle_delta: .double 0.3 # in radians
ray_length: .double 0.2

# Setup for rendering
# Right now, screen is only cleared at the start. Don't know if that's a bad idea
render_start: 
	# Clear screen
	mov $1, %rax 			# write
	mov $0, %rdi			# stdout
	mov $clear_screen, %rsi	# template
	mov $7, %rdx
	syscall

	ret


# Render goes through each "pixel" in the screen and calls `shader`. 
# Then, it takes the values of %xmm3, %xmm4 and %xmm5 and draws it in the screen
render:
	# Prologue for render
	push %rbp
	mov %rsp, %rbp

	# Reset position
	mov $1, %rax 						# write(
	mov $0, %rdi						# 	stdout
	mov $reset_cursor_position, %rsi	# 	template
	mov $7, %rdx						# 	7 bytes
	syscall								# )

	# Save callee-saved registers
	push %r12
	push %r13

	# %r12 stores column
	# %r13 stores row

	# Start at row 0
	mov $0, %r12
	jmp render_loop

# %r12 stores column, %r13 stores row
render_loop:
	# Start at column 0
	mov $0, %r13

render_row_loop:
	# Call shader for pixel
	mov %r12, %rdi
	mov %r13, %rsi
	call shader

	# TODO: Draw pixel

	# Increment column and loop if not at the end
	inc %r12
	cmp columns, %r12
	jl render_row_loop

render_row_end:

	# TODO: Print newline

	# Increment row and loop if not at the end
	inc %r13
	cmp rows, %r13
	jl render_loop

render_end:
	# Restore callee-saved registers
	pop %r13
	pop %r12

	# Epilogue for render
	mov %rbp, %rsp
	pop %rbp

	ret
