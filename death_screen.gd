extends CanvasLayer

@export var main_menu_scene: String = "res://main_menu.tscn"
@export var game_scene: String = "res://MainMap.tscn"
@onready var death_sound = $AudioStreamPlayer

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	death_sound.play()

	$ColorRect/CenterContainer/VBoxContainer/Retry.pressed.connect(_on_retry)
	$ColorRect/CenterContainer/VBoxContainer/MainMenu.pressed.connect(_on_main_menu)

func _on_retry():
	get_tree().paused = false
	get_tree().change_scene_to_file(game_scene)
	queue_free()

func _on_main_menu():
	get_tree().paused = false
	queue_free()
	get_tree().call_deferred("change_scene_to_file", main_menu_scene)
