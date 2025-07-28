extends CharacterBody2D

@export var health = 100

func _physics_process(delta: float) -> void:
	velocity.y = move_toward(velocity.y, 0, 2000 * delta)
	velocity.x = move_toward(velocity.x, 0, 2000 * delta)
	move_and_slide()

func take_dammage():
	$AnimationPlayer.play("take_dmmage")
	Input.start_joy_vibration(1, 0.5, 0, 0.1)
