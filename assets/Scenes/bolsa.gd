extends Area2D

@export var label_contador: Label
var contador_items := 0


func agregar_item():
	contador_items += 1
	label_contador.text = str(contador_items)
