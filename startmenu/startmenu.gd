extends Node2D

@export var next_scene:PackedScene
@onready var bg = $Background

func _ready():
	bg.frame = 0 


func _on_button_pressed():
	bg.frame = 1

