# import lenientops, math
import ../lib/[
    raylib,
    ]

import data

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
introScene_init()

#--------------------------------------------------------------------------------------
# Main game loop
#--------------------------------------------------------------------------------------
while not WindowShouldClose():    # Detect window close button or ESC key
   
    case currentScene
    of introScn:
        discard introScene_update()
        discard introScene_draw()
    of mainScn:
        discard mainScene_update()
        discard mainScene_draw()
    of settingsScn:
        discard settingsScene_update()
        discard settingsScene_draw()
    of gameScn:
        discard gameScene_update()
        discard gameScene_draw()
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