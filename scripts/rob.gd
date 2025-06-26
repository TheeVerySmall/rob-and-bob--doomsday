#Rob jumps higher and has str

class_name rob

extends CharacterBody2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var bomb = null
var facing_left = false

const START_POSITION = Vector2(-900, 500)

var SPEED = 240.0
var JUMP_VELOCITY = -520
var can_pick = false
var carry_bomb = false

func _physics_process(delta):
	# Add the gravity.
	# Add the gravity.
	if can_pick == true and Input.is_action_just_pressed("B"):
		if carry_bomb:
			carry_bomb = false
		else:
			carry_bomb = true
	if carry_bomb == true:
		JUMP_VELOCITY = -460
		SPEED = 200
		bomb.global_position.y = self.global_position.y - 30
		bomb.global_position.x = self.global_position.x - 2
	else:
		JUMP_VELOCITY = -520
		SPEED = 240

	if position.y > 1000:
		position = START_POSITION


	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if abs(velocity.x) > 10:
			anim.play("run")
		else:
			anim.play("idle")
	
	
	if velocity.x < -10:
		facing_left = true
	elif velocity.x > 10:
		facing_left = false

	anim.flip_h = facing_left
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


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Bomb:
		bomb = area
		can_pick = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Bomb:
		can_pick = false
