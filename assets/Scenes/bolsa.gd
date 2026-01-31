extends Area2D

var contador_items := 0

func agregar_item():
	contador_items += 1
	print("Items en la bolsa:", contador_items)
