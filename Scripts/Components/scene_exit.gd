class_name SceneExit
extends Area2D

@export_file("*.tscn") var next_scene_path : String
@export var exit_spawner : int = 0

func _ready() -> void:
	connect("body_entered", change_to_next_scene)
	SceneLoader.load_scene(next_scene_path, true)
	process_mode = Node.PROCESS_MODE_ALWAYS

func change_to_next_scene(_body):
	TransitionManager._out()
	print(owner.name)
	owner.process_mode = Node.PROCESS_MODE_DISABLED
	await get_tree().create_timer(1).timeout
	SceneLoader.load_scene(next_scene_path)
	Game.spawner = exit_spawner
