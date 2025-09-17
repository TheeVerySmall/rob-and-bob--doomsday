extends Node2D


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/reallevel_select.tscn")


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial_legit.tscn")


func _on_button_3_button_down() -> void:
	#get_tree().change_scene_to_file()
	pass


func _on_button_4_button_down() -> void:
	get_tree().quit()
