import ../../lib/raylib

type
    SettingsScene* = ref object of RootObj
        name*: string

proc init*(self: SettingsScene) =
    self.name = "Settings Scene"
    echo "Initializing " & self.name

proc update*(self: SettingsScene) =
    discard

proc draw*(self: SettingsScene) =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "Drawing " & self.name, 100, 100, 20, DARKGRAY
    EndDrawing()

proc cleanup*(self: SettingsScene) =
    echo "Cleaning up " & self.name
