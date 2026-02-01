extends Node

@onready var music = $Music
var current_music : String
var music_index = 0

func change_song(new_music:String):

    if current_music != new_music:
        current_music = new_music
        music.stream = load("res://audio/" + new_music + ".ogg")
        music.play()
    else:
        return


func play_music():
    $Music.play()

func play_game_music():
    $GameMusic.play()

func stop_music():
    $Music.stop()

func stop_game_music():
    $GameMusic.stop()

func play_victory():
    $Victory.play()

func play_defeat():
    $Defeat.play()

func play_pick_item():
    $PickItem.play()

func play_place_item():
    $PlaceItem.play()

func play_put_mask():
    $PutMask.play()

func play_making_mask():
    $MakingMask.play()