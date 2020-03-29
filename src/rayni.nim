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

nextScene       = mapScn
sceneChange     = true        

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
    case prevScene:
    of introScn:
        if sceneChange: 
            introScene_cleanup()
    of mainScn:
        if sceneChange: 
            mainScene_cleanup()
    of settingsScn:
        if sceneChange: 
            settingsScene_cleanup()
    of mapScn:
        if sceneChange: 
            mapScene_cleanup()
    of gameScn:
        if sceneChange: 
            gameScene_cleanup()
    else:
        discard
        
    case nextScene
    of introScn:
        if sceneChange: 
            introScene_init()
            sceneChange = false
        introScene_update()
        introScene_draw()
    of mainScn:
        if sceneChange: 
            mainScene_init()
            sceneChange = false
        mainScene_update()
        mainScene_draw()
    of settingsScn:
        if sceneChange: 
            settingsScene_init()
            sceneChange = false
        settingsScene_update()
        settingsScene_draw()
    of mapScn:
        if sceneChange: 
            mapScene_init()
            sceneChange = false
        mapScene_update()
        mapScene_draw()
    of gameScn:
        if sceneChange: 
            gameScene_init()
            sceneChange = false
        gameScene_update()
        gameScene_draw()
    else:
        discard


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