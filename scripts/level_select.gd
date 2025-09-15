extends Node2D


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/test_scene.tscn")


func _on_back_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_button_3_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_button_4_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
