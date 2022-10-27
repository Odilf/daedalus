.include "map/map.s"

.data

ray_angle: .double 0.0
delta_ray_x: .double 0.0
delta_ray_y: .double 0.0

.text

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

	# Loop if not collided
    cmp $0, %rax
    je raycast_check

    # Move ray length to %rax (output)
    mov %r15, %rax

	# Restore calle-saved register
    pop %r15

    movq %rbp, %rsp
    pop %rbp
    ret

collision_ray:
    push %rbp
    mov %rsp, %rbp

    # Convert scalar double to quad integer
	cvttsd2si %xmm9, %rdi
	cvttsd2si %xmm10, %rax

	# multiply y with map_size to figure out row positionm, and add by x to figure out column position
	mulq map_size
	add %rax, %rdi

	# Get value of position to %rax
	movb map(%rdi), %al

    movq %rbp, %rsp
    pop %rbp
    ret
