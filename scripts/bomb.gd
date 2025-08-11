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
	print(Globals.explode)
	if Globals.explode < 0:
		Globals.explode = 4
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	if raycast2d.is_colliding() and raycast2d.get_collider() is Ground:
		print("on ground")
		Globals.explode -= delta
	elif not raycast2d.is_colliding() and raycast2d.get_collider() is not Ground:
		print("not on ground")
		speed += GRAVITY
		position.y += speed * delta
		Globals.explode = 4




	if position.y > 1000:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
