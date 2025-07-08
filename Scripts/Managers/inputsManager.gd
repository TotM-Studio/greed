extends Node

@export var current_key_label : Label
@export var remap_button : Button
@export var instruction_label : Label

var remapping = false
var action_name : String
const MOTION_THRESHOLD = 0.5

func update_current_input_label():
	var events = InputMap.action_get_events(action_name)
	if events.is_empty():
		current_key_label.text = "Current binding: (none)"
		return

	var event = events[0]
	if event is InputEventKey:
		current_key_label.text = "Current binding: Keyboard - %s" % OS.get_keycode_string(event.physical_keycode)
	elif event is InputEventJoypadButton:
		current_key_label.text = "Current binding: Joypad Button - %d" % event.button_index
	elif event is InputEventJoypadMotion:
		current_key_label.text = "Current binding: Joypad Axis - %d (threshold %.2f)" % [event.axis, event.axis_value]
	else:
		current_key_label.text = "Current binding: (unsupported event type)"

func on_remap_button_pressed():
	instruction_label.text = "Press a key, controller button, or move stick..."
	remapping = true

func _unhandled_input(event):
	if not remapping:
		return

	if event is InputEventKey and event.pressed and !event.echo and Input.get_joy_name(0) == "":
		remap_to_key(event)
	elif event is InputEventJoypadButton and event.pressed:
		remap_to_joypad_button(event)
	elif event is InputEventJoypadMotion:
		if abs(event.axis_value) > MOTION_THRESHOLD:
			remap_to_joypad_motion(event)

func remap_to_key(event: InputEventKey):
	InputMap.action_get_events(action_name)
	InputMap.action_erase_events(action_name)
	var new_event = InputEventKey.new()
	new_event.physical_keycode = event.physical_keycode
	InputMap.action_add_event(action_name, new_event)

	remapping = false
	instruction_label.text = "Key mapped!"
	update_current_input_label()

func remap_to_joypad_button(event: InputEventJoypadButton):
	InputMap.action_erase_events(action_name)
	var new_event = InputEventJoypadButton.new()
	new_event.button_index = event.button_index
	InputMap.action_add_event(action_name, new_event)

	remapping = false
	instruction_label.text = "Joypad button mapped!"
	update_current_input_label()

func remap_to_joypad_motion(event: InputEventJoypadMotion):
	InputMap.action_erase_events(action_name)
	var new_event = InputEventJoypadMotion.new()
	new_event.axis = event.axis
	new_event.axis_value = sign(event.axis_value)  # We usually use ±1.0 to indicate direction
	InputMap.action_add_event(action_name, new_event)

	remapping = false
	instruction_label.text = "Joypad axis mapped!"
	update_current_input_label()
