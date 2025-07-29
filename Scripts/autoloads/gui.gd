extends Control

func change_weapon(weapons : Array, weapon : int):
	$Panel/Ax.texture = load("res://Assets/Sprites/Weapons/" + 
						weapons[weapon].name + ".png")
	$PanelUp/Ax.texture = load("res://Assets/Sprites/Weapons/" +
						weapons[weapon -1].name + ".png")
	$PanelDown/Ax.texture = load("res://Assets/Sprites/Weapons/" +
						weapons[(weapon + 1)% weapons.size()].name + ".png")
