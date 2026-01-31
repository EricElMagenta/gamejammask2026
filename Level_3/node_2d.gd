extends Node2D

var contador = 0
var puntos_victoria = 10
var success = false
@onready var label = $Label # Ajusta $Label al nombre de tu nodo Label
@onready var label_victoria = $MarginContainer/RichTextLabel # Label enriquecido
@onready var textura_sprite = $Sprite2D

func _process(_delta):
	# Detecta si la tecla se presiona solo una vez por pulsación
	if Input.is_action_just_pressed("presionar_tecla"):
		contador += 1
		actualizar_contador()
		condicion_victoria()

#Funciones

func mostrar_texto_victoria():
	label_victoria.visible = true # Hace visible el nodo
	#label_victoria.text = "¡Condición cumplida!" # Cambia el texto si es necesario
	textura_sprite.success = true

func condicion_victoria():	
	if contador == puntos_victoria:
		success = true
		mostrar_texto_victoria()

func actualizar_contador():
	label.text = "Contador: " + str(contador)
	print("Contador actual: ", contador) # Opcional: ver en consola             
