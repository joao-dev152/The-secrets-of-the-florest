extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _on_button_pressed() -> void:
	visible = false
	get_tree().paused = false
