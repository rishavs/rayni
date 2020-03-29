import ../../lib/[
    raylib,
    raygui]

import ../defs

proc settingsScene_init*(): void =
    echo "Initializing Settings"

proc settingsScene_update*(): void =
    discard

proc settingsScene_draw*(): void =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "Drawing Settings", 100, 100, 20, DARKGRAY

    if GuiButton(Rectangle(x: 600, y: 300, width: 200, height: 50), "Toggle Full Screen"):
        echo "clicked Full Screen"
        # ToggleFullscreen()

    if GuiButton(Rectangle(x: 600, y: 400, width: 200, height: 50), "Back"):
        echo "clicked Back"
        prevScene       = settingsScn
        nextScene       = mainScn
        sceneChange     = true

    EndDrawing()

proc settingsScene_cleanup*(): void =
    echo "Cleaning up Settings"
