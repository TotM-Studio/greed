extends Control

func _process(_delta: float) -> void:
	visible = get_tree().paused

func _on_button_pressed() -> void:
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_fullscreen"):
		toggle_fullscreen()

func toggle_fullscreen() -> void:
	var current_mode = DisplayServer.window_get_mode()
	if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_resume_button_pressed() -> void:
	get_tree().paused = false

func _on_fullscreen_button_pressed() -> void:
	toggle_fullscreen()

func _on_resume_button_visibility_changed() -> void:
	$Panel/VBoxContainer/ResumeButton.grab_focus()


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/GUI/main_menu.tscn")
