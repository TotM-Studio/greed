extends CharacterBody2D

@export var GRAVITY : int = 100
@export var acceleration : int = 1220
@export var speed : int = 1110

func _process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += GRAVITY
	
	var direction = Input.get_axis("Gauche", "Droite")
	
	velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	
	move_and_slide()
