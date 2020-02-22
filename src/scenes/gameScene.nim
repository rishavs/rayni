import ../../lib/raylib

type
    GameScene* = ref object of RootObj
        name*: string

proc init*(self: GameScene) =
    self.name = "Game Scene"
    echo "Initializing " & self.name

proc update*(self: GameScene) =
    discard

proc draw*(self: GameScene) =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "FPS: " & $GetFPS(), 10, 10, 20, DARKGRAY
    DrawText "TPS: " & $GetFrameTime(), 10, 30, 20, DARKGRAY
    DrawText "Time: " & $GetTime(), 10, 50, 20, DARKGRAY
    DrawFPS 10, 70
    DrawText "Drawing " & self.name, 100, 100, 20, DARKGRAY
    EndDrawing()

proc cleanup*(self: GameScene) =
    echo "Cleaning up " & self.name
