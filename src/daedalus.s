.include "termios.s"
.include "render/main.s"
.include "input.s"
.include "trig.s"
.include "screens/intro.s"
.include "screens/pause.s"

.global main

.data

screen: .quad 0
last_screen: .quad 0

.text

main:
	call set_termios_non_canonical
	call render_setup

main_loop:
	# Get screen and print it
	cmpq $-1, screen
	je g_pause

	cmpq $0, screen
	je g_intro

	cmpq $1, screen
	je game

	game:
		call render
		call input

		jmp main_loop

	g_intro:
		call intro
		jmp main_loop

	# Exit point is here
	g_pause:
		call show_pause
		jmp main_loop