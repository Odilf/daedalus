.bss

half_rows: .quad 0
half_columns: .quad 0

.text

max: .double 255.0
half: .double 127.5

min_column_height: .quad 8
half_min_column_height: .quad 4

# background_color:
# 	.double 162.0
# 	.double 103.0
# 	.double 105.0
background_color:
	.double 255.0
	.double 127.0
	.double 255.0

shader_setup:
	mov columns, %rdi
	shr $1, %rdi
	mov %rdi, half_columns

	mov rows, %rdi
	shr $1, %rdi
	mov %rdi, half_rows

	ret

# Shader sets the output rgb on registers %xmm3-5

# Arguments:
# - %rdi: row
# - %rsi: column
shader:
	cmp half_rows, %rdi
	jg lower_half
	jmp upper_half

upper_half:
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

lower_half:
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
# shader:
	cvtsi2sd %rdi, %xmm0
	cvtsi2sd columns, %xmm1
	divsd %xmm1, %xmm0
	mulsd max, %xmm0

	cvtsi2sd %rsi, %xmm1
	cvtsi2sd rows, %xmm2
	divsd %xmm2, %xmm1
	mulsd max, %xmm1

	movsd pos_y, %xmm2
	# subsd pi, %xmm2
	divsd tau, %xmm2
	divsd tau, %xmm2
	mulsd max, %xmm2

	jmp shader_end
