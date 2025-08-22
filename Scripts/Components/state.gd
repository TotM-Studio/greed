extends Node
class_name State

@onready var parent = get_parent()
@onready var Owner =  $"../.."

func Enter():
	pass

func Exit():
	pass

func Update(_delta):
	pass

func quit_to(next_state : String):
	parent.change_current_state(self, next_state)
