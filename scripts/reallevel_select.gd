extends Control

func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial_legit.tscn")


func _on_level_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_level_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_level_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
