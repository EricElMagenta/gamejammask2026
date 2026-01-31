extends Area2D

var dragging := false
var of = Vector2(0,0)

func _physics_process(_delta):
	if dragging: position = get_global_mouse_position() - of

func _on_button_button_down():
	dragging = true

func _on_button_button_up():
	dragging = false

func _on_area_entered(area):
	if area.name == "Bolsa":
		area.score += 1
		queue_free();
