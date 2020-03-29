import ../../lib/raylib

import ../defs
import ../logic/mapgen

var test_node_list: ListOfNodes

proc mapScene_init*(): void =
    echo "Initializing Map"
    test_node_list = map_generate()

proc mapScene_update*(): void =
    if IsKeyDown KEY_BACKSPACE :
        echo "Key Back Pressed"
        prevScene       = mapScn
        nextScene       = mainScn
        sceneChange     = true

proc mapScene_draw*(): void =
    BeginDrawing()
    ClearBackground WHITE
    DrawText "FPS: " & $GetFPS(), 10, 10, 20, BLUE
    DrawText "TPS: " & $GetFrameTime(), 10, 30, 20, BLUE
    DrawText "Time: " & $GetTime(), 10, 50, 20, BLUE
    DrawFPS 10, 70
    DrawText "Drawing Map", 100, 100, 20, DARKGRAY
    
    # vertical grid lines
    for i in countup(roomDoorSize * cellSize, (roomCountX * roomSquareSize * cellSize) + roomCountX * roomDoorSize * cellSize, cellSize):
        DrawLine i, 0, i, screenHeight, Fade(LIGHTGRAY, 0.6f)
        
        # horizontal grid lines
        for j in countup(roomDoorSize * cellSize, (roomCountY * roomSquareSize * cellSize) + roomCountY * roomDoorSize * cellSize, cellSize):
            DrawLine 0, j, screenWidth, j, Fade(LIGHTGRAY, 0.6f)
    
    for node in test_node_list:
        # echo node
        var offsetX = roomDoorSize * cellSize * (node.posX + 1)
        var offsetY = roomDoorSize * cellSize * (node.posY + 1)
        # echo offsetX
        # echo offsetY
        DrawRectangleLines(
            offsetX + (node.posX * (roomSquareSize ) * cellSize),
            offsetY + (node.posY * (roomSquareSize ) * cellSize) ,
            cellSize * roomSquareSize,
            cellSize * roomSquareSize,
            RED
        )

    EndDrawing()

proc mapScene_cleanup*(): void =
    echo "Cleaning up Map"
