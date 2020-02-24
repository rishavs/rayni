type
    Scenes* = enum introScn, mainScn, settingsScn, gameScn

var 
    currentScene*: Scenes
    sceneInit* : bool