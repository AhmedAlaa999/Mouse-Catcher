extends Area2D

@export var float_height: float = 3.0
@export var float_speed: float = 2.0
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var collect_sound: AudioStreamPlayer2D = $CollectSound

var start_y: float
var time_passed: float = 0.0
var is_collected: bool = false

func _ready():
	start_y = position.y
	body_entered.connect(_on_body_entered)

func _process(delta):
	if is_collected:
		return

	time_passed += delta
	position.y = start_y + sin(time_passed * float_speed) * float_height

func _on_body_entered(body):
	if is_collected:
		return
	if body is CharacterBody2D:
		is_collected = true

		var main_map = get_tree().current_scene
		main_map.game_finished = true

		set_deferred("monitoring", false)
		collision.set_deferred("disabled", true)

		sprite.hide()

		collect_sound.play()
		await collect_sound.finished

		get_tree().change_scene_to_file("res://WinScreen.tscn")
