extends CharacterBody2D
class_name Enemy

@export var health = 100

func _physics_process(delta: float) -> void:
	velocity.y = move_toward(velocity.y, 0, 2000 * delta)
	velocity.x = move_toward(velocity.x, 0, 2000 * delta)
	move_and_slide()
	if !$AnimationPlayer.is_playing() and !$Death.playing:
		if health <= 0:
			queue_free()

func take_dammage(direction : Vector2 = Vector2.ZERO):
	$AnimationPlayer.play("take_dmmage")
	$CPUParticles2D.direction = direction.normalized()
	$CPUParticles2D.emitting = true
	$Punch.pitch_scale = randf()/2 + 0.9
	$Punch.play()
	Game.freeze_engine(0.2, 0.5)
	Input.start_joy_vibration(1, 0.5, 0, 0.1)
	Input.start_joy_vibration(0, 0.5, 0, 0.1)
	if health <= 0:
			$Death.play()
