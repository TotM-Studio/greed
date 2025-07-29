extends Node2D

@onready var animation_player = $AnimationPlayer
@export_node_path("Weapon") var current_weapon

var playing : bool = false

func _ready() -> void:
	current_weapon = get_node(current_weapon)
	print(current_weapon)

func  _process(delta: float) -> void:
	playing = animation_player.is_playing()

func attack():
	animation_player.play("Attack")
	current_weapon.play_sound()
