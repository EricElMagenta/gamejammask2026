extends Node2D

@onready var label_tiempo: Label = $CanvasLayer/LabelTiempo
@onready var label_items: Label = $CanvasLayer/LabelItems
@onready var timer: Timer = $Timer

var time_left := 3
var items_count := 0

func _ready():
	label_tiempo.text = "Tiempo: %d" % time_left
	label_items.text = "Items: %d" % items_count

func _on_timer_timeout() -> void:
	time_left -= 1
	label_tiempo.text = "Tiempo: %d" % time_left
	
	if time_left <= 0:
		# GameManager.add_point()  # 👈 SUMA 1 PUNTO. AGREGAR A GAMEMANAGER
		timer.stop()
		get_tree().change_scene_to_file("res://assets/Scenes/level_2/level_2.tscn")
		
