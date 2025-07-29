extends Character
class_name Enemy

@onready var hit_particles = $Particles/Hit
@onready var death_particles = $Particles/Death
@onready var sound = $Sounds

func _physics_process(delta: float) -> void:
	velocity.y = move_toward(velocity.y, 0, 2000 * delta)
	velocity.x = move_toward(velocity.x, 0, 2000 * delta)
	move_and_slide()

func _process(_delta: float) -> void:
	if !sound.playing and health <= 0 and !$AnimationPlayer.is_playing():
		queue_free()

func take_dammage(direction : Vector2 = Vector2.ZERO):
	if health > 0:
		$AnimationPlayer.play("take_dmmage")
		hit_particles.direction = direction.normalized()
		hit_particles.emitting = true
		Game.freeze_engine(0.5, 0.04)
	else:
		$AnimationPlayer.play("Death")
		death_particles.emitting = true
		Game.freeze_engine(0.9, 0.06)
	
	if !sound.playing:
		if health <= 0:
				sound.stream = load("res://Assets/Sounds/rehehehe.mp3")
		sound.pitch_scale = randf()/2 + 0.9
		sound.play()
	
	Game.vibration(0.5, 0, 0.1)
