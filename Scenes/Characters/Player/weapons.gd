extends Node2D

@onready var animation_player = $AnimationPlayer
@export_node_path("Weapon") var current_weapon_path

var weapons : Dictionary
var current_weapon : Weapon

var playing : bool = false

func _ready() -> void:
	current_weapon = get_node(current_weapon_path)
	for i in $Pivot.get_children():
		if i is Weapon:
			weapons[i.name] = i

func  _process(_delta: float) -> void:
	playing = animation_player.is_playing()
	if playing:
		current_weapon.disabled = false
	else:
		current_weapon.disabled = true

func attack():
	animation_player.play(current_weapon.name + "Attack")
	current_weapon.play_sound()
