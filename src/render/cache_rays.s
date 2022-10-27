.include "render/raycasting.s"

.data

# Make sure this is the same as columns
column_length_cache: .skip 128

.text

column_height_scalar: .double 8000.0
max_column_height: .double 32.0

angle_delta: .double 0.1 # in radians

cache_column_lengths:
	push %r15
	movsd angle, %xmm8

	mov $0, %r15

cache_column_loop:
	addsd angle_delta, %xmm8 # Increment angle

	# Do the raycasting calculation with the angle
	call raycast # Output is stored on %rax

caca:
	# mov $401, %rax

	# Convert raycast length to column size
	cvtsi2sd %rax, %xmm9
	movsd one, %xmm10
	divsd %xmm9, %xmm10
	mulsd column_height_scalar, %xmm10
	maxss max_column_height, %xmm9		# Clamp to 32

	# movsd idk, %xmm10
	cvttsd2si %xmm10, %rsi

	# mov $20, %rsi

	# Store the resulting column size in column_length_cache(%rdi) (or similar)
	movb %sil, column_length_cache(%r15)

	# Loop
	inc %r15
	cmp columns, %r15
	jl cache_column_loop

	pop %r15

	ret
