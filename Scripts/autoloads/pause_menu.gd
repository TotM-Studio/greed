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
