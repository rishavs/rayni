import ../../lib/[
    raylib,
    raygui]

import ../defs

proc mainScene_init*(): void =
    echo "Initializing Main"
    if IsAudioDeviceReady():
        PlayMusicStream menuMusic
    else:
        echo "device not ready for init"


proc mainScene_update*(): void =
    if IsAudioDeviceReady():
        UpdateMusicStream menuMusic
    else:
        echo "device not ready for init"

proc mainScene_draw*(): void =
    BeginDrawing()
    ClearBackground BLACK
    DrawText "Drawing Main", 100, 100, 20, DARKGRAY

    if GuiButton(Rectangle(x: 600, y: 300, width: 200, height: 50), "Start"):
        echo "clicked Start"
        PlaySoundMulti menuBtnClickSound
        prevScene       = mainScn
        nextScene       = mapScn
        sceneChange     = true

    if GuiButton(Rectangle(x: 600, y: 400, width: 200, height: 50), "Settings"):
        echo "clicked Settings"
        PlaySoundMulti menuBtnClickSound
        prevScene       = mainScn
        nextScene       = settingsScn
        sceneChange     = true

    if GuiButton(Rectangle(x: 600, y: 500, width: 200, height: 50), "Exit"):
        PlaySoundMulti menuBtnClickSound
        CloseWindow()
        quit QuitSuccess

    EndDrawing()

proc mainScene_cleanup*(): void =
    echo "Cleaning up Main"
    StopMusicStream menuMusic


