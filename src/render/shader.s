.include "./render/cache_rays.s"

.bss

half_rows: .quad 0
half_columns: .quad 0

.text

max: .double 255.0
half: .double 127.5

min_column_height: .quad 8
half_min_column_height: .quad 4

background_color:
	.double 80.0
	.double 50.0
	.double 50.0

wall_color:
	.double 102.0
	.double 110.0
	.double 102.0

shader_setup:
	call cache_column_lengths

	ret

# Shader sets the output rgb on registers %xmm0-2

# Arguments:
# - %rdi: row
# - %rsi: column
shader:
	# Calculate if we have to draw background or column

	# Move column height to %rdx
	# mov $0, %rdx
	# mov column_length_cache(%rdx, %rsi, 8), %rdx
	mov $0, %rdx
	movb column_length_cache(%rdx), %dl

	# (Hardcoded for now)
	# mov %rsi, %rdx 
	# shl $59, %rdx 
	# shr $59, %rdx 

	# %rdx has the column height

	# Skip drawing the column if it's too small
	cmp min_column_height, %rdx
	jle draw_background
	
	# Check if we're inside of a column
	mov %rdx, %r8
	mov rows, %rcx
	sub %r8, %rcx			# %rcx = rows - column_height
	shr $1, %rcx			# %rcx = (rows - column_height) / 2

	cmp %rcx, %rdi # If on upper half
	jl background_upper_half

	add %rdx, %rcx			# %rcx = (rows - column_height) / 2 + column_height 
							#	   = (rows + column_height) / 2

	cmp %rcx, %rdi
	jg background_lower_half


draw_column:
	# %rdx has the column size
	sub min_column_height, %rdx
	cvtsi2sd %rdx, %xmm9
	cvtsi2sd rows, %xmm10
	divsd %xmm10, %xmm9
	
	# Interpolate color
	mov $wall_color, %rcx
	movsd %xmm9, %xmm0
	movsd %xmm9, %xmm1
	movsd %xmm9, %xmm2

	mulsd   (%rcx), %xmm0
	mulsd  8(%rcx), %xmm1
	mulsd 16(%rcx), %xmm2

	jmp shader_end


draw_background:
	cmp half_rows, %rdi
	jg background_lower_half
	jmp background_upper_half

	background_upper_half:
		mov half_rows, %rdx
		sub half_min_column_height, %rdx
		cvtsi2sd %rdi, %xmm9
		cvtsi2sd %rdx, %xmm10
		divsd %xmm10, %xmm9

		mulsd one_neg, %xmm9
		addsd one, %xmm9

		# Interpolate color
		mov $background_color, %rcx
		movsd %xmm9, %xmm0
		movsd %xmm9, %xmm1
		movsd %xmm9, %xmm2

		mulsd   (%rcx), %xmm0
		mulsd  8(%rcx), %xmm1
		mulsd 16(%rcx), %xmm2

		jmp shader_end

	background_lower_half:
		mov half_rows, %rdx
		sub half_min_column_height, %rdx
		sub half_rows, %rdi
		sub half_min_column_height, %rdi

		cvtsi2sd %rdi, %xmm9
		cvtsi2sd %rdx, %xmm10
		divsd %xmm10, %xmm9
		
		# Interpolate color
		mov $background_color, %rcx
		movsd %xmm9, %xmm0
		movsd %xmm9, %xmm1
		movsd %xmm9, %xmm2

		mulsd   (%rcx), %xmm0
		mulsd  8(%rcx), %xmm1
		mulsd 16(%rcx), %xmm2

		jmp shader_end







shader_end:
	# Clamp
	maxsd zero, %xmm0
	maxsd zero, %xmm1
	maxsd zero, %xmm2

	minsd max, %xmm0
	minsd max, %xmm1
	minsd max, %xmm2

	ret
	






gradient_shader:
	cvtsi2sd %rdi, %xmm0
	cvtsi2sd columns, %xmm1
	divsd %xmm1, %xmm0
	mulsd max, %xmm0

	cvtsi2sd %rsi, %xmm1
	cvtsi2sd rows, %xmm2
	divsd %xmm2, %xmm1
	mulsd max, %xmm1

	movsd pos_y, %xmm2
	divsd tau, %xmm2
	divsd tau, %xmm2
	mulsd max, %xmm2

	jmp shader_end
