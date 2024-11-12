extends Area2D
class_name DoorsComponent

var player_ref : Player = null

@export_group("variables")
@export var teleport_position : Vector2
@export var next_locate := "Wood florest"

@onready var anim: AnimationPlayer = $Anim

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_ref = body
		anim.play("oppening")
		LocationName.location = next_locate

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "oppening":
		player_ref.global_position = teleport_position
