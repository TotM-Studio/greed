extends Node
class_name FiniteStateMachine

@export_node_path("State") var initial_state
var current_state : State
var states : Dictionary = {}

@export_node_path("AnimationPlayer") var animation_player_path
var animation_player = AnimationPlayer.new()
var animation_direction
var animation_state : String

func _ready() -> void:
	if initial_state != null:
		current_state = get_node(initial_state)
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	
	if animation_player_path != null:
		animation_player = get_node(animation_player_path)
	else :
		animation_player = null

func _process(delta: float) -> void:
	current_state.Update()

func change_current_state(state : State, next_state : String):
	current_state.Exit()
	current_state = states[next_state]
	current_state.Enter()

func change_animation_direction(direction : Vector2):
	animation_direction = direction.angle_to(Vector2.UP)

func play(state):
	if animation_player != null:
		if state == "":
			animation_player.play("RESET")
		else:
			animation_player.play(state.capitalize() + " Front")
