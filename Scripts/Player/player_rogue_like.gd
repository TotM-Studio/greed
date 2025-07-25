extends CharacterBody2D

@export var GRAVITY : int = 100
@export var acceleration : int = 1220
@export var speed : int = 1110

@export var jumpForce : int = 100

func _process(_delta: float) -> void:
	if (!is_on_floor()):
		velocity.y += GRAVITY
	elif (Input.is_action_just_pressed("Jump")):
		velocity.y -= jumpForce
	
	var direction = Input.get_axis("Gauche", "Droite")
	velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	
	move_and_slide()
