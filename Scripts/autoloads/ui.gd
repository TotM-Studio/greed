extends CanvasLayer

func change_weapon(weapon : String):
	$GUI.change_weapon(weapon)

func show_gui():
	$GUI.visible = true
