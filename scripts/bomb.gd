extends Area2D
class_name Bomb
const GRAVITY : float = 10.0
const max_speed : float = 400.0
var speed : float = 0:
	set(value):
		if value > max_speed:
			speed = max_speed
		else:
			speed = value
@onready var raycast2d: RayCast2D = $RayCast2D

func _physics_process(delta):
	if raycast2d.is_colliding() and raycast2d.get_collider() is Ground:
		speed = 0
	elif not raycast2d.is_colliding():
		speed += GRAVITY
		position.y += speed * delta

		
