extends Node2D

@onready var bg = $Background

const GOOD_ENDING_SCORE = 4

func _ready():
	AudioManager.stop_game_music()
	if GameManager.total_score == GOOD_ENDING_SCORE: 
		bg.frame = 0
		AudioManager.play_victory()

	else: 
		bg.frame = 1 
		AudioManager.play_defeat()
		

func _on_button_pressed():
	get_tree().change_scene_to_file("res://startmenu/startmenu.tscn")
