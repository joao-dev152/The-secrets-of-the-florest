extends Area2D

var player_is_on := false

func _process(delta: float) -> void:
	if player_is_on:
		if Input.is_action_just_pressed("Interact") and !PlayerItens.is_with_book:
			PlayerItens.is_with_book = true
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_is_on = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player_is_on = false
