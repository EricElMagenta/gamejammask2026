extends Node2D

@export var next_scene:PackedScene
@export var n_areas := 1

@onready var time = $TimerContainer/RichTextLabel
@onready var timer = $Timer
@onready var result_label = $ResultLabel

@onready var dragable_piece = $DragablePiece

@onready var fillable_area = $FillableArea

@onready var bien_o_mal = $BienOMal

const MIN_SCORE_REQUIRED = 80
var has_won = false

func _ready():
	time.text = str(timer.wait_time)

func _process(_delta):
	time.text = str(round(timer.time_left))
	if get_mean_score() >= 100 && !has_won: 
		show_results()

func get_mean_score():
	var score := 0.0
	score += fillable_area.filled_percentage
	return score / n_areas

func show_results():
	timer.stop()
	has_won = true
	dragable_piece.dragging = false

	var mean_score = get_mean_score()
	if mean_score > MIN_SCORE_REQUIRED: 
		#result_label.text = "ÉXITO"
		bien_o_mal.cambiarTextura(true)
		GameManager.total_score += 1
	else: 
		#result_label.text = "¡PERDEDOR!"
		bien_o_mal.cambiarTextura(false)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(next_scene)

func _on_timer_timeout():
	show_results()


func _on_transition_timer_timeout():
	timer.start()
