import ../../lib/raylib

import ../defs

var
    introTimer: int = 5
    
proc introScene_init*(): void =
    echo "Initializing Intro"

proc introScene_update*(): void =
    if (introTimer - toInt(GetTime())) <= 0:
        currentScene = mainScn
        sceneInit = true
        return

proc introScene_draw*(): void =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText("Drawing Intro", 100, 100, 20, DARKGRAY)

    DrawText TextFormat("Timer: %i", introTimer - toInt(GetTime())), 100, 200, 20, RED
    EndDrawing()

proc introScene_cleanup*(): void =
    echo "Cleaning up Intro"