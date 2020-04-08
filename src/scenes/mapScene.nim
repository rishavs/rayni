import tables

import ../../lib/raylib

import ../defs
import ../logic/mapgen

var nodeMap: TableOfNodes

const
    roomCellColor           = RED
    doorCellColor           = GREEN
    corridorCellColor       = YELLOW
    startingRoomCellColor   = BLUE
    endingRoomCellColor     = BLUE


proc mapScene_init*(): void =
    echo "Initializing Map"
    nodeMap = map_generate(roomCountX, roomCountY, roomDoorSize)
    # next step will generate cell level data from room level data using cellSize, room num and few other vars

proc mapScene_update*(): void =
    if IsKeyDown KEY_BACKSPACE :
        echo "Key Back Pressed"
        prevScene       = mapScn
        nextScene       = mainScn
        sceneChange     = true

proc mapScene_draw*(): void =
    BeginDrawing()
    ClearBackground WHITE
    
    # vertical grid lines
    for i in countup(roomDoorSize * cellSize, (roomCountX * 3 * cellSize) + roomCountX * roomDoorSize * cellSize, cellSize):
        DrawLine i, 0, i, screenHeight, Fade(LIGHTGRAY, 0.6f)
        
        # horizontal grid lines
        for j in countup(roomDoorSize * cellSize, (roomCountY * 3 * cellSize) + roomCountY * roomDoorSize * cellSize, cellSize):
            DrawLine 0, j, screenWidth, j, Fade(LIGHTGRAY, 0.6f)
    
    for node in nodeMap.values:
        if node.isRoom == true:
            # Draw node as room
            DrawRectangleLines(
                cellSize * ((node.posX * (roomDoorSize + roomSquareSize)) - roomSquareSize),
                cellSize * ((node.posY * (roomDoorSize + roomSquareSize)) - roomSquareSize),
                cellSize * (roomSquareSize),
                cellSize * (roomSquareSize),
                BLUE
            )
        else:
            DrawRectangle(
                cellSize * ((node.posX * (roomDoorSize + roomSquareSize)) - (roomSquareSize - (roomSquareSize div 2))),
                cellSize * ((node.posY * (roomDoorSize + roomSquareSize)) - (roomSquareSize - (roomSquareSize div 2))),
                cellSize,
                cellSize,
                RED
            )

        if node.isStartingRoom == true or node.isEndingRoom == true:
            DrawRectangle(
                cellSize * ((node.posX * (roomDoorSize + roomSquareSize)) - (roomSquareSize - (roomSquareSize div 2))),
                cellSize * ((node.posY * (roomDoorSize + roomSquareSize)) - (roomSquareSize - (roomSquareSize div 2))),
                cellSize,
                cellSize,
                YELLOW
            )


        # Draw open doors & Corridors. For this we will simply join the central cells
        # We only need to handle 2 directions as the door will also be open from the other side anyway
        for door in node.openDoors:
            case door:
            of South:
                DrawRectangle(
                    cellSize * ((node.posX - 1) * (roomDoorSize + roomSquareSize) + roomSquareSize - (roomSquareSize div 2)),
                    cellSize * ((node.posY - 1) * (roomDoorSize + roomSquareSize) + roomSquareSize),
                    cellSize,
                    cellSize * (roomDoorSize + (roomSquareSize - (roomSquareSize div 2) )),
                    GREEN
                )
            of East:
                DrawRectangle(
                    cellSize * ((node.posX - 1) * (roomDoorSize + roomSquareSize) + roomSquareSize),
                    cellSize * ((node.posY - 1) * (roomDoorSize + roomSquareSize) + roomSquareSize - (roomSquareSize div 2)),
                    cellSize * (roomDoorSize + (roomSquareSize - (roomSquareSize div 2))),
                    cellSize,
                    PURPLE
                )
            of North:
                DrawRectangle(
                    cellSize * ((node.posX - 1) * (roomDoorSize + roomSquareSize) + roomSquareSize - (roomSquareSize div 2)),
                    cellSize * ((node.posY - 1) * (roomDoorSize + roomSquareSize) - (roomSquareSize div 2)),
                    cellSize,
                    cellSize * (roomDoorSize + (roomSquareSize - (roomSquareSize div 2) )),
                    RED
                )
            of West:
                DrawRectangle(
                    cellSize * ((node.posX - 1) * (roomDoorSize + roomSquareSize) - (roomSquareSize div 2)),
                    cellSize * ((node.posY - 1) * (roomDoorSize + roomSquareSize) + roomSquareSize - (roomSquareSize div 2)),
                    cellSize * (roomDoorSize + (roomSquareSize - (roomSquareSize div 2))),
                    cellSize,
                    PINK
                )


    DrawText "FPS: "    & $GetFPS(),        10, 10, 20, BLUE
    DrawText "TPS: "    & $GetFrameTime(),  10, 30, 20, BLUE
    DrawText "Time: "   & $GetTime(),       10, 50, 20, BLUE
    DrawFPS 10, 70
    DrawText "Drawing Map", 100, 100, 20, DARKGRAY
    EndDrawing()

proc mapScene_cleanup*(): void =
    echo "Cleaning up Map"
