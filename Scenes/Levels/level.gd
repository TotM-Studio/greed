extends Node2D

@onready var player : Player = $Player
@onready var spawners = $Spawners

func _ready() -> void:
	TransitionManager._in(1.5)
	if Game.spawner <= spawners.get_child_count():
		player.position = spawners.get_child(Game.spawner).position
