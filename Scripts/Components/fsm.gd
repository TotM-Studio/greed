extends Node

@export_node_path("State") var initial_state
var current_state : State

func _ready() -> void:
	if initial_state != null:
		current_state = get_node(initial_state) 
