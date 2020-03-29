import ../defs

proc map_generate*(): ListOfNodes = 
    result = [
        Node( posX: 0, posY: 0, isRoom : true, isNorthOpen: false, isEastOpen: true, isSouthOpen: true, isWestOpen: false),
        Node( posX: 1, posY: 0, isRoom : true, isNorthOpen: false, isEastOpen: true, isSouthOpen: false, isWestOpen: true),
        Node( posX: 2, posY: 0, isRoom : true, isNorthOpen: false, isEastOpen: false, isSouthOpen: true, isWestOpen: true),
        Node( posX: 3, posY: 0, isRoom : true, isNorthOpen: false, isEastOpen: true, isSouthOpen: true, isWestOpen: false),
        Node( posX: 4, posY: 0, isRoom : true, isNorthOpen: false, isEastOpen: false, isSouthOpen: true, isWestOpen: true),

        Node( posX: 0, posY: 1, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: false, isWestOpen: false),
        Node( posX: 1, posY: 1, isRoom : true, isNorthOpen: false, isEastOpen: true, isSouthOpen: true, isWestOpen: true),
        Node( posX: 2, posY: 1, isRoom : true, isNorthOpen: true, isEastOpen: false, isSouthOpen: false, isWestOpen: true),
        Node( posX: 3, posY: 1, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: true, isWestOpen: false),
        Node( posX: 4, posY: 1, isRoom : true, isNorthOpen: true, isEastOpen: false, isSouthOpen: false, isWestOpen: true),

        Node( posX: 0, posY: 2, isRoom : true, isNorthOpen: false, isEastOpen: true, isSouthOpen: true, isWestOpen: false),
        Node( posX: 1, posY: 2, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: true, isWestOpen: true),
        Node( posX: 2, posY: 2, isRoom : true, isNorthOpen: false, isEastOpen: true, isSouthOpen: false, isWestOpen: true),
        Node( posX: 3, posY: 2, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: true, isWestOpen: true),
        Node( posX: 4, posY: 2, isRoom : true, isNorthOpen: false, isEastOpen: false, isSouthOpen: false, isWestOpen: true),

        Node( posX: 0, posY: 3, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: true, isWestOpen: false),
        Node( posX: 1, posY: 3, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: true, isWestOpen: true),
        Node( posX: 2, posY: 3, isRoom : true, isNorthOpen: false, isEastOpen: false, isSouthOpen: true, isWestOpen: true),
        Node( posX: 3, posY: 3, isRoom : true, isNorthOpen: true, isEastOpen: false, isSouthOpen: true, isWestOpen: false),
        Node( posX: 4, posY: 3, isRoom : true, isNorthOpen: false, isEastOpen: false, isSouthOpen: true, isWestOpen: false),

        Node( posX: 0, posY: 4, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: false, isWestOpen: false),
        Node( posX: 1, posY: 4, isRoom : true, isNorthOpen: true, isEastOpen: false, isSouthOpen: false, isWestOpen: true),
        Node( posX: 2, posY: 4, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: false, isWestOpen: false),
        Node( posX: 3, posY: 4, isRoom : true, isNorthOpen: true, isEastOpen: true, isSouthOpen: false, isWestOpen: true),
        Node( posX: 4, posY: 4, isRoom : true, isNorthOpen: true, isEastOpen: false, isSouthOpen: false, isWestOpen: true),
    ]
