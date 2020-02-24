import ../../lib/raylib

import ../data

proc settingsScene_init*(): void =
    echo "Initializing Settings"

proc settingsScene_update*(): bool =
    discard

proc settingsScene_draw*(): bool =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "Drawing Settings", 100, 100, 20, DARKGRAY
    EndDrawing()

proc settingsScene_cleanup*(): void =
    echo "Cleaning up Settings"
