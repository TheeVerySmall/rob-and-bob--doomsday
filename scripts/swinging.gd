extends AnimatableBody2D

class_name Swinging

@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("swinging")

func _physics_process(delta):
	if Globals.swinging_anim_change:
		anim.speed_scale = 0.5
	else:
		anim.speed_scale = 0.84

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.player_death = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.player_death = false
