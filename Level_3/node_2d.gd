extends Node2D

var contador = 0
var puntos_victoria = 10
var success = false
var failure = false
var can_dress = false

@export var next_scene:PackedScene
@onready var label = $Label # Ajusta $Label al nombre de tu nodo Label
@onready var label_victoria = $MarginContainer/RichTextLabel # Label enriquecido
@onready var textura_sprite = $Sprite2D
@onready var texto_perder = $MarginContainer/TextoPerder
@onready var time_label = $TimerContainer/RichTextLabel
@onready var timer = $Timer

func _ready():
	time_label.text = str(timer.wait_time)

func _process(_delta):
	time_label.text = str(round(timer.time_left))
	# Detecta si la tecla se presiona solo una vez por pulsación
	if Input.is_action_just_pressed("presionar_tecla") && !failure && can_dress:
		AudioManager.play_put_mask()
		contador += 1
		actualizar_contador()
		condicion_victoria()

#Funciones

func mostrar_texto_victoria():
	timer.stop()
	$OK.visible = true
# label_victoria.visible = true # Hace visible el nodo
	#label_victoria.text = "¡Condición cumplida!" # Cambia el texto si es necesario
	textura_sprite.success = true
	GameManager.total_score += 1
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(next_scene)

func mostrar_texto_perder():
	timer.stop()
	failure = true
	# texto_perder.visible = true
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(next_scene)
	$MAL.visible = true

func condicion_victoria():	
	if contador == puntos_victoria:
		success = true
		mostrar_texto_victoria()

func actualizar_contador():
	label.text = "Contador: " + str(contador)
	# print("Contador actual: ", contador) # Opcional: ver en consola             


func _on_timer_timeout():
	mostrar_texto_perder()


func _on_transition_timer_timeout():
	can_dress = true
	timer.start()
