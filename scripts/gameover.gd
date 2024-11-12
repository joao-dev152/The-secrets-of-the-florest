extends Control

func _ready() -> void:
	PlayerItens.is_with_sword = false
	PlayerItens.is_with_key = false

func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()
