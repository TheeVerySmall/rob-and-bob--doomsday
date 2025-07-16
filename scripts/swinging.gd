extends AnimatableBody2D

class_name Swinging

@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("swinging")

func _physics_process(delta):
	if Globals.swinging_anim_change:
		anim.speed_scale = 0.5
	else:
		anim.speed_scale = 1

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
