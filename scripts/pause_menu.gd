extends CanvasLayer

@onready var Resume_btn : Button = $"menu_holder/resume-btn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		visible = true
		get_tree().paused = true
		Resume_btn.grab_focus()

func _on_resumebtn_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_quitbtn_pressed() -> void:
	get_tree().quit()
