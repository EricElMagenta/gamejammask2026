extends Sprite2D

# Carga las dos texturas en el script
var textura1 = preload("res://assets/Bien.png")
var textura2 = preload("res://assets/mal.png")


func _ready():
	texture = textura2 # Textura inicial

func cambiarTextura(exito: bool):
	visible = true
	if exito:
		texture = textura1
