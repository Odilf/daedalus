.bss

last_key: .quad 0

.data

pos_x: .double 3.0
pos_y: .double 3.5
delta_pos_x: .double 1.0
delta_pos_y: .double 0.0
angle: .double 0

.text

speed: .double  0.5
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
	movsd pos_y, %xmm4
	addsd speed, %xmm4

	jmp check_collision

move_back:
	movsd pos_y, %xmm4
	subsd speed, %xmm4

	jmp check_collision

move_right:
	movsd pos_x, %xmm3
	addsd speed, %xmm3

	jmp check_collision

move_left:
	movsd pos_x, %xmm3
	subsd speed, %xmm3

	jmp check_collision

rotate_left:
	movsd angle, %xmm5
	addsd angle_speed, %xmm5
	jmp clamp_rotation

rotate_right:
	movsd angle, %xmm5
	subsd angle_speed, %xmm5
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

	# x boundcheck (0 <= x < map_size)
	cmp $0, %rdi
	jge check_collision_inside
	cmp map_size, %rdi
	jl check_collision_inside

	# y boundcheck (0 <= y < map_size)
	cmp $0, %rsi
	jge check_collision_inside
	cmp map_size, %rsi
	jl check_collision_inside

	# If outside box, allow
	jmp check_collision_valid

check_collision_inside:
	# TODO: Implement collision properly
	# jmp check_collision_valid

	# Convert scalar double to quad integer
	cvttsd2si %xmm3, %rdi
	cvttsd2si %xmm4, %rax

	# multiply y with map_size to figure out row positionm, and add by x to figure out column position
	mulq map_size
	add %rax, %rdi

	# Check if that position is 0
	cmpb $0, map(%rdi)
	je check_collision_valid

	jmp check_collision_end

check_collision_valid:
	movsd %xmm3, pos_x
	movsd %xmm4, pos_y



check_collision_end:
	jmp input_end

input_end:
	mov %rbp, %rsp
	pop %rbp

	ret



