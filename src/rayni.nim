import ../lib/[
    raylib,
    ]

#--------------------------------------------------------------------------------------
# Initialize engine
#--------------------------------------------------------------------------------------
InitWindow 1920, 1080, "Rayni Game"
SetTargetFPS 60                  

import defs

#--------------------------------------------------------------------------------------
# Initialize game logic
#--------------------------------------------------------------------------------------

currentScene    = introScn
sceneInit       = true        

import scenes/[
    introScene,
    mainScene,
    settingsScene,
    mapScene,
    gameScene
    ]

#--------------------------------------------------------------------------------------
# Main game loop
#--------------------------------------------------------------------------------------
while not WindowShouldClose():

    #----------------------------------------------------------------------------------
    #  Init, Update & draw Scene
    # ---------------------------------------------------------------------------------
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
    of mapScn:
        if sceneInit: 
            mapScene_init()
            sceneInit = false
        mapScene_update()
        mapScene_draw()
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

# --------------------------------------------------------------------------------------
# De-Initialization
# --------------------------------------------------------------------------------------

CloseWindow()