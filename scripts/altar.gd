extends Area2D
class_name Altar

var Bob_here = false
var Rob_here = false
var Bomb_here = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Bob":
		Bob_here = true
		check_win()
	if body.name == "Rob":
		Rob_here = true
		check_win()


func _on_area_entered(area: Area2D) -> void:
	if area.name == "bomb":
		Bomb_here = true
		check_win()

func check_win():
	if Bob_here and Rob_here and Bomb_here:
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
		


func _on_area_exited(area: Area2D) -> void:
	if area.name == "bomb":
		Bomb_here = false


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Bob":
		Bob_here = false
	if body.name == "Rob":
		Rob_here = false
