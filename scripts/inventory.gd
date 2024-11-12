extends CanvasLayer

@onready var sword: Sprite2D = $itens/sword
@onready var key: Sprite2D = $itens/key
@onready var mystery_book: Sprite2D = $"itens/mystery book"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	sword.visible = false
	key.visible = false
	mystery_book.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PlayerItens.is_with_sword:
		sword.visible = true
	else:
		sword.visible = false
	if PlayerItens.is_with_key:
		key.visible = true
	else:
		key.visible = false
	if PlayerItens.is_with_book:
		mystery_book.visible = true
	else:
		mystery_book.visible = false
