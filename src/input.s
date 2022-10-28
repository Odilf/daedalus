# .include "map/map.s"

.bss
last_key: .quad 0

.data

pos_x: .double 3.0
pos_y: .double 3.5
angle: .double 1.57

.text

speed: .double  0.31415
angle_speed: .double 0.1

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

	# If x outside (0 <= x < map_size)
	cmp $0, %rdi
	jl check_collision_valid 
	cmp map_size, %rdi
	jge check_collision_valid 

	# If x inside (0 <= y < map_size)
	cmp $0, %rsi
	jl check_collision_valid 
	cmp map_size, %rsi
	jge check_collision_valid 

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

		# Check if that position is 0
		cmpb $0, game_map(%rdi)
		je check_collision_valid

		jmp check_collision_end

	check_collision_valid:
		movsd %xmm3, pos_x
		movsd %xmm4, pos_y

	check_collision_end:
		ret

