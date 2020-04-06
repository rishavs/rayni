import random
import tables
from sequtils import zip
import hashes, math

import ../defs

proc getRandomDoor(doors: set[Directions]):Directions =
    echo doors.len

proc map_generate*(rCountX: int, rCountY: int, rDoorSize: int): ListOfNodes = 
    var map: ListOfNodes

    randomize()
    let startingNodeX   = 1
    let startingNodeY   = rand(1 .. rCountY)
    let endingNodeX     = rCountX
    let endingNodeY     = rand(1 .. rCountY)

    var nodeTable = initTable[string, Node]()

    var curNodeX    : int   = startingNodeX
    var curNodeY    : int   = startingNodeY

    while true:
        var prevNodeX   : int   = startingNodeX
        var prevNodeY   : int   = startingNodeY

        var nextNodeX   : int   = startingNodeX
        var nextNodeY   : int   = startingNodeY

        var nextDoor        : Directions
        var curNode: Node = Node( posX: curNodeX, posY: curNodeY, isRoom : false, availableDoors: {North, East, South, West})

        echo "Currently Visting Room " & $curNode.posX & "/" & $curNode.posY

        # check if this is an edge node or a corner node
        if curNodeX == 1:
            excl curNode.availableDoors, West 
        elif curNodeX == rCountX:
            excl curNode.availableDoors, East 

        if curNodeY == 1:
            excl curNode.availableDoors, North 
        elif curNodeY == rCountY:
            excl curNode.availableDoors, South 

        # list all open doors
        echo "Available doors are: " & $curNode.availableDoors

        # iterate over available doors to select a random one and check if the target room is unvisited
        while (card curNode.availableDoors) > 0:

            # select a random available door to go through
            randomize()
            nextDoor = sample curNode.availableDoors
            echo "Next Door is: ", nextDoor

            # get next room
            case nextDoor:
            of North:
                nextNodeX = curNodeX
                nextNodeY = curNodeY - 1
            of East:
                nextNodeX = curNodeX + 1
                nextNodeY = curNodeY
            of South:
                nextNodeX = curNodeX
                nextNodeY = curNodeY + 1
            of West:
                nextNodeX = curNodeX - 1
                nextNodeY = curNodeY

            # remove the door from the list of available doors. Either we find it to be visited or we use it to visit 
            # next room, the door should no longer be available. Also, add the specific door to list of open doors
            excl curNode.availableDoors, nextDoor
            incl curNode.openDoors, nextDoor

            # check if the next room is unvisted. If it is already visited, then check other doors [TODO]
            if not nodeTable.hasKey($nextNodeX & "/" & $nextNodeY):
                echo "Found room " & $nextNodeX & "/" & $nextNodeY & " which is not yet visited"
                break

            echo "Room " & $nextNodeX & "/" & $nextNodeY & " was found to have already been visited"



        echo "Moving To the Room " & $nextNodeX & "/" & $nextNodeY & " which lies to the " & $nextDoor & " of Room " & $curNode.posX & "/" & $curNode.posY

        # add room to output table 
        nodeTable[$curNode.posX & "/" & $curNode.posY] = curNode



        # check if no other room is visited. then go back to previous room and repeat [TODO]
        # curNodeX = prevNodeX
        # curNodeY = prevNodeY

        # move to next room
        curNodeX = nextNodeX
        curNodeY = nextNodeY

        # Are we back to starting room? if yes, set loop done
        if curNodeX == startingNodeX and curNodeY == startingNodeY:
            break

        echo "------------- \n"

    echo "Final state of node table is: ", $nodeTable

    return nodeTable
    # result = @[
    #     Node( posX: 1, posY: 1, isRoom : false, openDoors: @[East, South]),
    #     Node( posX: 2, posY: 1, isRoom : true,  openDoors: @[East, West]),
    #     Node( posX: 3, posY: 1, isRoom : false, openDoors: @[South, West]),
    #     Node( posX: 4, posY: 1, isRoom : true,  openDoors: @[East, South]),
    #     Node( posX: 5, posY: 1, isRoom : true,  openDoors: @[West, South]),

    #     Node( posX: 1, posY: 2, isRoom : true,  openDoors: @[East, North]),
    #     Node( posX: 2, posY: 2, isRoom : true,  openDoors: @[East, South, West]),
    #     Node( posX: 3, posY: 2, isRoom : false, openDoors: @[North, West]),
    #     Node( posX: 4, posY: 2, isRoom : true,  openDoors: @[North, East, South]),
    #     Node( posX: 5, posY: 2, isRoom : false, openDoors: @[North, West]),

    #     Node( posX: 1, posY: 3, isRoom : true,  openDoors: @[East, South]),
    #     Node( posX: 2, posY: 3, isRoom : true,  openDoors: @[North, East, South, West]),
    #     Node( posX: 3, posY: 3, isRoom : false, openDoors: @[East, West]),
    #     Node( posX: 4, posY: 3, isRoom : true,  openDoors: @[North, East, South, West]),
    #     Node( posX: 5, posY: 3, isRoom : true,  openDoors: @[West]),

    #     Node( posX: 1, posY: 4, isRoom : false, openDoors: @[North, East, South]),
    #     Node( posX: 2, posY: 4, isRoom : true,  openDoors: @[North, East, South, West]),
    #     Node( posX: 3, posY: 4, isRoom : true,  openDoors: @[South, West]),
    #     Node( posX: 4, posY: 4, isRoom : true,  openDoors: @[North, South]),
    #     Node( posX: 5, posY: 4, isRoom : true,  openDoors: @[South]),

    #     Node( posX: 1, posY: 5, isRoom : true,  openDoors: @[North, East]),
    #     Node( posX: 2, posY: 5, isRoom : true,  openDoors: @[North, West]),
    #     Node( posX: 3, posY: 5, isRoom : true,  openDoors: @[North, East]),
    #     Node( posX: 4, posY: 5, isRoom : true,  openDoors: @[North, East, West]),
    #     Node( posX: 5, posY: 5, isRoom : false, openDoors: @[North, West]),
    # ]

# proc nodeAtDirection (node: Node, dir: Directions): Node =
#     node.posX


# proc directionOppositeOf(dir: Directions): Directions =
#     case dir:
#     of North:
#         result = South
#     of East:
#         result = West
#     of South:
#         result = North
#     of West:
#         result = East
    