.include "map/map.s"
.include "termios.s"
.include "render/main.s"
.include "input.s"
.include "trig.s"

.global main

.text

main:
	call set_termios_non_canonical
	call render_start

game_loop:
	call render
	call input

	jmp game_loop

epilogue:
	mov $0, %rdi
	call exit
