extends Node2D
class_name WeaponManager

@onready var animation_player = $AnimationPlayer

var weapons : Array
var current_weapon : int = 0

var playing : bool = false

func _ready() -> void:
	for i in $Pivot.get_children():
		if i is Weapon:
			weapons += [i]
	change_weapon()

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
	Gui.change_weapon(weapons, current_weapon)
