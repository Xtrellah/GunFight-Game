extends CharacterBody2D

@export var speed = 200
@export var bullet : PackedScene
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 350.0
const JUMP_VELOCITY = -500.0

#MOVEMENT
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

##SHOOTING
#func get_input():
	#look_at(get_global_mouse_position())
	#
	#if Input.is_action_just_pressed("shoot"):
		#shoot()
#
#func shoot():
	#var bul = bullet.instantiate()
	#get_tree().root.add_child(bul)
	#bul.transform = $Muzzle.global_transform
