# Knight-Travails
This project is an implementation of Dijkstra's algorithm which finds the shortest path a knight piece in chess can take from a defined start to finish.

## Knights
A Knight class defines our piece; knights are constrained such that they can only move once in one direction, and twice in the other direction. Each knight object is given a position and its possible moves are calculated from the moveset (move once in n direction, move twice in n-orthogonal direction) and included if they are still on the gameboard.

## Gameboard
The gameboard initializes the knight object, displays it for the user, and iniitializes itself as an 8 by 8 board, 0-indexed; 0 to 7 by 0 to 7.

## Dijkstra's Algorithm
The algorithm for finding the shortest path works as the Wikipedia article describes it below. Assign a value of nil to each position on the board. Go through each feasible path and assign a number to each position on the board based on when you've visited it (1 is first visited, 2 if second visited) and it is lower than the current number assigned to it. Finally, iterate through the board to find the positions with the smallest numbers (smallest distances) and add their positions to the solutions array.

From Wikipedia:
> Suppose you would like to find the shortest path between two intersections on a city map: a starting point and a destination. Dijkstra's algorithm initially marks the distance (from the starting point) to every other intersection on the map with infinity. This is done not to imply that there is an infinite distance, but to note that those intersections have not been visited yet. Some variants of this method leave the intersections' distances unlabeled. Now select the current intersection at each iteration. For the first iteration, the current intersection will be the starting point, and the distance to it (the intersection's label) will be zero. For subsequent iterations (after the first), the current intersection will be a closest unvisited intersection to the starting point (this will be easy to find).

> From the current intersection, update the distance to every unvisited intersection that is directly connected to it. This is done by determining the sum of the distance between an unvisited intersection and the value of the current intersection and then relabeling the unvisited intersection with this value (the sum) if it is less than the unvisited intersection's current value. In effect, the intersection is relabeled if the path to it through the current intersection is shorter than the previously known paths. To facilitate shortest path identification, in pencil, mark the road with an arrow pointing to the relabeled intersection if you label/relabel it, and erase all others pointing to it. After you have updated the distances to each neighboring intersection, mark the current intersection as visited and select an unvisited intersection with minimal distance (from the starting point) – or the lowest label—as the current intersection. Intersections marked as visited are labeled with the shortest path from the starting point to it and will not be revisited or returned to.

> Continue this process of updating the neighboring intersections with the shortest distances, marking the current intersection as visited, and moving onto a closest unvisited intersection until you have marked the destination as visited. Once you have marked the destination as visited (as is the case with any visited intersection), you have determined the shortest path to it from the starting point and can trace your way back following the arrows in reverse. In the algorithm's implementations, this is usually done (after the algorithm has reached the destination node) by following the nodes' parents from the destination node up to the starting node; that's why we also keep track of each node's parent.

> This algorithm makes no attempt of direct "exploration" towards the destination as one might expect. Rather, the sole consideration in determining the next "current" intersection is its distance from the starting point. This algorithm therefore expands outward from the starting point, interactively considering every node that is closer in terms of shortest path distance until it reaches the destination. When understood in this way, it is clear how the algorithm necessarily finds the shortest path. However, it may also reveal one of the algorithm's weaknesses: its relative slowness in some topologies. 

## Directions
To run this application, install ruby, navigate to the project's directory, and enter "ruby lib/main.rb"

## Demo
![image](https://user-images.githubusercontent.com/88121502/165214491-bbdd9d84-c86c-49a2-ae45-d9750d1e3437.png)

## Improvements
You could more clearly show the path that the knight has taken by coloring in visited blocks.
