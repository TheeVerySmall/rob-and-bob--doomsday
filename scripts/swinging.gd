extends AnimatableBody2D

class_name Swinging

@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("swinging")

func _physics_process(delta):
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if Globals.swinging_anim_change == true:
		anim.play("slowed_swinging")
	else:
		anim.play("swinging")
