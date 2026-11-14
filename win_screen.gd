extends CanvasLayer

@export var main_menu_scene = "res://main_menu.tscn"
@export var game_scene = "res://MainMap.tscn"
@onready var win_sound: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

	win_sound.play()

	var retry_button = find_child("Retry", true, false)
	var menu_button = find_child("MainMenu", true, false)

	if retry_button:
		retry_button.pressed.connect(_on_retry)

	if menu_button:
		menu_button.pressed.connect(_on_main_menu)


func _on_retry():
	get_tree().paused = false
	get_tree().change_scene_to_file(game_scene)


func _on_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file(main_menu_scene)
