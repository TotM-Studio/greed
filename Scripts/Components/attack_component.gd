extends Area2D
class_name AttackComponent

@export var dammages : float = 10

func _ready() -> void:
	connect("area_entered",on_area_entered)

func on_area_entered(Area : HitBoxComponent) -> void :
	if Area != null and Area.has_method("take_dammage"):
		print(Area.get_method_list())
