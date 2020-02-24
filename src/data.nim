#--------------------------------------------------------------------------------------
# Declarations
#--------------------------------------------------------------------------------------
const screenWidth* = 1600
const screenHeight* = 900

type
    Scenes* = enum introScn, mainScn, settingsScn, gameScn

var 
    currentScene*: Scenes
      