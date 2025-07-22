extends Area2D
class_name AttackComponent

@export var dammages : float = 10
@export var direction : Vector2 = Vector2.ZERO

func _ready() -> void:
	connect("area_entered",on_area_entered)

func on_area_entered(Area : HitBoxComponent) -> void :
	if Area != null and Area.has_method("take_dammage"):
		var direction_2 = Vector2(direction.x * direction2(Area, self), direction.y)
		Area.take_dammage(dammages, direction_2)

func direction2(chr1, chr2) -> int:
	if chr1.position.x - chr2.position.x < 0:
		return 1
	else:
		return -1
