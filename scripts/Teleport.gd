extends Area2D

@export var teleport_pos : Vector2 = Vector2.ZERO 
@export var next_locate := "Wood florest"

func _on_body_entered(body):
	if body is Player:
		body.global_position = teleport_pos
		LocationName.location = next_locate
