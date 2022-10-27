let
	map = read("src/map/map.txt") 

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