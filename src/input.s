.bss

last_key: .quad 0

.data

pos_x: .double 4.0
pos_y: .double 4.0
angle: .double 0

.text

speed: .double  0.5
angle_speed: .double 0.3

# GENERAL REMARKS

# In general, the following SSE registers are used: 
# - xmm0: pos_x
# - xmm1: pos_y
# - xmm2: angle

input:
	push %rbp
	mov %rsp, %rbp

	# Read from stdin, store input in $last_key
	mov $0, %rax		# read (
	mov $1, %rdi		# 	stdin
	mov $last_key, %rsi	# 	store in $last_key
	mov $10, %rdx		# 	read 1 byte
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
	movsd pos_y, %xmm1
	addsd speed, %xmm1

	jmp check_collision

move_back:
	movsd pos_y, %xmm1
	subsd speed, %xmm1

	jmp check_collision

move_right:
	movsd pos_x, %xmm0
	addsd speed, %xmm0

	jmp check_collision

move_left:
	movsd pos_x, %xmm0
	subsd speed, %xmm0

	jmp check_collision

rotate_left:
	movsd angle, %xmm2
	addsd angle_speed, %xmm2
	jmp clamp_rotation

rotate_right:
	movsd angle, %xmm2
	subsd angle_speed, %xmm2
	jmp clamp_rotation

clamp_rotation:
	comisd pi, %xmm2
	jae sub_2pi

	comisd pi_neg, %xmm2
	jb add_2pi

	jmp clamp_end

sub_2pi:
	subsd tau, %xmm2
	jmp clamp_end

add_2pi:
	addsd tau, %xmm2
	jmp clamp_end

clamp_end:
	movsd %xmm2, angle
	jmp input_end


# Checks if pos_x and pos_y is inside a wall
# Moves values into pos_x, pos_y if valid
check_collision:
	# x is stored in %xmm0
	# y is stored in %xmm1

	# Convert scalar double to quad integer
	cvttsd2si %xmm0, %rdi
	cvttsd2si %xmm1, %rsi

	# %rdi has trunc(x)
	# %rsi has trunc(y)


	# Boundchecks

	# x boundcheck (0 <= x < map_x)
	cmp $0, %rdi
	jge check_collision_inside
	cmp map_x, %rdi
	jl check_collision_inside

	# y boundcheck (0 <= y < map_y)
	cmp $0, %rsi
	jge check_collision_inside
	cmp map_y, %rsi
	jl check_collision_inside

	# If outside box, allow
	jmp check_collision_valid

check_collision_inside:
	# Store 0 in %rax if it's valid
	mov map(%rdi), %rax
	# shr %rsi, %rax
	and $0x01, %rax

	cmp $0, %rax
	je check_collision_valid

	jmp check_collision_end

check_collision_valid:
	movsd %xmm0, pos_x
	movsd %xmm1, pos_y

check_collision_end:
	jmp input_end


input_end:
	mov %rbp, %rsp
	pop %rbp

	ret
