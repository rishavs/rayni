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
    Scenes* = enum noScn, introScn, mainScn, settingsScn, mapScn, gameScn

var 
    nextScene*: Scenes
    prevScene*: Scenes
    sceneChange* : bool
    menuMusic* : Music
    menuBtnClickSound* : Sound

#--------------------------------------------------------------------------------------
# Load assets
#--------------------------------------------------------------------------------------

InitAudioDevice()        
menuMusic = LoadMusicStream "assets/guitar_noodling.ogg"
menuBtnClickSound = LoadSound "assets/misc_menu_4.wav"