extends CharacterBody2D
class_name Player

var state_machine

var is_attacking := false
var  is_dead := false

@export_group("Movement")
@export var move_speed : float = 64.0
@export var friction : float = 0.2
@export var acceleration : float = 0.2

@onready var animationTree: AnimationTree = $AnimationTree
@onready var Atack_Timer: Timer = $Attack_timer

func _ready() -> void:
	state_machine = animationTree["parameters/playback"]

func _physics_process(_delta: float) -> void:
	if is_dead:
		return
	
	move()
	attack()
	animate()
	move_and_slide()

func move() -> void:
	var direction : Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	
	if direction != Vector2.ZERO:
		animationTree["parameters/idle/blend_position"] = direction
		animationTree["parameters/walk/blend_position"] = direction
		animationTree["parameters/attack/blend_position"] = direction
		velocity.x = lerp(velocity.x, direction.normalized().x * move_speed, acceleration)
		velocity.y = lerp(velocity.y, direction.normalized().y * move_speed, acceleration)
		return
	
	velocity.x = lerp(velocity.x, direction.normalized().x * move_speed, friction)
	velocity.y = lerp(velocity.y, direction.normalized().y * move_speed, friction)
	
	velocity = direction.normalized() * move_speed
 
func animate():
	if is_attacking:
		state_machine.travel("attack")
		return
	
	if velocity.length() > 10:
		state_machine.travel("walk")
		return
	
	state_machine.travel("idle")

func attack():
	if Input.is_action_just_pressed("attack") and !is_attacking and PlayerItens.is_with_sword:
		set_physics_process(false)
		Atack_Timer.start()
		is_attacking = true

func _on_attack_timer_timeout() -> void:
	set_physics_process(true)
	is_attacking = false

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.update_health()

func die() -> void:
	is_dead = true
	state_machine.travel("die")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
