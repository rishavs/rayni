import ../../lib/raylib

# import ../defs

proc mapScene_init*(): void =
    echo "Initializing Map"

proc mapScene_update*(): void =
    discard

proc mapScene_draw*(): void =
    BeginDrawing()
    ClearBackground BLACK
    DrawText "FPS: " & $GetFPS(), 10, 10, 20, BLUE
    DrawText "TPS: " & $GetFrameTime(), 10, 30, 20, BLUE
    DrawText "Time: " & $GetTime(), 10, 50, 20, BLUE
    DrawFPS 10, 70
    DrawText "Drawing Map", 100, 100, 20, DARKGRAY
    EndDrawing()

proc mapScene_cleanup*(): void =
    echo "Cleaning up Map"
