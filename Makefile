run:
	cd src && gcc daedalus.s -no-pie -o ../out/daedalus
	out/daedalus

debug:
	cd src && gcc daedalus.s -g -no-pie -o ../out/daedalus
	gdb out/daedalus