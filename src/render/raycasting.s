.include "map/map.s"

.data

ray_angle: .double 0.0
delta_ray_x: .double 0.0
delta_ray_y: .double 0.0

.text

render_distance: .quad 4096
raycast_size: .double 0.01

# Will use %xmm8 to get angle in which it'll get distance for wall
# distance will be in rax.
# Uses xmm9 for ray_pos_x and xmm10 for ray_pos_y
#
# --------------------------------------------
#             C-like explanation
# --------------------------------------------
# raycast_size = (some hardwired value that will be inserted before compilation);
# r15 = 0;
# ray_angle = angle;
# dx = sin(angle) * raycast_size;
# dy = cos(angle) * raycast_size;
# ray_pos_x = pos_x;
# ray_pos_y = pos_y;
#
# do {
#  r15++;
#  ray_pos_x += dx * raycast_size;
#  ray_pos_y += dy * raycast_size;
# } while (!collide(ray_pos_x, ray_pos_y));
# rax = r15
# return rax; 

raycast:
    push %rbp
    mov %rsp, %rbp
	
	# Save calle-saved register
    push %r15

	# %r15 holds the ray length
    mov $0, %r15

    # Get cos and multiply by raycast_size to get dx
    movsd %xmm8, ray_angle
    call cos
    mulsd raycast_size, %xmm8
    movsd %xmm8, delta_ray_x
 
    # Get sin and multiply by raycast_size to get dx
    movsd ray_angle, %xmm8
    call sin
    mulsd raycast_size, %xmm8
    movsd %xmm8, delta_ray_y

    # Set xmm9 and xmm10 to x and y respectively
    movsd pos_x, %xmm9
    movsd pos_y, %xmm10

raycast_check:
	# %r15 holds ray length
    inc %r15

	# Move vector
    addsd delta_ray_x, %xmm9
    addsd delta_ray_y, %xmm10

	# Check collision 
    call collision_ray

	cmp render_distance, %r15
    jge above_render_distance 

	# Loop if not collided
    cmp $0, %rax
	je raycast_check

	# cmp $1, %rax
	# je exit_raycast_check

	# jmp shit
	jmp exit_raycast_check

shit:
	mov $game_map, %rdx
	mov $1, %rdi
	call exit
	# je exit_raycast_check

    # jmp raycast_check

exit_raycast_check:
    # Move ray length to %rax (output)
    mov %r15, %rax

	# Restore calle-saved register
    pop %r15

    movq %rbp, %rsp
    pop %rbp
    ret

above_render_distance:
    mov render_distance, %r15
    jmp exit_raycast_check

# function for checking if ray is colliding wall/bounds
collision_ray:
    push %rbp
    mov %rsp, %rbp

    # Convert scalar double to quad integer
	cvttsd2si %xmm9, %rcx
	cvttsd2si %xmm10, %rax
    
    # mov map_size, %rbx
    # inc %rbx

    # jump if it is above map size + 1, meaning if it is out of bounds
	cmp $0, %rcx
	jl set_out_of_bounds

    cmp map_size, %rcx
    jge set_out_of_bounds

	cmp $0, %rax
	jl set_out_of_bounds

    cmp map_size, %rax
    jge set_out_of_bounds

	# multiply y with map_size to figure out row position, and add by x to figure out column position
	mulq map_size
	add %rax, %rcx

	# mov $map, %rdx
	# add %rdx, %rcx
	add $game_map, %rcx
	# Get value of position to %rax
	movq $0, %rax
	movb (%rcx), %al

	# Debug
	cmp $0, %rax
	je exit_collision_ray

	cmp $1, %rax
	je exit_collision_ray

	jmp shit

exit_collision_ray:
    movq %rbp, %rsp
    pop %rbp
    ret

set_out_of_bounds:
    mov $0, %rax
    jmp exit_collision_ray
