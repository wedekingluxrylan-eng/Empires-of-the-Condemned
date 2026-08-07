extends CharacterBody2D

@onready var animation_player: AnimationPlayer = %AnimationPlayer

const SPEED = 200.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var horizontalDirection := Input.get_axis("Left", "Right")
	if horizontalDirection:
		velocity.x = horizontalDirection * SPEED
		animation_player.play("player_walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("RESET")
		
	var verticalDirection := Input.get_axis("Up", "Down")
	if verticalDirection:
		velocity.y = verticalDirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
