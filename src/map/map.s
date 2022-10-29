.data

game_map: .quad map_1

map_size: .quad 8

.text

map_1_size: .quad 8
map_1: 
	# Row 0 
	.byte 1 # Pos (0, 0)
	.byte 1 # Pos (0, 1)
	.byte 1 # Pos (0, 2)
	.byte 1 # Pos (0, 3)
	.byte 1 # Pos (0, 4)
	.byte 1 # Pos (0, 5)
	.byte 0 # Pos (0, 6)
	.byte 1 # Pos (0, 7)

	# Row 1 
	.byte 1 # Pos (1, 0)
	.byte 0 # Pos (1, 1)
	.byte 1 # Pos (1, 2)
	.byte 1 # Pos (1, 3)
	.byte 1 # Pos (1, 4)
	.byte 0 # Pos (1, 5)
	.byte 0 # Pos (1, 6)
	.byte 1 # Pos (1, 7)

	# Row 2 
	.byte 1 # Pos (2, 0)
	.byte 0 # Pos (2, 1)
	.byte 0 # Pos (2, 2)
	.byte 0 # Pos (2, 3)
	.byte 1 # Pos (2, 4)
	.byte 0 # Pos (2, 5)
	.byte 1 # Pos (2, 6)
	.byte 1 # Pos (2, 7)

	# Row 3 
	.byte 1 # Pos (3, 0)
	.byte 0 # Pos (3, 1)
	.byte 1 # Pos (3, 2)
	.byte 1 # Pos (3, 3)
	.byte 1 # Pos (3, 4)
	.byte 0 # Pos (3, 5)
	.byte 0 # Pos (3, 6)
	.byte 1 # Pos (3, 7)

	# Row 4 
	.byte 1 # Pos (4, 0)
	.byte 0 # Pos (4, 1)
	.byte 0 # Pos (4, 2)
	.byte 0 # Pos (4, 3)
	.byte 1 # Pos (4, 4)
	.byte 1 # Pos (4, 5)
	.byte 0 # Pos (4, 6)
	.byte 1 # Pos (4, 7)

	# Row 5 
	.byte 1 # Pos (5, 0)
	.byte 0 # Pos (5, 1)
	.byte 1 # Pos (5, 2)
	.byte 0 # Pos (5, 3)
	.byte 1 # Pos (5, 4)
	.byte 0 # Pos (5, 5)
	.byte 0 # Pos (5, 6)
	.byte 1 # Pos (5, 7)

	# Row 6 
	.byte 1 # Pos (6, 0)
	.byte 0 # Pos (6, 1)
	.byte 1 # Pos (6, 2)
	.byte 0 # Pos (6, 3)
	.byte 0 # Pos (6, 4)
	.byte 0 # Pos (6, 5)
	.byte 0 # Pos (6, 6)
	.byte 1 # Pos (6, 7)

	# Row 7 
	.byte 1 # Pos (7, 0)
	.byte 0 # Pos (7, 1)
	.byte 1 # Pos (7, 2)
	.byte 1 # Pos (7, 3)
	.byte 1 # Pos (7, 4)
	.byte 1 # Pos (7, 5)
	.byte 1 # Pos (7, 6)
	.byte 1 # Pos (7, 7)

map_2_size: .quad 16
map_2: 
	# Row 0 
	.byte 1 # Pos (0, 0)
	.byte 1 # Pos (0, 1)
	.byte 1 # Pos (0, 2)
	.byte 1 # Pos (0, 3)
	.byte 1 # Pos (0, 4)
	.byte 1 # Pos (0, 5)
	.byte 1 # Pos (0, 6)
	.byte 1 # Pos (0, 7)
	.byte 1 # Pos (0, 8)
	.byte 1 # Pos (0, 9)
	.byte 1 # Pos (0, 10)
	.byte 1 # Pos (0, 11)
	.byte 1 # Pos (0, 12)
	.byte 1 # Pos (0, 13)
	.byte 0 # Pos (0, 14)
	.byte 1 # Pos (0, 15)

	# Row 1 
	.byte 1 # Pos (1, 0)
	.byte 0 # Pos (1, 1)
	.byte 0 # Pos (1, 2)
	.byte 1 # Pos (1, 3)
	.byte 0 # Pos (1, 4)
	.byte 0 # Pos (1, 5)
	.byte 0 # Pos (1, 6)
	.byte 0 # Pos (1, 7)
	.byte 0 # Pos (1, 8)
	.byte 1 # Pos (1, 9)
	.byte 1 # Pos (1, 10)
	.byte 0 # Pos (1, 11)
	.byte 0 # Pos (1, 12)
	.byte 0 # Pos (1, 13)
	.byte 0 # Pos (1, 14)
	.byte 1 # Pos (1, 15)

	# Row 2 
	.byte 1 # Pos (2, 0)
	.byte 0 # Pos (2, 1)
	.byte 0 # Pos (2, 2)
	.byte 1 # Pos (2, 3)
	.byte 0 # Pos (2, 4)
	.byte 0 # Pos (2, 5)
	.byte 1 # Pos (2, 6)
	.byte 1 # Pos (2, 7)
	.byte 1 # Pos (2, 8)
	.byte 1 # Pos (2, 9)
	.byte 0 # Pos (2, 10)
	.byte 0 # Pos (2, 11)
	.byte 0 # Pos (2, 12)
	.byte 1 # Pos (2, 13)
	.byte 1 # Pos (2, 14)
	.byte 1 # Pos (2, 15)

	# Row 3 
	.byte 1 # Pos (3, 0)
	.byte 0 # Pos (3, 1)
	.byte 0 # Pos (3, 2)
	.byte 1 # Pos (3, 3)
	.byte 1 # Pos (3, 4)
	.byte 0 # Pos (3, 5)
	.byte 1 # Pos (3, 6)
	.byte 0 # Pos (3, 7)
	.byte 0 # Pos (3, 8)
	.byte 0 # Pos (3, 9)
	.byte 0 # Pos (3, 10)
	.byte 0 # Pos (3, 11)
	.byte 0 # Pos (3, 12)
	.byte 0 # Pos (3, 13)
	.byte 0 # Pos (3, 14)
	.byte 1 # Pos (3, 15)

	# Row 4 
	.byte 1 # Pos (4, 0)
	.byte 0 # Pos (4, 1)
	.byte 0 # Pos (4, 2)
	.byte 0 # Pos (4, 3)
	.byte 1 # Pos (4, 4)
	.byte 0 # Pos (4, 5)
	.byte 0 # Pos (4, 6)
	.byte 0 # Pos (4, 7)
	.byte 1 # Pos (4, 8)
	.byte 1 # Pos (4, 9)
	.byte 1 # Pos (4, 10)
	.byte 1 # Pos (4, 11)
	.byte 1 # Pos (4, 12)
	.byte 1 # Pos (4, 13)
	.byte 1 # Pos (4, 14)
	.byte 1 # Pos (4, 15)

	# Row 5 
	.byte 1 # Pos (5, 0)
	.byte 1 # Pos (5, 1)
	.byte 1 # Pos (5, 2)
	.byte 0 # Pos (5, 3)
	.byte 1 # Pos (5, 4)
	.byte 1 # Pos (5, 5)
	.byte 0 # Pos (5, 6)
	.byte 1 # Pos (5, 7)
	.byte 1 # Pos (5, 8)
	.byte 1 # Pos (5, 9)
	.byte 0 # Pos (5, 10)
	.byte 1 # Pos (5, 11)
	.byte 0 # Pos (5, 12)
	.byte 0 # Pos (5, 13)
	.byte 0 # Pos (5, 14)
	.byte 1 # Pos (5, 15)

	# Row 6 
	.byte 1 # Pos (6, 0)
	.byte 0 # Pos (6, 1)
	.byte 1 # Pos (6, 2)
	.byte 0 # Pos (6, 3)
	.byte 0 # Pos (6, 4)
	.byte 0 # Pos (6, 5)
	.byte 0 # Pos (6, 6)
	.byte 0 # Pos (6, 7)
	.byte 0 # Pos (6, 8)
	.byte 0 # Pos (6, 9)
	.byte 0 # Pos (6, 10)
	.byte 1 # Pos (6, 11)
	.byte 0 # Pos (6, 12)
	.byte 1 # Pos (6, 13)
	.byte 1 # Pos (6, 14)
	.byte 1 # Pos (6, 15)

	# Row 7 
	.byte 1 # Pos (7, 0)
	.byte 0 # Pos (7, 1)
	.byte 1 # Pos (7, 2)
	.byte 1 # Pos (7, 3)
	.byte 1 # Pos (7, 4)
	.byte 1 # Pos (7, 5)
	.byte 1 # Pos (7, 6)
	.byte 1 # Pos (7, 7)
	.byte 1 # Pos (7, 8)
	.byte 0 # Pos (7, 9)
	.byte 0 # Pos (7, 10)
	.byte 1 # Pos (7, 11)
	.byte 0 # Pos (7, 12)
	.byte 0 # Pos (7, 13)
	.byte 0 # Pos (7, 14)
	.byte 1 # Pos (7, 15)

	# Row 8 
	.byte 1 # Pos (8, 0)
	.byte 0 # Pos (8, 1)
	.byte 0 # Pos (8, 2)
	.byte 0 # Pos (8, 3)
	.byte 0 # Pos (8, 4)
	.byte 0 # Pos (8, 5)
	.byte 0 # Pos (8, 6)
	.byte 0 # Pos (8, 7)
	.byte 1 # Pos (8, 8)
	.byte 0 # Pos (8, 9)
	.byte 0 # Pos (8, 10)
	.byte 0 # Pos (8, 11)
	.byte 0 # Pos (8, 12)
	.byte 0 # Pos (8, 13)
	.byte 0 # Pos (8, 14)
	.byte 1 # Pos (8, 15)

	# Row 9 
	.byte 1 # Pos (9, 0)
	.byte 1 # Pos (9, 1)
	.byte 0 # Pos (9, 2)
	.byte 1 # Pos (9, 3)
	.byte 1 # Pos (9, 4)
	.byte 1 # Pos (9, 5)
	.byte 1 # Pos (9, 6)
	.byte 1 # Pos (9, 7)
	.byte 1 # Pos (9, 8)
	.byte 1 # Pos (9, 9)
	.byte 1 # Pos (9, 10)
	.byte 1 # Pos (9, 11)
	.byte 1 # Pos (9, 12)
	.byte 0 # Pos (9, 13)
	.byte 0 # Pos (9, 14)
	.byte 1 # Pos (9, 15)

	# Row 10 
	.byte 1 # Pos (10, 0)
	.byte 0 # Pos (10, 1)
	.byte 0 # Pos (10, 2)
	.byte 0 # Pos (10, 3)
	.byte 0 # Pos (10, 4)
	.byte 0 # Pos (10, 5)
	.byte 0 # Pos (10, 6)
	.byte 0 # Pos (10, 7)
	.byte 0 # Pos (10, 8)
	.byte 0 # Pos (10, 9)
	.byte 0 # Pos (10, 10)
	.byte 0 # Pos (10, 11)
	.byte 1 # Pos (10, 12)
	.byte 0 # Pos (10, 13)
	.byte 0 # Pos (10, 14)
	.byte 1 # Pos (10, 15)

	# Row 11 
	.byte 1 # Pos (11, 0)
	.byte 1 # Pos (11, 1)
	.byte 0 # Pos (11, 2)
	.byte 1 # Pos (11, 3)
	.byte 1 # Pos (11, 4)
	.byte 1 # Pos (11, 5)
	.byte 1 # Pos (11, 6)
	.byte 0 # Pos (11, 7)
	.byte 1 # Pos (11, 8)
	.byte 1 # Pos (11, 9)
	.byte 0 # Pos (11, 10)
	.byte 0 # Pos (11, 11)
	.byte 1 # Pos (11, 12)
	.byte 0 # Pos (11, 13)
	.byte 0 # Pos (11, 14)
	.byte 1 # Pos (11, 15)

	# Row 12 
	.byte 1 # Pos (12, 0)
	.byte 0 # Pos (12, 1)
	.byte 0 # Pos (12, 2)
	.byte 0 # Pos (12, 3)
	.byte 0 # Pos (12, 4)
	.byte 0 # Pos (12, 5)
	.byte 0 # Pos (12, 6)
	.byte 0 # Pos (12, 7)
	.byte 0 # Pos (12, 8)
	.byte 1 # Pos (12, 9)
	.byte 0 # Pos (12, 10)
	.byte 0 # Pos (12, 11)
	.byte 1 # Pos (12, 12)
	.byte 0 # Pos (12, 13)
	.byte 0 # Pos (12, 14)
	.byte 1 # Pos (12, 15)

	# Row 13 
	.byte 1 # Pos (13, 0)
	.byte 0 # Pos (13, 1)
	.byte 1 # Pos (13, 2)
	.byte 1 # Pos (13, 3)
	.byte 1 # Pos (13, 4)
	.byte 1 # Pos (13, 5)
	.byte 1 # Pos (13, 6)
	.byte 1 # Pos (13, 7)
	.byte 1 # Pos (13, 8)
	.byte 1 # Pos (13, 9)
	.byte 0 # Pos (13, 10)
	.byte 0 # Pos (13, 11)
	.byte 1 # Pos (13, 12)
	.byte 0 # Pos (13, 13)
	.byte 0 # Pos (13, 14)
	.byte 1 # Pos (13, 15)

	# Row 14 
	.byte 1 # Pos (14, 0)
	.byte 0 # Pos (14, 1)
	.byte 0 # Pos (14, 2)
	.byte 0 # Pos (14, 3)
	.byte 0 # Pos (14, 4)
	.byte 0 # Pos (14, 5)
	.byte 0 # Pos (14, 6)
	.byte 0 # Pos (14, 7)
	.byte 0 # Pos (14, 8)
	.byte 0 # Pos (14, 9)
	.byte 0 # Pos (14, 10)
	.byte 0 # Pos (14, 11)
	.byte 0 # Pos (14, 12)
	.byte 0 # Pos (14, 13)
	.byte 0 # Pos (14, 14)
	.byte 1 # Pos (14, 15)

	# Row 15 
	.byte 1 # Pos (15, 0)
	.byte 0 # Pos (15, 1)
	.byte 1 # Pos (15, 2)
	.byte 1 # Pos (15, 3)
	.byte 1 # Pos (15, 4)
	.byte 1 # Pos (15, 5)
	.byte 1 # Pos (15, 6)
	.byte 1 # Pos (15, 7)
	.byte 1 # Pos (15, 8)
	.byte 1 # Pos (15, 9)
	.byte 1 # Pos (15, 10)
	.byte 1 # Pos (15, 11)
	.byte 1 # Pos (15, 12)
	.byte 1 # Pos (15, 13)
	.byte 1 # Pos (15, 14)
	.byte 1 # Pos (15, 15)

map_3_size: .quad 16
map_3: 
	# Row 0 
	.byte 1 # Pos (0, 0)
	.byte 1 # Pos (0, 1)
	.byte 1 # Pos (0, 2)
	.byte 1 # Pos (0, 3)
	.byte 1 # Pos (0, 4)
	.byte 1 # Pos (0, 5)
	.byte 1 # Pos (0, 6)
	.byte 1 # Pos (0, 7)
	.byte 1 # Pos (0, 8)
	.byte 1 # Pos (0, 9)
	.byte 1 # Pos (0, 10)
	.byte 0 # Pos (0, 11)
	.byte 1 # Pos (0, 12)
	.byte 1 # Pos (0, 13)
	.byte 1 # Pos (0, 14)
	.byte 1 # Pos (0, 15)

	# Row 1 
	.byte 1 # Pos (1, 0)
	.byte 0 # Pos (1, 1)
	.byte 0 # Pos (1, 2)
	.byte 0 # Pos (1, 3)
	.byte 0 # Pos (1, 4)
	.byte 0 # Pos (1, 5)
	.byte 0 # Pos (1, 6)
	.byte 0 # Pos (1, 7)
	.byte 0 # Pos (1, 8)
	.byte 0 # Pos (1, 9)
	.byte 0 # Pos (1, 10)
	.byte 1 # Pos (1, 11)
	.byte 0 # Pos (1, 12)
	.byte 0 # Pos (1, 13)
	.byte 0 # Pos (1, 14)
	.byte 1 # Pos (1, 15)

	# Row 2 
	.byte 1 # Pos (2, 0)
	.byte 0 # Pos (2, 1)
	.byte 0 # Pos (2, 2)
	.byte 0 # Pos (2, 3)
	.byte 0 # Pos (2, 4)
	.byte 0 # Pos (2, 5)
	.byte 0 # Pos (2, 6)
	.byte 0 # Pos (2, 7)
	.byte 0 # Pos (2, 8)
	.byte 0 # Pos (2, 9)
	.byte 0 # Pos (2, 10)
	.byte 1 # Pos (2, 11)
	.byte 0 # Pos (2, 12)
	.byte 0 # Pos (2, 13)
	.byte 0 # Pos (2, 14)
	.byte 1 # Pos (2, 15)

	# Row 3 
	.byte 1 # Pos (3, 0)
	.byte 0 # Pos (3, 1)
	.byte 0 # Pos (3, 2)
	.byte 0 # Pos (3, 3)
	.byte 1 # Pos (3, 4)
	.byte 0 # Pos (3, 5)
	.byte 0 # Pos (3, 6)
	.byte 0 # Pos (3, 7)
	.byte 0 # Pos (3, 8)
	.byte 0 # Pos (3, 9)
	.byte 0 # Pos (3, 10)
	.byte 1 # Pos (3, 11)
	.byte 0 # Pos (3, 12)
	.byte 0 # Pos (3, 13)
	.byte 0 # Pos (3, 14)
	.byte 1 # Pos (3, 15)

	# Row 4 
	.byte 1 # Pos (4, 0)
	.byte 0 # Pos (4, 1)
	.byte 0 # Pos (4, 2)
	.byte 0 # Pos (4, 3)
	.byte 1 # Pos (4, 4)
	.byte 0 # Pos (4, 5)
	.byte 0 # Pos (4, 6)
	.byte 0 # Pos (4, 7)
	.byte 0 # Pos (4, 8)
	.byte 0 # Pos (4, 9)
	.byte 0 # Pos (4, 10)
	.byte 1 # Pos (4, 11)
	.byte 0 # Pos (4, 12)
	.byte 0 # Pos (4, 13)
	.byte 0 # Pos (4, 14)
	.byte 1 # Pos (4, 15)

	# Row 5 
	.byte 1 # Pos (5, 0)
	.byte 0 # Pos (5, 1)
	.byte 0 # Pos (5, 2)
	.byte 0 # Pos (5, 3)
	.byte 1 # Pos (5, 4)
	.byte 0 # Pos (5, 5)
	.byte 0 # Pos (5, 6)
	.byte 0 # Pos (5, 7)
	.byte 0 # Pos (5, 8)
	.byte 0 # Pos (5, 9)
	.byte 0 # Pos (5, 10)
	.byte 1 # Pos (5, 11)
	.byte 0 # Pos (5, 12)
	.byte 0 # Pos (5, 13)
	.byte 0 # Pos (5, 14)
	.byte 1 # Pos (5, 15)

	# Row 6 
	.byte 1 # Pos (6, 0)
	.byte 0 # Pos (6, 1)
	.byte 0 # Pos (6, 2)
	.byte 0 # Pos (6, 3)
	.byte 1 # Pos (6, 4)
	.byte 0 # Pos (6, 5)
	.byte 0 # Pos (6, 6)
	.byte 0 # Pos (6, 7)
	.byte 0 # Pos (6, 8)
	.byte 0 # Pos (6, 9)
	.byte 0 # Pos (6, 10)
	.byte 1 # Pos (6, 11)
	.byte 0 # Pos (6, 12)
	.byte 0 # Pos (6, 13)
	.byte 0 # Pos (6, 14)
	.byte 1 # Pos (6, 15)

	# Row 7 
	.byte 1 # Pos (7, 0)
	.byte 0 # Pos (7, 1)
	.byte 0 # Pos (7, 2)
	.byte 0 # Pos (7, 3)
	.byte 1 # Pos (7, 4)
	.byte 0 # Pos (7, 5)
	.byte 0 # Pos (7, 6)
	.byte 0 # Pos (7, 7)
	.byte 0 # Pos (7, 8)
	.byte 0 # Pos (7, 9)
	.byte 0 # Pos (7, 10)
	.byte 1 # Pos (7, 11)
	.byte 0 # Pos (7, 12)
	.byte 0 # Pos (7, 13)
	.byte 0 # Pos (7, 14)
	.byte 1 # Pos (7, 15)

	# Row 8 
	.byte 1 # Pos (8, 0)
	.byte 0 # Pos (8, 1)
	.byte 0 # Pos (8, 2)
	.byte 0 # Pos (8, 3)
	.byte 1 # Pos (8, 4)
	.byte 0 # Pos (8, 5)
	.byte 0 # Pos (8, 6)
	.byte 0 # Pos (8, 7)
	.byte 0 # Pos (8, 8)
	.byte 0 # Pos (8, 9)
	.byte 0 # Pos (8, 10)
	.byte 1 # Pos (8, 11)
	.byte 0 # Pos (8, 12)
	.byte 0 # Pos (8, 13)
	.byte 0 # Pos (8, 14)
	.byte 1 # Pos (8, 15)

	# Row 9 
	.byte 1 # Pos (9, 0)
	.byte 0 # Pos (9, 1)
	.byte 0 # Pos (9, 2)
	.byte 0 # Pos (9, 3)
	.byte 1 # Pos (9, 4)
	.byte 0 # Pos (9, 5)
	.byte 0 # Pos (9, 6)
	.byte 0 # Pos (9, 7)
	.byte 0 # Pos (9, 8)
	.byte 0 # Pos (9, 9)
	.byte 0 # Pos (9, 10)
	.byte 1 # Pos (9, 11)
	.byte 0 # Pos (9, 12)
	.byte 0 # Pos (9, 13)
	.byte 0 # Pos (9, 14)
	.byte 1 # Pos (9, 15)

	# Row 10 
	.byte 1 # Pos (10, 0)
	.byte 0 # Pos (10, 1)
	.byte 0 # Pos (10, 2)
	.byte 0 # Pos (10, 3)
	.byte 1 # Pos (10, 4)
	.byte 0 # Pos (10, 5)
	.byte 0 # Pos (10, 6)
	.byte 0 # Pos (10, 7)
	.byte 0 # Pos (10, 8)
	.byte 0 # Pos (10, 9)
	.byte 0 # Pos (10, 10)
	.byte 1 # Pos (10, 11)
	.byte 0 # Pos (10, 12)
	.byte 0 # Pos (10, 13)
	.byte 0 # Pos (10, 14)
	.byte 1 # Pos (10, 15)

	# Row 11 
	.byte 1 # Pos (11, 0)
	.byte 0 # Pos (11, 1)
	.byte 0 # Pos (11, 2)
	.byte 0 # Pos (11, 3)
	.byte 1 # Pos (11, 4)
	.byte 0 # Pos (11, 5)
	.byte 0 # Pos (11, 6)
	.byte 0 # Pos (11, 7)
	.byte 0 # Pos (11, 8)
	.byte 0 # Pos (11, 9)
	.byte 0 # Pos (11, 10)
	.byte 1 # Pos (11, 11)
	.byte 0 # Pos (11, 12)
	.byte 0 # Pos (11, 13)
	.byte 0 # Pos (11, 14)
	.byte 1 # Pos (11, 15)

	# Row 12 
	.byte 1 # Pos (12, 0)
	.byte 0 # Pos (12, 1)
	.byte 0 # Pos (12, 2)
	.byte 0 # Pos (12, 3)
	.byte 1 # Pos (12, 4)
	.byte 1 # Pos (12, 5)
	.byte 1 # Pos (12, 6)
	.byte 1 # Pos (12, 7)
	.byte 1 # Pos (12, 8)
	.byte 1 # Pos (12, 9)
	.byte 1 # Pos (12, 10)
	.byte 1 # Pos (12, 11)
	.byte 0 # Pos (12, 12)
	.byte 0 # Pos (12, 13)
	.byte 0 # Pos (12, 14)
	.byte 1 # Pos (12, 15)

	# Row 13 
	.byte 1 # Pos (13, 0)
	.byte 0 # Pos (13, 1)
	.byte 0 # Pos (13, 2)
	.byte 0 # Pos (13, 3)
	.byte 0 # Pos (13, 4)
	.byte 0 # Pos (13, 5)
	.byte 0 # Pos (13, 6)
	.byte 0 # Pos (13, 7)
	.byte 0 # Pos (13, 8)
	.byte 0 # Pos (13, 9)
	.byte 0 # Pos (13, 10)
	.byte 0 # Pos (13, 11)
	.byte 0 # Pos (13, 12)
	.byte 0 # Pos (13, 13)
	.byte 0 # Pos (13, 14)
	.byte 1 # Pos (13, 15)

	# Row 14 
	.byte 1 # Pos (14, 0)
	.byte 0 # Pos (14, 1)
	.byte 0 # Pos (14, 2)
	.byte 0 # Pos (14, 3)
	.byte 0 # Pos (14, 4)
	.byte 0 # Pos (14, 5)
	.byte 0 # Pos (14, 6)
	.byte 0 # Pos (14, 7)
	.byte 0 # Pos (14, 8)
	.byte 0 # Pos (14, 9)
	.byte 0 # Pos (14, 10)
	.byte 0 # Pos (14, 11)
	.byte 0 # Pos (14, 12)
	.byte 0 # Pos (14, 13)
	.byte 0 # Pos (14, 14)
	.byte 1 # Pos (14, 15)

	# Row 15 
	.byte 1 # Pos (15, 0)
	.byte 0 # Pos (15, 1)
	.byte 1 # Pos (15, 2)
	.byte 1 # Pos (15, 3)
	.byte 1 # Pos (15, 4)
	.byte 1 # Pos (15, 5)
	.byte 1 # Pos (15, 6)
	.byte 1 # Pos (15, 7)
	.byte 1 # Pos (15, 8)
	.byte 1 # Pos (15, 9)
	.byte 1 # Pos (15, 10)
	.byte 1 # Pos (15, 11)
	.byte 1 # Pos (15, 12)
	.byte 1 # Pos (15, 13)
	.byte 1 # Pos (15, 14)
	.byte 1 # Pos (15, 15)

debug_size: .quad 8
debug: 
	# Row 0 
	.byte 0 # Pos (0, 0)
	.byte 0 # Pos (0, 1)
	.byte 0 # Pos (0, 2)
	.byte 1 # Pos (0, 3)
	.byte 0 # Pos (0, 4)
	.byte 1 # Pos (0, 5)
	.byte 0 # Pos (0, 6)
	.byte 1 # Pos (0, 7)

	# Row 1 
	.byte 1 # Pos (1, 0)
	.byte 0 # Pos (1, 1)
	.byte 0 # Pos (1, 2)
	.byte 0 # Pos (1, 3)
	.byte 0 # Pos (1, 4)
	.byte 0 # Pos (1, 5)
	.byte 0 # Pos (1, 6)
	.byte 0 # Pos (1, 7)

	# Row 2 
	.byte 0 # Pos (2, 0)
	.byte 0 # Pos (2, 1)
	.byte 0 # Pos (2, 2)
	.byte 0 # Pos (2, 3)
	.byte 0 # Pos (2, 4)
	.byte 0 # Pos (2, 5)
	.byte 0 # Pos (2, 6)
	.byte 1 # Pos (2, 7)

	# Row 3 
	.byte 1 # Pos (3, 0)
	.byte 0 # Pos (3, 1)
	.byte 0 # Pos (3, 2)
	.byte 0 # Pos (3, 3)
	.byte 0 # Pos (3, 4)
	.byte 0 # Pos (3, 5)
	.byte 0 # Pos (3, 6)
	.byte 0 # Pos (3, 7)

	# Row 4 
	.byte 0 # Pos (4, 0)
	.byte 0 # Pos (4, 1)
	.byte 0 # Pos (4, 2)
	.byte 0 # Pos (4, 3)
	.byte 0 # Pos (4, 4)
	.byte 0 # Pos (4, 5)
	.byte 0 # Pos (4, 6)
	.byte 1 # Pos (4, 7)

	# Row 5 
	.byte 1 # Pos (5, 0)
	.byte 1 # Pos (5, 1)
	.byte 0 # Pos (5, 2)
	.byte 1 # Pos (5, 3)
	.byte 0 # Pos (5, 4)
	.byte 0 # Pos (5, 5)
	.byte 0 # Pos (5, 6)
	.byte 0 # Pos (5, 7)

	# Row 6 
	.byte 1 # Pos (6, 0)
	.byte 0 # Pos (6, 1)
	.byte 0 # Pos (6, 2)
	.byte 1 # Pos (6, 3)
	.byte 0 # Pos (6, 4)
	.byte 0 # Pos (6, 5)
	.byte 0 # Pos (6, 6)
	.byte 1 # Pos (6, 7)

	# Row 7 
	.byte 1 # Pos (7, 0)
	.byte 0 # Pos (7, 1)
	.byte 1 # Pos (7, 2)
	.byte 1 # Pos (7, 3)
	.byte 0 # Pos (7, 4)
	.byte 1 # Pos (7, 5)
	.byte 0 # Pos (7, 6)
	.byte 0 # Pos (7, 7)

