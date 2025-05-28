extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = 350
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var xbob = get_parent().get_node("Bob").position.x
	var xrob = get_parent().get_node("Rob").position.x
	position.x = (xbob + xrob) / 2
	
	if abs(xrob - xbob) >= 1000:
		zoom.x = abs(1000 / (xrob - xbob))
		zoom.y = abs(1000 / (xrob - xbob))
	else:
		zoom.x = 1
		zoom.y = 1
