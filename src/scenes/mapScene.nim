import ../../lib/raylib

import ../defs
import ../logic/mapgen

var test_node_list: ListOfNodes

const
    roomCellColor       = RED
    doorCellColor       = GREEN
    corridorCellColor   = YELLOW

proc mapScene_init*(): void =
    echo "Initializing Map"
    test_node_list = map_generate()
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
    
    for node in test_node_list:
        var offsetX = roomDoorSize * cellSize * (node.posX + 1)
        var offsetY = roomDoorSize * cellSize * (node.posY + 1)

        if node.isRoom == true:
            # Draw node as room
            DrawRectangle(
                offsetX + (node.posX * 3 * cellSize),
                offsetY + (node.posY * 3 * cellSize) ,
                cellSize * 3,
                cellSize * 3,
                RED
            )
        else:
            DrawRectangle(
                offsetX + (node.posX * 3 * cellSize) + cellsize,
                offsetY + (node.posY * 3 * cellSize) + cellSize,
                cellSize,
                cellSize,
                RED
            )
        # Draw open doors & Corridors. FOr this we will simply join the central cells
        for door in node.openDoors:
            case door:
            of North:
                DrawRectangle(
                    offsetX + (node.posX * 3 * cellSize) + cellSize,
                    offsetY + (node.posY * 3 * cellSize) - 2 * cellSize,
                    cellSize,
                    cellSize * 3,
                    RED
                )
            of East:
                DrawRectangle(
                    offsetX + (node.posX * 3 * cellSize) + (2 * cellSize),
                    offsetY + (node.posY * 3 * cellSize) + cellSize,
                    cellSize * 3,
                    cellSize,
                    RED
                )
            # We only need to handle 2 directions as the door will also be open from the other side anyway
            of South:
                discard
            of West:
                discard


    DrawText "FPS: "    & $GetFPS(),        10, 10, 20, BLUE
    DrawText "TPS: "    & $GetFrameTime(),  10, 30, 20, BLUE
    DrawText "Time: "   & $GetTime(),       10, 50, 20, BLUE
    DrawFPS 10, 70
    DrawText "Drawing Map", 100, 100, 20, DARKGRAY
    EndDrawing()

proc mapScene_cleanup*(): void =
    echo "Cleaning up Map"
