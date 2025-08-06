extends Area2D
class_name HitBoxComponent

@onready var parent = get_parent().get_parent()
@export var enabled : bool = true

func take_dammage(amount:float ,direction :Vector2 = Vector2.ZERO) -> void :
	if enabled:
		if parent is Character:
			parent.health -= amount
			parent.velocity = direction
			
			if parent.has_method("take_dammage"):
				if parent is Enemy:
					parent.take_dammage(direction)
				else:
					parent.take_dammage()
