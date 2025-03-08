extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 350.0
const JUMP_VELOCITY = -500.0

@onready var sprite = $Player_Sprite

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	flip_sprite()

func flip_sprite():
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x > global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
