extends CharacterBody2D

@export var health = 100

func _physics_process(_delta: float) -> void:
	velocity.y = move_toward(velocity.y, 0, 3)
	move_and_slide()
