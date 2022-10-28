function generate_map(input)
	map = read(input, String) 

	output = ".text \n\n"
	map_size = split(map, '\n')[1] |> length
	output *= "map_size: .quad $map_size \n\n"
	output *= "map: \n"

	for i in map
		if i == '\n'
			output *= "\n	# new row\n"
		else
			output *= "	.byte $i\n"
		end
	end

	write("src/map/map.s", output)
end

normal = "src/map/map.txt"
debug = "src/map/map_debug.txt"

generate_map(normal)