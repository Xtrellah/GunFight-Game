extends Area2D

@export var bullet : PackedScene

var can_fire = true
var bul = load("res://bullet.tscn")

# SHOOTING
func get_input():
	look_at(get_global_mouse_position())

func _physics_process(_delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	get_input()
	print('nada')

func shoot():
	if bullet:
		var bul = bullet.instantiate()
		get_tree().root.add_child(bul)
		bul.global_transform = $Muzzle.global_transform
