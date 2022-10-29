# .include "map/map.s"

.bss
last_key: .quad 0

.data

pos_x: .double 0.0
pos_y: .double 0.0
angle: .double -1.57

# The value to use if something is outside the map
oob_collision_mode: .quad 0

.text

speed: .double  0.31415
angle_speed: .double 0.2

# GENERAL REMARKS

# In general, the following SSE registers are used: 
# - xmm3: pos_x
# - xmm4: pos_y
# - xmm5: angle

input:
	push %rbp
	mov %rsp, %rbp

	# Read from stdin, store input in $last_key
	mov $0, %rax		# read (
	mov $1, %rdi		# 	stdin
	mov $last_key, %rsi	# 	store in $last_key
	mov $1, %rdx		# 	read 1 byte
	syscall				# )

	mov last_key, %rdi	# Move last_key to register since we are goin to be using it a lot

	# Movement (WASD)
	cmp $0x77, %rdi		# last_key == 'w'?
	je move_forward

	cmp $0x73, %rdi		# last_key == 's'?
	je move_back

	cmp $0x61, %rdi		# last_key == 'a'?
	je move_left

	cmp $0x64, %rdi		# last_key == 'd'?
	je move_right

	# Camera (arrow keys)
	cmp $0x6C, %rdi		# last_key == 'l'?
	je rotate_right

	cmp $0x6A, %rdi		# last_key == 'j'?
	je rotate_left

	cmp $0x70, %rdi		# last_key == 'p'?
	je pause_game

	# Ignore everything else
	jmp input_end



	move_forward:
		# Calculate delta x
		movsd angle, %xmm8
		call cos
		movsd %xmm8, %xmm12
		mulsd speed, %xmm12

		# Calculate delta y
		movsd angle, %xmm8
		call sin
		movsd %xmm8, %xmm13
		mulsd speed, %xmm13

		# Add the deltas
		movsd pos_x, %xmm3
		addsd %xmm12, %xmm3

		movsd pos_y, %xmm4
		addsd %xmm13, %xmm4

		call check_collision
		jmp input_end

	move_back:
		# Calculate delta x
		movsd angle, %xmm8
		call cos
		movsd %xmm8, %xmm12
		mulsd speed, %xmm12

		# Calculate delta y
		movsd angle, %xmm8
		call sin
		movsd %xmm8, %xmm13
		mulsd speed, %xmm13

		# Subtract the deltas
		movsd pos_x, %xmm3
		subsd %xmm12, %xmm3

		movsd pos_y, %xmm4
		subsd %xmm13, %xmm4

		call check_collision
		jmp input_end


	move_right:
		# Calculate delta x
		movsd angle, %xmm8
		call cos
		movsd %xmm8, %xmm12
		mulsd speed, %xmm12

		# Calculate delta y
		movsd angle, %xmm8
		call sin
		movsd %xmm8, %xmm13
		mulsd speed, %xmm13

		# do pos + (-delta_y, delta_x)
		movsd pos_x, %xmm3
		subsd %xmm13, %xmm3

		movsd pos_y, %xmm4
		addsd %xmm12, %xmm4

		call check_collision
		jmp input_end

	move_left:
		# Calculate delta x
		movsd angle, %xmm8
		call cos
		movsd %xmm8, %xmm12
		mulsd speed, %xmm12

		# Calculate delta y
		movsd angle, %xmm8
		call sin
		movsd %xmm8, %xmm13
		mulsd speed, %xmm13

		# do pos + delta_y, -delta_x)
		movsd pos_x, %xmm3
		addsd %xmm13, %xmm3

		movsd pos_y, %xmm4
		subsd %xmm12, %xmm4

		call check_collision
		jmp input_end

	rotate_left:
		movsd angle, %xmm5
		subsd angle_speed, %xmm5
		jmp clamp_rotation

	rotate_right:
		movsd angle, %xmm5
		addsd angle_speed, %xmm5
		jmp clamp_rotation

		clamp_rotation:
			comisd pi, %xmm5
			jae sub_2pi

			comisd pi_neg, %xmm5
			jb add_2pi

			jmp clamp_end

		sub_2pi:
			subsd tau, %xmm5
			jmp clamp_end

		add_2pi:
			addsd tau, %xmm5
			jmp clamp_end

		clamp_end:
			movsd %xmm5, angle
			jmp input_end


	pause_game:
		mov screen, %rdi
		mov %rdi, last_screen
		movq $-1, screen
		jmp input_end

input_end:
	mov %rbp, %rsp
	pop %rbp

	ret

# Checks if pos_x and pos_y is inside a wall
# Moves values into pos_x, pos_y if valid
check_collision:
	# x is stored in %xmm3
	# y is stored in %xmm4

	# Convert scalar double to quad integer
	cvttsd2si %xmm3, %rdi
	cvttsd2si %xmm4, %rsi

	# %rdi has trunc(x)
	# %rsi has trunc(y)

	# Boundchecks
	cmp $-2, %rsi
	jle fade_and_advance_screen 

	# If x outside (0 <= x < map_size)
	cmp $0, %rdi
	jl check_collision_oob 
	cmp map_size, %rdi
	jge check_collision_oob 

	# If y outside (0 <= y < map_size)
	cmp $0, %rsi
	jl check_collision_oob 
	cmp map_size, %rsi
	jge check_collision_oob 

	# If outside box, allow
	# jmp check_collision_end

	check_collision_inside:
		# Convert scalar double to quad integer
		# Probably reduntand, but whatever
		cvttsd2si %xmm3, %rdi
		cvttsd2si %xmm4, %rax

		# multiply y with map_size to figure out row position, and add x to figure out column position
		mulq map_size
		add %rax, %rdi
		add game_map, %rdi

		# Check if that position is 0
		mov $0, %rax
		movb (%rdi), %al
		and $0x0, %rax
		cmpb $0, %al
		je check_collision_valid

		jmp check_collision_end

	check_collision_valid:
		movsd %xmm3, pos_x
		movsd %xmm4, pos_y

	check_collision_end:
		ret

	check_collision_oob:
		cmpq $0, oob_collision_mode
		je check_collision_valid

		jmp check_collision_end

place_player:
	movsd three_halves, %xmm14
	movsd %xmm14, pos_x
	
	cvtsi2sd map_size, %xmm14
	addsd one, %xmm14
	movsd %xmm14, pos_y

	movsd pi_half_neg, %xmm14
	movsd %xmm14, angle

	ret