extends Node

func  freeze_engine(freezeTime:float, freezeSlow:float = 0.5) -> void:
	Engine.time_scale = freezeSlow
	await get_tree().create_timer(freezeTime * freezeSlow).timeout
	Engine.time_scale = 1

func vibration(Weak, Strong, Duration) -> void:
	Input.start_joy_vibration(1, Weak, Strong, Duration)
	Input.start_joy_vibration(0, Weak, Strong, Duration)
