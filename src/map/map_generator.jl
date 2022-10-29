const default_map_size = 8

function generate_map(name::AbstractString, path::AbstractString)
	map = read(path, String)

	output = "$(name)_size: .quad $(length(split(map, '\n')))\n"

	output *= "$name: \n"


	for (i, row) in enumerate(split(map, '\n'))
		output *= "	# Row $(i-1) \n"
		for (j, num) in enumerate(row)
			output *= "	.byte $num # Pos ($(i-1), $(j-1))\n"
		end
		output *= "\n"
	end

	return output
end

function generate_map(
	input::Dict{<:AbstractString, <:AbstractString}, 
	output_path::AbstractString
)
	output = """
	.data

	game_map: .quad $(collect(keys(input))[1])

	map_size: .quad $default_map_size

	.text

	"""

	for (name, path) in input 
		output *= generate_map(name, path)
	end

	write(output_path, output)
end

const files = Dict(
	"debug" => "src/map/map_debug.txt",
	"map_1" => "src/map/map_1.txt",
	"map_2" => "src/map/map_2.txt",
	"map_3" => "src/map/map_3.txt",
)

generate_map(files, "src/map/map.s")