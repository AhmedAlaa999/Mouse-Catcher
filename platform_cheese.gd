extends StaticBody2D

@export var speed = 100.0
@export var distance = 100.0

var start_y
var direction = 1

func _ready():
	start_y = position.y

func _process(delta):
	position.y += direction * speed * delta

	if position.y >= start_y + distance:
		direction = -1
	elif position.y <= start_y:
		direction = 1
