extends Control

func _on_quit_pressed():
	get_tree().quit()

func _on_test_pressed():
	get_tree().change_scene_to_file("res://test world.tscn")
