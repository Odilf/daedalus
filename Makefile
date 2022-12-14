run:
	# Make sure address exists
	mkdir -p ./build

	# Create window size file
	gcc src/window/get_window_size.s -no-pie -o ./build/get_window_size
	./build/get_window_size

	# Run program
	cd src && gcc daedalus.s -no-pie -o ../build/daedalus
	./build/daedalus

generate_window:
	# Make sure address exists
	mkdir -p ./build

	# Create window size file
	gcc src/window/get_window_size.s -no-pie -o ./build/get_window_size
	./build/get_window_size

debug:
	# Make sure address exists
	mkdir -p ./build

	# Create window size file
	gcc src/window/get_window_size.s -no-pie -o ./build/get_window_size
	./build/get_window_size

	# Run program
	cd src && gcc daedalus.s -no-pie -g -o ../build/daedalus
	gdb ./build/daedalus