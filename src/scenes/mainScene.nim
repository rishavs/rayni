import ../../lib/[
    raylib,
    raygui]

import ../definitions
import ../data

import gameScene, settingsScene

proc mainScene_init*(): void =
    echo "Initializing Main"

proc mainScene_update*(): bool =
    discard

proc mainScene_draw*(): bool =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "Drawing Main", 100, 100, 20, DARKGRAY

    if GuiButton(Rectangle(x: 600, y: 300, width: 200, height: 50), "Start"):
        echo "clicked Start"
        currentScene = gameScn
        gameScene_init()

    if GuiButton(Rectangle(x: 600, y: 400, width: 200, height: 50), "Settings"):
        echo "clicked Settings"
        currentScene = settingsScn
        settingsScene_init()

    if GuiButton(Rectangle(x: 600, y: 500, width: 200, height: 50), "Exit"):
        CloseWindow()
        quit(QuitSuccess)


    EndDrawing()

proc mainScene_cleanup*(): void =
    echo "Cleaning up Main"
