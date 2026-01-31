extends Node2D

@export var next_scene:PackedScene
@onready var bg = $Background
@onready var next_game_btn = $Background/NextGameBtn

func _ready():
	bg.frame = 0

func _on_button_pressed():
	bg.frame = 1
	next_game_btn.disabled = false

func _on_next_game_btn_pressed():
	if next_scene: get_tree().change_scene_to_packed(next_scene)
