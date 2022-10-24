.include "map.s"
.include "termios.s"
.include "render.s"
.include "input.s"

.global main

.text

main:
	call set_termios_non_canonical
	call render

game_loop:
	call input
	call render

	jmp game_loop

epilogue:
	mov $0, %rdi
	call exit
