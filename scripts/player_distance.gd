extends ProgressBar

func _physics_process(delta):
	Globals.player_distance = abs(Globals.x_position_rob - Globals.x_position_bob)
	value = Globals.player_distance
	print(Globals.player_distance)
	if Globals.player_distance > 1000:
		Globals.player_death = true
	else:
		Globals.player_death = false
