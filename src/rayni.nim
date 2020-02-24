# import lenientops, math
import ../lib/[
    raylib,
    ]

import definitions, data

import scenes/[
    introScene,
    mainScene,
    settingsScene,
    gameScene]

#--------------------------------------------------------------------------------------
# Initialization
#--------------------------------------------------------------------------------------
InitWindow screenWidth, screenHeight, "Rayni Game"
SetTargetFPS 60                  # Set our game to run at 60 frames-per-second

currentScene = introScn
sceneInit = true                 # flag to check if the scene has just been initiated

#--------------------------------------------------------------------------------------
# Main game loop
#--------------------------------------------------------------------------------------
while not WindowShouldClose():    # Detect window close button or ESC key

    #-----------------------------------------------------------------------------------
    #  Init, Update & draw Scene
    # ----------------------------------------------------------------------------------
    case currentScene
    of introScn:
        if sceneInit: 
            introScene_init()
            sceneInit = false
        introScene_update()
        introScene_draw()
    of mainScn:
        if sceneInit: 
            mainScene_init()
            sceneInit = false
        mainScene_update()
        mainScene_draw()
    of settingsScn:
        if sceneInit: 
            settingsScene_init()
            sceneInit = false
        settingsScene_update()
        settingsScene_draw()
    of gameScn:
        if sceneInit: 
            gameScene_init()
            sceneInit = false
        gameScene_update()
        gameScene_draw()
    #-----------------------------------------------------------------------------------
    #  Override Update
    # ----------------------------------------------------------------------------------
        
    # ----------------------------------------------------------------------------------
    #  Override Draw
    # ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# De-Initialization
# --------------------------------------------------------------------------------------

CloseWindow()        #  Close window and OpenGL context