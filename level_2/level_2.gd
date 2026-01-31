extends Node2D

@onready var time = %Time
@onready var timer = $Timer

func _ready():
    time.text = str(timer.wait_time)

func _process(_delta):
    time.text = str(round(timer.time_left))