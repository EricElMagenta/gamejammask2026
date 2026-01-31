extends CharacterBody2D

# Velocidad de movimiento (píxeles por segundo)
@export var speed : float = 200.0
var direction : int = -1 # 1 para derecha, -1 para izquierda

func _physics_process(_delta):
	# Define la velocidad en el eje X de forma constante
	velocity.x = direction * speed
	
	# move_and_slide usa velocity automáticamente
	move_and_slide()
