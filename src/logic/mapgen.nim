import ../defs

proc map_generate*(): ListOfNodes = 
    result = [
        Node( posX: 1, posY: 1, isRoom : false, openDoors: @[East, South]),
        Node( posX: 2, posY: 1, isRoom : true,  openDoors: @[East, West]),
        Node( posX: 3, posY: 1, isRoom : false, openDoors: @[South, West]),
        Node( posX: 4, posY: 1, isRoom : true,  openDoors: @[East, South]),
        Node( posX: 5, posY: 1, isRoom : true,  openDoors: @[West, South]),

        Node( posX: 1, posY: 2, isRoom : true,  openDoors: @[East, North]),
        Node( posX: 2, posY: 2, isRoom : true,  openDoors: @[East, South, West]),
        Node( posX: 3, posY: 2, isRoom : false, openDoors: @[North, West]),
        Node( posX: 4, posY: 2, isRoom : true,  openDoors: @[North, East, South]),
        Node( posX: 5, posY: 2, isRoom : false, openDoors: @[North, West]),

        Node( posX: 1, posY: 3, isRoom : true,  openDoors: @[East, South]),
        Node( posX: 2, posY: 3, isRoom : true,  openDoors: @[North, East, South, West]),
        Node( posX: 3, posY: 3, isRoom : false, openDoors: @[East, West]),
        Node( posX: 4, posY: 3, isRoom : true,  openDoors: @[North, East, South, West]),
        Node( posX: 5, posY: 3, isRoom : true,  openDoors: @[West]),

        Node( posX: 1, posY: 4, isRoom : false, openDoors: @[North, East, South]),
        Node( posX: 2, posY: 4, isRoom : true,  openDoors: @[North, East, South, West]),
        Node( posX: 3, posY: 4, isRoom : true,  openDoors: @[South, West]),
        Node( posX: 4, posY: 4, isRoom : true,  openDoors: @[North, South]),
        Node( posX: 5, posY: 4, isRoom : true,  openDoors: @[South]),

        Node( posX: 1, posY: 5, isRoom : true,  openDoors: @[North, East]),
        Node( posX: 2, posY: 5, isRoom : true,  openDoors: @[North, West]),
        Node( posX: 3, posY: 5, isRoom : true,  openDoors: @[North, East]),
        Node( posX: 4, posY: 5, isRoom : true,  openDoors: @[North, East, West]),
        Node( posX: 5, posY: 5, isRoom : false, openDoors: @[North, West]),
    ]

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
    