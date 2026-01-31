extends Sprite2D

@export var total_areas := 0
@onready var fill_percentage_label = %FillPercentageLabel
var filled_percentage:float
var area_score:float

func _ready():
	area_score = 100.0 / total_areas
	fill_percentage_label.text = str(filled_percentage) + "%"

func add_to_score():
	filled_percentage += area_score
	fill_percentage_label.text = str(round(filled_percentage)) + "%"

func substract_from_score():
	filled_percentage -= area_score
	fill_percentage_label.text = str(filled_percentage) + "%"

func _on_score_area_area_entered(_area:Area2D):
	add_to_score()

func _on_score_area_area_exited(_area:Area2D):
	substract_from_score()
