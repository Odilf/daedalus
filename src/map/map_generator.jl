let
	map = read("src/map/map.txt", String) 

	output = ".text \n\n"
	map_size = split(map, '\n')[1] |> length
	output *= "map_size: $map_size \n\n"
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