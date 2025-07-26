class_name SceneDoor
extends Area2D

@export_file("*.tscn") var exit_scene_path : String

func _ready() -> void:
	connect("body_entered", exit_scene)

func exit_scene(_body):
	SceneLoader.load_scene(exit_scene_path)
