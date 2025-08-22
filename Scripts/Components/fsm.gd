extends Node
class_name FiniteStateMachine

@export_node_path("State") var initial_state : NodePath
var current_state : State
var states : Dictionary = {}

@export_node_path("Node") var animation_player_path : NodePath
var animation_player
@export var directions : Dictionary = {"Front":180,"Back":0,"Left":270,"Right":90}
var animation_direction : String = "Front"
var last_animation_direction : String = "Front"

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	
	if initial_state != null:
		current_state = get_node(initial_state)
	
	animation_player = get_node(animation_player_path)

func _process(_delta: float) -> void:
	current_state.Update(_delta)

func change_current_state(_state : State, next_state : String):
	current_state.Exit()
	current_state = states[next_state]
	current_state.Enter()

func change_animation_direction(direction : Vector2, state : String = "walk"):
	var angle : int = rad_to_deg(direction.angle() + 0.5 * PI)
	if angle in directions.values():
		animation_direction = directions.find_key(angle)
	if animation_direction != last_animation_direction:
		play(state)
		last_animation_direction = animation_direction

func play(state):
	if state == "":
		animation_player.animation = "RESET"
	else:
		animation_player.play(state + animation_direction)
