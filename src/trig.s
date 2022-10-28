.text

one_neg: .double -1.0
zero: .double 0.0
one: .double 1.0
two: .double 2.0
six: .double 6.0
twenty_four: .double 24.0
hundred_twenty: .double 120.0

tau: .double 6.2831853072
pi: .double 3.14159265358979323846
pi_neg: .double -3.14159265358979323846
pi_half: .double 1.5707963268
pi_half_neg: .double -1.5707963268

# Input (call it x) is passed in %xmm8
# Modifies %xmm9, 10 and 11
cos:
	# Invert angle if outside -pi/2 to pi/2 range
	movsd one_neg, %xmm11

	comisd pi_half, %xmm8
	ja cos_sub_pi

	comisd pi_half_neg, %xmm8
	jb cos_add_pi

	movsd one, %xmm11
	jmp cos_main

	cos_sub_pi:
		subsd pi, %xmm8
		jmp cos_main

	cos_add_pi:
		addsd pi, %xmm8
		jmp cos_main

	# Main Taylor series calculation
	cos_main:
		movsd %xmm8, %xmm9
		movsd %xmm8, %xmm10

		mulsd %xmm8, %xmm9	# %xmm9 has x^2
		divsd two, %xmm9	# %xmm9 has x^2/2


		mulsd %xmm8, %xmm10	# %xmm10 has x^2
		mulsd %xmm8, %xmm10	# %xmm10 has x^3
		mulsd %xmm8, %xmm10	# %xmm10 has x^4
		divsd twenty_four, %xmm10	# %xmm10 has x^4 / 4!
		
		# 1 - x^2/2! + x^4/4!
		movsd one, %xmm8
		subsd %xmm9, %xmm8
		addsd %xmm10, %xmm8

		mulsd %xmm11, %xmm8

		ret

# Input (call it x) is passed in %xmm8
# Modifies %xmm9 and %xmm10
sin:
	# Invert angle if outside -pi/2 to pi/2 range
	movsd one_neg, %xmm11

	comisd pi_half, %xmm8
	ja sin_sub_pi

	comisd pi_half_neg, %xmm8
	jb sin_add_pi

	movsd one, %xmm11
	jmp sin_main

	sin_sub_pi:
		subsd pi, %xmm8
		jmp sin_main

	sin_add_pi:
		addsd pi, %xmm8
		jmp sin_main

	sin_main:
		movsd %xmm8, %xmm9
		movsd %xmm8, %xmm10

		mulsd %xmm8, %xmm9	# %xmm9 has x^2
		mulsd %xmm8, %xmm9	# %xmm9 has x^3
		divsd six, %xmm9	# %xmm9 has x^3/3!


		mulsd %xmm8, %xmm10				# %xmm10 has x^2
		mulsd %xmm8, %xmm10				# %xmm10 has x^3
		mulsd %xmm8, %xmm10				# %xmm10 has x^4
		mulsd %xmm8, %xmm10				# %xmm10 has x^5
		divsd hundred_twenty, %xmm10	# %xmm10 has x^5 / 5!
		
		# x - x^3/3! + x^5/5!
		subsd %xmm9, %xmm8
		addsd %xmm10, %xmm8

		mulsd %xmm11, %xmm8

		ret
