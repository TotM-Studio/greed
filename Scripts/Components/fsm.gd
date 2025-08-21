extends Node
class_name FiniteStateMachine

@export_node_path("State") var initial_state
var current_state : State
var states : Dictionary = {}

@export_node_path("AnimatedSprite2D") var animation_player_path
var animation_player : AnimatedSprite2D
@export var directions : Dictionary = {}
var animation_direction : String = "Front"
var last_animation_direction : String = "Front"

func _ready() -> void:
	if initial_state != null:
		current_state = get_node(initial_state)
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	
	animation_player = get_node(animation_player_path)

func _process(delta: float) -> void:
	current_state.Update()

func change_current_state(state : State, next_state : String):
	current_state.Exit()
	print(current_state) 
	current_state = states[next_state]
	current_state.Enter()

func change_animation_direction(direction : Vector2, state : String = "walk"):
	var angle = floori(rad_to_deg(direction.angle() + 0.5 * PI))
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
