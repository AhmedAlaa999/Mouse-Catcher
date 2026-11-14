extends Area2D
@export var death_screen_scene: PackedScene
var is_dead = false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if is_dead:
		return

	if body is CharacterBody2D:
		is_dead = true

		var screen = death_screen_scene.instantiate()
		screen.process_mode = Node.PROCESS_MODE_ALWAYS

		get_tree().root.add_child(screen)
		get_tree().paused = true
