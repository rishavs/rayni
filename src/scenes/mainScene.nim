import ../../lib/[
    raylib,
    raygui]

type
    MainScene* = ref object of RootObj
        name*: string

proc init*(self: MainScene) =
    self.name = "Main Scene"
    echo "Initializing " & self.name

proc update*(self: MainScene) =
    discard

proc draw*(self: MainScene) =
    BeginDrawing()
    ClearBackground RAYWHITE
    DrawText "Drawing " & self.name, 100, 100, 20, DARKGRAY

    if GuiButton(Rectangle(x: 600, y: 320, width: 200, height: 50), "Start"):
        # switchScene(mainScn)
        echo "clicked btn"

    EndDrawing()

proc cleanup*(self: MainScene) =
    echo "Cleaning up " & self.name
