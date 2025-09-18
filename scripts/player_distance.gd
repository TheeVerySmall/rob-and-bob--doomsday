extends ProgressBar

func _physics_process(delta):
	Globals.player_distance = abs(Globals.x_position_rob - Globals.x_position_bob)
	value = Globals.player_distance
	#print(Globals.player_distance)
	if Globals.player_distance > 1240:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")

func _ready():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("E81717")
