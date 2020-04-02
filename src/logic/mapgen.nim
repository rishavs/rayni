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

    while not isLoopDone:
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

        nextDoor = sample curNode.availableDoors

        # get next room
        echo "Next Door is: ", nextDoor

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

        echo "To the " & $nextDoor & " of Room " & $curNode.posX & "/" & $curNode.posY & " lies the Room " & $nextNodeX & "/" & $nextNodeY

        # add room to output table 
        nodeTable[$curNode.posX & "/" & $curNode.posY] = curNode

        # check if the next room is unvisted. If it is already visited, then check other doors [TODO]
        if nodeTable.hasKey($nextNodeX & "/" & $nextNodeY):
            discard

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

    return map
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
    