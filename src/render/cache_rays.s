.include "render/raycasting.s"

.data

column_length_cache: .skip 4096
max_column_height: .double 0.0

.text

column_height_scalar: .double 9384.0

angle_delta: .double 0.008 # in radians

cache_column_lengths:
	push %r15

	# Caclulate `angle - (angle_delta * columns) / 2`
	movsd angle, %xmm13
	cvtsi2sd columns, %xmm9
	mulsd angle_delta, %xmm9
	divsd two, %xmm9
	subsd %xmm9, %xmm13

	mov $0, %r15

cache_column_loop:
	addsd angle_delta, %xmm13 # Increment angle

	# Do the raycasting calculation with the angle
	movsd %xmm13, %xmm8 # Input
	call raycast # Output is stored on %rax

	movsd angle, %xmm8
	subsd %xmm13, %xmm8
	call cos
	movsd %xmm8, %xmm11

	# Convert from raycast length to column size
	cvtsi2sd %rax, %xmm9
	# sqrtsd %xmm9, %xmm9 # Square root?
	# divsd %xmm11, %xmm9
	movsd one, %xmm10
	divsd %xmm9, %xmm10
	divsd %xmm11, %xmm10
	mulsd column_height_scalar, %xmm10
	# sqrtsd  %xmm10, %xmm10 # Also square constant
	minsd max_column_height, %xmm10		# Clamp to 32
	cvttsd2si %xmm10, %rsi

	# Store the resulting column size in column_length_cache
	movb %sil, column_length_cache(%r15)

	# Loop
	inc %r15
	cmp columns, %r15
	jl cache_column_loop

	pop %r15

	ret
