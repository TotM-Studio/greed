extends Node2D

@onready var animation_player = $AnimationPlayer
@export_node_path("Weapon") var current_weapon_path

var weapons = []
var current_weapon : int = 0

var playing : bool = false

func _ready() -> void:
	for i in $Pivot.get_children():
		if i is Weapon:
			weapons += [i]

func  _process(_delta: float) -> void:
	playing = animation_player.is_playing()
	if playing:
		weapons[current_weapon].disabled = false
	else:
		weapons[current_weapon].disabled = true
		if Input.is_action_just_pressed("Change Weapon"):
			change_weapon()

func attack():
	animation_player.play(weapons[current_weapon].name + "Attack")
	weapons[current_weapon].play_sound()

func change_weapon():
	current_weapon += 1
	current_weapon %= weapons.size()
