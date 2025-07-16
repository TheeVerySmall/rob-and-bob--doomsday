extends AnimatableBody2D

class_name Expanding

@onready var anim : AnimationPlayer = $AnimationPlayer
var finished = true



func _ready():
	anim.play("expanding_side")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if Globals.expanding_anim_change == true and finished:
		finished = false
		anim.play("Finished") #make it only happen once
	elif finished:
		anim.play("expanding_side")
