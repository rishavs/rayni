import ../../lib/raylib

import ../definitions
import ../data

import mainScene

var
    introTimer: int = 3
    
proc introScene_init*(): void =
    echo "Initializing Intro"

proc introScene_update*(): bool =
    if (introTimer - toInt(GetTime())) <= 0:
        currentScene = mainScn
        mainScene_init()
        return false

proc introScene_draw*(): bool =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText("Drawing Intro", 100, 100, 20, DARKGRAY)

    DrawText TextFormat("Timer: %i", introTimer - toInt(GetTime())), 100, 200, 20, RED
    EndDrawing()

proc introScene_cleanup*(): void =
    echo "Cleaning up Intro"