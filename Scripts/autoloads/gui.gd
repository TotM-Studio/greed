extends Control

func change_weapon(weapon : String):
	$Panel/Ax.texture = load(weapon)
