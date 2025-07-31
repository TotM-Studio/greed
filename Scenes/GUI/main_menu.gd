extends Control

func _ready() -> void:
	$Panel/VBoxContainer/play_button.grab_focus()

  
func _on_play_button_pressed() -> void:
	TransitionManager._out(1)
	await get_tree().create_timer(1).timeout
	SceneLoader.load_scene("res://Scenes/Levels/rpg_level_1.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
