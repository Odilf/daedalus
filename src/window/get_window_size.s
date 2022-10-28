.global main

.bss

file: .quad 0
filedata: .skip 16
terminal_dimensions: .skip 8
terminal_dimensions_quad: .skip 16

.text

filename: .asciz "build/window_size.daedalus"
mode: .asciz "wb+"

template: .asciz "Found %d and %d\n"

pseudo_breakpoint_write: .asciz "Written!\n"
pseudo_breakpoint_read: .asciz "Read!\n"

main:
	# Prologue
	push %rbp
	mov %rsp, %rbp

	# Get and dynamically set terminal size
	mov $16, %rax           # Kernel function SYS_IOCTL
    mov $1, %rdi            # STDOUT
    mov $0x5413, %rsi       # TIOCGWINSZ
    mov $terminal_dimensions, %rdx           # struct winsize sz
    syscall                 # Call Linux

	mov $0, %rdi
	movw terminal_dimensions, %di
	dec %rdi

	mov $0, %rsi
	movw terminal_dimensions + 2, %si

	mov %rdi, filedata
	mov %rsi, filedata + 8

	# Open the file
	mov $filename, %rdi
	mov $mode, %rsi
	call fopen

	mov %rax, file

	# Write two quads
	mov $filedata, %rdi
	mov $8, %rsi
	mov $2, %rdx
	mov file, %rcx
	call fwrite

	# Close the file
	mov file, %rdi
	call fclose

	# Epilogue
	mov %rbp, %rsp
	pop %rbp

	mov $0, %rdi
	call exit

error_msg: .asciz "Something went wrong"
error:
	mov $error_msg, %rdi
	call printf
