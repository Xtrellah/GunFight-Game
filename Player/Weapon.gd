extends Area2D

@export var bullet : PackedScene

var can_fire = true
var b = load("res://bullet.tscn")

# SHOOTING
func get_input():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	get_input()

func shoot():
	if bullet:
		var b = bullet.instantiate()
		get_tree().root.add_child(b)
		b.global_transform = $Muzzle.global_transform
