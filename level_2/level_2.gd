extends Node2D

@export var next_scene:PackedScene
@export var n_areas := 1

@onready var time = %Time
@onready var timer = $Timer
@onready var result_label = $ResultLabel

@onready var dragable_piece = $DragablePiece

@onready var fillable_area = $FillableArea

const MIN_SCORE_REQUIRED = 80

func _ready():
    time.text = str(timer.wait_time)

func _process(_delta):
    time.text = str(round(timer.time_left))
    if get_mean_score() >= 100: 
        show_results()

func get_mean_score():
    var score := 0.0
    score += fillable_area.filled_percentage
    return score / n_areas

func show_results():
    timer.stop()

    dragable_piece.dragging = false

    var mean_score = get_mean_score()
    if mean_score > MIN_SCORE_REQUIRED: result_label.text = "ÉXITO"
    else: result_label.text = "¡PERDEDOR!"
    await get_tree().create_timer(1).timeout
    get_tree().change_scene_to_packed(next_scene)

func _on_timer_timeout():
    show_results()
