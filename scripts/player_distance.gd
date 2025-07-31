extends ProgressBar

func _physics_process(delta):
	value = Globals.player_distance
	if Globals.player_distance > 1000:
		Globals.player_death = true
	else:
		Globals.player_death = false
