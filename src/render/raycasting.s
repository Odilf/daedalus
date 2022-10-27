.include "../map/map.s"

.data
tmp_angle: .double 0.0
delta_ray_x: .double 0.0
delta_ray_y: .double 0.0

.text
raycast_size: .double 0.001

# Will use %xmm8 to get angle in which it'll get distance for wall
# distance will be in rax.
# Uses xmm9 for ray_pos_x and xmm10 for ray_pos_y
#
# --------------------------------------------
#             C-like explanation
# --------------------------------------------
# raycast_size = (some hardwired value that will be inserted before compilation);
# r15 = 0;
# tmp_angle = angle;
# dx = sin(angle) * raycast_size;
# dy = cos(angle) * raycast_size;
# ray_pos_x = pos_x;
# ray_pos_y = pos_y;
#
# do {
#  r15++;
#  ray_pos_x += dx * raycast_size;
#  ray_pos_y += dy * raycast_size;
#} while (!collide(ray_pos_x, ray_pos_y));
# rax = r15
# return rax; 

raycast:
    push %rbp
    mov %rsp, %rbp
    
    push %r15
    mov $0, %r15

    # get sin and multiply by raycast_size to get dx
    movsd %xmm8, tmp_angle
    call sin
    mulsd raycast_size, %xmm8
    movsd %xmm8, delta_ray_x

    # get cos and multiply by raycast_size to get dx
    movsd tmp_angle, %xmm8
    call cos
    mulsd raycast_size, %xmm8
    movsd %xmm8, delta_ray_y

    # set xmm9 and xmm10 to x and y respectively
    movsd %xmm3, %xmm9
    movsd %xmm4, %xmm10

    # loop to add until it hits a wall
raycast_check:
    addsd 
    inc %r15

    addsd delta_ray_x, %xmm9
    addsd delta_ray_y, %xmm10
    call collision_ray

    cmp $0, %rax
    je raycast_check

    # exit
    mov %r15, %rax
    pop %r15

    push %rbp, %rsp
    pop %rbp
    ret

collision_ray:
    push %rbp
    mov %rsp, %rbp

    # Convert scalar double to quad integer
	cvttsd2si %xmm9, %rdi
	cvttsd2si %xmm10, %rax

	# multiply y with map_size to figure out row positionm, and add by x to figure out column position
	mul map_size 
	add %rax, %rdi

	# Get value of position to %rax
	mov map(%rdi), %rax

    push %rbp, %rsp
    pop %rbp
    ret
