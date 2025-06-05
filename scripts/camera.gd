extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = 350

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var xbob = get_parent().get_node("Bob").position.x
	var xrob = get_parent().get_node("Rob").position.x
	var distance = xbob - xrob
	
	if abs(distance) <= 1500:
		position.x = (xbob + xrob) / 2
	else:
		if xrob > xbob:
			position.x = xrob - 750
		else:
			position.x = xbob - 750
	
	if abs(distance) >= 1500:
		zoom.x = 0.67
		zoom.y = 0.67
	elif abs(distance) >= 1000:
		zoom.x = abs(1000 / distance)
		zoom.y = abs(1000 / distance)
	else:
		zoom.x = 1
		zoom.y = 1
