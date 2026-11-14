extends Node2D
@export var lose_screen_scene: PackedScene

var game_finished: bool = false

func _ready():
	game_finished = false

func lose_game():
	if game_finished:
		return

	game_finished = true

	if lose_screen_scene == null:
		push_error("LoseScreen is not assigned!")
		return

	var lose_screen = lose_screen_scene.instantiate()
	lose_screen.process_mode = Node.PROCESS_MODE_ALWAYS

	get_tree().root.add_child(lose_screen)
	get_tree().paused = true
