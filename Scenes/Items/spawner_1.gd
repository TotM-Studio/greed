@tool
extends Node2D
class_name Spawner

@export_node_path("Player") var player_node_path
@export_tool_button("Update Psotion")
var update_position_action = update_position



func update_position():
	position = get_node(player_node_path).position
