extends Control
@export var game_scene = "res://MainMap.tscn"

func _ready():
	$CenterContainer/VBoxContainer/PlayButton.pressed.connect(_on_play)
	$CenterContainer/VBoxContainer/QuitButton.pressed.connect(_on_quit)

func _on_play():
	get_tree().change_scene_to_file(game_scene)

func _on_quit():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_play()
