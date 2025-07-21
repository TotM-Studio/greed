extends Node

func  freeze_engine(freezeTime:float, freezeSlow:float) -> void:
	Engine.time_scale = freezeSlow
	await get_tree().create_timer(freezeTime * freezeSlow).timeout
	Engine.time_scale = 1
