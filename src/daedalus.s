.include "termios.s"
.include "render/main.s"
.include "input.s"
.include "trig.s"
.include "screens/intro.s"
.include "screens/pause.s"
.include "screens/cutscene_1.s"

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
	je intro

	cmpq $2, screen
	je cutscene_1

	game:
		call render
		call input

		jmp main_loop

	# Exit point is here
	g_pause:
		call show_pause
		jmp main_loop

fade_and_advance_screen:
	call fade_out
advance_screen:
	add $1, screen
	jmp main_loop