extends ParallaxBackground

func _process(delta):
	scale.x = 1 / Globals.xzoom
	scale.y = 1 / Globals.yzoom
	print(scale.x)
	print(scale.y)
