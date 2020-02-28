import ../../lib/[
    raylib,
    raygui]

import ../defs

proc mainScene_init*(): void =
    echo "Initializing Main"
    if not IsAudioDeviceReady():
        echo "device not ready for init"
    PlayMusicStream menuMusic

proc mainScene_update*(): void =
    if not IsAudioDeviceReady():
        echo "device not ready for update"
    UpdateMusicStream menuMusic


proc mainScene_draw*(): void =
    BeginDrawing()
    ClearBackground BLACK
    DrawText "Drawing Main", 100, 100, 20, DARKGRAY

    if GuiButton(Rectangle(x: 600, y: 300, width: 200, height: 50), "Start"):
        echo "clicked Start"
        currentScene = mapScn
        sceneInit = true

    if GuiButton(Rectangle(x: 600, y: 400, width: 200, height: 50), "Settings"):
        echo "clicked Settings"
        currentScene = settingsScn
        sceneInit = true

    if GuiButton(Rectangle(x: 600, y: 500, width: 200, height: 50), "Exit"):
        CloseWindow()
        quit(QuitSuccess)

    EndDrawing()

proc mainScene_cleanup*(): void =
    echo "Cleaning up Main"
    StopMusicStream menuMusic
    UnloadMusicStream menuMusic
    menuMusic = nil
