extends Area2D
class_name Bomb
const GRAVITY : float = 8.0
const max_speed : float = 350.0
var bomb_detonate = false
var speed : float = 0:
	set(value):
		if value > max_speed:
			speed = max_speed
		else:
			speed = value
@onready var raycast2d: RayCast2D = $RayCast2D

func _physics_process(delta):
	if raycast2d.is_colliding() and raycast2d.get_collider() is Ground:
		bomb_detonate = true
		speed = 0
	elif not raycast2d.is_colliding():
		$Timer.stop()
		speed += GRAVITY
		position.y += speed * delta



	if position.y > 1000:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
