extends Node2D


@export var game_intro:PackedScene

func _ready():
	pass 


func _on_button_pressed():
	if game_intro: get_tree().call_deferred("change_to_packed_scene", game_intro)
	else: print("no hay nada")
