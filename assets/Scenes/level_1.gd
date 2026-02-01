extends Node2D

@export var next_scene:PackedScene
@onready var bolsa = $Bolsa
@onready var timer = $Timer
@onready var time = %Time
@onready var result_label = $ResultLabel
@onready var time_label = $TimerContainer/RichTextLabel

const SCORE_REQUIRED = 4

var showed_results = false


func _ready():
	time_label.text = str(timer.wait_time)
	AudioManager.stop_music()
	AudioManager.play_game_music()


func _process(_delta):
	time_label.text = str(round(timer.time_left))
	if bolsa.score == SCORE_REQUIRED && !showed_results: show_results()

func show_results():
	showed_results = true
	timer.stop()

	if bolsa.score == SCORE_REQUIRED: 
		GameManager.total_score += 1
		$OK.visible = true
		result_label.text = "ÉXITO"

	else: 
		$MAL.visible = true
		result_label.text = "¡PERDEDOR!"

	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(next_scene)

func _on_timer_timeout():
	show_results()


func _on_transition_timer_timeout():
	timer.start()
