extends Node2D

@export var next_scene:PackedScene

const WINNING_SCORE = 8

var inside_bullseye := false
var current_target:CharacterBody2D = null
var score := 0

@onready var result_label = $ResultLabel
@onready var timer = $Timer
@onready var time_label = $TimeLabel
@onready var bien_o_mal = $BienOMal

func _ready():
	time_label.text = str(round(timer.wait_time))

func _physics_process(_delta):
	time_label.text = str(round(timer.time_left))
	if Input.is_action_just_pressed("presionar_tecla") && inside_bullseye:
		if current_target: destroy_target(current_target)


func destroy_target(target):
	target.queue_free()
	score += 1
	current_target = null

func _on_bullseye_body_entered(body:Node2D):
	current_target = body
	inside_bullseye = true


func show_results():
	timer.stop()

	if score >= WINNING_SCORE: 
		#result_label.text = "ÉXITO"
		bien_o_mal.cambiarTextura(true)
		GameManager.total_score += 1
	else: 
		#result_label.text = "¡PERDEDOR!"
		bien_o_mal.cambiarTextura(false)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(next_scene)


func _on_bullseye_body_exited(_body:Node2D):
	current_target = null
	inside_bullseye = false


func _on_timer_timeout():
	show_results()


func _on_transition_timer_timeout():
	timer.start()
