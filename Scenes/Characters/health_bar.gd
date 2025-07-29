extends ProgressBar
class_name HealthBar

@export_node_path("Character") var parent_path 
var parent : Character

func _ready() -> void:
	parent = get_node(parent_path)
	max_value = parent.health_max

func _process(_delta: float) -> void:
	value = parent.health
	modulate.h = value/max_value /3.59
	visible = (value != max_value)
