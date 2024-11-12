extends Area2D

@onready var fog: CanvasLayer = $"../CanvasLayers/fog"

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		fog.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		fog.visible = false
