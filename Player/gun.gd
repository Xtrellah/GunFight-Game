extends Node2D

var bullet_path = preload("res://Bullet/bullet.tscn")

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		fire()

func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = rotation
	bullet.pos = $Marker2D.global_position
	bullet.rota = global_rotation
	get_parent().add_child(bullet)
