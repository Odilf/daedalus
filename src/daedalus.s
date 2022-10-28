.include "termios.s"
.include "render/main.s"
.include "input.s"
.include "trig.s"
.include "screens/intro.s"

.global main

.data

screen: .quad 0

.text

main:
	call set_termios_non_canonical
	call render_setup

main_loop:
	cmpq $0, screen
	je g_intro

	cmpq $1, screen
	je game

	jmp epilogue

	g_intro:
		call intro

		jmp main_loop

	game:
		call render
		call input

		jmp main_loop

epilogue:
	mov $0, %rdi
	call exit
