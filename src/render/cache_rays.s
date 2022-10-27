.data

column_length_cache:
	.quad 0x10

.text

cache_column_lengths:
	movsd angle, %xmm6
	mov $0, %rdi

cache_column_loop:
	addsd angle_delta, %xmm6 # Increment angle

	# Do the raycasting calculation with the angle

	# Convert raycast length to column size

	# Store the resulting column size in column_length_cache(%rdi) (or similar)

	# Loop
	inc %rdi
	cmp columns, %rdi
	jl cache_column_loop

	ret