extends Area2D
class_name HitBoxComponent

@onready var parent = get_parent()

func take_dammage(amount:float ,direction :Vector2 = Vector2.ZERO) -> void :
	parent.health -= amount
	if parent is CharacterBody2D and parent.health > 0:
		parent.velocity = direction
	
	if parent.has_method("take_dammage"):
		if parent is Enemy:
			parent.take_dammage(direction)
		else:
			parent.take_dammage()
