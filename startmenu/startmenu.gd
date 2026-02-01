extends Node2D

@export var next_scene:PackedScene
@onready var bg = $Background
@onready var next_game_btn = $Background/NextGameBtn
@onready var title_label = $Background/Title


func _ready():
	AudioManager.play_music()
	GameManager.total_score = 0
	bg.frame = 0

func _on_button_pressed():
	title_label.visible = false
	bg.frame = 1

	$Background/HistoriaLabel.visible = true
	next_game_btn.disabled = false

	
	var tween = create_tween()
	tween.tween_property($Background/HistoriaLabel, "visible_ratio", 1.0, 8.0).from(0.0)

func _on_next_game_btn_pressed():
	if next_scene: get_tree().change_scene_to_packed(next_scene)
