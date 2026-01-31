extends Node2D

func _on_timer_timeout() -> void:
	print("⏱️ timeout en level_1")
	get_tree().change_scene_to_file("res://assets/Scenes/level_2/level_2.tscn")
