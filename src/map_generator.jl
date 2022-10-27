let
	map = """

	11111101
	10111001
	10000011
	10110101
	10001101
	10100011
	10111111"""

	output = ".text \n\n"
	output *= "map:"

	for i in map
		if i == '\n'
			output *= "\n	# new row\n"
		else
			output *= "	.byte $i\n"
		end
	end

	write("src/map.s", output)
end