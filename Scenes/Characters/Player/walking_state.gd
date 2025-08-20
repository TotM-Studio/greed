extends State

func Enter():
	parent.play("walk")

func Update():
	if Input.is_action_just_pressed("Attack"):
		quit_to("attack")
	
	if Owner.direction == Vector2.ZERO:
		quit_to("idle")

func Exit():
	pass
