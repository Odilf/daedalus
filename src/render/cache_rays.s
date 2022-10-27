.include "render/raycasting.s"

.data

# Make sure this is the same as columns
column_length_cache: .skip 128

.text

column_height_scalar: .double 32.0
max_column_height: .double 20.0

angle_delta: .double 0.3 # in radians

cache_column_lengths:
	movsd angle, %xmm8
	mov $0, %rdi

cache_column_loop:
	addsd angle_delta, %xmm8 # Increment angle

	# Do the raycasting calculation with the angle
	call raycast # Output is stored on %rax

	# Convert raycast length to column size
	cvtsi2ss %rax, %xmm9
	rcpss %xmm9, %xmm9
	mulss column_height_scalar, %xmm9
	maxss max_column_height, %xmm9
	cvttss2si %xmm9, %rsi

	# Store the resulting column size in column_length_cache(%rdi) (or similar)
	movb %sil, column_length_cache(%rdi)
	# movb $16, column_length_cache(%rdi)

	# NOTE: We should also clamp the values if they're too big!

	# Loop
	inc %rdi
	cmp columns, %rdi
	jl cache_column_loop

	ret
