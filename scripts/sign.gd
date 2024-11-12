extends CanvasLayer

var current_locate := "Wood florest"
@onready var anim: AnimationPlayer = $anim
@onready var label: Label = $sign/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if LocationName.location != current_locate:
		current_locate = LocationName.location
		anim.play("fade")
	label.text = current_locate
