@tool
extends Node2D
class_name Spawner

@export_node_path("Player") var player_node_path
@export_tool_button("Update Position")
var update_position_action = update_position
@export_tool_button("Add Sprite")
var add_sprite_action = add_sprite

func _ready() -> void:
	if !Engine.is_editor_hint():
		visible = false

func add_sprite():
	if get_child_count() == 0:
		var sprite = Sprite2D.new()
		sprite.name = "Sprite"
		sprite.texture_filter = Sprite2D.TEXTURE_FILTER_NEAREST
		sprite.texture = load("res://Assets/Sprites/Characters/Player_1/devant.png")
		sprite.position = Vector2(0, -8)
		add_child(sprite)
		sprite.owner = get_owner()

func update_position():
	position = get_node(player_node_path).position
