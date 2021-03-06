import ../../lib/raylib

import ../defs

proc gameScene_init*(): void =
    echo "Initializing Game"

proc gameScene_update*(): void =
    discard

proc gameScene_draw*(): void =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "FPS: " & $GetFPS(), 10, 10, 20, DARKGRAY
    DrawText "TPS: " & $GetFrameTime(), 10, 30, 20, DARKGRAY
    DrawText "Time: " & $GetTime(), 10, 50, 20, DARKGRAY
    DrawFPS 10, 70
    DrawText "Drawing Game", 100, 100, 20, DARKGRAY
    EndDrawing()

proc gameScene_cleanup*(): void =
    echo "Cleaning up Game"
