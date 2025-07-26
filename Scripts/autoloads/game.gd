extends Node

func  freeze_engine(freezeTime:float, freezeSlow:float = 0.5) -> void:
	Engine.time_scale = freezeSlow
	await get_tree().create_timer(freezeTime * freezeSlow).timeout
	Engine.time_scale = 1
