#Rob jumps higher and has str

class_name rob

extends CharacterBody2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var bomb = null

const SPEED = 240.0
const JUMP_VELOCITY = -480.0
var can_pick = false
var carry_bomb = false

func _physics_process(delta):
	# Add the gravity.
	# Add the gravity.
	if can_pick == true and Input.is_action_just_pressed("P"):
		if carry_bomb:
			carry_bomb = false
		else:
			carry_bomb = true
	if carry_bomb == true:
		bomb.global_position.y = self.global_position.y - 30
		bomb.global_position.x = self.global_position.x - 2


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


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Bomb:
		bomb = area
		can_pick = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Bomb:
		can_pick = false
