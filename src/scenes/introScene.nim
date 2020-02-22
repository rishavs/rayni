import ../../lib/raylib

type
    IntroScene* = ref object of RootObj
        name*: string

proc init*(self: IntroScene) =
    self.name = "Intro Scene"
    echo "Initializing " & self.name

proc update*(self: IntroScene) =
    discard

proc draw*(self: IntroScene) =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText("Drawing INtro", 100, 100, 20, DARKGRAY)
    EndDrawing()

proc cleanup*(self: IntroScene) =
    echo "Cleaning up " & self.name
