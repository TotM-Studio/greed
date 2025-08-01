extends Character
class_name Enemy

@onready var hit_particles = $Particles/Hit
@onready var death_particles = $Particles/Death
@onready var sound = $Sounds
@onready var animation = $AnimationPlayer
@onready var timer : Timer = $Timer

var direction : Vector2 = Vector2.ZERO
var speed : float = 10
var chasing : bool = false

func _process(delta: float) -> void:
	if !sound.playing and health <= 0 and !animation.is_playing():
		queue_free()
	if chasing:
		chasing_process()
	else:
		idling_process(delta)

func _physics_process(delta: float) -> void:
	velocity.y = move_toward(velocity.y, 0, 2000 * delta)
	velocity.x = move_toward(velocity.x, 0, 2000 * delta)
	move_and_slide()


func take_dammage(direction : Vector2 = Vector2.ZERO):
	randomize_direction()
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

func idling_process(delta):
	if timer.is_stopped() or is_on_ceiling() or is_on_floor() or is_on_wall():
		randomize_direction()
	position += direction * speed * delta

func chasing_process():
	pass

func attack_process():
	pass

func randomize_direction():
	direction = Vector2(randf_range(-1,1),randf_range(-1,1))
	direction = direction.normalized()
	speed = randf_range(10,50)
	$Timer.start(5)
