#--------------------------------------------------------------------------------------
# All global declarations and deinitions go here
#--------------------------------------------------------------------------------------

type
    Scenes* = enum introScn, mainScn, settingsScn, gameScn

var 
    currentScene*: Scenes
    sceneInit* : bool