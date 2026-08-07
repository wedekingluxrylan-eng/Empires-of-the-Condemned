extends CharacterBody2D

@onready var animation_player: AnimationPlayer = %AnimationPlayer

const SPEED = 200.0
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
>>>>>>> Stashed changes
=======
>>>>>>> b5e548f923481e28584e64cb6915477a64c931aa


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		animation_player.play("player_walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("RESET")

	move_and_slide()
