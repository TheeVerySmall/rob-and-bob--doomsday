extends Area2D

func _ready() -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.swinging_anim_change = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.swinging_anim_change = false
