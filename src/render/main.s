.include "render/shader.s"

.data

rows: .quad 32
columns: .quad 150

.text

clear_screen: .asciz "\033[2J"
reset_cursor_position: .asciz "\033[H"
newline: .asciz "\n"

color_template: .asciz "\033[38;2;%.0f;%.0f;%.0fm█"


# Setup for rendering
# Right now, screen is only cleared at the start. Don't know if that's a bad idea
render_setup: 
	# Clear screen
	mov $clear_screen, %rdi
	call printf

	# Dynamically cache the half_columns and half_rows variables
	mov columns, %rdi
	shr $1, %rdi
	mov %rdi, half_columns

	mov rows, %rdi
	shr $1, %rdi
	mov %rdi, half_rows

	# Convert rows into float for SSE operations
	cvtsi2sd rows, %xmm9
	movsd %xmm9, max_column_height

	ret


# Render goes through each "pixel" in the screen and calls `shader`. 
# Then, it takes the values of %xmm3, %xmm4 and %xmm5 and draws it in the screen
render:
	# Prologue for render
	push %rbp
	push %rbp
	mov %rsp, %rbp

	# Setup stuff for shader
	call shader_setup

	# Reset cursor position
	mov $reset_cursor_position, %rdi
	call printf

	# Save callee-saved registers
	push %r12
	push %r13

	# %r12 stores column
	# %r13 stores row

	# Start at row 0
	mov $0, %r13
	jmp render_loop


	# %r12 stores column, %r13 stores row
	render_loop:
		# Start at column 0
		mov $0, %r12

		render_row_loop:
			# Call shader for pixel
			mov %r13, %rdi
			mov %r12, %rsi
			call shader

			# Draw pixel
			movq $3, %rax
			movq $color_template, %rdi
			call printf

			# Increment column and loop if not at the end
			inc %r12
			cmp columns, %r12
			jl render_row_loop

	render_row_end:
		# Newline, but fancier lol
		mov $newline, %rdi
		call printf

		# Increment row and loop if not at the end
		inc %r13
		cmp rows, %r13
		jl render_loop

render_end:
	# Flush buffer
	mov $newline, %rdi
	call printf

	# Restore callee-saved registers
	pop %r13
	pop %r12

	# Epilogue for render
	mov %rbp, %rsp
	pop %rbp
	pop %rbp

	ret
