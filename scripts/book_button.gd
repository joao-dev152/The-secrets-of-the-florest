extends CanvasLayer

@export var Book : CanvasLayer = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if PlayerItens.is_with_book:
		visible = true
	else:
		visible = false

func _on_button_pressed() -> void:
	if Book != null:
		Book.visible = true
		get_tree().paused = true
	else:
		print("No books selected.")
