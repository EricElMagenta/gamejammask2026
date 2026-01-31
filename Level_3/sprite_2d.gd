extends Sprite2D

# Carga las dos texturas en el script
var textura1 = preload("res://assets/idle.png")
var textura2 = preload("res://assets/pressed.png")
# PAra dejar de animar cuando se logre la meta
var success = false

func _ready():
	texture = textura1 # Textura inicial

func _input(event):
	if success == false:
		if event.is_action_pressed("ui_accept"): # "ui_accept" es espacio por defecto
			texture = textura2
		elif event.is_action_released("ui_accept"):
			texture = textura1
	else:
		texture = textura2
