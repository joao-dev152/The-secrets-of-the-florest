extends CharacterBody2D
class_name Slime

var is_dead := false
var player_ref = null

@export_group("Variables")
@export var health : float = 10 

@onready var texture: Sprite2D = $texture
@onready var anim: AnimationPlayer = $anim

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_ref = body

func _on_player_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_ref = null

func _physics_process(delta: float) -> void:
	if is_dead:
		return
	
	animate()
	if player_ref != null:
		if player_ref.is_dead:
			velocity = Vector2.ZERO
			move_and_slide()
			return
		
		var direction : Vector2 = global_position.direction_to(player_ref.global_position)
		var distance : float = global_position.distance_to(player_ref.global_position)
		
		if distance < 20 and !player_ref.is_attacking:
			player_ref.die()
		
		velocity = direction * 40
		move_and_slide()

func animate():
	if velocity.x > 0:
		texture.flip_h = false
	elif velocity.x < 0:
		texture.flip_h = true
	
	if velocity != Vector2.ZERO:
		anim.play("walk")
		return
	

func update_health():
	#health -= randi_range(min_damage, max_damage)
	#if health < 0:
	is_dead = true
	anim.play("die")

func _on_anim_animation_finished(anim_name: StringName) -> void:
	queue_free()
