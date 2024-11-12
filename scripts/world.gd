extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LocationName.location = "Wood florest"
	PlayerItens.is_with_book = false
	PlayerItens.is_with_key = false
	PlayerItens.is_with_sword = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
