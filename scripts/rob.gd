#Rob jumps higher and has str

class_name rob

extends CharacterBody2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 240.0
const JUMP_VELOCITY = -480.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if abs(velocity.x) > 10:
			anim.play("run")
		else:
			anim.play("idle")
	
	
	if velocity.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false


	# Handle jump.
	if Input.is_action_just_pressed("W") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("A", "D")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
