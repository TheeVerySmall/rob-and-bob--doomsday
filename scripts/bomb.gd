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
	Globals.explode = $Timer.time_left
	if raycast2d.is_colliding() and raycast2d.get_collider() is Ground:
		speed = 0
	elif not raycast2d.is_colliding():
		speed += GRAVITY
		position.y += speed * delta

	if raycast2d.is_colliding() and raycast2d.get_collider() is Ground:
		bomb_detonate = true
	else:
		$Timer.stop()
		Globals.explode = 4
	if bomb_detonate == true and $Timer.is_stopped():
		bomb_detonate = false
		$Timer.start()





	if position.y > 1000:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
