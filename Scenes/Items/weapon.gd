extends Node2D
class_name Weapon

@export var disabled : bool = false
@onready var collision = $AttackComponent/CollisionShape2D

func _process(_delta: float) -> void:
	collision.disabled = disabled
