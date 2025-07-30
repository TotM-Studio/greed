extends CanvasLayer

@onready var animationPlayer = $AnimationPlayer

func _in(time : float = 1):
	animationPlayer.speed_scale = 1 * time ** -1
	animationPlayer.play("transition_in")

func _out(time : float = 1):
	animationPlayer.speed_scale = 1 * time ** -1
	animationPlayer.play("transition_out")
