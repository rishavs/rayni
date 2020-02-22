proc switchScene*(scn: Scenes) =
    # cleanup the current scene
    case currentScene
    of introScn:
        IntroScene().cleanup()
    of mainScn:
        MainScene().cleanup()
    of settingsScn:
        SettingsScene().cleanup()
    of gameScn:
        GameScene().cleanup()

    # init the new scene
    case scn
    of introScn:
        IntroScene().init()
    of mainScn:
        MainScene().init()
    of settingsScn:
        SettingsScene().init()
    of gameScn:
        GameScene().init()

    # set current scene
    currentScene = scn
    echo "-------------------------"