import ../../lib/[
    raylib,
    raygui]

import ../definitions
import ../data

proc settingsScene_init*(): void =
    echo "Initializing Settings"

proc settingsScene_update*(): bool =
    discard

proc settingsScene_draw*(): bool =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "Drawing Settings", 100, 100, 20, DARKGRAY

    if GuiButton(Rectangle(x: 600, y: 400, width: 200, height: 50), "Back"):
        echo "clicked Back"
        currentScene = mainScn

    EndDrawing()

proc settingsScene_cleanup*(): void =
    echo "Cleaning up Settings"
