extends Area2D

var dragging := false
var offset := Vector2.ZERO
var start_position := Vector2.ZERO

func _ready():
	start_position = global_position

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			offset = global_position - get_global_mouse_position()
		else:
			dragging = false

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + offset

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bolsa"):
		area.agregar_item()
		queue_free()
