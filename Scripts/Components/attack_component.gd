extends Area2D
class_name AttackComponent

@export var dammages : float = 10
@export var knockback : Vector2 = Vector2.ZERO

func _ready() -> void:
	connect("area_entered",on_area_entered)

func on_area_entered(Area : HitBoxComponent) -> void :
	if Area != null and Area.has_method("take_dammage"):
		print(direction2(Area.parent, self))
		var knockback_2 = knockback
		knockback_2.x *= direction2(Area.parent, self)
		Area.take_dammage(dammages, knockback_2)

func direction2(chr1, chr2) -> int:
	return max(min((chr1.position.x-chr2.position.x)*10, 1), -1)
