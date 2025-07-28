extends Area2D
class_name AttackComponent

@export var dammages : float = 10
@export var knockback : int = 10

func _ready() -> void:
	connect("area_entered",on_area_entered)

func on_area_entered(Area : HitBoxComponent) -> void :
	if Area != null and Area.has_method("take_dammage"):
		
		var angle = global_rotation + -0.5 * PI
		var direction = Vector2(cos(angle), sin(angle))
		Area.take_dammage(dammages, knockback * direction)
