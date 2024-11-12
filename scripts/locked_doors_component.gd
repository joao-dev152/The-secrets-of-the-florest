extends Area2D
class_name LockedDoorsComponent

var player_ref : Player = null

const UNLOCKEDDOOR := preload("res://prefabs/doors_component.tscn")

@export_group("variables")
@export var teleport_position : Vector2
@export var next_locate := "Wood florest"

@export_group("Objects")
@export var Key : Key_collectable = null

@onready var anim: AnimationPlayer = $Anim
var is_locked := true

func _on_body_entered(body: Node2D) -> void:
	if body is Player and PlayerItens.is_with_key and Key == null:
		player_ref = body
		anim.play("oppening")
		PlayerItens.is_with_key = false
		is_locked = false
		LocationName.location = next_locate
	
	if body is Player and PlayerItens.is_with_key:
		Controlscreen.next_message = "This key doesn't work. That's not the key to the door."
	if body is Player and !PlayerItens.is_with_key:
		Controlscreen.next_message = "This door is locked. I need a key."
	
	if body is Player and is_locked:
		Controlscreen.show_message = true

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "oppening":
		player_ref.global_position = teleport_position
		create_unlocked_door()
		queue_free()

func _on_body_exited(body: Node2D) -> void:
	Controlscreen.show_message = false

func create_unlocked_door():
	var new_unlocked_door := UNLOCKEDDOOR.instantiate()
	add_sibling(new_unlocked_door)
	new_unlocked_door.global_position = global_position
	new_unlocked_door.teleport_position = teleport_position
	new_unlocked_door.next_locate = next_locate
