# import lenientops, math
import ../lib/[
    raylib,
    raygui]

import scenes/[
    introScene,
    mainScene,
    settingsScene,
    gameScene]

#--------------------------------------------------------------------------------------
# Declarations
#--------------------------------------------------------------------------------------
const screenWidth = 1600
const screenHeight = 900

type
    Scenes = enum introScn, mainScn, settingsScn, gameScn

var 
    currentScene: Scenes

proc switchScene*(scn: Scenes) =
    # cleanup the current scene
    case currentScene
    of introScn:
        IntroScene().cleanup()
    of mainScn:
        MainScene().cleanup()
    of settingsScn:
        SettingsScene().cleanup()
    of gameScn:
        GameScene().cleanup()

    # init the new scene
    case scn
    of introScn:
        IntroScene().init()
    of mainScn:
        MainScene().init()
    of settingsScn:
        SettingsScene().init()
    of gameScn:
        GameScene().init()

    # set current scene
    currentScene = scn
    echo "-------------------------"

#--------------------------------------------------------------------------------------
# Initialization
#--------------------------------------------------------------------------------------
InitWindow screenWidth, screenHeight, "raylib [core] example - keyboard input"

60.SetTargetFPS                   # Set our game to run at 60 frames-per-second

switchScene(introScn)

#--------------------------------------------------------------------------------------
# Main game loop
#--------------------------------------------------------------------------------------
while not WindowShouldClose():    # Detect window close button or ESC key
    if KEY_ENTER.IsKeyPressed:       
        case currentScene
        of introScn:
            switchScene(mainScn)
        of mainScn:
            switchScene(settingsScn)
        of settingsScn:
            switchScene(gameScn)
        of gameScn:
            switchScene(introScn)
    
    case currentScene
    of introScn:
        IntroScene().update()
        IntroScene().draw()
    of mainScn:
        MainScene().update()
        MainScene().draw()
    of settingsScn:
        SettingsScene().update()
        SettingsScene().draw()
    of gameScn:
        GameScene().update()
        GameScene().draw()
    #-----------------------------------------------------------------------------------
    #  Update
    # ----------------------------------------------------------------------------------
        
    # ----------------------------------------------------------------------------------
    #  Draw
    # ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# De-Initialization
# --------------------------------------------------------------------------------------

CloseWindow()        #  Close window and OpenGL context