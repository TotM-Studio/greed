extends Area2D
class_name HitBoxComponent

@onready var parent = get_parent()

func _ready() -> void:
	print(parent)

func take_dammage(amount:float ,dir:Vector2 = Vector2.ZERO) -> void :
	if !parent.has_meta("health"):
		parent.health -= amount
		if parent is CharacterBody2D:
			parent.velocity += dir
		print(parent.health)
		if parent.health < 0:
			parent.queue_free()
