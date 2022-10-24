.data

termios: .skip 148
# struct termios {
# 	tcflag_t c_iflag;               /* input mode flags 	32 bits	*/ 
# 	tcflag_t c_oflag;               /* output mode flags 	32 bits	*/
# 	tcflag_t c_cflag;               /* control mode flags 	32 bits	*/
# 	tcflag_t c_lflag;               /* local mode flags 	32 bits	*/
# 	cc_t c_line;                    /* line discipline 		 1 bit	*/
# 	cc_t c_cc[NCCS];                /* control characters 	19 bits	*/
# };

.text

set_termios_non_canonical:
	# Get termios struct and store it in $termios
	mov $16, %rax 		# IOCTL
	mov $0, %rdi		# stdin
	mov $0x5401, %rsi	# TCGETS
	mov $termios, %rdx	# pointer to struct
	syscall

	# Set flag
	mov $0x00000002, %rdi	# ICANON flag
	mov $termios, %rsi		# Get termios address
	add $12, %rsi			# Offset to get `c_lflag`
	mov (%rsi), %rdx		# Move c_lflag to rdx

	not %rdi				# not ICANON
	and %rdx, %rdi			# c_lflag and (not ICANON)
	mov %rdi, (%rsi)		# Move it back

	# Notify of change
	mov $16, %rax 		# IOCTL
	mov $0, %rdi		# stdin
	mov $0x5402, %rsi	# TCSETS
	mov $termios, %rdx	# pointer to struct
	syscall

	ret
