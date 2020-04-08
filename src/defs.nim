import ../lib/raylib
import tables

#--------------------------------------------------------------------------------------
# All global constants and data loding goes in here
#--------------------------------------------------------------------------------------
const screenWidth*      = 2560
const screenHeight*     = 1440

const cellSize*         = 50
const roomSquareSize*   = 3 # how many cells make up a room. Has to be odd
const roomDoorSize*     = 1 # how many cells lie between 2 rooms
const roomCountX*       = 7
const roomCountY*       = 5

#--------------------------------------------------------------------------------------
# All declarations and definitions go here
#--------------------------------------------------------------------------------------

type
    Scenes* = enum noScn, introScn, mainScn, settingsScn, mapScn, gameScn

var 
    nextScene*          : Scenes
    prevScene*          : Scenes
    sceneChange*        : bool
    menuMusic*          : Music
    menuBtnClickSound*  : Sound


type
    Directions* = enum North, East, South, West

    Cell* = object
        x: int

    Node* = object
        posX*, posY*    : int
        isRoom*         : bool
        isStartingRoom* : bool
        isEndingRoom*   : bool
        openDoors*      : set[Directions]
        availableDoors* : set[Directions]
    
    ListOfNodes*        = seq[Node]
    TableOfNodes*       = Table[string, Node]
#--------------------------------------------------------------------------------------
# Load assets
#--------------------------------------------------------------------------------------

InitAudioDevice()        
menuMusic           = LoadMusicStream "assets/guitar_noodling.ogg"
menuBtnClickSound   = LoadSound "assets/misc_menu_4.wav"