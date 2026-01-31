extends Node2D

@onready var bg = $Background

const GOOD_ENDING_SCORE = 3

func _ready():
	if GameManager.total_score == GOOD_ENDING_SCORE: bg.frame = 0
	else: bg.frame = 1 

func _on_button_pressed():
	get_tree().change_scene_to_file("res://startmenu/startmenu.tscn")
