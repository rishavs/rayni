

Cards:
Move +2

generate resources on hitting?


Mapmaker:
Start: Mark all nodes. With all doorways closed and all nodes unvisited, start at entry node
step 1: visit current node and look at nearby unvisited nodes and randomly move to one of them (open the door) and repeat step 1
step 2: if no nearby nodes are unvisited, go back to the previous node and repeat step 1
step 3: if you return to the start node, your maze is complete
Step 5: (optional) all rooms with 2 doors, have a n% chance of becoming corridors



for all doors, ensure that 70% are open
check if there are unconnected nodes. remove them