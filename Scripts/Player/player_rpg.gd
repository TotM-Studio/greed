extends CharacterBody2D

var direction : Vector2
@export var speed = 320
@export var acceleration = 3000


func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("Gauche", "Droite"), Input.get_axis("Haut", "Bas"))
	if direction.length() > 0 and !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
		$AudioStreamPlayer.pitch_scale = 0.7 + (randf())
	velocity.y = move_toward(velocity.y, direction.y * speed, acceleration * delta)
	velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
	move_and_slide()
