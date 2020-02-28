import ../lib/raylib

#--------------------------------------------------------------------------------------
# All global constants and data loding goes in here
#--------------------------------------------------------------------------------------
const screenWidth* = 2560
const screenHeight* = 1440

#--------------------------------------------------------------------------------------
# All declarations and definitions go here
#--------------------------------------------------------------------------------------

type
    Scenes* = enum introScn, mainScn, settingsScn, mapScn, gameScn

var 
    currentScene*: Scenes
    sceneInit* : bool
    menuMusic* : Music

#--------------------------------------------------------------------------------------
# Load assets
#--------------------------------------------------------------------------------------
const menuMusicFile = "assets/guitar_noodling.ogg"

if FileExists menuMusicFile:
    echo "File Found"
else :
    echo "No File found"

InitAudioDevice()        
menuMusic = LoadMusicStream menuMusicFile