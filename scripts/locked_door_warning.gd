extends CanvasLayer

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Controlscreen.show_message:
		visible = true
	else:
		visible = false
	if label.text != Controlscreen.next_message:
		label.text = Controlscreen.next_message
