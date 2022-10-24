# Daedalus

A game about getting though a labyrinth in the fastest time possible, with a doom style (text) renderer. 

## Map

The map will be stored as a bitmap. 0 is a path, 1 is a wall. This is easier than trying to make 0-width walls. Something like:

```
		   exit
		    |
		    V
1 1 1 1 1 1 0 1
1 0 1 1 1 0 0 1
1 0 0 0 0 0 1 1
1 0 1 1 0 1 0 1
1 0 1 1 0 0 0 1
1 0 0 0 1 1 0 1
1 0 1 0 0 0 1 1
1 0 1 1 1 1 1 1

  ^
  |
entrance
```

## Movement

We will store the (x, y) position of the player, and the angle that he's looking at. All of this will be floating point, so we have to use the xmm registers to do floating point arithmetic. 

The WASD keys will modify these (x, y) coordinates. If the modified coordinates, rounded, would be inside a wall, the movement is not done (this would allow to go through walls with a high enough velocity but if the velocity is never greater than 1 then it's not a problem). 

## Renderer

We will evaluate a number of angles around the current player angle. This number will be the number of vertical columns in the renderer. For every angle, we "shoot a ray". That is, we will take the player position and add a vector with the given angle. We will, then, round the new coordinates. If the new coordinates are not inside of a wall, we will repeat the process. If the coordinates are inside of a wall, we will draw a line that's inversely proportional to the amount of times that we have shot the ray. This will have the effect that things further away are smaller!