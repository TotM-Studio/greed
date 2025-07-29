extends CanvasLayer

func change_weapon(weapons : Array, weapon : int):
	$GUI.change_weapon(weapons, weapon)

func show_gui():
	$GUI.visible = true
