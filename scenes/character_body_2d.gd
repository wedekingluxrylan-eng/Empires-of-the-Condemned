extends CharacterBody2D


const SPEED = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var horizontaldirection := Input.get_axis("Left", "Right")
	var verticaldirection := Input.get_axis("Up", "Down")
	if horizontaldirection:
		velocity.x = horizontaldirection * SPEED
		animated_sprite_2d.play("WalkLeft")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("Idle")
	if verticaldirection:
		velocity.y = verticaldirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)


	move_and_slide()
