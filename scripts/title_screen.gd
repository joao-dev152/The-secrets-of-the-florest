extends Control

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_credits_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()
