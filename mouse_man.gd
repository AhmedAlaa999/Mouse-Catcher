extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -300.0
@export var gravity: float = 980.0
@onready var anim = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

func _physics_process(delta: float):

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		jump_sound.play()

	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	if not is_on_floor():
		if velocity.y > 0:
			anim.play("DropDown")
		else:
			anim.play("Jump")
	elif direction != 0:
		anim.play("Run")
	else:
		anim.play("Ideal")

	if direction != 0:
		anim.flip_h = direction < 0

	move_and_slide()
