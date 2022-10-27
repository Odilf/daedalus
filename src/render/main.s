.include "render/shader.s"

.bss

row: .quad 0
column: .quad 0

render_buffer: .skip 4096

.text

clear_screen: .asciz "\033[2J"
reset_cursor_position: .asciz "\033[H"
set_cursor_position_template: .asciz "\033[%d;%dH"

go_down: .asciz "\033[1E"
color_template: .asciz "\033[38;2;%.0f;%.0f;%.0fm█"

terminal_background_color: .asciz "\033[48;2;64;0;5m"

newline: .asciz "\n"
# color_template: .asciz "[%.0f,%.0f,%.0f], "
# color_template: .asciz "[%d,%d,%d], "

# Maybe these could be defined as macros?
rows: .quad 32
columns: .quad 128

angle_delta: .double 0.3 # in radians
ray_length: .double 0.2

# Setup for rendering
# Right now, screen is only cleared at the start. Don't know if that's a bad idea
render_start: 
	# Clear screen
	mov $1, %rax 			# write
	mov $0, %rdi			# stdout
	mov $clear_screen, %rsi	# template
	mov $4, %rdx
	syscall

	ret


# Render goes through each "pixel" in the screen and calls `shader`. 
# Then, it takes the values of %xmm3, %xmm4 and %xmm5 and draws it in the screen
render:
	# Prologue for render
	push %rbp
	push %rbp
	mov %rsp, %rbp

	call shader_setup

	# Set background color
	mov $terminal_background_color, %rdi
	call printf

	# Clear screen
	mov $clear_screen, %rdi
	call printf
	
	mov $reset_cursor_position, %rdi
	call printf

	# Save callee-saved registers
	push %r12
	push %r13

	# %r12 stores column
	# %r13 stores row
	movq $0, render_buffer

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

	mov $set_cursor_position_template, %rdi
	mov %r13, %rsi
	mov %r12, %rdx
	call printf

	# TODO: just store in the buffer (?)
	# mov $3, %rax
	# mov $render_buffer, %rdi
	# mov $color_template, %rsi
	# call sprintf



	# Draw pixel
	movq $3, %rax
	movq $color_template, %rdi
	call printf

	# Increment column and loop if not at the end
	inc %r12
	cmp columns, %r12
	jl render_row_loop

render_row_end:
	# mov $render_buffer, %rdi
	# mov $go_down, %rsi
	# call sprintf
	# mov $go_down, %rdi
	# call printf

	# Increment row and loop if not at the end
	inc %r13
	cmp rows, %r13
	jl render_loop

render_end:
	# Flush buffer
	# mov $render_buffer, %rdi
	# call printf

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
